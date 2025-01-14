# libraries and functions
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from tqdm.notebook import tqdm
from scipy.ndimage.morphology import binary_fill_holes

from . import regionprops
from . import plot

def G(x, x_0, l): 
    return np.exp( -abs(x - x_0)/l )

def plot_fit(x_r, x_g, x_b, x_grey, x_lightgr, r, g, b, grey, lightgr):
    
    fig_size_x, fig_size_y = 0.6*4, 0.6*2
    font_size = 6
    plt.rcParams.update({'font.size': font_size})
    
    fig, ax = plt.subplots( 1, 1, dpi=200, figsize=(2*fig_size_x, fig_size_y) )
    
    ax.plot(x_r, r, 'r', label = 'source', linewidth=0.5)
    ax.plot(x_g, g, 'g', label = 'exp. profile', linewidth=0.5)
    ax.plot(x_b,  b, 'b', label = 'Exp(-|x|/lambda)', linewidth=0.5 )
    ax.plot(x_grey, grey, color = 'grey', label = 'conv', linewidth=0.5)
    ax.plot(x_lightgr, lightgr, color = 'lightgreen', label = 'fit', linewidth=0.5)

    ax.vlines( [-3*max(x_g), -2*max(x_g), -max(x_g), 0, max(x_g), 2*max(x_g), 3*max(x_g)], 0, 1, color = 'black', linestyle = ':') 

    ax.set_xlabel('x, bins')
    
    handles, labels = ax.get_legend_handles_labels()
    fig.legend(handles, labels, loc="right", bbox_to_anchor=(1.15, 0.50), fontsize=font_size)
    
    plt.show()
    
def plot_rmsd(lam, RMSD, label_str):
    
    fig_size_x, fig_size_y = 0.6*4, 0.6*2
    font_size = 6
    plt.rcParams.update({'font.size': font_size})
    
    fig, ax = plt.subplots( 1, 1, dpi=200, figsize=(fig_size_x, fig_size_y) )
    
    ax.plot(lam, RMSD, label = label_str)

    ax.set_xlabel('lambda, bins')
    ax.set_ylabel('error')
    
    plt.legend()
    plt.show()

