import matplotlib.pyplot as plt
from skimage import io
import math
import os
import numpy as np
from scipy import stats
from skimage.morphology import binary_opening, binary_closing, disk
import skimage

from . import statistics
from . import regionprops
from image_analysis.preprocess import file_structure

fig_size_x = 5
fig_size_y = 5
font_size = 10

# https://stackoverflow.com/questions/53235638/how-should-i-convert-a-float32-image-to-an-uint8-image
def norm1(I):
    I = I.astype(np.float64)
    if I.max() != 0:
        return I/I.max()
    else:
        return np.zeros(I.shape)

def rgb(ax, r, g, b, mask, pixel_size):
    
    mask_rgb = ((r + g + b) > 0) * 1
    mask_inv = np.abs( mask.astype(bool)-1 ).astype( np.float64 )
    r, g, b = norm1(r), norm1(g), norm1(b)

    rr = (np.ones(mask.shape) * (1-g) * (1-b) * 255).astype( np.uint8 )
    gg = (np.ones(mask.shape) * (1-r) * (1-b) * 255).astype( np.uint8 )
    bb = (np.ones(mask.shape) * (1-r) * (1-g) * 255).astype( np.uint8 )

    ax.imshow( np.stack([rr, gg, bb], axis=2),       extent=[0, mask.shape[1]*pixel_size, mask.shape[0]*pixel_size, 0])
    ax.contour(mask, linewidths=0.1, colors='gray',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])

def rgb_contours(ax, r, g, b, mask, pixel_size):
    
    mask_rgb = ((r + g + b) > 0) * 1
    r, g, b = norm1(r), norm1(g), norm1(b)
    empty = (255 * np.ones(r.shape)).astype(int)
    ax.imshow( np.stack([empty, empty, empty], axis=2),       extent=[0, mask.shape[1]*pixel_size, mask.shape[0]*pixel_size, 0])
    
    ax.contour(r, linewidths=0.1, colors='red',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])
    ax.contour(g, linewidths=0.1, colors='green',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])
    ax.contour(b, linewidths=0.1, colors='blue',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])
    ax.contour(mask, linewidths=0.1, colors='gray',  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])
    
def rgb_contours_color(ax, r, g, b, mask, pixel_size, colors):
    
    color_r,  color_g,  color_b, color_m = colors
    
    mask_rgb = ((r + g + b) > 0) * 1
    r, g, b = norm1(r), norm1(g), norm1(b)
    empty = (255 * np.ones(r.shape)).astype(int)
    ax.imshow( np.stack([empty, empty, empty], axis=2),       extent=[0, mask.shape[1]*pixel_size, mask.shape[0]*pixel_size, 0])
    
    ax.contour(r, linewidths=0.1, colors=color_r,  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])
    ax.contour(g, linewidths=0.1, colors=color_g,  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])
    ax.contour(b, linewidths=0.1, colors=color_b,  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size])
    ax.contour(mask, linewidths=0.1, colors=color_m,  extent=[0, mask.shape[1]*pixel_size, 0, mask.shape[0]*pixel_size]) 
    
def add_line(ax, p1, p2, c):
    x = [p1[1], p2[1]]
    y = [p1[0], p2[0]]
    ax.plot(x, y, color=c, linewidth=0.5)

