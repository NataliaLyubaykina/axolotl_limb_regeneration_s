import numpy as np
from numpy.linalg import eig
from skimage import io, measure
import pyclesperanto_prototype as cle
import pandas as pd
import matplotlib.pyplot as plt
import time

from . import roi 
from . import fit_1d
from image_analysis.preprocess import mask
from image_analysis.preprocess import file_structure

def center_mass(img_arr):
    '''returns the coordinates of center of mass'''
    if len(img_arr.shape) == 3:
        img_arr_x = np.average( np.average( img_arr, axis=0 ), axis=0 )
        j = np.sum( np.nonzero( img_arr_x ) * img_arr_x[np.nonzero( img_arr_x )] )/np.sum(img_arr_x)
        
        img_arr_y = np.average( np.average( img_arr, axis=0 ), axis=1 )
        i = np.sum( np.nonzero( img_arr_y ) * img_arr_y[np.nonzero( img_arr_y )] )/np.sum(img_arr_y)
        
        img_arr_z = np.average( np.average( img_arr, axis=1 ), axis=1 )
        k = np.sum( np.nonzero( img_arr_z ) * img_arr_z[np.nonzero( img_arr_z )] )/np.sum(img_arr_z)
        return np.array([k, i, j]).astype(int)
    
    if len(img_arr.shape) == 2:
        img_arr_x = np.average( img_arr, axis=0 )
        if np.sum(img_arr_x) != 0:
            j = np.sum( np.nonzero( img_arr_x ) * img_arr_x[np.nonzero( img_arr_x )] )/np.sum(img_arr_x)
        else:
            j = np.sum( np.nonzero( img_arr_x ) * img_arr_x[np.nonzero( img_arr_x )] )
                       
        img_arr_y = np.average( img_arr, axis=1 )
        if np.sum(img_arr_y) != 0:
            i = np.sum( np.nonzero( img_arr_y ) * img_arr_y[np.nonzero( img_arr_y )] )/np.sum(img_arr_y)
        else:
            i = np.sum( np.nonzero( img_arr_y ) * img_arr_y[np.nonzero( img_arr_y )] )
        
        return np.array([i, j]).astype(int)
    
    if len(img_arr.shape) == 1:
        j = np.sum( np.nonzero( img_arr ) * img_arr[np.nonzero( img_arr )] )/np.sum(img_arr)
               
        return int(j)
    
def rmse(img, cm, pixel_size):
    ind = np.array( np.nonzero( img ) )
    img = img.astype(np.uint32)
    intensities = img[ ind[0], ind[1], ind[2] ]
    
    ind_cm = ( ind - cm.reshape([3, 1]) ) * pixel_size#.reshape([3, 1])
    ind_cm_norm = np.sum(ind_cm**2, axis=0)
        
    mse = np.sum( intensities * ind_cm_norm)/np.sum( intensities)
    
    return round( np.sqrt(mse) )

def length_bw_p1p2(p1, p2, pixel_size):
    p1_p2 = (p1 - p2) * pixel_size
    length = np.sqrt( np.sum( p1_p2**2 ) )
    return round( length )

def tensor_inertia(img):
    cm = center_mass(img)
    t = measure.inertia_tensor(img)
    lams, v = eig( t )
    sort_indices = np.argsort(lams)
    lams = lams[sort_indices]
    v = v[:, sort_indices]
    return lams, v

def plot_rgb(ax, x, img, suffix, name, i):
    line_width = 0.8
    ax = plt.subplot(1, 3, i)
    ax.plot(x, img['shh'+suffix], 'r', linewidth=line_width, label='shh')
    ax.plot(x, img['fgf'+suffix], color='white', linewidth=line_width, label='fgf')
    ax.plot(x, img['ptch'+suffix], 'g', linewidth=line_width, label='ptch')
    ax.set_title(name)
    ax.set_xlabel('x, \u03BCm')