def middle(shh, ptch, shh_x0, initial_guess, interval, accuracy):
    
    print("-----Fit in the middle-----")
    print(f"Looking for lambda between {initial_guess*(1-interval)} and {initial_guess*(1+interval)}.")
    print(f"Step is {accuracy}.")
    
    ptch_0 = ptch
    shh = shh/np.max(shh)
    ptch = ptch/np.max(ptch)
    
    source = np.abs( (shh > np.max(shh)/2) )
    source = binary_fill_holes(source)
    mask = abs( source - 1 )
    mask = mask * (ptch > 0)      
    if shh_x0 < len( shh )/2:
        print("cut 0.15 from edge")
        edge_shift = int( 0.85 * len(mask) )
        mask[:shh_x0] = 0
        mask[edge_shift:] = 0
        x0 = np.nonzero(mask)[0][0]
    else:
        print("cut 0.15 from edge")
        edge_shift = int( 0.15 * len(mask) )
        mask[shh_x0:] = 0
        mask[:edge_shift] = 0
        x0 = np.nonzero(mask)[0][-1]

    ptch = ptch * mask

    font_size = 14
    line_width = 0.8
    plt.rcParams.update({'font.size': font_size})
        
    fig, ax = plt.subplots( 1, 1, dpi=50)

    x = np.linspace(0, shh.shape[0], shh.shape[0])

    #ax = plt.subplot(1, 1, 1)
    ax.plot(x, shh, color='magenta', linewidth=line_width, label='source shh/fgf')
    ax.plot(x, source, color='magenta', linewidth=line_width, label='source shape')
    ax.plot(x, ptch, color='black', linewidth=line_width, label='grad. ptch/dusp')


    x = np.linspace(0, len(shh), len(shh))
    X = len(shh)
    lam = []
    MSD = []
    fit = []
    R_value = []

    for l in np.linspace(initial_guess * (1 - interval), initial_guess * (1 + interval), int(1/accuracy) ):
        fit_funct = G(x, x0, l) * mask
        fit_funct = np.mean(ptch) * fit_funct/np.mean(fit_funct)
        m = np.mean( np.power(fit_funct - ptch, 2) )
        R = np.corrcoef(ptch, fit_funct)[0,1]
        lam.append(l)
        MSD.append(m)
        fit.append(fit_funct)
        R_value.append(R)

    R_value, lam, MSD, fit = np.array(R_value), np.array(lam), np.array(MSD), np.array(fit)

    lam_opt = lam[ np.argmin(MSD) ]
    R_value_opt = np.corrcoef(ptch, fit[np.argmin(MSD)])[0,1]
    fit_opt = fit[ np.argmin(MSD) ]

    RMSD = np.sqrt( np.array(MSD) )
    
    print(f'Fitted lambda:       {lam_opt} bins.')
    print(f'R value: {R_value_opt}.')
    
    ax.plot(x, fit_opt, color='gray', linewidth=line_width, label='fit')

    ax.set_xlabel('x, pixels')
    plt.legend()
    plt.show()

    #plot_fit(x, x, x, x, x, shh, ptch_0/max(ptch_0), G(x, x0, lam_opt), fit[np.argmin(MSD)], fit[np.argmin(MSD)])
    #plot_rmsd(lam, RMSD, 'middle region fit')
    
    #return lam, RMSD, lam_opt, R_value_opt, fit[np.argmin(MSD)]
    return lam, RMSD, lam_opt, R_value_opt, x, fit_opt, shh, source, ptch

    
def no_bound(shh, ptch, shh_x0, initial_guess, interval, accuracy):
    
    print("-----Fit remote boundaries-----")
    print(f"Looking for lambda between {initial_guess*(1-interval)} and {initial_guess*(1+interval)}.")
    print(f"Step is {accuracy}.")
        
    shh = shh/np.max(shh)
    ptch = ptch/np.max(ptch)
    
    x = np.linspace(0, len(shh), len(shh))
    X = len(shh)
    lam = []
    MSD = []
    fit = []
    R_value = []
    x_inf = np.concatenate( ((-np.linspace(0, 3*X, 3*X))[-1] - 1 + np.linspace(0, 3*X, 3*X), np.linspace(0, 3*X, 3*X)), 0)
    
    # periodic boundary
    shh = np.concatenate( (np.zeros(shh.shape), np.zeros(shh.shape), np.zeros(shh.shape), shh, np.zeros(shh.shape), np.zeros(shh.shape)), 0)
    
    for l in np.linspace(initial_guess * (1 - interval), initial_guess * (1 + interval), int(1/accuracy) ):
        conv = np.convolve( shh, G(x_inf, shh_x0, l))[6*X+int(shh_x0):7*X+int(shh_x0)]
        conv = np.mean(ptch) * conv/np.mean(conv)
        m = np.mean( np.power(conv - ptch, 2) )
        R = np.corrcoef(ptch, conv)[0,1]
        lam.append(l)
        MSD.append(m)
        fit.append(conv)
        R_value.append(R)
        
    R_value, lam, MSD, fit = np.array(R_value), np.array(lam), np.array(MSD), np.array(fit)
    
    lam_opt = lam[ np.argmin(MSD) ]
    R_value_opt = np.corrcoef(ptch, fit[np.argmin(MSD)])[0,1]
    
    RMSD = np.sqrt( np.array(MSD) )
    
    print(f'Fitted lambda:       {lam_opt} bins.')
    print(f'R value: {R_value_opt}.')
    
    conv = np.convolve( shh, G(x_inf, shh_x0, lam_opt))[3*X+int(shh_x0):9*X+int(shh_x0)]
    
    #plot_fit(x_inf, x, x_inf, x_inf, x, shh, ptch, G(x_inf, shh_x0, lam_opt), conv/np.max(conv), fit[np.argmin(MSD)] )
    #plot_rmsd(lam, RMSD, 'Periodic Boundary')

    return lam, RMSD, lam_opt, R_value_opt, fit[np.argmin(MSD)]


