#----- channels names from metadata
channels = {
            "fgf":    0, 
            "shh":    1, 
            "bright":   2, 
            "dapi": 3, 
            "dusp":   4, 
            "auto":    5
           }

#-----
downsample = 2                  # downsampling level while image loading (the same along all axis)
R_average = 20                 # um, the radius of cyllinder for making 1d Shh-Fgf ROI
pixel_size_aim_user_def = 2e-6    # pixel size used while making 3d image isotropic

sigma = 5 # for gauss filter before thresholding
