 Here are the instructions to run the CESM container - it's just a few easy steps.

  1) Download and install Docker ( https://www.docker.com/products/docker-desktop )

  2) Run 'docker pull escomp/cam_mars' - this will take about 2.2GB of disk space.
  
  3) [Optional, but recommended] Create a subdirectory to mount into the container:

  Mac/Linux:
    mkdir ~/cesm-dev

  Windows (on the C: drive):
     cd C:\
     mkdir cesm-dev
 
  4) From there, you can run it (and feel free to give a different directory than 'cesmlab' on your own system):

  docker run -it --rm -v ${HOME}/cesm-dev:/home/user escomp/cam_mars

  
  5) And from there, you should be able to do a 'git clone' of the code and it'll just work.  
  
  git clone https://github.com/PeterHjortLauritzen/CAM cam-mars
  
  cd cam-mars
  
  git checkout cam-mars (*)
  
  ./manage_externals/checkout_externals 
  
  cd scripts
  
  From a different terminal on you host machine copy the shell script from this repo's scripts directory to the cam-mars/scripts directory. e.g., 
  cp baroclinic_wave.sh /Users/*user_name*/cesm-dev/cam-mars/scripts/baroclinic_docker.sh
  
  from a tcsh
  source baroclinic_wave.sh
  This should take you to the case directory /home/user/scratch/FADIAB_ne30_ne30_mg17

 6) Build the model: ./case.build 

 (*) However, before you do that, make sure you do this first, and accept the certificate permanently ('p') to fix that issue with 'checkout_externals':
 
 svn ls  https://svn-ccsm-models.cgd.ucar.edu/tools/proc_atm/chem_proc/release_tags/chem_proc5_0_04


