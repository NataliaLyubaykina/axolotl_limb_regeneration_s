import numpy as np
from numpy.linalg import eig
from skimage import measure
from scipy.ndimage import gaussian_filter
import pyclesperanto_prototype as cle
import pandas as pd
import matplotlib.pyplot as plt
import time
import copy
from sklearn.decomposition import PCA

from . import roi 
from image_analysis.preprocess import mask

def center_mass(img_arr):
    '''returns the coordinates of the center of mass as integers'''
    
    # Ensure the array is float and replace zeros with NaNs
    img_arr = img_arr.astype(float)
    img_arr[img_arr == 0] = np.nan

    if len(img_arr.shape) == 3:
        # Handle the 3D case
        img_arr_x = np.nanmean(np.nanmean(img_arr, axis=0), axis=0)
        j = np.nansum(np.arange(len(img_arr_x)) * img_arr_x) / np.nansum(img_arr_x)
        
        img_arr_y = np.nanmean(np.nanmean(img_arr, axis=0), axis=1)
        i = np.nansum(np.arange(len(img_arr_y)) * img_arr_y) / np.nansum(img_arr_y)
        
        img_arr_z = np.nanmean(np.nanmean(img_arr, axis=1), axis=1)
        k = np.nansum(np.arange(len(img_arr_z)) * img_arr_z) / np.nansum(img_arr_z)
        
        return np.array([int(k), int(i), int(j)])
    
    elif len(img_arr.shape) == 2:
        # Handle the 2D case
        img_arr_x = np.nanmean(img_arr, axis=0)
        j = np.nansum(np.arange(len(img_arr_x)) * img_arr_x) / np.nansum(img_arr_x)
        
        img_arr_y = np.nanmean(img_arr, axis=1)
        i = np.nansum(np.arange(len(img_arr_y)) * img_arr_y) / np.nansum(img_arr_y)
        
        return np.array([int(i), int(j)])
    
    elif len(img_arr.shape) == 1:
        # Handle the 1D case
        j = np.nansum(np.arange(len(img_arr)) * img_arr) / np.nansum(img_arr)
        
        return int(j)

def rmse(img, cm, pixel_size):
    """
    "variance" sum_i( Ii*(xi - cn)**2 )/sum(Ii)
    """
    cm = cm/pixel_size
    if len(img.shape) == 3:
        ind = np.array( np.nonzero( img ) )
        img = img.astype(np.uint32)
        intensities = img[ ind[0], ind[1], ind[2] ]
        
        ind_cm = ( ind - cm.reshape([3, 1]) ) * pixel_size#.reshape([3, 1])
        ind_cm_norm = np.sum(ind_cm**2, axis=0)
            
        mse = np.sum( intensities * ind_cm_norm)/np.sum( intensities)
        
        return np.sqrt(mse)
    
    elif len(img.shape) == 2:
        ind = np.array( np.nonzero( img ) )
        img = img.astype(np.uint32)
        intensities = img[ ind[0], ind[1] ]
        
        ind_cm = ( ind - cm.reshape([2, 1]) ) * pixel_size#.reshape([3, 1])
        ind_cm_norm = np.sum(ind_cm**2, axis=0)
            
        mse = np.sum( intensities * ind_cm_norm)/np.sum( intensities)        
        return np.sqrt(mse)
    
    elif len(img.shape) == 1:
        ind = np.array( np.nonzero( img ) )
        img = img.astype(np.uint32)
        intensities = img[ ind[0] ]
        
        ind_cm = ( ind - cm ) * pixel_size#.reshape([3, 1])
        ind_cm_norm = np.sum(ind_cm**2, axis=0)
            
        mse = np.sum( intensities * ind_cm_norm)/np.sum( intensities)        
        return np.sqrt(mse)


def tensor_inertia(img):
    t = measure.inertia_tensor(img)
    lams, v = eig( t )
    sort_indices = np.argsort(-lams)
    lams = lams[sort_indices]
    v = v[:, sort_indices]
    v = np.array([vi / np.linalg.norm(vi) for vi in v.T]).T
    return lams, v

def compute_N_desired(p0, SF):
    """
    Compute N_desired = SF × (SF × p0) using the vector triple product.

    Parameters:
    - p0 (numpy.ndarray): The input vector p0 (1D array of shape (3,))
    - SF (numpy.ndarray): The input vector SF (1D array of shape (3,))

    Returns:
    - N_desired (numpy.ndarray): The resulting vector (1D array of shape (3,))
    """
    
    # Compute the cross product SF × p0
    SF_cross_p0 = np.cross(SF, p0)
    
    # Compute the final cross product SF × (SF × p0)
    N_desired = np.cross(SF, SF_cross_p0)
    
    return N_desired

