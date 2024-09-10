# CAM development scripts

Initial setup for Mars using a recent cam_development version:

```
git clone https://github.com/NCAR/CESM-planets CESM-planets
cd CESM-planets
git checkout planets_dev
./manage_externals/checkout_externals 
cd mars/scripts
tcsh
source held_suarez_mars.sh
exit
```

all code modifications are ifdef'ed in with "planet_mars".
