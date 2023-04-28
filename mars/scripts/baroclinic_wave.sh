#!/bin/tcsh
set res = ne30_ne30_mg17
#
# source code (assumed to be in /glade/u/home/$USER/src)
# changed to /home/user/cam-mars/
#
set src="cam-mars"
set stopoption="ndays"
set steps="1"
set cset="FADIAB"
# set pecount="225"
set pecount="1"
set queue="regular"
set PBS_ACCOUNT="P93300642"
# echo $PBS_ACCOUNT
# set scratch="/glade/scratch"
set scratch="/home/user/scratch/"

set caze=${cset}_${res}

echo /home/user/$src/cime/scripts/create_newcase

/home/user/$src/cime/scripts/create_newcase --case $scratch/$caze --compset $cset --res $res  --q $queue --walltime 00:10:00 --pecount $pecount  --project $PBS_ACCOUNT --run-unsupported

cd $scratch/$caze
./xmlchange STOP_OPTION=$stopoption,STOP_N=$steps
./xmlchange DOUT_S=FALSE
./xmlchange DEBUG=FALSE
./xmlchange TIMER_LEVEL=10
./xmlchange CAM_CONFIG_OPTS="-phys adiabatic -analytic_ic -cppdefs -Dplanet_mars -nlev 32"
./case.setup

echo "se_statefreq       = 1"                     >> user_nl_cam

echo "interpolate_output = .true.,.true.,.true."    >> user_nl_cam
echo "interpolate_nlat   = 192,192,192"             >> user_nl_cam
echo "interpolate_nlon   = 288,288,288"             >> user_nl_cam
echo "empty_htapes       = .true." >> user_nl_cam
#held_suarez_1994,moist_baroclinic_wave_dcmip2016,dry_baroclinic_wave_dcmip2016,dry_baroclinic_wave_jw2006,us_standard_atmosphere
echo "analytic_ic_type='dry_baroclinic_wave_dcmip2016'"  >> user_nl_cam
echo "nhtfrq = -24" >> user_nl_cam
echo "mfilt = 144" >> user_nl_cam
echo "avgflag_pertape(1) = 'I'" >> user_nl_cam
echo "fincl1 = 'PS','U','V','T','OMEGA'" >> user_nl_cam
#
# time-steps have not been optimized for Mars at this point
#
echo "se_nsplit = 6" >> user_nl_cam
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