def refl_bound(shh, ptch, shh_x0, initial_guess, interval, accuracy):
    
    print("-----Fit reflecting boundaries-----")
    print(f"Looking for lambda between {initial_guess*(1-interval)} and {initial_guess*(1+interval)}.")
    print(f"Step is {accuracy}.")
        
    shh = shh/np.max(shh)
    ptch = ptch/np.max(ptch)
    
    x = np.linspace(0, len(shh), len(shh))
    X = len(shh)
    lam = []
    MSD = []
    fit = []
    R_value = []
    x_inf = np.concatenate( ((-np.linspace(0, 3*X, 3*X))[-1] - 1 + np.linspace(0, 3*X, 3*X), np.linspace(0, 3*X, 3*X)), 0)
    
    # reflectiong boundary
    shh = np.concatenate( (np.flip(shh, 0), shh, np.flip(shh, 0), shh, np.flip(shh, 0), shh), 0)
    
    for l in np.linspace(initial_guess * (1 - interval), initial_guess * (1 + interval), int(1/accuracy) ):
        conv = np.convolve( shh, G(x_inf, shh_x0, l))[6*X+int(shh_x0):7*X+int(shh_x0)]
        conv = np.mean(ptch) * conv/np.mean(conv)
        m = np.mean( np.power(conv - ptch, 2) )
        R = np.corrcoef(ptch, conv)[0,1]
        lam.append(l)
        MSD.append(m)
        fit.append(conv)
        R_value.append(R)
        
    R_value, lam, MSD, fit = np.array(R_value), np.array(lam), np.array(MSD), np.array(fit)
    
    lam_opt = lam[ np.argmin(MSD) ]
    R_value_opt = np.corrcoef(ptch, fit[np.argmin(MSD)])[0,1]
    
    RMSD = np.sqrt( np.array(MSD) )
    
    print(f'Fitted lambda:       {lam_opt} bins.')
    print(f'R value: {R_value_opt}.')
    
    conv = np.convolve( shh, G(x_inf, shh_x0, lam_opt))[3*X+int(shh_x0):9*X+int(shh_x0)]
    
    #plot_fit(x_inf, x, x_inf, x_inf, x, shh, ptch, G(x_inf, shh_x0, lam_opt), conv/np.max(conv), fit[np.argmin(MSD)] )
    #plot_rmsd(lam, RMSD, 'Reflecting Boundary')
    
    return lam, RMSD, lam_opt, R_value_opt, fit[np.argmin(MSD)]


