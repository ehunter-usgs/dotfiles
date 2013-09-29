#!/usr/bin/env bash

# Script to create the ".extra" file. Creates customized stuff not suitable for
# sharing.

extra="${HOME}/.extra";
noPass=${HOME}/.ssh/id_rsa_nopass.pub
withPass=${HOME}/.ssh/id_rsa_withpass.pub

authKeys='~/.ssh/authorized_keys'; # Authorized keys file on servers

me=`whoami`;

###########################################################################
# Subroutines
###########################################################################

function configureServer () {
	local serverName='';
	local serverAlias='';

	read -p 'Server Name: ' serverName
	read -p 'Server Alias: ' serverAlias
	read -p "Server User [${me}]: " serverUser
	read -p 'Use passphrase [y|N]: ' usePass

	case "${usePass}" in
		y|Y|yes|Yes)
			serverKey=$withPass;
			;;
		*)
			serverKey=$noPass;
			;;
	esac

	if [ -z "${serverUser}" ]; then
		serverUser=$me;
	fi

	# Install the key on the server
	# TODO :: Execute this rather than echo it
	echo "cat ${serverKey} | ssh ${serverUser}@${serverName} 'cat - >> ~/.ssh/authorized_keys'";

	# Add the entry as an alias
	writeExtra "alias ${serverAlias}='ssh ${serverUser}@${serverName}'";
}

function writeExtra () {
	local message="$@";
	echo $message >> $extra;
}

################################################################################
# Main script body
################################################################################

# Move old file out of the way
if [ -f $extra ]; then
	mv $extra ${extra}.`date +%Y%m%d%H%M%S`;
fi

writeExtra "# ~/.extra";
writeExtra "# created: `date`";
writeExtra '';

# Add server configurations
read -p 'Would you like to configure server connections [y|N]: ' answer;

if [[ "${answer:0:1}" == "Y" || "${answer:0:1}" == "y" ]]; then
	writeExtra '# Server alias configurations';
fi

while [[ "${answer:0:1}" == "Y" || "${answer:0:1}" == "y" ]]; do
	configureServer;
	read -p 'Configure another server [y|N]: ' answer;
done

echo 'Done configuring servers.';

# Let user know about all .extra files in $HOME (so they can clean up)
numExtra=`ls ${extra}.* | wc -l` 2> /dev/null;
if [[ $? -eq 0 && $numExtra -gt 0 ]]; then
	echo '';
	echo 'Existing extra files found. Consider cleaning up.';
	ls -l ${extra}.*
fi

exit 0;
