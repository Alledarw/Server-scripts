# server-scripts
Useful bash scripts for server configuration and setup

# ./switch-service.sh
If you have multiple web server technologies installed on your server, you can use this simple command to change between them. (Works for Apache2 and node.js and nginx)

# ./setup-apache-host-files.sh
Configure and create apache vhosts file automatically and in the var/www folder on your server.

# ./now-time.sh
This script prints date and time to a file called now.log. It should be combined with a cron job.

Give it permission to execute: chmod +x write-now.sh

Add it as a cron job: crontab -e

Add this to the last line in the file that gets opened:
* * * * * /var/bash-test/write-now.sh

To view all active cron jobs enter this command: crontab -l
