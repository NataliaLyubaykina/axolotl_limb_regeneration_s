# axolotl_limb_regeneration_s: Growth Simulations and Image Analysis of Axolotl Limb Regeneration

Supporting repositorium for PhD thesis 'Mathematical Modelling of Axolotl Limb Regeneration'.
Paper preprint: https://doi.org/10.1101/2025.02.14.638295

## Overview
This repository contains codes for:
- **Growth Simulations**: Numerical simulations using the Euler scheme to model growth dynamics.
- **Growth Simulations (additional)**: Additional growth simulations to analyze further model variants.
- **Image Analysis**: Tools for analyzing axolotl limb regeneration 3d images.
- **PhD Thesis**: Basic examples for simulating diffusion and image analysis.
- **Statistical Tests**: Statistical tests to analyze image analysis results.

### Repository Structure
- `growth_simulations`: Growth Simulations 
    - `growth_simulations/euler_scheme_1d_with_growth/`: Python package for growth simulations.
- `growth_simulations_additional`
- `image_analysis`: Image Analysis
    - `axolotl_limb_regeneration_s/image_analysis/image_analysis`: Python package for image analysis.
    - `axolotl_limb_regeneration_s/example/`: Example of the image analysis pipeline for 3 images available here.
    - `axolotl_limb_regeneration_s/all_image_analysis_without_data/`: The copy of the complete image analysis for all the data from without any images themselves.
    - `axolotl_limb_regeneration_s/widefield_images/`: Analysis of the measurements from widefield images.
- `statistical_tests`: Statistical Tests=

## Installation Instructions

### Clone the Repository
To download this repository, run:
```bash
git clone https://github.com/NataliaLyubaykina/axolotl_limb_regeneration_s
cd axolotl_limb_regeneration_s
```

### Create the Conda Environment
The repository includes an `environment.yml` file that defines the dependencies.

To create the environment, run:
```bash
conda env create -f environment.yml
conda activate axolotl
```

Please note that this repository requires CuPy. By default, CuPy supports Nvidia GPUs via CUDA. If you are using a different platform (e.g., AMD or Intel), you may need to install a compatible CuPy backend manually.

Enjoy exploring the fascinating dynamics of limb regeneration!
