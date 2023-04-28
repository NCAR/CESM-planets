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



  Once you do that, open a web browser and go to http://127.0.0.1:8888 - you should see the basic interface.

  Here's a few common questions/issues you might run into:

1) What if I'm already running Jupyter locally?

  If you're already running, it might be on port 8888 (the default), so you'll need to use a different port in the 'docker run' command.  Since this is a container, you only need to change the external port, which is the first number in the set of two.  Eg, to switch from listening on port 8888 to port 9999, do:

  docker run -i -n cesmlab --rm -v  ${HOME}:/home/user -p 9999:8888 escomp/cesm-lab-2.2

  After that, open a browser window to:  http://127.0.0.1:9999

 
