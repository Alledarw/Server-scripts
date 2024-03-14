#! /bin/bash

# Get domain name from the user
echo Enter your domain name:
read domainName

# Get the folder name from the user
echo Enter the folder name in  \/var\/www:
read folderName

# Add /var/www at the beginning of folderName
folderName="/var/www/$folderName"

# Read the contents of the template file
template=$(<apache-vhost-config.template)

# Replace DOMAINNAME and FOLDERPATH in the template
output="${template/DOMAINNAME/"$domainName"}"
output="${output//FOLDERPATH/"$folderName"}"

# Write to file in /etc/apache2/sites-available
filePath="/etc/apache2/sites-available/"$domainName.conf

# Tell user what we have done
echo Created the host file $filePath.

# Should we create a "demo folder" in /var/www if the folder does not exist?
echo Enter a path to a directory:
read directoryPath

if [ -d $folderName ]

then
echo 'The folder you chose already exists, be sure to have the right content in it'

else
echo 'Create the folder in /var/www + a simple "Hello from domain" php file'
mkdir $folderName
echo -e  "<?php\n echo \"Hello $domainName\";" > "$folderName/index.php"
echo 'No such folder, so created one is /var/www for testing purposes.'

fi

# Should we run a2ensite automatically?
echo
echo 'Do you wan to enable the host file? (Y/N)'
read enable

if [[ $enable == "Y" ]] || [[ $enable == "y" ]]
then # Automatically enable the host file
a2ensite $domainName
systemctl reload apache2
echo "Host enabled (systemctl reload apache2 is already done)"

fi
