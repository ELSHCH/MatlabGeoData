# Time series plots for observational data. Fourier Transform and Welsch
# Power Spectrum for geochemical data from observational site at the Baltic Sea.
# Example of 3 panel plots for illustration with sinusoidal function.

The files for reproducing observations from the Baltic Sea and measured high
frequency near surface wind from the station. The codes are in Matlab and in
Python for the same data set.

## Description

The Fourier Transform and P-welsch power spectrum plot in Matlab is illustrated in
`fft_pwelch_Boknis.m` for the observational geochemical time series.

In files `plotLHGeomar.m` and `plotLHGeomar.py` athmospheric data such as pressure
and wind are reproduced on time plots.

The code `readGeomarRoofLighthouseData.m` is used as a data loader from multi-column
`.dat` file format into `.m` Matlab format.

With `threePlots.py` one can create 3 type of time panel plots. It is illustrated With
sinusoidal function as an example.