def abs_bound(shh, ptch, shh_x0, initial_guess, interval, accuracy):
    
    print("-----Fit absorbing boundaries-----")
    print(f"Looking for lambda between {initial_guess*(1-interval)} and {initial_guess*(1+interval)}.")
    print(f"Step is {accuracy}.")
        
    shh = shh/np.max(shh)
    ptch = ptch/np.max(ptch)
    
    x = np.linspace(0, len(shh), len(shh))
    X = len(shh)
    lam = []
    MSD = []
    fit = []
    R_value = []
    x_inf = np.concatenate( ((-np.linspace(0, 3*X, 3*X))[-1] - 1 + np.linspace(0, 3*X, 3*X), np.linspace(0, 3*X, 3*X)), 0)
    
    # absorbing boundary
    shh = np.concatenate( (-np.flip(shh, 0), shh, -np.flip(shh, 0), shh, -np.flip(shh, 0), shh), 0)

    for l in np.linspace(initial_guess * (1 - interval), initial_guess * (1 + interval), int(1/accuracy) ):
        conv = np.convolve( shh, G(x_inf, shh_x0, l))[6*X+int(shh_x0):7*X+int(shh_x0)]
        conv = np.mean(ptch) * conv/np.mean(conv)
        m = np.mean( np.power(conv - ptch, 2) )
        R = np.corrcoef(ptch, conv)[0,1]
        lam.append(l)
        MSD.append(m)
        fit.append(conv)
        R_value.append(R)

    R_value, lam, MSD, fit = np.array(R_value), np.array(lam), np.array(MSD), np.array(fit)
    
    lam_opt = lam[ np.argmin(MSD) ]
    R_value_opt = np.corrcoef(ptch, fit[np.argmin(MSD)])[0,1]
    
    RMSD = np.sqrt( np.array(MSD) )
    
    print(f'Fitted lambda:       {lam_opt} bins.')
    print(f'R value: {R_value_opt}.')
    
    conv = np.convolve( shh, G(x_inf, shh_x0, lam_opt))[3*X+int(shh_x0):9*X+int(shh_x0)]
    
    #plot_fit(x_inf, x, x_inf, x_inf, x, shh, ptch, G(x_inf, shh_x0, lam_opt), conv/np.max(conv), fit[np.argmin(MSD)] )
    #plot_rmsd(lam, RMSD, 'Absorbing Boundary')
    
    return lam, RMSD, lam_opt, R_value_opt, fit[np.argmin(MSD)]

def abs_refl_bound(shh, ptch, shh_x0, initial_guess, interval, accuracy):
    
    print("-----Fit absorbing-reflecting boundaries-----")
    print(f"Looking for lambda between {initial_guess*(1-interval)} and {initial_guess*(1+interval)}.")
    print(f"Step is {accuracy}.")
        
    shh = shh/np.max(shh)
    ptch = ptch/np.max(ptch)
    
    x = np.linspace(0, len(shh), len(shh))
    X = len(shh)
    lam = []
    MSD = []
    fit = []
    R_value = []
    x_inf = np.concatenate( ((-np.linspace(0, 3*X, 3*X))[-1] - 1 + np.linspace(0, 3*X, 3*X), np.linspace(0, 3*X, 3*X)), 0)
    
    # reflectiong boundary
    shh = np.concatenate( (np.flip(shh, 0), -shh, -np.flip(shh, 0), shh, np.flip(shh, 0), -shh), 0)
    
    for l in np.linspace(initial_guess * (1 - interval), initial_guess * (1 + interval), int(1/accuracy) ):
        conv = np.convolve( shh, G(x_inf, shh_x0, l))[6*X+int(shh_x0):7*X+int(shh_x0)]
        conv = np.mean(ptch) * conv/np.mean(conv)
        m = np.mean( np.power(conv - ptch, 2) )
        R = np.corrcoef(ptch, conv)[0,1]
        lam.append(l)
        MSD.append(m)
        fit.append(conv)
        R_value.append(R)
        
    R_value, lam, MSD, fit = np.array(R_value), np.array(lam), np.array(MSD), np.array(fit)
    
    lam_opt = lam[ np.argmin(MSD) ]
    R_value_opt = np.corrcoef(ptch, fit[np.argmin(MSD)])[0,1]
    
    RMSD = np.sqrt( np.array(MSD) )
    
    print(f'Fitted lambda:       {lam_opt} bins.')
    print(f'R value: {R_value_opt}.')
    
    conv = np.convolve( shh, G(x_inf, shh_x0, lam_opt))[3*X+int(shh_x0):9*X+int(shh_x0)]
    
    #plot_fit(x_inf, x, x_inf, x_inf, x, shh, ptch, G(x_inf, shh_x0, lam_opt), conv/np.max(conv), fit[np.argmin(MSD)] )
    #plot_rmsd(lam, RMSD, 'absorb-reflect. Boundary')
    
    return lam, RMSD, lam_opt, R_value_opt, fit[np.argmin(MSD)]