def add_cm_vec(ax, s, p, f, pixel_size):
    sc_v = 0.5
    
    s_cm = regionprops.center_mass(s)*pixel_size
    p_cm = regionprops.center_mass(p)*pixel_size
    
       
    ax.plot(s_cm[1], s_cm[0], 'ro', markersize=1)
    #ax.plot(p_cm[1], p_cm[0], 'go', markersize=1)
    
    #ex_2d = np.array([0,1])
    #add_line(ax, p_cm, p_cm + 100*ex_2d, 'b')
    
    # s main PCA axis
    #s_vec = (regionprops_u.eig_vec(s)['vec'])
    #for v in s_vec:
    #    add_line(ax, s_cm, s_cm + sc_v*v, 'r')
    # p main PCA axis
    #p_vec = regionprops_u.eig_vec(p)['vec']# * regionprops_u.eig_vec(p)['lam']
    #for v in p_vec:
    #    add_line(ax, p_cm, p_cm + sc_v*v, 'g')
    
    if str(f) != 'None':
        f_cm = regionprops.center_mass(f)*pixel_size
        ax.plot(f_cm[1], f_cm[0], 'bo', markersize=1)
    
        # sf
        add_line(ax, s_cm, f_cm, "gray")
        
        # sf middle
        ax.plot(f_cm[1] + 0.5 * (s_cm[1] - f_cm[1]), f_cm[0] + 0.5*(s_cm[0] - f_cm[0]), '.', color='gray', markersize=1)
        
        # sf edge points
        ax.plot(f_cm[1], f_cm[0], '.', color='blue', markersize=1)
        ax.plot(s_cm[1], s_cm[0], '.', color='red', markersize=1)

        # f main PCA axis
        #f_vec = (regionprops_u.eig_vec(f)['vec'])
        #for v in f_vec:
        #    add_line(ax, f_cm, f_cm + sc_v*v, 'b')

def add_cm_vec_color(ax, s, p, f, pixel_size, colors):
    
    color_r,  color_g,  color_b, color_m = colors
    
    sc_v = 0.5
    
    s_cm = regionprops.center_mass(s)*pixel_size
    p_cm = regionprops.center_mass(p)*pixel_size
    
    #ax.plot(s_cm[1], s_cm[0], 'ro', markersize=1)
    if str(f) != 'None':
        f_cm = regionprops.center_mass(f)*pixel_size
        #ax.plot(f_cm[1], f_cm[0], 'bo', markersize=1)
    
        # sf
        add_line(ax, s_cm, f_cm, color_m)
        
        # sf middle
        ax.plot(f_cm[1] + 0.5 * (s_cm[1] - f_cm[1]), f_cm[0] + 0.5*(s_cm[0] - f_cm[0]), 'o', color=color_m, markersize=1)
        
        # sf edge points
        ax.plot(f_cm[1], f_cm[0], '.', color=color_b, markersize=1)
        ax.plot(s_cm[1], s_cm[0], '.', color=color_r, markersize=1)
                
        
def all_img(img, pixel_size, shh_morph, ptch_morph, fgf_morph, add_cm_vec_cond, dpi_input):
    
    font_size = 4
    plt.rcParams.update({'font.size': font_size})
    
    nrows = len( img.keys() )
    ncols = 0
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            if ncols < int(k_num):
                ncols = int(k_num)
                
    x_lim, y_lim = 0, 0
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            x_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[1]
            y_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[0]
            if x_lim < x_lim_n:
                x_lim = x_lim_n
            if y_lim < y_lim_n:
                y_lim = y_lim_n
                
    fig_size = 1
    fig, ax = plt.subplots(nrows, ncols, dpi=200, figsize=(ncols*fig_size, ncols*fig_size), sharex=True, sharey=True)
    
    for i in ax.ravel():
        i.axis('off')
        i.set_xlim(0, x_lim * pixel_size)
        i.set_ylim(y_lim * pixel_size, 0)
    
    t_dpa = []
    for k_dpa in img.keys():
        t_dpa.append( int(k_dpa)  )
    t_dpa = np.sort( np.array(t_dpa) )
    
    i = 0
    for t in t_dpa:
        for k_num in img[str(t)].keys():
            j = i*ncols + int(k_num)
            ax = plt.subplot(nrows, ncols, j)
            mask = ((img[str(t)][k_num]['shh'] > 0) * 1).astype( np.uint16)
            r, g, b = img[str(t)][k_num][shh_morph], img[str(t)][k_num][ptch_morph], img[str(t)][k_num][fgf_morph]
            rgb(ax, r, g, b, mask, pixel_size)
            if add_cm_vec_cond == True:
                add_cm_vec(ax, r, g, b, pixel_size)
            title = str(t) + ' dpa\n' + str(k_num)
            ax.set_title(title, fontsize = font_size )
            ax.set_xlim(0, x_lim * pixel_size)
            ax.set_ylim(y_lim * pixel_size, 0)
            if j > ncols*nrows - ncols:
                ax.set_xlabel('\u03BCm')
            if (j-1)%ncols == 0:
                ax.set_ylabel('\u03BCm')
            ax.axis('on')
        i = i + 1
    
    plt.tight_layout()
    
    #fig_name = 'all_img_'+ptch_morph+'.png'
    #fig_path = os.path.join(os.getcwd(), 'fig', fig_name)
    
    #print(fig_path)
    #plt.savefig(fig_path, bbox_inches='tight', dpi=200)
    plt.show()

