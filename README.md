# Bias to Simplicity in Systems Biology Models

This repository contains MATLAB scripts designed to automate the generation of integration data for standard and perturbed models, analyze this data, and generate frequency versus complexity plots as part of a systems biology study.

## Prerequisites

Before you begin, ensure you have the following installed:
- [MATLAB](https://www.mathworks.com/products/matlab.html) (R2022b or later)
- [Statistics and Machine Learning Toolbox](https://www.mathworks.com/products/statistics.html) for MATLAB

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/bias-to-simplicity.git
   cd bias-to-simplicity
   ```

2. **Setup MATLAB Path**
   
   Ensure that MATLAB can access the scripts by adding the repository's directory to your MATLAB path:
   ```matlab
   addpath(genpath('path_to_repository'));
   ```

## Usage

To run the scripts and generate the required data and plots, execute the following steps:

1. **Set Up Your Environment**
   Make sure all required MATLAB paths are set correctly as mentioned in the installation section.

2. **Run the Automation Script**
   On Linux or macOS:
   ```bash
   chmod +x run_models.sh
   ./run_models.sh
   ```
   On Windows, use:
   ```bat
   run_models.bat
   ```

   This script will automatically call the necessary MATLAB scripts (e.g., `Tyson1991`) to process each model, generate integration data, analyze this data, and produce the plots.

## Scripts Overview

- `Tyson1991.m`: Main script for the Tyson 1991 model. It orchestrates the workflow by calling the following scripts:
  - `get_tyson_traj_data.m`: Generates integration data for both standard and perturbed models.
  - `main_script.m`: Analyzes the integration data and creates frequency vs. complexity plots.