class regionprops_3d():
    """
    class define diffrent parameters from the preprocess image
    the image is in the form of dict img[dpa][sample_number][channels]
    channels are in the form channel_of_interst and channel_of_interest_bg_substr_clip
    """
    
    def __init__(self, img, t, n, i, pixel_size): 
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
            'file': n
        }
        self.pixel_size = pixel_size
        #print(f'time point {t} dpa, sample number {n}')            
        
    def center_mass(self, morph_list):
        for morph in morph_list:
            self.parm['cm_'+morph] = center_mass( self.img[morph] ) * self.pixel_size
        
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

    def rotate_sf_to_ey(self):

        ex = np.array([0,0,1])
        ey = np.array([0,-1,0])
        ez = np.cross(ex, ey)

        SF = center_mass(self.img['shh_mask']) - center_mass(self.img['fgf_mask'])

        # rotation around x
        rot_x = roi.angle_between(
                ey, 
                SF * (ey + ez),
                ex
            )
        rot_y = 0
        rot_z = 0

        #print('rotation around x:')
        #print(rot_x, rot_y, rot_z)

        self.img = roi.rotate(self.img, rot_x, rot_y, rot_z)
        SF = center_mass(self.img['shh_mask']) - center_mass(self.img['fgf_mask'])

        # rotation around z
        rot_x = 0
        rot_y = 0
        rot_z = roi.angle_between(
                SF, 
                ey,
                ez
            )
        #print('rotation around y:')
        #print(rot_x, rot_y, rot_z)
        self.img = roi.rotate(self.img, rot_x, rot_y, rot_z)
        SF = center_mass(self.img['shh_mask']) - center_mass(self.img['fgf_mask'])

        # Check final angle
        check_angle = round(roi.angle_between(ey, SF, ex))
        if abs(check_angle) < 3:
            print(f'Angle between ey and SF: {check_angle}')
            return self.img
        elif abs(check_angle) > 45:
            print('Strange rotation')
            print(f'Angle between ey and SF: {check_angle}')
            return 0
        else:
            print('Re-running the rotation function due to insufficient alignment')
            return self.rotate_sf_to_ey()
              
        
    def rotate_N_desired_to_ez(self):

        img_not_rotated = copy.deepcopy(self.img)

        # Define axes
        ex = np.array([0, 0, 1])
        ey = np.array([0, -1, 0])
        ez = np.cross(ex, ey)

        # Calculate SF and other values
        SF = center_mass(self.img['shh_mask']) - center_mass(self.img['fgf_mask'])
        lams, v = tensor_inertia(self.img['tissue_mask_with_epi'])
        p0 = v[0]
        N_desired = compute_N_desired(p0, SF)

        # Rotation around y-axis
        rot_y = roi.angle_between(ez, N_desired * (ex + ez), ey)
        self.img = roi.rotate(self.img, 0, rot_y, 0)

        #print('rotation around y:')
        #print(0, rot_y, 0)

        SF = center_mass(self.img['shh_mask']) - center_mass(self.img['fgf_mask'])
        lams, v = tensor_inertia(self.img['tissue_mask_with_epi'])
        p0 = v[0]
        N_desired = compute_N_desired(p0, SF)

        # Rotation around x-axis
        rot_x = roi.angle_between(N_desired, ez, ex)
        self.img = roi.rotate(self.img, rot_x, 0, 0)

        #print('rotation around x:')
        #print(rot_x, 0, 0)

        SF = center_mass(self.img['shh_mask']) - center_mass(self.img['fgf_mask'])
        lams, v = tensor_inertia(self.img['tissue_mask_with_epi'])
        p0 = v[0]
        N_desired = compute_N_desired(p0, SF)

        # Check final angle
        check_angle = round(roi.angle_between(ez, N_desired, ey))
        if abs(check_angle) < 15:
            print(f'Angle between ez and N_desired: {check_angle}')
            return self.img
        elif abs(check_angle) > 45:
            print('Strange rotation, RETURN NOT ROTATED')
            print(f'Angle between ez and N_desired: {check_angle}')
            return img_not_rotated
        else:
            print(f'Angle between ez and N_desired: {check_angle}')
            print('Re-running the rotation function due to insufficient alignment')
            return self.rotate_N_desired_to_ez()
        
    def rotate_N_desired_to_ez_special(self):

        # sometimes (rare) p1 and p0 are switch

        img_not_rotated = copy.deepcopy(self.img)

        # Define axes
        ex = np.array([0, 0, 1])
        ey = np.array([0, -1, 0])
        ez = np.cross(ex, ey)

        # Calculate SF and other values
        SF = center_mass(self.img['shh_mask']) - center_mass(self.img['fgf_mask'])
        lams, v = tensor_inertia(self.img['tissue_mask_with_epi'])
        p0 = v[1]
        N_desired = compute_N_desired(p0, SF)

        # Rotation around y-axis
        rot_y = roi.angle_between(ez, N_desired * (ex + ez), ey)
        self.img = roi.rotate(self.img, 0, rot_y, 0)

        #print('rotation around y:')
        #print(0, rot_y, 0)

        SF = center_mass(self.img['shh_mask']) - center_mass(self.img['fgf_mask'])
        lams, v = tensor_inertia(self.img['tissue_mask_with_epi'])
        p0 = v[1]
        N_desired = compute_N_desired(p0, SF)

        # Rotation around x-axis
        rot_x = roi.angle_between(N_desired, ez, ex)
        self.img = roi.rotate(self.img, rot_x, 0, 0)

        #print('rotation around x:')
        #print(rot_x, 0, 0)

        SF = center_mass(self.img['shh_mask']) - center_mass(self.img['fgf_mask'])
        lams, v = tensor_inertia(self.img['tissue_mask_with_epi'])
        p0 = v[1]
        N_desired = compute_N_desired(p0, SF)

        # Check final angle
        check_angle = round(roi.angle_between(ez, N_desired, ey))
        if abs(check_angle) < 15:
            print(f'Angle between ez and N_desired: {check_angle}')
            return self.img
        elif abs(check_angle) > 45:
            print('Strange rotation, RETURN NOT ROTATED')
            print(f'Angle between ez and N_desired: {check_angle}')
            return img_not_rotated
        else:
            print(f'Angle between ez and N_desired: {check_angle}')
            print('Re-running the rotation function due to insufficient alignment')
            return self.rotate_N_desired_to_ez_special()

    
if __name__ == '__main__':
    pass