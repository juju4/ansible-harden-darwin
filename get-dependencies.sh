#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/juju4.macos_apps_install ] && git clone https://github.com/juju4/ansible-macos-apps-install $rolesdir/juju4.macos_apps_install
[ ! -d $rolesdir/juju4.chrome_config ] && git clone https://github.com/juju4/ansible-chrome-config $rolesdir/juju4.chrome_config
[ ! -d $rolesdir/juju4.firefox_config ] && git clone https://github.com/juju4/ansible-firefox-config $rolesdir/juju4.firefox_config
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.harden-darwin ] && ln -s ansible-harden-darwin $rolesdir/juju4.harden-darwin
[ ! -e $rolesdir/juju4.harden_darwin ] && cp -R $rolesdir/ansible-harden-darwin $rolesdir/juju4.harden_darwin

## don't stop build on this script return code
true
