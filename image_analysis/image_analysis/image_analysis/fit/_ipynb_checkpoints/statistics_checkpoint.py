from skimage import io
import math
import os
import numpy as np
from scipy import stats

def regr(x, y):
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
    print('chech hypothesis: data is discribed by the regression with k = 0')
    print(f'p_value = {round(p,2)}')
    print(f'reject hypothesis p < {sign_lev}: {p < sign_lev}')
    return p