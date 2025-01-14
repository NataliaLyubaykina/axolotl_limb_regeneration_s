# axolotl_limb_regeneration_s: Growth Simulations and Image Analysis of Axolotl Limb Regeneration

## Overview
This repository contains tools for:
- **Growth Simulations**: Numerical simulations using the Euler scheme to model growth dynamics.
- **Image Analysis**: Tools for analyzing axolotl limb regeneration 3d images.

### Repository Structure
- `growth_simulations`: Growth Simulations 
    - `growth_simulations/euler_scheme_1d_with_growth/`: Python package for growth simulations.
- `image_analysis`: Image Analysis
    - `axolotl_limb_regeneration_s/image_analysis/image_analysis`: Python package for image analysis.
    - `axolotl_limb_regeneration_s/example/`: Example of the image analysis pipeline for 3 images available here.
    - `axolotl_limb_regeneration_s/all_image_analysis_without_data/`: The copy of the complete image analysis for all the data from **paper** without any images themselves, raw data is available **link**.

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

Enjoy exploring the fascinating dynamics of limb regeneration!