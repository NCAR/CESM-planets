 Here are the instructions to run the CESM+Jupyter ('CESM-Lab') container - it's just a few easy steps.  There's a preliminary FAQ afterwards for common questions, too:

  1) Download and install Docker ( https://www.docker.com/products/docker-desktop )

  2) Run 'docker pull escomp/cesm-lab-2.2' -- this gets you the CESM2.2 release w/ Jupyter integration

  3) [Optional, but recommended] Create a subdirectory to mount into the container:

  Mac/Linux:
    mkdir ~/cesmlab

  Windows (on the C: drive):
     cd C:\
     mkdir cesmlab

  4) Run the container - the ‘-v’ flag is for mounting the directory above into the container.  

  Mac/Linux:

   docker run -it --rm -v  ${HOME}/cesmlab:/home/user -p 8888:8888 escomp/cesm-lab-2.2

  Windows:
   docker run -it --rm -v  C:\cesmlab:/home/user -p 8888:8888 escomp/cesm-lab-2.2


  (Note: The ‘-n’ option is only in newer Docker versions; if you have an issue with it, just remove the ‘-n cesmlab’ section above.)



  Once you do that, open a web browser and go to http://127.0.0.1:8888 - you should see the basic interface, and if you click on the 'tutorials' folder, then 'index.ipynb', you'll be brought to the list of tutorials (many just placeholders).  The quick start should be fully functional, though.

  If you're unfamiliar with Jupyter, and want the bash interface, you can (in the Jupyter browser) go to 'File'->'New'->'Terminal', and use the terminal mode.  Alternatively, a smaller image of just CESM can also be used by running ‘escomp/cesm-2.2’ instead of ‘escomp/cesm-lab-2.2’.  This image offers a full, portable CESM image, but without the Jupyter notebook interface.  To run it, follow the same instructions as above, but the ‘-p 8888:8888’ option is no longer necessary.

  Here's a few common questions/issues you might run into:

1) What if I'm already running Jupyter locally?

  If you're already running, it might be on port 8888 (the default), so you'll need to use a different port in the 'docker run' command.  Since this is a container, you only need to change the external port, which is the first number in the set of two.  Eg, to switch from listening on port 8888 to port 9999, do:

  docker run -i -n cesmlab --rm -v  ${HOME}:/home/user -p 9999:8888 escomp/cesm-lab-2.2

  After that, open a browser window to:  http://127.0.0.1:9999

  2) When running the quickstart tutorial, my MPI run failed.  Why?

  The most likely situation here is your system has lots of processor cores - the CESM-Lab container automatically adjusts to use however many cores your Docker runtime has access to, but by default, Docker only gives images 64MB in a /dev/shm shared memory mount.  Since MPI uses this space for bookkeeping, lots of processes will need more memory.  You can provide more by adding the '--shm-size=<n>' argument, like below:

  docker run -i -n cesmlab --rm --shm-size=256M -v  ${HOME}:/home/user -p 9999:8888 escomp/cesm-lab-2.2

  3) I'm trying to run multiple CESM commands (eg, case.setup, case.build, case.submit, etc) in a single cell and it doesn't work, why?

  Jupyter's parser doesn't handle this sort of thing right now; you can only do a single 'system' command per cell.  Cells and lines are treated differently. 

  4) I tried to build a common case, like a B1850 @ 2-degree, and it failed with 'relocation truncated to fit: R_X86_64_PC32', why?

  You probably have too few processors - technically, the models shouldn't depend on having a certain number of cores, but in practice a few do, due to static arrays being too large.  One way around this is to a) launch the container with more shared memory in /dev/shm (see #2 above), and then b) artificially tell the environment you want to run on more cores.  Even if you only have 4 cores, you can launch a 16-core job, and that should work.

