PROJ=raspi-fan-manager
CC=cc
SRC=main.c
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_FILE = $(INSTALL) -m 0644
SYSTEMCTL = /bin/systemctl

all:
	$(CC) -g -Wall -std=c17 $(SRC) -lwiringPi -o $(PROJ)

install:
	$(INSTALL_PROG) $(PROJ) /usr/local/bin/
	$(INSTALL_FILE) ${PROJ}.service /etc/systemd/system/${PROJ}.service
	${SYSTEMCTL} enable ${PROJ}.service

clean:
	rm $(PROJ)