def all_img_rev(img, pixel_size, shh_morph, ptch_morph, fgf_morph, add_cm_vec_cond, dpi_input):
    
    font_size = 4
    plt.rcParams.update({'font.size': font_size})
    
    nrows = 0
    ncols = len( img.keys() )
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            if nrows < int(k_num):
                nrows = int(k_num)
                
    x_lim, y_lim = 0, 0
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            x_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[1]
            y_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[0]
            if x_lim < x_lim_n:
                x_lim = x_lim_n
            if y_lim < y_lim_n:
                y_lim = y_lim_n
                
    fig_size = 1
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, nrows*fig_size), sharex=False, sharey=True)
    
    for i in ax.ravel():
        i.axis('off')
        i.set_xlim(0, x_lim * pixel_size)
        i.set_ylim(y_lim * pixel_size, 0)
    
    t_dpa = []
    for k_dpa in img.keys():
        t_dpa.append( int(k_dpa)  )
    t_dpa = np.sort( np.array(t_dpa) )
               
    i = 0
    for t in t_dpa:
        for k_num in img[str(t)].keys():
            # have to think about this condition to get right plots positions
            j = (int(k_num) - 1) * ncols + (i + 1)
            ax = plt.subplot(nrows, ncols, j)
            mask = ((img[str(t)][k_num]['shh'] > 0) * 1).astype( np.uint16)
            r, g = img[str(t)][k_num][shh_morph], img[str(t)][k_num][ptch_morph]
            if fgf_morph == None:
                b = np.zeros( (img[str(t)][k_num][shh_morph]).shape )
                rgb(ax, r, g, b, mask, pixel_size)
                if add_cm_vec_cond == True:
                    add_cm_vec(ax, r, g, None, pixel_size)
            else:
                b = img[str(t)][k_num][fgf_morph]                
                rgb(ax, r, g, b, mask, pixel_size)
                
                if add_cm_vec_cond == True:
                    add_cm_vec(ax, r, 0*g, b, pixel_size)
            title = str(t) + ' dpa'# + str(k_num)
            ax.set_xlim(0, x_lim * pixel_size)
            ax.set_ylim(y_lim * pixel_size, 0)
            if j < ncols + 1:
                ax.set_title(title, fontsize = font_size )
            if j > ncols*nrows - ncols:
                ax.set_xlabel('\u03BCm')
            if (j-1)%ncols == 0:
                ax.set_ylabel('\u03BCm')
            ax.axis('on')
        i = i + 1
    
    plt.tight_layout()
    
    #fig_name = 'all_img_'+ptch_morph+'.png'
    #fig_path = os.path.join(os.getcwd(), 'fig', fig_name)
    
    #print(fig_path)
    #plt.savefig(fig_path, bbox_inches='tight', dpi=200)
    #plt.show()
    
