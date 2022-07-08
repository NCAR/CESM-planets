# CAM development scripts

'Here is an initial setup for Mars using a recent cam_development version:

git clone https://github.com/PeterHjortLauritzen/CAM cam-mars
cd cam-mars
git checkout cam-mars
./manage_externals/checkout_externals 
cd scripts
source baroclinic_wave.sh

all code modifications are ifdef'ed in with "planet_mars"

In the scripts directory there is a run script for a baroclinic wave on Mars (scripts/baroclinic_wave.sh) and another one for Held-Suarez (scripts/held_suarez.sh). Once we have a vertical profile for T we can modify Held-Suarez forcing for that.

Not sure how waves propagate on Mars but the baroclinic wave looks just like the one on Earth (with appropriate scaling of g, PS, etc.).
