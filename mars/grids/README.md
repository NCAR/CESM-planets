### Notebooks for creating a vertical grid for CESM-Mars on same pressure levels as PCM-Mars


mars_cam_vcoords_L49_c221221_netcdf3.nc is with the "NETCDF3_64BIT" format option
mars_cam_vcoords_L49_c221221_netcdf3classic.nc is with the "NETCDF3_CLASSIC" format option

and one where I did a nccopy -k cdf5 on the NETCDF3_64BIT file:
```
$ nccopy -k cdf5 mars_cam_vcoords_L49_c221221_netcdf3.nc mars_cam_vcoords_L49_c221221_netcdf3_cdf5.nc

$ ncdump -k mars_cam_vcoords_L49_c221221_netcdf3_cdf5.nc
cdf5

$ ncdump -k mars_cam_vcoords_L49_c221221_netcdf3.nc
64-bit offset

$ ncdump -k mars_cam_vcoords_L49_c221221_netcdf3classic.nc
classic
```