def sf_img_rev(img, pixel_size, shh_morph, ptch_morph, fgf_morph, add_cm_vec_cond, dpi_input):
    
    font_size = 4
    plt.rcParams.update({'font.size': font_size})
    
    nrows = 0
    ncols = len( img.keys() )
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            if nrows < int(k_num):
                nrows = int(k_num)
                
    x_lim, y_lim = 0, 0
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            x_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[1]
            y_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[0]
            if x_lim < x_lim_n:
                x_lim = x_lim_n
            if y_lim < y_lim_n:
                y_lim = y_lim_n
                
    fig_size = 1
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, nrows*fig_size), sharex=False, sharey=True)
    
    for i in ax.ravel():
        i.axis('off')
        i.set_xlim(0, x_lim * pixel_size)
        i.set_ylim(y_lim * pixel_size, 0)
    
    t_dpa = []
    for k_dpa in img.keys():
        t_dpa.append( int(k_dpa)  )
    t_dpa = np.sort( np.array(t_dpa) )
               
    i = 0
    for t in t_dpa:
        for k_num in img[str(t)].keys():
            # have to think about this condition to get right plots positions
            j = (int(k_num) - 1) * ncols + (i + 1)
            ax = plt.subplot(nrows, ncols, j)
            mask = ((img[str(t)][k_num]['shh'] > 0) * 1).astype( np.uint16)
            r, g = img[str(t)][k_num][shh_morph], img[str(t)][k_num][ptch_morph]

            b = img[str(t)][k_num][fgf_morph]
            selem = disk(radius=10)
            r = binary_opening( r, selem )
            g = 0*r
            b = binary_opening( b, selem )
            rgb_contours(ax, r, g, b, mask, pixel_size)

            if add_cm_vec_cond == True:
                add_cm_vec(ax, r, 0*g, b, pixel_size)
            title = str(t) + ' dpa'# + str(k_num)
            #ax.set_xlim(0, x_lim * pixel_size)
            #ax.set_ylim(y_lim * pixel_size, 0)
            
            if j < ncols + 1:
                ax.set_title(title, fontsize = font_size )
            if j > ncols*nrows - ncols:
                ax.set_xlabel('\u03BCm')
            if (j-1)%ncols == 0:
                ax.set_ylabel('\u03BCm')
            ax.axis('on')
        i = i + 1
    
    plt.tight_layout()
    
    #fig_name = 'all_img_'+ptch_morph+'.png'
    #fig_path = os.path.join(os.getcwd(), 'fig', fig_name)
    
    #print(fig_path)
    #plt.savefig(fig_path, bbox_inches='tight', dpi=200)
    plt.show()

def overlay_n(img, pixel_size, shh_morph, ptch_morph, fgf_morph, add_cm_vec_cond, dpi_input):
    
    font_size = 4
    plt.rcParams.update({'font.size': font_size})
    
    colors = [
        ['darkred', 'darkgreen', 'darkblue', 'black'],
        ['red', 'green', 'blue', 'gray'],
        ['lightcoral', 'lightgreen', 'lightblue', 'lightgray']
    ]
        
    nrows = 1
    ncols = len( img.keys() )
                
    x_lim, y_lim = 0, 0
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            x_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[1]
            y_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[0]
            if x_lim < x_lim_n:
                x_lim = x_lim_n
            if y_lim < y_lim_n:
                y_lim = y_lim_n
                
    fig_size = 1
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, nrows*fig_size), sharex=False, sharey=True)
    
    for i in ax.ravel():
        i.set_xlim(0, x_lim * pixel_size)
        i.set_ylim(y_lim * pixel_size, 0)
    
    t_dpa = []
    for k_dpa in img.keys():
        t_dpa.append( int(k_dpa)  )
    t_dpa = np.sort( np.array(t_dpa) )
               
    i = 1
    for t in t_dpa:
        ax = plt.subplot(nrows, ncols, i)
        for k_num in img[str(t)].keys():
            
            mask = ((img[str(t)][k_num]['shh'] > 0) * 1).astype( np.uint16)
            r, g = img[str(t)][k_num][shh_morph], img[str(t)][k_num][ptch_morph]

            b = img[str(t)][k_num][fgf_morph]
            selem = disk(radius=10)
            r = binary_opening( r, selem )
            g = 0*r
            b = binary_opening( b, selem )
            rgb_contours_color(ax, r, g, b, mask, pixel_size, colors[i-1])

            if add_cm_vec_cond == True:
                add_cm_vec_color(ax, r, 0*g, b, pixel_size, colors[i-1])
        title = str(t) + ' dpa'
        ax.set_title(title, fontsize = font_size )
        
        i = i + 1
    
    plt.tight_layout()
    plt.show()
    
