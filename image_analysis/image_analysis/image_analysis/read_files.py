import os
import numpy as np

def get_paths(folder, channel=None, exclude=None, suffix=None):
    """
    Generate a list of file paths in the specified folder that meet specific criteria.

    Parameters
    ----------
    folder : str
        Path to the folder where files are searched.
    channel : str, optional
        Substring to include in the file names (case-insensitive). Default is ''.
    exclude : str, optional
        Substring to exclude from the file names (case-insensitive). Default is ';'.
    suffix : str, optional
        Substring (e.g., file extension) to include in the file names (case-insensitive). Default is ''.

    Returns
    -------
    files_paths : list of str
        List of file paths that match the given criteria.
    """
    if channel is None:
        channel = ''
    if exclude is None:
        exclude = ';'
    if suffix is None:
        suffix = ''
    
    # Normalize input strings to lowercase for case-insensitive matching
    channel = str(channel).lower()
    exclude = str(exclude).lower()
    suffix = str(suffix).lower()
    
    files_paths = []
    
    # Traverse the directory tree to find matching files
    for root, dirs, files in os.walk(folder, topdown=False):
        for current_file in files:
            current_file_l = current_file.lower()
            if (channel in current_file_l and 
                exclude not in current_file_l and 
                suffix in current_file_l):
                files_paths.append(os.path.join(root, current_file))
    
    # Notify if no files match the criteria
    if not files_paths:
        print('No files found.')
    else:
        return files_paths

def change_paths(paths, include=None, exclude=None):
    """
    Filter a list of paths based on inclusion and exclusion criteria.

    Parameters
    ----------
    paths : list of str
        List of file paths to be filtered.
    include : str, optional
        Substring that must be present in the file name (case-insensitive). Default is ''.
    exclude : str, optional
        Substring that must not be present in the file name (case-insensitive). Default is ';'.

    Returns
    -------
    paths_new : list of str
        Filtered list of file paths meeting the criteria.
    """
    if include is None:
        include = ''
    if exclude is None:
        exclude = ';'

    # Normalize input strings to lowercase for case-insensitive matching
    include = str(include).lower()
    exclude = str(exclude).lower()

    paths_new = []

    # Iterate through the given paths and filter based on criteria
    for path in paths:
        basename = os.path.basename(path).lower()
        if include in basename and exclude not in basename:
            paths_new.append(path)

    return paths_new

if __name__ == '__main__':
    pass    