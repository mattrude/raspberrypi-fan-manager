# Raspberry PI Fan Manager - Version 0.1.1

Copyright 2020 Matt Rude <matt@mattrude.com>

This is a small program written in c that monitors the CPU temperature,
turns on an installed fan if the temperature reaches a set limit, then turns
the fan back off when the temperature drops below a second set limit.

There is no configuration file or command line flags, all options must be
set before compiling.

## Avaliable options

* **fanPin** (Default: 0) - (pin) The GPIO pin you're using to control the fan.
  * *(See: http://wiringpi.com/pins/ for the WiringPi pinout.)*
* **sleepTime** (Default: 30) - (seconds) How often to check the core temperature.

* **onTem** (Default: 62) -  (in degrees Celsius) Fan turns on at this temperature.
* **offTemp** (Default: 52) - (in degress Celsius) Fan shuts off at this temperature.


## Build Instructions

Building & installling the *raspberrypi-fan-manager* is accomplshed the by comiling the source code and installing the resulting program on your Raspberry Pi.  although this may sound like a dounting task, in reality, its pretty simple.

The part most people have problem with is installing the required dependencies.  The *raspberrypi-fan-manager* only requires *wiringpi* to be installed on most systems, but to make sure that most people can install the program, we will walk though the full install.


## Installing Required dependencies

As we talked about above, *git*, *gcc*, & *make* should already be installed on your system, but just incase we will ask to have it installed again.  If a dependencie is already installed, it will simply be skipped by *apt* automatically.

Run the following command, make sure to choose **Y** when asked to confirm your selection during the install.

```
sudo apt install git gcc make wiringpi
```

## Download the source code

After the dependencies are installed, we can download the source code from [github](https://github.com/mattrude/raspberrypi-fan-manager).

For this README file, we are going to download the source code into your home directory, but you may change that to where ever you wish.  After the install is finished, you may delete the source code.

```
cd
sudo git clone git@github.com:mattrude/raspberrypi-fan-manager.git
```

## Build & install the software

Now for the fun part, building the source code and installing the resulting file on your system.

You first need to make sure you are in the new folder that was created during the previous step.  If you followed the directions above directly, your source code will now be at **~/raspberrypi-fan-manager**, so you make go into that directory by running

```
cd ~/raspberrypi-fan-manager
```

Once inside the source directory, run the build proccess by running the following commands.

```
make
sudo make install
```

## Confirming the software was built & is now running

The `make install` command installs systemd service for running the fan manager, this will also have the fan manager load at system boot.  There are three ways of confirming that the fan manager software is running:

* System Status

```
systemctl status raspi-fan-manager.service
```

* View the logs

```
grep 'raspi-fan-manager' /var/log/syslog
```

* View the running process

```
ps -eaf |grep raspi-fan-manager |grep -v grep
```

## License

```
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