def parm_and_fit(img, pixel_size):
    shh_morph = 'shh_bg_substr_clip'

    parm = pd.DataFrame(columns=[
        'time', 'file', 'L', 'L_ptch', 'ls', 'lf', 'ws', 'wf', 
        'lam_middle', 'R_middle', 'lam_pb', 'R_pb', 'lam_rb', 'R_rb', 'lam_ab', 'R_ab'
    ])

    for key_t in img:
        for k_num in img[key_t].keys():
            image = img[key_t][k_num]
            L = image['shh'].shape[0] * pixel_size
            L_ptch = np.max( np.nonzero( image['ptch_bg_substr_clip'] ) ) * pixel_size
            ls_ind = regionprops.center_mass( image[shh_morph] )
            ls = ls_ind * pixel_size
            lf_ind = regionprops.center_mass( image['fgf_bg_substr_clip'] )
            lf = L - lf_ind * pixel_size # not the same as lf_ind, but from other edge!
            ws = regionprops.rmse(image[shh_morph], ls_ind) * pixel_size
            wf = regionprops.rmse(image['fgf_bg_substr_clip'], lf_ind) * pixel_size

            ptch_morph = 'ptch_bg_substr' # for fit
            lam_middle, RMSD_middle, lam_middle_ind, err_middle, fit_middle = middle(image[shh_morph], image[ptch_morph], ls_ind, 31, 0.9, 0.001)
            lam_pb, RMSD_pb, lam_pb_ind, err_pb, fit_pb = no_bound(image[shh_morph], image[ptch_morph], ls_ind, 34, 0.9, 0.001)
            lam_rb, RMSD_rb, lam_rb_ind, err_rb, fit_rb = refl_bound(image[shh_morph], image[ptch_morph], ls_ind, 34, 0.9, 0.001)
            lam_ab, RMSD_ab, lam_ab_ind, err_ab, fit_ab = abs_bound(image[shh_morph], image[ptch_morph], ls_ind, 34, 0.9, 0.001)

            d = {
                'time':       key_t,
                'file':       k_num,
                'L':          [round(L)],
                'L_ptch':     [round(L_ptch)],
                'ls':         [round(ls)],
                'lf':         [round(lf)],
                'ws':         [round(ws)],
                'wf':         [round(wf)],
                'lam_middle': [round(lam_middle_ind * pixel_size)],
                'R_middle':   [round(err_middle, 2)],    
                'lam_pb':     [round(lam_pb_ind * pixel_size)],
                'R_pb':       [round(err_pb, 2)],
                'lam_rb':     [round(lam_rb_ind * pixel_size)],
                'R_rb':       [round(err_rb, 2)],
                'lam_ab':     [round(lam_ab_ind * pixel_size)],
                'R_ab':       [round(err_ab, 2)]
            }
            df = pd.DataFrame(data=d)
            parm = parm.append(df, ignore_index=True)

    parm.sort_values(by='file', inplace=True, ignore_index=True)
    parm.sort_values(by='time', inplace=True, ignore_index=True)

    for column in parm:
        parm[column] = [float(t) for t in parm[column]]
    
    return parm