def overlay_t(img, pixel_size, shh_morph, ptch_morph, fgf_morph, add_cm_vec_cond, dpi_input):
    
    font_size = 4
    plt.rcParams.update({'font.size': font_size})
    
    colors = [
        ['darkred', 'darkgreen', 'darkblue', 'black'],
        ['red', 'green', 'blue', 'gray'],
        ['lightcoral', 'lightgreen', 'lightblue', 'lightgray']
    ]
    
    nrows = 1
    ncols = 1
                    
    x_lim, y_lim = 0, 0
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            x_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[1]
            y_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[0]
            if x_lim < x_lim_n:
                x_lim = x_lim_n
            if y_lim < y_lim_n:
                y_lim = y_lim_n
                
    fig_size = 1
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, nrows*fig_size), sharex=False, sharey=True)
    
    ax.set_xlim(0, x_lim * pixel_size)
    ax.set_ylim(y_lim * pixel_size, 0)
    
    t_dpa = []
    for k_dpa in img.keys():
        t_dpa.append( int(k_dpa)  )
    t_dpa = np.sort( np.array(t_dpa) )
               
    i = 1
    for t in t_dpa:
        ax = plt.subplot(nrows, ncols, 1)
        for k_num in img[str(t)].keys():
            
            mask = ((img[str(t)][k_num]['shh'] > 0) * 1).astype( np.uint16)
            r, g = img[str(t)][k_num][shh_morph], img[str(t)][k_num][ptch_morph]

            b = img[str(t)][k_num][fgf_morph]
            selem = disk(radius=10)
            r = binary_opening( r, selem )
            g = 0*r
            b = binary_opening( b, selem )
            rgb_contours_color(ax, r, g, b, mask, pixel_size, colors[i-1])

            if add_cm_vec_cond == True:
                add_cm_vec_color(ax, r, 0*g, b, pixel_size, colors[i-1])
        
        i = i + 1
    
    plt.tight_layout()
    plt.show()
    