class regionprops_3d():
    """
    class define diffrent parameters from the preprocess image
    """
    
    def __init__(self, img, t, n, i): 
        """
        Parameters
        ----------
        img : dict
        t : int
        time point, dpa
        n : int
        sample number
        i : int
        number of the image, for batch

        Returns
        -------
        None.

        """
        # i is the interation number for batch image processing
        self.img = img
        self.i = i
        self.parm = {
            'time': t,
            'file': n,
            'pixel_size': img['pixel_size']
        }
        print(f'time point {t} dpa, sample number {n}')

    def center_mass_segm_check(self, morph_list):
        """
        calculate the distances beetween center of masses of segmented and not morphogens
        Parameters
        ----------
        morph_list : list
            list of the morphogen names
        Returns
        -------
        None.
        """
        for morph in morph_list:
            self.parm['cm_segm_check_'+morph] = np.linalg.norm( self.img['pixel_size'] * center_mass( self.img[morph]) - center_mass( self.img[morph+'_clip'] ) )
            
    def rmse_explicit(self, morph_list):
        """
        calculate the sizes of moprhogen domains as a 'variance'  
        and writes coressponding image_array indexes 
        to self.parm['rmse_'+morph]
        Parameters
        ----------
        morph_list : list
            list of the EXPLICIT morphogen names
        Returns
        -------
        None.
        """
        for morph in morph_list:
            cm = center_mass( self.img[morph] )
            self.parm['rmse_'+morph+'_um'] = rmse( self.img[morph], cm, self.parm['pixel_size'] )
        
    def center_mass(self, morph_list):
        for morph in morph_list:
            self.parm['cm_'+morph] = center_mass( self.img[morph+'_clip'] )
            
    def rmse(self, morph_list):
        for morph in morph_list:
            self.parm['rmse_'+morph+'_um'] = rmse( self.img[morph+'_clip'], self.parm['cm_'+morph], self.parm['pixel_size'] )

    def ampl(self, morph_list, filter_bool):
        if filter_bool == True:
            R_av = int(50/self.parm['pixel_size'])
            for morph in morph_list:
                print(f'filtring {morph}')
                print( "Start : %s" % time.ctime() )
                img_filt = cle.mean_sphere(self.img[morph+'_clip'], None, R_av, R_av, R_av)
                self.parm['ampl_'+morph] = round( np.max( img_filt ) )
                print( "Start : %s" % time.ctime() )
        else:
            for morph in morph_list:
                self.parm['ampl_'+morph] = round( np.max( self.img[morph+'_clip'] ) )

    def volume(self, morph_list):
        for morph in morph_list:
            self.parm['volume_'+morph] = round( np.sum( self.img[morph+'_mask'] ) * self.parm['pixel_size']**3 )
    
    def total_int(self, morph_list):
        for morph in morph_list:
            self.parm['total_int_'+morph] = round( np.sum( self.img[morph+'_clip'] ) * self.parm['pixel_size']**3 )
    
    def length_bw_p1p2(self, morph_list):
        m1 = morph_list[0]
        m2 = morph_list[1]
        cm_m1 = center_mass( self.img[m1+'_clip'] )
        cm_m2 = center_mass( self.img[m2+'_clip'] )
        self.parm['length_'+m1+'_'+m2+'_um'] = length_bw_p1p2(cm_m1, cm_m2, self.parm['pixel_size'])
        
    def size_along_sf(self):
        print('check SF, possible issue with mask_line (check in napari)')
        ind_line = roi.line_th_2_point( self.parm['cm_shh'], self.parm['cm_fgf'], self.img['shh'].shape)
        mask_line = np.zeros( self.img['shh'].shape ).astype( np.uint16 )
        mask_line[ind_line[0], ind_line[1], ind_line[2]] = 1
        mask_line = mask_line * self.img['tissue_mask']
        L = 0
        i = 0
        ind_mask = np.array( np.nonzero( mask_line) ).T
        print(f'number of points on mask line: {len( np.array( np.nonzero( mask_line) ).T )}')
        
        # quick fix to deal with cases when line through 2 points gives strange result (returns too few points
        #if len( np.array( np.nonzero( mask_line) ).T ) > 10: 
        p_prev = ind_mask[0]
        for p in ind_mask:
            L = L + length_bw_p1p2(p, p_prev, self.parm['pixel_size'])
            p_prev = p
        self.parm['L_um']  = L
        #else:
        #    print("making  cyllinder mask")
        #    ps = [self.parm['pixel_size'], self.parm['pixel_size'], self.parm['pixel_size']]
        #    R_av = 20
        #    ind_line = roi.cylinder_th_2_point(self.parm['cm_shh'], self.parm['cm_fgf'], self.img['shh'].shape, R_av, ps)
        #    mask_line = np.zeros( self.img['shh'].shape ).astype( np.uint16 )
        #    mask_line[ind_line[0], ind_line[1], ind_line[2]] = 1
        #    mask_line = mask_line * self.img['tissue_mask']
        #    ind_mask = np.array( np.nonzero( mask_line) ).T
        #    L = length_bw_p1p2(ind_mask[0], ind_mask[-1], self.parm['pixel_size'])
        #    print(L)
        #    self.parm['L_um']  = L
        return mask_line

        
    def tensor_inertia(self, morph):
        lams, v = tensor_inertia(self.img[morph])
        self.parm['lams_'+morph] = lams
        self.parm['v_'+morph]    = v
     
    def write_parm_df(self):
        parm_to_write = self.parm.copy()
        for key in self.parm.keys():
            if type(self.parm[key]) is np.ndarray:
                del parm_to_write[key]
        for key in parm_to_write.keys():
            parm_to_write[key] = float( parm_to_write[key] )
        self.df = pd.DataFrame(data=parm_to_write, index=[self.i])


    def rotate_pca_to_ey(self, pca_for, naxis):
        '''
        rotate_pca_to_ey
        pca_for = 'ptch_clip' 
        naxis the number of PCA axis for the orientation like v_ptch[:,1]
        '''

        ex = np.array([0,0,1])
        ey = np.array([0,-1,0])
        ez = np.cross(ex, ey)

        lams_ptch, v_ptch = tensor_inertia(self.img[pca_for])

        # rotation around x
        rot_x = roi.angle_between(
                ey, 
                v_ptch[:, naxis] * (ey + ez),
                ex
            )
        rot_y = 0
        rot_z = 0

        print('rotation around x:')
        print(rot_x, rot_y, rot_z)

        self.img = roi.rotate(self.img, rot_x, rot_y, rot_z)
        lams_ptch, v_ptch = tensor_inertia(self.img[pca_for])

        # rotation around z
        rot_x = 0
        rot_y = 0
        rot_z = roi.angle_between(
                v_ptch[:, naxis], 
                ey,
                ez
            )
        print('rotation around y:')
        print(rot_x, rot_y, rot_z)
        self.img = roi.rotate(self.img, rot_x, rot_y, rot_z)
        lams_ptch, v_ptch = tensor_inertia(self.img[pca_for])

        # check angle between ey and Ptch axis
        check_angle = round( roi.angle_between(ey, v_ptch[:, naxis], ex) )
        if abs(check_angle) > 5:
            print('strange rotation')
        print(f'angle beetween ey and {pca_for}, {naxis}: {check_angle}')
        
        return self.img

    def rotate_pca_to_ez(self, pca_for, naxis):
        '''
        rotate_pca_to_ey
        pca_for = 'ptch_clip' 
        naxis the number of PCA axis for the orientation like v_ptch[:,1]
        '''

        ex = np.array([0,0,1])
        ey = np.array([0,-1,0])
        ez = np.cross(ex, ey)

        lams_ptch, v_ptch = tensor_inertia(self.img[pca_for])

        # rotation around x
        rot_x = roi.angle_between(
                ez,
                v_ptch[:,naxis] * (ez + ey),
                ex
            )
        rot_y = 0
        rot_z = 0
        print('rotation around x:')
        print(rot_x, rot_y, rot_z)

        self.img = roi.rotate(self.img, rot_x, rot_y, rot_z)
        lams_ptch, v_ptch = tensor_inertia(self.img[pca_for])


        # rotation around y
        rot_x = 0
        rot_y = roi.angle_between(
                ez,
                v_ptch[:,naxis], 
                ey
            )
        rot_z = 0
        print('rotation around y:')
        print(rot_x, rot_y, rot_z)
        
        self.img = roi.rotate(self.img, rot_x, rot_y, rot_z)
        lams_ptch, v_ptch = tensor_inertia(self.img[pca_for])

        # check angle between ey and Ptch axis
        check_angle = round( roi.angle_between(ez, v_ptch[:, naxis], ex) )
        if abs(check_angle) > 5:
            print('strange rotation')
        print(f'angle beetween ey and {pca_for}, {naxis}: {check_angle}')
        
        return self.img
    
    def rotate_sf_to_ey(self):
        '''
        rotate_pca_to_ey
        pca_for = 'ptch_clip' 
        naxis the number of PCA axis for the orientation like v_ptch[:,1]
        '''

        ex = np.array([0,0,1])
        ey = np.array([0,-1,0])
        ez = np.cross(ex, ey)

        sf = center_mass(self.img['shh_clip']) - center_mass(self.img['fgf_clip'])

        # rotation around x
        rot_x = roi.angle_between(
                ey, 
                sf * (ey + ez),
                ex
            )
        rot_y = 0
        rot_z = 0

        print('rotation around x:')
        print(rot_x, rot_y, rot_z)

        self.img = roi.rotate(self.img, rot_x, rot_y, rot_z)
        self.img = mask.crop(self.img, self.img['tissue_mask'])
        sf = center_mass(self.img['shh_clip']) - center_mass(self.img['fgf_clip'])

        # rotation around z
        rot_x = 0
        rot_y = 0
        rot_z = roi.angle_between(
                sf, 
                ey,
                ez
            )
        print('rotation around y:')
        print(rot_x, rot_y, rot_z)
        self.img = roi.rotate(self.img, rot_x, rot_y, rot_z)
        self.img = mask.crop(self.img, self.img['tissue_mask'])
        sf = center_mass(self.img['shh_clip']) - center_mass(self.img['fgf_clip'])

        # check angle between ey and Ptch axis
        check_angle = round( roi.angle_between(ey, sf, ex) )
        if abs(check_angle) > 5:
            print('strange rotation')
        print(f'angle beetween ey and sf: {check_angle}')
                
        return self.img
    
    
    def take_1d_scan_ey(self, p1, R_average):

        cyl_ind = roi.cylinder_th_ey( p1, self.img['shh'].shape, R_average, self.parm['pixel_size'] )
        mask_cyl = np.zeros( self.img['shh'].shape ).astype( np.uint16 )
        mask_cyl[cyl_ind[0], cyl_ind[1], cyl_ind[2]] = 1
        mask_cyl = mask_cyl * self.img['tissue_mask']
        
        # in dict img 1d data after appling this function
        self.img_1d = roi.make_1d_from_3d(self.img, mask_cyl, self.parm['pixel_size'])

    def preview_1d_scan(self):
        x = np.linspace(0, self.img_1d['shh'].shape[0], self.img_1d['shh'].shape[0])
        x = x * self.parm['pixel_size']

        fig_size_x, fig_size_y = 3*4, 4
        font_size = 14
        line_width = 0.8
        plt.rcParams.update({'font.size': font_size})
            
        fig, ax = plt.subplots( 1, 3, dpi=50, figsize=(fig_size_x, fig_size_y), sharex=True, sharey=True)

        plot_rgb(ax, x, self.img_1d, '', 'raw', 1)
        #plot_rgb(ax, x, self.img_1d, '_bg_substr', 'bg substracted', 2)
        plot_rgb(ax, x, self.img_1d, '_clip', 'bg substracted + clipped', 3)

        plt.legend()
        plt.show()

    def fit_lambda_middle(self, guess, interval, accuracy, name_source, name_grad):
        x0 = center_mass( self.img_1d[name_source] )
        #with file_structure.HiddenPrints():
        lam_middle, RMSD_middle, lam_middle_ind, R_v_middle, x, fit_middle, shh_middle, source_middle, ptch_middle = fit_1d.middle(self.img_1d[name_source], self.img_1d[name_grad], x0, guess, interval, accuracy)

        lam_fit = round( lam_middle_ind*self.parm['pixel_size'] )
        print(f'fitted lambda: {lam_fit}, um')

        self.parm['lam_um'] = lam_fit
        self.parm['R_v_lam'] = round( R_v_middle, 2)

        fig, ax = plt.subplots( 1, 1, dpi=50)
        ax.plot( lam_middle*self.parm['pixel_size'], RMSD_middle)
        ax.set_xlabel('x, um')
        ax.set_ylabel('error')
        plt.show()
        
        x = x * self.parm['pixel_size']
        
        return x, fit_middle, shh_middle, source_middle, self.img_1d[name_grad]