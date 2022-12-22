### Notebooks for creating a vertical grid for CESM-Mars on same pressure levels as PCM-Mars


Grid files:
49 level CESM grid:
mars_cam_vcoords_L49_c221221_netcdf3.nc is with the "NETCDF3_64BIT" format option

and one created nccopy -k cdf5:
```
$ nccopy -k cdf5 mars_cam_vcoords_L49_c221221_netcdf3.nc mars_cam_vcoords_L49_c221221_netcdf3_cdf5.nc
```
