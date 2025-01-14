import numpy as np
from scipy import stats

def regr(x, y, fit_intercept=True, return_r2=False):
    if fit_intercept == True:
        x, y = np.array(x), np.array(y)
        n = len(x)
        
        k, b = np.polyfit(x, y, deg=1)
        y_est = k * x + b
        
        # getting 95% confience interval for each fitted y
        t = stats.t.ppf(1-0.05/2, n-2)
        y_err = t*(y-y_est).std() * np.sqrt(1/n + (x - x.mean())**2 / np.sum((x - x.mean())**2))
        
        # confidence intervals for coefficients
        # https://en.wikipedia.org/wiki/Simple_linear_regression#Normality_assumption
        k_err = np.sqrt( np.sum((y-y_est)**2)/(n - 2)/np.sum((x - x.mean())**2) )
        b_err = k_err * np.sqrt( np.sum(x**2/n) )
    else:
        from sklearn.linear_model import LinearRegression
        x, y = np.array(x), np.array(y)
        n = len(x)
        
        regression = LinearRegression(fit_intercept=False)
        regression.fit(x.reshape(-1, 1), y)
        k = regression.coef_[0]
        
        y_est = k * x
        # getting 95% confience interval for each fitted y
        t = stats.t.ppf(1-0.05/2, n-2)
        y_err = t*(y-y_est).std() * np.sqrt(1/n + (x - x.mean())**2 / np.sum((x - x.mean())**2))

        # confidence intervals for coefficients
        # https://en.wikipedia.org/wiki/Simple_linear_regression#Normality_assumption
        k_err = np.sqrt( np.sum((y-y_est)**2)/(n - 2)/np.sum((x - x.mean())**2) )
        b, b_err = 0, 0

    # R² calculation
    ss_res = np.sum((y - y_est) ** 2)  # Sum of squared residuals
    ss_tot = np.sum((y - y.mean()) ** 2)  # Total sum of squares
    r2 = 1 - (ss_res / ss_tot)  # R² coefficient

    if return_r2 == True:
        return k, b, y_est, y_err, k_err, b_err, r2
    else:
        return k, b, y_est, y_err, k_err, b_err

def test_k0(x, y, sign_lev):
    # https://stattrek.com/regression/slope-test
    k, b, y_est, y_err, k_err, b_err = regr(x, y)
    n = len(x)
    df = n - 2 # degrees of freedom
    t_stat = k/k_err
    # https://stackoverflow.com/questions/17559897/python-p-value-from-t-statistic
    # p-value for 2-sided test
    p = 2*(1 - stats.t.cdf(abs(t_stat), df))
    #print('chech hypothesis: data is discribed by the regression with k = 0')
    #print(f'p_value = {round(p,2)}')
    #print(f'reject hypothesis p < {sign_lev}: {p < sign_lev}')
    return p

def few_const(x_groups, y_groups):

    constants = []
    y_est_all = []

    for x, y in zip(x_groups, y_groups):
        c = np.mean(y) 
        constants.append(c)
        y_est_all.extend([c] * len(y)) 

    x_all = np.concatenate(x_groups)
    y_all = np.concatenate(y_groups)
    y_est_all = np.array(y_est_all)

    # Calculate R² for the entire dataset
    ss_res = np.sum((y_all - y_est_all) ** 2)  # Sum of squared residuals
    ss_tot = np.sum((y_all - y_all.mean()) ** 2)  # Total sum of squares
    r2 = 1 - (ss_res / ss_tot)

    return constants, x_all, y_est_all, r2

