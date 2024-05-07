#!/bin/bash
# Script to run MATLAB models and generate data and plots

# Add the current directory to MATLAB's path
export MATLABPATH=$MATLABPATH:$(pwd)

# Function to run MATLAB commands
run_matlab() {
    echo "Running $1..."
    matlab -batch "try, addpath(genpath('.')); $1; catch e, disp(getReport(e, 'extended')); end"
}

# List the main model script names here
models=("Tyson1991") # Example model names

# Execute each model script
for model in "${models[@]}"
do
    run_matlab "$model"
done

echo "All models have been processed."


