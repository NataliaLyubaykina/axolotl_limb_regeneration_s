import math
import matplotlib.colors as mcolors

# assume to be 1
D0      = 1
beta0   = 1
alpha0  = 1
lam0    = math.sqrt(D0/beta0) 

L_to_plot = [1.8 * lam0, 3.6 * lam0]

# supported by experiments
x00    = 0.5*lam0
w0     = 0.5*lam0

# minimal anitial size: minimal possible x0 + w, minimal ti assume 2 * (x0 + w)

# proportionality coefficient for scaling
b_lam   = 1 / 1.8
b_xw    = 0.5 / 1.8
b_alpha = alpha0 / min(L_to_plot)

sc_lam_keys = ['no', 'D', 'mixed', 'beta']
sc_s_keys   = ['', 'x', 'a', 'w', 'ax', 'xw', 'aw', 'axw']

color_scheme = {
    "no":    mcolors.to_rgb("black"),
    "D":     mcolors.to_rgb("cyan"),
    "mixed": mcolors.to_rgb("orange"),
    "beta":  mcolors.to_rgb("magenta")
}

def scaling_lam(b_lam, D0, beta0, alpha0, L):
    return {
        "no": {
            "lambda": math.sqrt(D0 / beta0),
            "beta":   beta0,
            "D":      D0
        },
        "D": {
            "lambda": b_lam * L,
            "beta":   beta0,
            "D":      beta0 * (b_lam * L)**2
        },
        "mixed": {
            "lambda": b_lam * L,
            "beta":   (beta0 * math.sqrt(D0 / beta0)) / (b_lam * L),
            "D":      (D0 * (b_lam * L)) / math.sqrt(D0 / beta0)
        },
        "beta": {
            "lambda": b_lam * L,
            "beta":   D0 / (b_lam * L)**2,
            "D":      D0
        }
    }

# Add elements function
def add_elements(x, y):
    return x + y if x == 0 else x

def scaling_source(b_xw, b_alpha, L, alpha0, x0, w0):
    sources = {}
    for i in range(2**3):  # 2^3 = 8 combinations
        binary_digits = [int(d) for d in f"{i:03b}"]  # Convert to 3-digit binary
        keys = "".join([char for char, digit in zip("axw", binary_digits) if digit])

        values = {
            "a":  add_elements(binary_digits[0] * (b_alpha * L), alpha0),
            "x0": add_elements(binary_digits[1] * (b_xw * L),    x00   ),
            "w":  add_elements(binary_digits[2] * (b_xw * L),    w0    )
        }

        sources[keys] = values
        
    return sources