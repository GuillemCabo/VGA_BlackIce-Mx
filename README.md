# VGA_BlackIce-Mx
Simple example VGA for BlackIce MX fpga.

Follow this tutorial to be sure that you have all the tools:
https://github.com/folknology/IceCore/wiki/IceCore-Getting-Started


Remember to have a terminal open where cat /dev/ttyACX is running, otherwise you
will not be able to flash the FPGA.
```
stty -F /dev/ttyACM0 raw -echo
cat /dev/ttyACM0
```

I used a Digilent VGA pmod adapter. It shall be connected to MX1 (Corner closest
to C2, c5, and c6).


Once the previous step is done load the design into the FPGA:
```
make upload
```

The output will be a screen full of blue smiley faces.
