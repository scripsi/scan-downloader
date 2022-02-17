#!/bin/sh

# PROVIDE: scandl
# REQUIRE: NETWORKING SYSLOG
# KEYWORD: 
#
# Add the following lines to /etc/rc.conf to enable ocrmypdf:
#
#scandl_enable="YES"

. /etc/rc.subr

name="scandl"
rcvar="scandl_enable"

command="/usr/sbin/daemon"
command_args="-S -l daemon -s debug -T scandl -u user -p /var/run/scandl.pid /usr/bin/env -i OCR_INPUT_DIRECTORY=/home/user/scandl/in OCR_OUTPUT_DIRECTORY=/home/user/scandl/out OCR_ON_SUCCESS_DELETE=1 HOME=/home/user PATH=/usr/local/bin:${PATH} USER=user /usr/local/bin/python /home/user/scandl/bin/watcher.py"


load_rc_config ${name}

: ${scandl_enable:=no}


run_rc_command "$1"