def parm(img, pixel_size):
    shh_morph = 'shh_bg_substr_clip'

    parm = pd.DataFrame(columns=[
        'time', 'file', 'L', 'As', 'Ap', 'Af', 'L_ptch', 'ls', 'lf', 'ws', 'wf'
    ])
    sigma_filt_ampl = 2
    
    for key_t in img:
        for k_num in img[key_t].keys():
            image = img[key_t][k_num]
            L = image['shh'].shape[0] * pixel_size
            #lp_ind = regionprops.center_mass( image['ptch_bg_substr_clip'] )
            #L_ptch = regionprops.rmse(image['ptch_bg_substr'], lp_ind) * pixel_size
            As = regionprops.ampl( image[shh_morph], sigma_filt_ampl )
            Ap = regionprops.ampl( image['ptch_bg_substr_clip'], sigma_filt_ampl )
            Af = regionprops.ampl( image['fgf_bg_substr_clip'], sigma_filt_ampl )
            L_ptch = np.max( np.nonzero( image['ptch_bg_substr_clip'] ) ) * pixel_size
            ls_ind = regionprops.center_mass( image[shh_morph] )
            ls = ls_ind * pixel_size
            lf_ind = regionprops.center_mass( image['fgf_bg_substr_clip'] )
            lf = L - lf_ind * pixel_size # not the same as lf_ind, but from other edge!
            ws = regionprops.rmse(image[shh_morph], ls_ind) * pixel_size
            wf = regionprops.rmse(image['fgf_bg_substr_clip'], lf_ind) * pixel_size

            d = {
            'time':       key_t,
            'file':       k_num,
            'L':          [round(L)],                
            'As':         [round(As)], 
            'Ap':         [round(Ap)], 
            'Af':         [round(Af)], 
            'L_ptch':     [round(L_ptch)],
            'ls':         [round(ls)],
            'lf':         [round(lf)],
            'ws':         [round(ws)],
            'wf':         [round(wf)]
            }
            df = pd.DataFrame(data=d)
            parm = parm.append(df, ignore_index=True)

    parm.sort_values(by='file', inplace=True, ignore_index=True)
    parm.sort_values(by='time', inplace=True, ignore_index=True)

    for column in parm:
        parm[column] = [float(t) for t in parm[column]]
    
    return parm

def plot_error_lam(ax, pixel_size, lam_middle, lam_pb, lam_rb, lam_ab, RMSD_middle, RMSD_pb, RMSD_rb, RMSD_ab):  
    lw = 0.5
    ax.plot(lam_middle, RMSD_middle, color = 'gray', label = 'middle fit', linewidth=lw)
    ax.plot(lam_pb, RMSD_pb, ':', color = 'black', label = 'infinite bound.', linewidth=lw)
    ax.plot(lam_rb, RMSD_rb, '-.', color = 'black', label = 'reflecting bound.', linewidth=lw)
    ax.plot(lam_ab, RMSD_ab, '--', color = 'black', label = 'absorbing bound.', linewidth=lw)
    ax.set_ylim(0, 0.4)
    ax.get_yaxis().set_visible(False)
    ax.set_xlabel('\u03BB, \u03BCm')
    ax.legend(loc='upper right')    
    
def ptch_shh(ax, x, shh, ptch, line_width): 
    ax.plot(x, shh/np.max(shh), color='red',  linewidth = line_width)
    ax.plot(x, ptch/np.max(ptch), color='green', linewidth = line_width)

def plot_fit(ax, x, shh, ptch, fit_middle, fit_pb, fit_rb, fit_ab):
    lw = 0.5
    ptch_shh(ax, x, shh,  ptch, lw/1.5)
    ax.plot( x , fit_middle, color = 'gray', linewidth = lw )
    ax.plot( x , fit_pb, ':',  color = 'black', linewidth = lw )
    ax.plot( x , fit_rb, '-.', color = 'black', linewidth = lw)
    ax.plot( x , fit_ab, '--', color = 'black', linewidth = lw)
    ax.set_ylim(0, 1)
    ax.get_yaxis().set_visible(False)
    ax.set_xlabel('x, \u03BCm')
    
