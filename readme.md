dist/build/eta-example/eta-example   bash script that calls java with the full classpath containing all the libraries


how to create  uberjar

etlas clean
etlas configure --enable-uberjar-mode # Needs to be done once
etlas build # You will now have an uberjar
