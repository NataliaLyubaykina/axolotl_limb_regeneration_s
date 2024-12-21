import numpy as np

def fill_gaps(array):
    if not isinstance(array, np.ndarray):
        raise ValueError("Input must be a numpy array.")
    if not np.all((array == 0) | (array == 1)):
        raise ValueError("Array must contain only 0s and 1s.")
    
    indices = np.where(array == 1)[0]  # Find positions of 1s
    if len(indices) > 0:  # Check if there are any 1's
        array[indices[0]:indices[-1] + 1] = 1
    return array

def one_morph_growth_rule( s, threshold, accuracy ):

    growth_region = np.where(s - threshold > accuracy, 1, 0) 
    growth_region = fill_gaps(growth_region)

    # trick to deal with additional bins 
    if growth_region[2] == 1:
        growth_region[0] = 1
        growth_region[1] = 1
    if growth_region[-3] == 1:
        growth_region[-1] = 1
        growth_region[-2] = 1

    return growth_region

def two_morph_growth_rule( s, f, threshold, accuracy ):

    growth_region = np.where(s - threshold > accuracy, 1, 0) * np.where(f - threshold > accuracy, 1, 0)
    growth_region = fill_gaps(growth_region)

    # trick to deal with additional bins 
    if growth_region[2] == 1:
        growth_region[0] = 1
        growth_region[1] = 1
    if growth_region[-3] == 1:
        growth_region[-1] = 1
        growth_region[-2] = 1

    return growth_region