def fit_all(img, pixel_size, dpi_input):

    fig, ax, nrows, ncols, t_dpa, font_size = plot.frame(img, pixel_size, dpi_input)
    subfig = fig.subfigures(nrows, ncols)
    
    shh_morph = 'shh_bg_substr_clip'
    ptch_morph = 'ptch_bg_substr' # for fit
    
    parm = pd.DataFrame(columns=[
        'time', 'file', 'lam_middle', 'R_middle', 'lam_pb', 'R_pb', 'lam_rb', 'R_rb', 'lam_ab', 'R_ab'
    ])

    i = 0
    for key_t in tqdm(t_dpa):
        for k_num in img[str(key_t)].keys():
            image = img[str(key_t)][k_num]
            ls_ind = regionprops.center_mass( image[shh_morph] )
            lf_ind = regionprops.center_mass( image['fgf_bg_substr_clip'] )

            ptch_morph = 'ptch_bg_substr' # for fit
            accuracy = 0.001
            L = image['shh'].shape[0] * pixel_size
            lam_middle, RMSD_middle, lam_middle_ind, err_middle, fit_middle = middle(image[shh_morph], image[ptch_morph], ls_ind, 31, 0.9, accuracy)
            lam_pb, RMSD_pb, lam_pb_ind, err_pb, fit_pb = no_bound(image[shh_morph], image[ptch_morph], ls_ind, 34, 0.9, accuracy)
            lam_rb, RMSD_rb, lam_rb_ind, err_rb, fit_rb = refl_bound(image[shh_morph], image[ptch_morph], ls_ind, 34, 0.9, accuracy)
            lam_ab, RMSD_ab, lam_ab_ind, err_ab, fit_ab = abs_bound(image[shh_morph], image[ptch_morph], ls_ind, 34, 0.9, accuracy)

            d = {
                'L':          round(L),
                'time':       key_t,
                'file':       k_num,
                'lam_middle': [round(lam_middle_ind * pixel_size)],
                'R_middle':   [round(err_middle, 2)],    
                'lam_pb':     [round(lam_pb_ind * pixel_size)],
                'R_pb':       [round(err_pb, 2)],
                'lam_rb':     [round(lam_rb_ind * pixel_size)],
                'R_rb':       [round(err_rb, 2)],
                'lam_ab':     [round(lam_ab_ind * pixel_size)],
                'R_ab':       [round(err_ab, 2)]
            }
            df = pd.DataFrame(data=d)
            parm = parm.append(df, ignore_index=True)
        
            # have to think about this condition to get right plots positions
            j = (int(k_num) - 1) * ncols + (i + 1)
            title = str(key_t) + ' dpa, n = ' + k_num + \
                '\n\u03BBmid = ' + str(d['lam_middle'][0]) + ' \u03BCm' + \
                '\n\u03BBpd = ' + str(d['lam_pb'][0]) + ' \u03BCm' + \
                '\n\u03BBrb = ' + str(d['lam_rb'][0]) + ' \u03BCm' + \
                '\n\u03BBab = ' + str(d['lam_ab'][0]) + ' \u03BCm'
            
            axs = subfig[int(k_num)-1][i].subplots(2, 1)
            plot_error_lam(axs[0], pixel_size, lam_middle* pixel_size, lam_pb* pixel_size, lam_rb* pixel_size, lam_ab* pixel_size, RMSD_middle, RMSD_pb, RMSD_rb, RMSD_ab)
            #if j < ncols + 1:
            axs[0].set_title(title, fontsize = font_size )
            
            if i == 0:
                axs[0].get_yaxis().set_visible(True)
                axs[0].set_ylabel('error')
            
            x = np.linspace(0, image[shh_morph].shape[0], image[shh_morph].shape[0]) * pixel_size
            plot_fit(axs[1], x, image[shh_morph], image[ptch_morph], fit_middle, fit_pb, fit_rb, fit_ab)
            if i == 0:
                axs[1].get_yaxis().set_visible(True)
                axs[1].set_ylabel('Intensity')
                
        i = i + 1
    
    plt.show()
            
    parm.sort_values(by='file', inplace=True, ignore_index=True)
    parm.sort_values(by='time', inplace=True, ignore_index=True)

    for column in parm:
        parm[column] = [float(t) for t in parm[column]]
    
    return parm