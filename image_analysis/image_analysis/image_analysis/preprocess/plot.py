import matplotlib.pyplot as plt
import math
import numpy as np

figsize_y, figsize_x = plt.rcParams['figure.figsize']

def preview(img, z_position, enhanc_coef, save_results, output_name):
    """
    Display and optionally save preview plots of images at a specified z-slice.

    Parameters
    ----------
    img : dict
        Dictionary containing one or more 3D images as NumPy arrays.
    z_position : float
        Relative position of the z-slice to show (0 to 1).
    enhanc_coef : float
        Coefficient to multiply the image intensities for enhancement.
    save_results : bool
        Whether to save the resulting plots to a file.
    output_name : str
        Name of the output file (used if `save_results` is True).

    Returns
    -------
    None
        Displays x-y plots at the specified z-slice.
    """
    # Define the file path for saving results, if enabled
    if save_results:
        fig_path = 'fig/' + output_name + '.eps'

    # Determine the layout of the subplot grid
    nrows = math.ceil(len(img.keys()) / 4)
    ncols = 4

    # Create the figure and axes
    f, axes = plt.subplots(nrows, ncols, figsize=(figsize_x * ncols, figsize_y * nrows))
    axes = axes.ravel()

    # Turn off all axes initially
    for ax in axes:
        ax.axis('off')

    # Populate the subplots with image data
    for i, (key, value) in enumerate(img.items()):
        z = int(z_position * value.shape[0])  # Determine the z-slice based on relative position
        axes[i].imshow(enhanc_coef * value[z, :, :], cmap='binary')  # Apply enhancement and display
        title = (
            f'Channel: {key}\n'
            f'Size in pixels: {value.shape}\n'
            f'Enhanced by: {enhanc_coef}'
        )
        axes[i].set_title(title)

    # Adjust layout
    plt.tight_layout()

    # Save the figure if enabled
    if save_results:
        plt.savefig(fig_path, bbox_inches='tight', dpi=200)

    # Show the plot
    plt.show()
    
if __name__ == '__main__':
    pass    