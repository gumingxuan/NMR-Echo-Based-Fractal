README

Code Repository: Fractal Analysis for Shale Hydrocarbon Mobility Evaluation

Corresponding Manuscript

Title: A Novel NMR Echo-Based Fractal Method for Evaluating Hydrocarbon Mobility in Shale Reservoirs

Overview

This repository contains the implementation code for the fractal framework proposed in the manuscript, used to extract fractal dimensions from NMR data (echo data and T1-T2 spectra) for quantitative evaluation of shale hydrocarbon mobility.

Core Functions

1. fractal_from_Echo(E, nbins)

  - Purpose: Extract fractal dimensions directly from NMR echo data.

  - Inputs: E (NMR echo data matrix), nbins (number of bins for radial averaging).

  - Outputs: D (fractal dimension), x (log(rvec) of valid data), y (log(Pr) of valid data).

2. fractal_from_spec_DBC(Z1)

  - Purpose: Extract fractal dimensions from NMR T1-T2 spectra using the box-counting method (for comparison).

  - Input: Z1 (NMR T1-T2 spectrum matrix).

  - Outputs: FD (fractal dimension), x (log(1/s_valid)), y (log(Nr_valid)).

Usage Notes

- Ensure input data (NMR echo data `E` and T1-T2 spectrum `Z1`) are in matrix format.

- Adjust `nbins` in `fractal_from_Echo` based on the size of your echo data for optimal radial averaging.

- The code is compatible with MATLAB (tested on R2020b and later versions).

Citation

Please cite the corresponding manuscript when using this code for research or application.
