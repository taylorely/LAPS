# LAPS
Code and tables generated from analyses for "title here" by ... Datasets are too large for github and can be found ???

# Ocean Parcels Runs

# PDDs and FUVs
LAPS_FUV_final.Rmd contains an example set of code used in the number of particles released sensitivity test to go from the netcdf files to then calculate a particle density distribution (PDD) and then calculated the fraction of unexplained variance (FUV) between 2 PDDs.  

divide_by_days.py contains python script using xarray. For the number of particles released sensitivity test, the netcdf files were extremely large and therefore a step before using this R markdown file was used which extracted only the day of interest from the entire netcdf file.

# Larval Connectivity Diffferences
nearest_neighbor.ipynb contains a jupyter notebook python file to calculate settlement and then differences in larval connections into the Hawaiian Archipelago with varying PLDs. We defined a connection as any successful larval exchange between an island in the study domain and the Hawaiian Archipelago. Successful larval exchange occurred if a particle’s closest distance to an island in the Hawaiian archipelago was ≤10km during the settlement window. The settlement window had a constant pre-competency period of 15 days and a maximum PLD of either 30, 60, 90, or 180 days. This settlement window was chosen because… A large settlement distance was chosen because of the coarse resolution of the model (~9km). However, the code allows for you to change the PLD, pre-competency window, and settlement distance to whatever you want.

HIreefsNew.csv contains coordinates of habitat for the nearest_neighbor.ipynb script to use
