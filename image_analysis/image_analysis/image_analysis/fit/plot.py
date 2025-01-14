import matplotlib.pyplot as plt
import numpy as np
from skimage.morphology import binary_opening, binary_closing, disk
from scipy.ndimage import binary_fill_holes, gaussian_filter

from . import statistics
from sklearn.decomposition import PCA

def norm(x):
    x = x.astype(float)
    if np.max(x) != 0:
        x = x/np.max(x)
        return x
    else:
        return np.zeros(x.shape)
    
def rgb(ax, r, g, b, mask, pixel_size):
    
    r, g, b = norm(r), norm(g), norm(b)

    rr = (np.ones(mask.shape) * (1-g) * (1-b) * 255).astype( np.uint8 )
    gg = (np.ones(mask.shape) * (1-r) * (1-b) * 255).astype( np.uint8 )
    bb = (np.ones(mask.shape) * (1-r) * (1-g) * 255).astype( np.uint8 )

    ax.imshow( np.stack([rr, gg, bb], axis=2),       extent=[0, mask.shape[1]*pixel_size, mask.shape[0]*pixel_size, 0])
    ax.contour(mask, linewidths=0.1, colors='gray',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])

def rgb_contours(ax, r, g, b, mask, pixel_size):

    r = binary_closing( binary_fill_holes(r > 0), disk(5*pixel_size))
    g = binary_closing( binary_fill_holes(g > 0), disk(5*pixel_size))
    b = binary_closing( binary_fill_holes(b > 0), disk(5*pixel_size))

    ax.contour(r, colors='red',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])
    ax.contour(g, colors='green',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])
    ax.contour(b, colors='blue',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])

    mask = binary_closing( binary_fill_holes(mask > 0), disk(5*pixel_size))
    ax.contour(mask, colors='gray',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])

def shh_fgf_red_blue(img, pixel_size, shh_morph, fgf_morph, dpi_input):

    
    nrows = max([len(img[tkey]) for tkey in img.keys()])
    ncols = len(img.keys())
           
    x_lim, y_lim = 0, 0
    for tkey in img.keys():
        for nkey in img[tkey].keys():
            for file_name in img[tkey][nkey].keys():
                x_lim_n = img[tkey][nkey][file_name][shh_morph].shape[1]
                y_lim_n = img[tkey][nkey][file_name][shh_morph].shape[0]
                if x_lim < x_lim_n:
                    x_lim = x_lim_n
                if y_lim < y_lim_n:
                    y_lim = y_lim_n
                
    figsize_y, fig_size = plt.rcParams['figure.figsize']
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, nrows*fig_size), sharex=False, sharey=True)
    
    for i in ax.ravel():
        i.axis('off')
        i.set_xlim(0, x_lim * pixel_size)
        i.set_ylim(y_lim * pixel_size, 0)
    
    t_dpa = []
    for tkey in img.keys():
        t_dpa.append( int(tkey)  )
    t_dpa = np.sort( np.array(t_dpa) )
               
    i = 0
    for t in t_dpa:
        for nkey in img[str(t)].keys():
            for file_name in img[str(t)][nkey].keys():

                j = (int(nkey) - 1) * ncols + (i + 1)

                ax = plt.subplot(nrows, ncols, j)
                mask = img[str(t)][nkey][file_name]['tissue_mask_with_epi']
                r, g, b = img[str(t)][nkey][file_name][shh_morph], 0*img[str(t)][nkey][file_name][shh_morph], img[str(t)][nkey][file_name][fgf_morph]
                rgb(ax, r, g, b, mask, pixel_size)

                #title = str(t) + ' dpa, ' + str(nkey) + ' index'
                ax.set_xlim(0, x_lim * pixel_size)
                ax.set_ylim(y_lim * pixel_size, 0)
                ax.set_title( file_name )
                ax.axis('on')

        i = i + 1
    
    plt.tight_layout()

def shh_dusp_fgf_rgb(img, pixel_size, shh_morph, dusp_morph, fgf_morph, dpi_input):

    
    nrows = max([len(img[tkey]) for tkey in img.keys()])
    ncols = len(img.keys())
           
    x_lim, y_lim = 0, 0
    for tkey in img.keys():
        for nkey in img[tkey].keys():
            for file_name in img[tkey][nkey].keys():
                x_lim_n = img[tkey][nkey][file_name][shh_morph].shape[1]
                y_lim_n = img[tkey][nkey][file_name][shh_morph].shape[0]
                if x_lim < x_lim_n:
                    x_lim = x_lim_n
                if y_lim < y_lim_n:
                    y_lim = y_lim_n
                
    figsize_y, fig_size = plt.rcParams['figure.figsize']
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, nrows*fig_size), sharex=False, sharey=True)
    
    for i in ax.ravel():
        i.axis('off')
        i.set_xlim(0, x_lim * pixel_size)
        i.set_ylim(y_lim * pixel_size, 0)
    
    t_dpa = []
    for tkey in img.keys():
        t_dpa.append( int(tkey)  )
    t_dpa = np.sort( np.array(t_dpa) )
               
    i = 0
    for t in t_dpa:
        for nkey in img[str(t)].keys():
            for file_name in img[str(t)][nkey].keys():

                j = (int(nkey) - 1) * ncols + (i + 1)

                ax = plt.subplot(nrows, ncols, j)
                mask = img[str(t)][nkey][file_name]['tissue_mask_with_epi']
                r, g, b = img[str(t)][nkey][file_name][shh_morph], img[str(t)][nkey][file_name][dusp_morph], img[str(t)][nkey][file_name][fgf_morph]
                rgb_contours(ax, r, g, b, mask, pixel_size)

                #title = str(t) + ' dpa, ' + str(nkey) + ' index'
                ax.set_xlim(0, x_lim * pixel_size)
                ax.set_ylim(y_lim * pixel_size, 0)
                ax.set_title( file_name )
                ax.axis('on')

        i = i + 1
    
    plt.tight_layout()
    
