import numpy as np

def hill(A, K, n):
    return A**n/(A**n + K**n)

def nheaviside(x, accuracy):
    return np.where(x > -accuracy, 1, 0)

def nrect(x, x0, w, accuracy):
    return nheaviside(w + x0 - x, accuracy) * nheaviside(x - x0, accuracy)

def steady_solution(x, x0, lam, alpha, w, beta, Diff, L):

    # left  from the source
    part1 = 2 * np.sinh(w / (2 * lam)) * np.cosh((2 * L - 2 * x0 - w) / (2 * lam)) * np.cosh(x / lam)
    part1 = part1 * (x <= x0)

    # inside the source
    part2 = np.sinh(L / lam) - (np.sinh((L - w - x0) / lam) * np.cosh(x / lam) + np.sinh(x0 / lam) * np.cosh((L - x) / lam))
    part2 = part2 * (x > x0) * (x <= x0 + w)

    # right from the source
    part3 = 2 * np.sinh(w / (2 * lam)) * np.cosh((w + 2 * x0) / (2 * lam)) * np.cosh((L - x) / lam)
    part3 = part3 * (x > x0 + w)

    result = (alpha / (beta * np.sinh(L / lam))) * (part1 + part2 + part3) * (x0 + w <= L)
    
    return result