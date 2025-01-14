import numpy as np
#from tqdm.notebook import tqdm
import time
import math
import os
import pyclesperanto_prototype as cle
import image_analysis.preprocess.mask

def t_b(x1, x2, y1, y2):
    '''
    y = tx + b
    y(x) crosses to points 1 and 2
    return: t, b
    '''
    t, b = (y2 - y1)/(x2 - x1), y1 - (y2 - y1) * x1/(x2 - x1)
    return t, b

def line_th_2_point(p1, p2, array_shape):
    '''
    returns the coordinate arrays (k, i, j) for the line going through to 2 points inside the array
    '''
    
    # take coordinates of line
    k = np.array( range(0, array_shape[0]) )
    ti, bi = t_b(x1=p1[0], x2=p2[0], y1=p1[1], y2=p2[1] )
    i = bi + ti * k
    tj, bj = t_b(x1=p1[0], x2=p2[0], y1=p1[2], y2=p2[2] )
    j = bj + tj * k
    
    # make coordinates the int indexes
    i = i * (i < array_shape[1])
    j = j * (j < array_shape[2])
    index = np.array( [ k, i, j ] ).astype(int)
    index = index * (index > 0)# * (index < array_shape[1]) * (index < array_shape[2])
    
    index = index[:, np.nonzero( np.min( index, axis=0 ) )[0]] #dont remeber what it is, make line worse
    
    return index

def mask_line_th_2_point(p1, p2, array_shape):
    '''
    returns the coordinate arrays (k, i, j) for the line going through to 2 points inside the array
    '''
    
    # take coordinates of line
    k = np.array( range(0, array_shape[0]) )
    ti, bi = t_b(x1=p1[0], x2=p2[0], y1=p1[1], y2=p2[1] )
    i = bi + ti * k
    tj, bj = t_b(x1=p1[0], x2=p2[0], y1=p1[2], y2=p2[2] )
    j = bj + tj * k
    
    # make coordinates the int indexes
    i = i * (i < array_shape[1])
    j = j * (j < array_shape[2])
    index = np.array( [ k, i, j ] ).astype(int)
    index = index * (index > 0)# * (index < array_shape[1]) * (index < array_shape[2])
    
    index = index[:, np.nonzero( np.min( index, axis=0 ) )[0]] #dont remeber what it is, make line worse
    
    mask_line = np.zeros( array_shape ).astype( np.uint16 )
    mask_line[index[0], index[1], index[2]] = 1
    
    return mask_line

def cylinder_th_ey(p1, array_shape, R, pixel_size):
    '''
    The cylinder axis is OY, only for isotropic image
    Parameters
    ----------
    p1 : np.array, shape (3,)
        1st point on cylinder x2es

    array_shape : TYPE
        shape of data array from which the indexes of cylinder should be taken
    R : float
        radius of cylinder in physical units
    pixel_size : float
        physical pixel size

    Returns
    -------
    index : np.array
        coordinate arrays (k, i, j) for the cylinder with the x2is going through to 2 points
    '''
        
    print('making cylinder')
    
    print( "Start : %s" % time.ctime() )
    
    z0, y0, x0 = p1 * pixel_size

    to_compare = R**2
    
    nk, ni, nj = array_shape
    
    k = np.linspace(0, nk-1, nk ).astype( int )
    i = np.linspace(0, ni-1, ni ).astype( int )
    j = np.linspace(0, nj-1, nj ).astype( int )
    
    z, y, x = [ ind.ravel() for ind in np.meshgrid(k, i, j) ]
    index = np.vstack((z, y, x))
    
    z, y, x = z*pixel_size, y*pixel_size, x*pixel_size

   
    condition_arr = ( ( ( z - z0 )**2 + ( x - x0 )**2 < to_compare ) * 1 ).astype( np.uint8 )
    
    
    index[0] = index[0] * condition_arr
    index[1] = index[1] * condition_arr
    index[2] = index[2] * condition_arr
    
    print( "End : %s" % time.ctime() )
    
    return index


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

def mean_nonzero(arr, axis_n):
    arr[ np.where(arr == 0) ] = np.nan
    arr = np.nanmean(arr, axis=axis_n)
    return arr.astype( np.uint16 )

