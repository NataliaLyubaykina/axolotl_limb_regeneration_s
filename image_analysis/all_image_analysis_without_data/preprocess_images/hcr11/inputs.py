#----- channels names from metadata
channels = {
            "dapi":      0, 
            "fgf":       1, 
            "dusp":      2, 
            "edu":       3, 
            "shh":       4, 
            "autofluor": 5, 
            "bright":    6
           }

#-----
downsample = 2                  # downsampling level while image loading (the same along all axis)
R_average = 20                 # um, the radius of cyllinder for making 1d Shh-Fgf ROI
pixel_size_aim_user_def = 2e-6    # pixel size used while making 3d image isotropic

sigma = 5 # for gauss filter before thresholding