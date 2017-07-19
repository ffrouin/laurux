#
# Regular cron jobs for the laurux package
#
0 4	* * *	root	[ -x /usr/bin/laurux_maintenance ] && /usr/bin/laurux_maintenance