def overlay_n(img, pixel_size, size, shh_morph, dusp_mask, fgf_morph, dpi_input):

    
    nrows = 1#max([len(img[tkey]) for tkey in img.keys()])
    ncols = len(img.keys())
           
    x_lim, y_lim = size, size
                
    figsize_y, fig_size = plt.rcParams['figure.figsize']
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, nrows*fig_size), sharex=False, sharey=True)
    
    for i in ax.ravel():
        i.axis('off')
        i.set_xlim(0, x_lim * pixel_size)
        i.set_ylim(y_lim * pixel_size, 0)
    
    t_dpa = []
    for tkey in img.keys():
        t_dpa.append( int(tkey)  )
    t_dpa = np.sort( np.array(t_dpa) )
               
    #i = 0
    j = 1
    for t in t_dpa:
        ax = plt.subplot(nrows, ncols, j)

        for nkey in img[str(t)].keys():
            for file_name in img[str(t)][nkey].keys():

                #j = (int(nkey) - 1) * ncols + (i + 1)

                
                mask = img[str(t)][nkey][file_name]['tissue_mask_with_epi']
                r, g, b = img[str(t)][nkey][file_name][shh_morph], img[str(t)][nkey][file_name][dusp_mask], img[str(t)][nkey][file_name][fgf_morph]
                rgb_contours(ax, r, g, b, mask, pixel_size)

                #title = str(t) + ' dpa, ' + str(nkey) + ' index'
                ax.set_xlim(0, x_lim * pixel_size)
                ax.set_ylim(y_lim * pixel_size, 0)
                ax.set_title( file_name )
                ax.axis('on')

        j = j + 1
    
    plt.tight_layout()

def compute_centered_r2(observed, predicted):
    """
    Compute the centered R² value for observed and predicted data. As in Excel. 
    Functions for statistical models return NOT centered value.
    """
    # Convert inputs to numpy arrays
    observed = np.array(observed)
    predicted = np.array(predicted)

    # Mean of observed values
    mean_observed = np.mean(observed)

    # Centered Total Sum of Squares (TSS)
    tss_centered = np.sum((observed - mean_observed) ** 2)

    # Sum of Squared Residuals (SSR)
    ssr = np.sum((observed - predicted) ** 2)

    # Centered R²
    r_sq_centered = 1 - ssr / tss_centered

    return r_sq_centered


def add_regr(ax, x, y, cl, name, fit_intercept=True, extend_to_zero=True, linestyle='solid', add_label=True):

    k, b, y_est, y_err, k_err, b_err, r2 = statistics.regr(x, y, fit_intercept, return_r2=True)

    r2 = compute_centered_r2(y, y_est)

    #with Hiddens():
    p = statistics.test_k0(x, y, 0.05)

    if add_label == True:
        text = name + f'R^2 = {round(r2, 2)}' # y = {round(k, 2)}x + {round(b, 2)}, p_v = {round(p, 2)}
    else:
        text = None
    #text = name + ', ' + f'k = {round(k, 2)} \u00B1 {round(k_err, 2)},  p_value(k = 0) = {round(p,2)}'
    #(text)
    #(text)
    ax.fill_between(
                    x, 
                    y_est - y_err, 
                    y_est + y_err, 
                    facecolor = cl,
                    alpha=0.1
                )
    if fit_intercept == True:
        ax.plot(x, y_est, color=cl, label=text, linestyle=linestyle)
    else:
        ax.plot(np.concatenate(([0], x)), np.concatenate(([0], y_est)), color=cl,  label=text, linestyle=linestyle)
    
    # Add a star marker if p > 0.05
    if p <= 0.05:
        ax.text(x[-1], 1.1 * y_est[-1], '*', color=cl, fontsize=16)

    
    if extend_to_zero==True:
        # Extend the x range
        x_max = max(x)
        x_extended = np.linspace(0, x_max, 100) 
        y_extended = k * x_extended + b
        ax.plot(x_extended, y_extended, color=cl, linestyle=(0, (1, 5)) )

    return k, b, p, r2

if __name__ == '__main__':
    pass