def overlay_t_sc(img, pixel_size, shh_morph, ptch_morph, fgf_morph, add_cm_vec_cond, dpi_input):
    
    font_size = 4
    plt.rcParams.update({'font.size': font_size})
    
    colors = [
        ['darkred', 'darkgreen', 'darkblue', 'black'],
        ['red', 'green', 'blue', 'gray'],
        ['lightcoral', 'lightgreen', 'lightblue', 'lightgray']
    ]
    
    nrows = 1
    ncols = 1
    
    i = 0
    len_sf_max = 0
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            cm_s = regionprops.center_mass(img[k_dpa][k_num][shh_morph])
            cm_f = regionprops.center_mass(img[k_dpa][k_num][fgf_morph])
            len_sf = abs(regionprops.length_bw_p1p2(cm_s, cm_f, pixel_size))
            if len_sf > len_sf_max:
                len_sf_max = len_sf
                size = img[k_dpa][k_num][shh_morph].shape
    i = 0
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            cm_s = regionprops.center_mass(img[k_dpa][k_num][shh_morph])
            cm_f = regionprops.center_mass(img[k_dpa][k_num][fgf_morph])
            len_sf = abs(regionprops.length_bw_p1p2(cm_s, cm_f, pixel_size))
            
            # scale
            scale = (1, len_sf_max/len_sf)
            for k_morph in img[k_dpa][k_num].keys():
                img[k_dpa][k_num][k_morph] = skimage.transform.rescale(img[k_dpa][k_num][k_morph], scale)
                
            # shift
            cm_s = regionprops.center_mass(img[k_dpa][k_num][shh_morph])
            cm_f = regionprops.center_mass(img[k_dpa][k_num][fgf_morph])
            sf_middle = cm_f + (cm_f - cm_s)/2
            
            for k_morph in img[k_dpa][k_num].keys():
                shift_1 = int( size[1]/2 - sf_middle[1] )
                img[k_dpa][k_num][k_morph] = np.roll(img[k_dpa][k_num][k_morph], shift_1, 1)
            
            i = i + 1    
            
    x_lim, y_lim = 0, 0
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            x_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[1]
            y_lim_n = img[k_dpa][k_num]['shh_bg_substr_clip'].shape[0]
            if x_lim < x_lim_n:
                x_lim = x_lim_n
            if y_lim < y_lim_n:
                y_lim = y_lim_n
                
    fig_size = 1
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, nrows*fig_size), sharex=False, sharey=True)
    
    ax.set_xlim(0, x_lim * pixel_size)
    ax.set_ylim(y_lim * pixel_size, 0)
    
    t_dpa = []
    for k_dpa in img.keys():
        t_dpa.append( int(k_dpa)  )
    t_dpa = np.sort( np.array(t_dpa) )
               
    i = 1
    for t in t_dpa:
        ax = plt.subplot(nrows, ncols, 1)
       
        for k_num in img[str(t)].keys():
            
            mask = ((img[str(t)][k_num]['shh'] > 0) * 1).astype( np.uint16)
            r, g = img[str(t)][k_num][shh_morph], img[str(t)][k_num][ptch_morph]

            b = img[str(t)][k_num][fgf_morph]
            selem = disk(radius=10)
            r = binary_opening( r, selem )
            g = 0*r
            b = binary_opening( b, selem )
            rgb_contours_color(ax, r, g, b, mask, pixel_size, colors[i-1])

            if add_cm_vec_cond == True:
                add_cm_vec_color(ax, r, 0*g, b, pixel_size, colors[i-1])
        
        i = i + 1
    
    plt.tight_layout()
    plt.show()    
def rgb_1d(ax, x, r, g, b, pixel_size):
    lw = 0.4
    ax.plot(x, r, linewidth=lw, color='red')
    ax.plot(x, g, linewidth=lw, color='green')
    ax.plot(x, b, linewidth=lw, color='blue')

def get_nLmean_t(img_t, morph):
    nLmean, n = 0, 1
    for k_num in img_t.keys():
        nLmean += (img_t[k_num][morph]).shape[0]
        n     += 1
    return nLmean/n

def get_Amm_t(img_t, morph):
    # mean( max for each profile  )
    Amm, n = 0, 1
    for k_num in img_t.keys():
        Amm += np.max(img_t[k_num][morph])
        n     += 1
    return Amm/n


