Code to create an analytic function for the zonal mean temperature of Mars up to about 250 km.
###  Contents

+ climatology.ipynb

Reads in LMD-Mars temperatures, takes the zonal mean and fourier analyzes the structure. 
It then fits the latitudinal structure at each height to a function of the form (i.e., taking the global mean and
first four coefficients assuming it is symmetric about the equator.
```
    fit[i,:] = amp[i,0] \
             + amp[i,1]*np.cos(y) \
             + amp[i,2]*np.cos(2*y) \
             + amp[i,3]*np.cos(3*y) \
             + amp[i,4]*np.cos(4*y)
```
amplitudes are a function of height (index i).
+ amplitudes.dat

Output amplitudes from climatology notebook

+ polyfitamplitudes.ipynb

Fits the vertical structure of the amplitudes to a fifth order polynomial

+ gentref.ipynb  

A routine to take the fitted coefficients are generete a reference temperture field.

