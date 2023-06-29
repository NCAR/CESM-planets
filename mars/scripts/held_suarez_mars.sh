#!/bin/tcsh
set short="F"
set analytic="F"
#set res = ne30_ne30_mg17
set res=ne16_ne16_mg17
#
# source code (assumed to be in /glade/u/home/$USER/src) --> BPM changed
set home=/glade/u/home
set srcloc=/glade/work/$USER/MARS
set src="cam-mars"
if ($short == "T") then
  set stopoption="ndays"
  set steps="1"
  set wall="00:05:00"
  set caze=Mars_${res}_L49_short
else
  set stopoption="nmonths"
  set steps="12"
  set wall="00:40:00"
  set caze=Mars_${res}_L49
endif
set cset="FHS94"
set pecount="4"
set queue="regular"
set PBS_ACCOUNT="P93300642"
echo $PBS_ACCOUNT
# set scratch="/glade/scratch"
set scratch=$home/$USER/scratch/


$srcloc/$src/cime/scripts/create_newcase --case $scratch/$USER/$caze --compset $cset --res $res  --q $queue --walltime $wall --pecount $pecount  --project $PBS_ACCOUNT --run-unsupported

cd $scratch/$USER/$caze
./xmlchange STOP_OPTION=$stopoption,STOP_N=$steps
./xmlchange DOUT_S=FALSE
./xmlchange DEBUG=FALSE
./xmlchange TIMER_LEVEL=10
if ($analytic == "T") then
  ./xmlchange CAM_CONFIG_OPTS="-phys held_suarez -analytic_ic -cppdefs -Dplanet_mars -nlev 49"
else
#./xmlchange CAM_CONFIG_OPTS="-phys held_suarez -analytic_ic -cppdefs -Dplanet_mars -nlev 32"
  ./xmlchange CAM_CONFIG_OPTS="-phys held_suarez -cppdefs -Dplanet_mars -nlev 49"
endif
./xmlquery CAM_CONFIG_OPTS
./case.setup
if ($short == "T") then
  echo "se_statefreq       = 1"                       >> user_nl_cam
  echo "nhtfrq = 1,-24"                             >> user_nl_cam
  echo "inithist          =  'DAILY'" >> user_nl_cam
else
  echo "se_statefreq       = 144"                     >> user_nl_cam
  echo "nhtfrq = 0,0"                                 >> user_nl_cam
  echo "inithist          =  'MONTHLY'" >> user_nl_cam
endif
echo "interpolate_output = .true.,.true.,.true."    >> user_nl_cam
echo "interpolate_nlat   = 96,96,96"             >> user_nl_cam
echo "interpolate_nlon   = 144,144,144"             >> user_nl_cam
echo "empty_htapes       = .true." >> user_nl_cam
#held_suarez_1994,moist_baroclinic_wave_dcmip2016,dry_baroclinic_wave_dcmip2016,dry_baroclinic_wave_jw2006,us_standard_atmosphere
if ($analytic == "T") then
  echo "ncdata = '/home/user/cam-mars/scripts/Mars_ne16_ne16_mg17_L49.cam.i.0001-04-01-00000.nc'" >> user_nl_cam
  echo "analytic_ic_type='us_standard_atmosphere'" >> user_nl_cam
  echo "se_nsplit = 100"
  echo "se_rsplit = 1"  >> user_nl_cam
  echo "se_hypervis_subcycle           = 1" >> user_nl_cam
  echo "se_hypervis_subcycle_q         = 1" >> user_nl_cam
else
  #
  # spun-up Held-Suarez initial condition
  #
  echo "ncdata = '/glade/u/home/pel/src/cam-mars/scripts/FHS94_ne16_ne16_mg17.cam.i.0002-10-01-00000.nc'" >> user_nl_cam
#
# time-steps have not been optimized for Mars at this point
#
  echo "se_nsplit = 8" >> user_nl_cam
  echo "se_rsplit = 4"  >> user_nl_cam
  echo "se_hypervis_subcycle           = 8" >> user_nl_cam
  echo "se_hypervis_subcycle_q         = 1" >> user_nl_cam
#echo "se_nsplit = 6" >> user_nl_cam
endif
#echo "analytic_ic_type='dry_baroclinic_wave_dcmip2016'"  >> user_nl_cam



echo "mfilt = 144" >> user_nl_cam
echo "avgflag_pertape(1) = 'I'" >> user_nl_cam
echo "fincl1 = 'PS','U','V','T','OMEGA'" >> user_nl_cam
echo "fincl2 = 'PS','U','V','T','OMEGA'" >> user_nl_cam


#
# set physical constants
#
echo "gravit = 3.72"      >> user_nl_cam
echo "sday   = 88642.0"   >> user_nl_cam
echo "mwdry  = 43.34"     >> user_nl_cam #0.04334 - original value
echo "cpair  = 735.0"     >> user_nl_cam
echo "rearth = 3.38992e6" >> user_nl_cam

# qcmd -- ./case.build
# ./case.submit