def all_1d(image, pixel_size, shh_morph, ptch_morph, fgf_morph, dpi_input):
    
    img = image.copy()
    
    font_size = 4
    plt.rcParams.update({'font.size': font_size})

    nrows = 1
    ncols = 3

    x_lim, y_lim = 0, 0

    for key_t in img:
        x_lim_n = get_nLmean_t(img[key_t], shh_morph) * pixel_size
        if x_lim < x_lim_n:
            x_lim = x_lim_n
        y_lim_n = get_Amm_t(img[key_t], ptch_morph)
        if y_lim < y_lim_n:
            y_lim = y_lim_n

    t_dpa = []
    for key_t in img.keys():
        t_dpa.append( int(key_t)  )
    t_dpa = np.sort( np.array(t_dpa) )            
    
    fig_size = 1
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, nrows*fig_size), sharex=True, sharey=True)

    for i in ax.ravel():
        i.axis('off')
        i.set_xlim(0, x_lim)
        #i.set_ylim(0, y_lim)

    i = 0
    for key_t in t_dpa:
        key_t = str(key_t)
        Lmean = get_nLmean_t(img[key_t], shh_morph ) * pixel_size
        shhAmm =  get_Amm_t(  img[key_t], shh_morph)           
        ptchAmm = get_Amm_t( img[key_t], ptch_morph)  
        fgfAmm =  get_Amm_t(  img[key_t], fgf_morph)  
        
        for k_num in img[key_t].keys():
            # normalize all morphogen amplitudes accorging their means
            r = shhAmm  * img[key_t][k_num][shh_morph ]/np.max(img[key_t][k_num][shh_morph])
            g = ptchAmm * img[key_t][k_num][ptch_morph]/np.max(img[key_t][k_num][ptch_morph])
            b = fgfAmm  * img[key_t][k_num][fgf_morph ]/np.max(img[key_t][k_num][fgf_morph])
            
            # scale system size
            x = Lmean*np.linspace(0, r.shape[0], r.shape[0])/r.shape[0]
            
            j = i + 1
            
            ax = plt.subplot(nrows, ncols, j)
            rgb_1d(ax, x, r, g, b, pixel_size)

            ax.set_title(str(key_t) + ' dpa')

            ax.set_xlabel('\u03BCm')
            if j == 1:
                ax.set_ylabel('Intensity')

            ax.axis('on')
        i = i + 1

def add_regr(ax, x, y, cl, name):

    k, b, y_est, y_err, k_err, b_err = statistics.regr(x, y)
    with file_structure.HiddenPrints():
        p = statistics.test_k0(x, y, 0.05)

    text = name + ', ' + f'p = {round(p,2)}'
    #text = name + ', ' + f'k = {round(k, 2)} \u00B1 {round(k_err, 2)},  p_value(k = 0) = {round(p,2)}'
    #print(text)
    
    ax.fill_between(
                    x, 
                    y_est - y_err, 
                    y_est + y_err, 
                    facecolor = cl,
                    alpha=0.1
                    )
    ax.plot(x, y_est, color=cl,  linewidth = 0.3, label=text)

    #ax.text(0.77*xmax, 0.9*ymax, 
    #        f'k = {round(k, 2)} \u00B1 {round(k_err, 2)},  p_value(k = 0) = {round(p,2)}', 
    #        color = cl)
    #ax.text(0.77*xmax, 0.9*ymax, 
    #        f'k = {round(k, 2)} \u00B1 {round(k_err, 2)}, b = {round(b, 2)} \u00B1 {round(b_err, 2)}', 
    #        color = cl)

def frame(img, pixel_size, dpi_input):
    
    font_size = 3
    plt.rcParams.update({'font.size': font_size})
    
    nrows = 0
    ncols = len( img.keys() )
    for k_dpa in img.keys():
        for k_num in img[k_dpa].keys():
            if nrows < int(k_num):
                nrows = int(k_num)
                
                
    fig_size = 1
    fig, ax = plt.subplots(nrows, ncols, dpi=dpi_input, figsize=(ncols*fig_size, 1.5*nrows*fig_size), sharex=False, sharey=False)
    
    for i in ax.ravel():
        i.axis('off')
    
    t_dpa = []
    for k_dpa in img.keys():
        t_dpa.append( int(k_dpa)  )
    t_dpa = np.sort( np.array(t_dpa) )
    
    plt.subplots_adjust(
                        bottom=0.2,
                        top=0.8
    )

    return fig, ax, nrows, ncols, t_dpa, font_size
    
if __name__ == '__main__':
    pass