def mean_along_y(roi_cylinder):
    roi_cylinder[ np.nonzero( (roi_cylinder == 0) * 1 ) ] = np.nan
    roi_cylinder = np.nanmean(roi_cylinder, axis=0)
    roi_cylinder = np.nanmean(roi_cylinder, axis=1)
    return roi_cylinder

def save_1d(roi_1d, img_path, roi_name, pixel_size_aim):
    from inputs import R_average, downsample
    roi_file = os.path.join(os.getcwd(), 'results', os.path.split( os.path.dirname(img_path) )[1]+'_'+os.path.splitext(os.path.basename(img_path))[0] + str(roi_name) + '_ds_' + str(downsample) + '_' + str(int(1e6*R_average)) + 'mkm.csv')
    print(roi_file)
    
    f = open(roi_file, 'w')
    f.writelines( 'physical_pixel_size_mkm, ' + str(pixel_size_aim) + '\n' )
    np.savetxt(roi_file, roi_1d)
    f.close()
    
def save_1d(roi_1d, img_path, roi_name, pixel_size_aim):
    from inputs import R_average, downsample
    roi_file = os.path.join(os.getcwd(), 'results', 'roi_1d', os.path.split( os.path.dirname(img_path) )[1]+'_'+os.path.splitext(os.path.basename(img_path))[0] + str(roi_name) + '_ds_' + str(downsample) + '_' + str(int(1e6*R_average)) + 'mkm.csv')
    print(roi_file)
    
    f = open(roi_file, 'w')
    f.writelines( 'physical_pixel_size_mkm, ' + str(pixel_size_aim) + '\n' )
    np.savetxt(roi_file, roi_1d)
    f.close()
    
def save_2d(roi_2d, img_path, roi_name, pixel_size_aim):
    from inputs import downsample
    roi_file = os.path.join(os.getcwd(), 'results', 'roi_2d', os.path.split( os.path.dirname(img_path) )[1]+'_'+os.path.splitext(os.path.basename(img_path))[0] + str(roi_name) + '_ds_' + str(downsample) + '_' + str(1e6*pixel_size_aim) + 'mkm.csv')
    print(roi_file)
    np.savetxt(roi_file, roi_2d)

def rotate(image, rot_x, rot_y, rot_z):
    img = image.copy()
    for key in img:
        if type(img[key]) is np.ndarray:
            img[key] = cle.rotate(img[key], None, rot_x, rot_y, rot_z, True, True, True)
            img[key] = (np.array(img[key])).astype( np.uint16 )
    return img

def make_1d_from_2d(image, R_average, pixel_size, p1):
    img = image.copy()
    n_average = int( np.ceil(R_average/pixel_size) )
    #print(p1[0])
    p = int(p1[0]/pixel_size)

    for key in img:
        img[key] = np.mean(img[key][p-n_average:p+n_average, :], axis=0)
        
    # crop tissue
    for_crop = img['shh']
    i0, im = np.min(np.nonzero( for_crop )), np.max(np.nonzero( for_crop ))
    for key in img:
        img[key] = img[key][i0:im]
        
    return img

def make_1d_from_3d(image, mask, pixel_size):

    img = image_analysis.preprocess.mask.crop(image, mask)
    mask = image_analysis.preprocess.mask.crop(mask, mask)

    for key in img.keys():
        if type(img[key]) is np.ndarray:
            img[key] = (img[key] * mask).astype('float')
            img[key][img[key] == 0] = np.nan
   
    for key in img.keys():
        if type(img[key]) is np.ndarray:
            img[key] = np.nanmean(img[key][:, :, :], axis=0).astype( np.uint16 )
            img[key] = np.nanmean(img[key][:, :], axis=1).astype( np.uint16 )
    
    # crop tissue
    for_crop = img['shh']
    i0, im = np.min(np.nonzero( for_crop )), np.max(np.nonzero( for_crop ))
    for key in img:
        if type(img[key]) is np.ndarray:
            img[key] = img[key][i0:im]
    
    return img

def flip(image, axis):
    img = image.copy()
    for key in img:
        if type(img[key]) is np.ndarray:
            img[key] = (np.flip(img[key], axis)).astype( np.uint16 )
    return img