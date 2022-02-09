#!/bin/sh

# PROVIDE: ocrmypdf
# REQUIRE: NETWORKING SYSLOG
# KEYWORD: 
#
# Add the following lines to /etc/rc.conf to enable ocrmypdf:
#
#ocrmypdf_enable="YES"

. /etc/rc.subr

name="ocrmypdf"
rcvar="ocrmypdf_enable"

command="/usr/sbin/daemon"
command_args="-S -l daemon -s debug -T ocrmypdf -u scan -p /var/run/ocrmypdf.pid /usr/bin/env -i OCR_INPUT_DIRECTORY=/home/scan/scandl/in OCR_OUTPUT_DIRECTORY=/home/scan/scandl/out OCR_ON_SUCCESS_DELETE=1 HOME=/home/scan PATH=/usr/local/bin:${PATH} USER=scan /usr/local/bin/python /home/scan/scandl/bin/watcher.py"


load_rc_config ${name}

: ${ocrmypdf_enable:=no}


run_rc_command "$1"
