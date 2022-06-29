import xarray as xr
#n100 second run
ds = xr.open_dataset('LAPS_sensitivity_n100_pld180_5m_Kh10_nday545_daily_07012012_repeattest.nc')

subset_n100_repeat_day30 = ds.where(ds.age == 2592000, drop=True)
subset_n100_repeat_day60 = ds.where(ds.age == 5184000, drop=True)
subset_n100_repeat_day90 = ds.where(ds.age == 7776000, drop=True)
subset_n100_repeat_day180 = ds.where(ds.age == 15552000, drop=True)

subset_n100_repeat_day30.to_netcdf('/Users/taylorely/Documents/OceanModeling/n100_repeat_day30.nc')
subset_n100_repeat_day60.to_netcdf('/Users/taylorely/Documents/OceanModeling/n100_repeat_day60.nc')
subset_n100_repeat_day90.to_netcdf('/Users/taylorely/Documents/OceanModeling/n100_repeat_day90.nc')
subset_n100_repeat_day180.to_netcdf('/Users/taylorely/Documents/OceanModeling/n100_repeat_day180.nc')

#n100 first run
ds2 = xr.open_dataset('LAPS_sensitivity_n100_pld180_5m_Kh10_nday545_daily_07012012.nc')

subset_n100_day30 = ds2.where(ds2.age == 2592000, drop=True)
subset_n100_day60 = ds2.where(ds2.age == 5184000, drop=True)
subset_n100_day90 = ds2.where(ds2.age == 7776000, drop=True)
subset_n100_day180 = ds2.where(ds2.age == 15552000, drop=True)

subset_n100_day30.to_netcdf('/Users/taylorely/Documents/OceanModeling/n100_day30.nc')
subset_n100_day60.to_netcdf('/Users/taylorely/Documents/OceanModeling/n100_day60.nc')
subset_n100_day90.to_netcdf('/Users/taylorely/Documents/OceanModeling/n100_day90.nc')
subset_n100_day180.to_netcdf('/Users/taylorely/Documents/OceanModeling/n100_day180.nc')

#n500 first run
ds3 = xr.open_dataset('LAPS_sensitivity_n500_pld180_5m_Kh10_nday545_daily_07012012.nc')

subset_n500_day30 = ds3.where(ds3.age == 2592000, drop=True)
subset_n500_day60 = ds3.where(ds3.age == 5184000, drop=True)
subset_n500_day90 = ds3.where(ds3.age == 7776000, drop=True)
subset_n500_day180 = ds3.where(ds3.age == 15552000, drop=True)

subset_n500_day30.to_netcdf('/Users/taylorely/Documents/OceanModeling/n500_day30.nc')
subset_n500_day60.to_netcdf('/Users/taylorely/Documents/OceanModeling/n500_day60.nc')
subset_n500_day90.to_netcdf('/Users/taylorely/Documents/OceanModeling/n500_day90.nc')
subset_n500_day180.to_netcdf('/Users/taylorely/Documents/OceanModeling/n500_day180.nc')

#n1000 first run
ds1000_1 = xr.open_dataset('LAPS_sensitivity_n1000_pld180_5m_Kh10_nday545_daily_07012012_first.nc')
ds1000_2 = xr.open_dataset('LAPS_sensitivity_n1000_pld180_5m_Kh10_nday545_daily_07012012_second.nc')
ds1000_3 = xr.open_dataset('LAPS_sensitivity_n1000_pld180_5m_Kh10_nday545_daily_07012012_third.nc')



subset_n1000_1_day30 = ds1000_1.where(ds1000_1.age == 2592000, drop=True)
subset_n1000_2_day30 = ds1000_2.where(ds1000_2.age == 2592000, drop=True)
subset_n1000_3_day30 = ds1000_3.where(ds1000_3.age == 2592000, drop=True)
subset_n1000_day30_half = subset_n1000_1_day30.merge(subset_n1000_2_day30)
subset_n1000_day30 = subset_n1000_day30_half.merge(subset_n1000_3_day30)

subset_n1000_1_day60 = ds1000_1.where(ds1000_1.age == 5184000, drop=True)
subset_n1000_2_day60 = ds1000_2.where(ds1000_2.age == 5184000, drop=True)
subset_n1000_3_day60 = ds1000_3.where(ds1000_3.age == 5184000, drop=True)
subset_n1000_day60_half = subset_n1000_1_day60.merge(subset_n1000_2_day60)
subset_n1000_day60 = subset_n1000_day60_half.merge(subset_n1000_3_day60)


subset_n1000_1_day90 = ds1000_1.where(ds1000_1.age == 7776000, drop=True)
subset_n1000_2_day90 = ds1000_2.where(ds1000_2.age == 7776000, drop=True)
subset_n1000_3_day90 = ds1000_3.where(ds1000_3.age == 7776000, drop=True)
subset_n1000_day90_half = subset_n1000_1_day90.merge(subset_n1000_2_day90)
subset_n1000_day90 = subset_n1000_day90_half.merge(subset_n1000_3_day90)

subset_n1000_1_day180 = ds1000_1.where(ds1000_1.age == 15552000, drop=True)
subset_n1000_2_day180 = ds1000_2.where(ds1000_2.age == 15552000, drop=True)
subset_n1000_3_day180 = ds1000_3.where(ds1000_3.age == 15552000, drop=True)
subset_n1000_day180_half = subset_n1000_1_day180.merge(subset_n1000_2_day180)
subset_n1000_day180 = subset_n1000_day180_half.merge(subset_n1000_3_day180)

subset_n1000_day30.to_netcdf('/Users/taylorely/Documents/OceanModeling/n1000_day30.nc')
subset_n1000_day60.to_netcdf('/Users/taylorely/Documents/OceanModeling/n1000_day60.nc')
subset_n1000_day90.to_netcdf('/Users/taylorely/Documents/OceanModeling/n1000_day90.nc')
subset_n1000_day180.to_netcdf('/Users/taylorely/Documents/OceanModeling/n1000_day180.nc')
