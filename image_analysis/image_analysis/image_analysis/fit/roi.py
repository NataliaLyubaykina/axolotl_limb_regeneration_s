import numpy as np
import math
import pyclesperanto_prototype as cle
import image_analysis.preprocess.mask as mask
from skimage import measure

def angle_between(v1, v2, rotational_axis):
    """ Returns the angle in radians between vectors 'v1' and 'v2'::

            >>> angle_between((1, 0, 0), (0, 1, 0))
            1.5707963267948966
            >>> angle_between((1, 0, 0), (1, 0, 0))
            0.0
            >>> angle_between((1, 0, 0), (-1, 0, 0))
            3.141592653589793
    """

    # normalize vectors
    v1, v2 = v1/np.linalg.norm(v1), v2/np.linalg.norm(v2)
    cos_v1v2 = np.clip(np.dot(v1, v2), -1, 1)
    angle_v1v2 = 180 * np.arccos(cos_v1v2)/math.pi
    
    # define the direction around rotational axis
    if np.clip(np.dot(np.cross(v2, v1), rotational_axis), -1, 1) < 0:
        angle_v1v2 = -angle_v1v2
        
    if np.abs(angle_v1v2) >= 90:
        angle_v1v2 = -np.sign(angle_v1v2) * (180 - np.abs(angle_v1v2))
    
    return angle_v1v2

def angle_between_2d(v1, v2):
    # from https://stackoverflow.com/questions/2827393/angles-between-two-n-dimensional-vectors-in-python
    """ Returns the angle in radians between vectors 'v1' and 'v2'::

            >>> angle_between((1, 0, 0), (0, 1, 0))
            1.5707963267948966
            >>> angle_between((1, 0, 0), (1, 0, 0))
            0.0
            >>> angle_between((1, 0, 0), (-1, 0, 0))
            3.141592653589793
    """
    
    # ez, ex, ey in ek, ei, ej
    ex_2d = np.array([0,  0, 1])
    ey_2d = np.array([0, -1, 0])
    ez_2d = np.cross(ex_2d, ey_2d)
    
    # normalize vectors
    v1, v2 = v1/np.linalg.norm(v1), v2/np.linalg.norm(v2)
    
    # add the z axis to make 3d vectors
    v1, v2 = np.concatenate((np.array([0]), v1)), np.concatenate((np.array([0]), v2))
    
    # v1, v2 are written in ek, ei, ej
    cos_v1v2 = np.clip(np.dot(v1, v2), -1, 1)
    angle_v1v2 = 180 * np.arccos(cos_v1v2)/math.pi
    
    if np.sign( np.cross(v2, v1)[0] ) != np.sign( ez_2d[0] ):
        angle_v1v2 = -angle_v1v2
        
    return angle_v1v2

def mean_nonzero(arr, axis_n):
    arr = arr.astype(float)
    arr[ np.where(arr == 0) ] = np.nan
    arr = np.nanmean(arr, axis=axis_n)
    arr[ np.where(arr == np.nan) ] = 0
    return arr.astype( np.uint16 )

def rotate(image, rot_x, rot_y, rot_z):
    img = image.copy()
    for key in img.keys():
        if isinstance(img[key], np.ndarray):
            original_dtype = img[key].dtype
            img[key] = cle.rotate(img[key], None, rot_x, rot_y, rot_z, True, True, True)
            img[key] = (np.array(img[key])).astype(original_dtype)

            if key.find('mask') > 0:
                img[key] = (img[key] > 0).astype(original_dtype)
    if 'tissue_mask_with_epi' in img.keys():
        img = mask.crop(img, img['tissue_mask_with_epi'])
    elif 'tissue_mask' in img.keys():
        img = mask.crop(img, img['tissue_mask'])


    return img

def flip(image, axis):
    img = image.copy()
    for key in img:
        if type(img[key]) is np.ndarray:
            img[key] = (np.flip(img[key], axis)).astype( np.uint16 )
    return img

if __name__ == '__main__':
    pass    