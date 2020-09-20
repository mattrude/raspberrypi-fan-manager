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

* Required libraries

```
sudo apt install wiringpi
```

* Build & install the software

```
make
sudo make install
```

There are two ways of confirming that the new software is running

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
