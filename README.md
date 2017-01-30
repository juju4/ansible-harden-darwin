[![Build Status - Master](https://travis-ci.org/juju4/ansible-harden-darwin.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden-darwin)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-harden-darwin.svg?branch=devel)](https://travis-ci.org/juju4/ansible-harden-darwin/branches)
# Darwin harden ansible role

Ansible role to harden darwin/macosx system.

Pay attention to test carefully role and fit to your context unless you want to lock yourself.
This role is continuous work in progress as security landscape is constantly evolving.

Legal disclaimer!
Depending on settings, very detailed activity log can be created.
Only apply to your own system else for most countries (ex: Europe), user must have been warned and agreed (usually through internal policy, code of conduct...)
Whitelisting and certificates trust removal are part of most impacting tasks.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0
 * 2.2

### Operating systems

Target MacOS X: 10.10, 10.11, 10.12
Xcode & cli developer tools might be required for some tools (ex: osxlockdown)

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.harden-darwin
```

Run
```
## if ssh key is set
$ ansible-playbook -i inventory --limit mymac mac.yml
## else
$ ansible-playbook -i inventory --limit mymac mac.yml --ask-pass --ask-sudo-pass
```
ssh must be enabled (Remote Login in Preferences > Sharing)

## Variables

See defaults/main.yml file for complete set
```
harden_use_forwarding: false
harden_umask: '022'
harden_init_aidedb: false
harden_unix_fstab_flags: false

## Application firewall
harden_darwin_disable_firewall: false
harden_darwin_firewall_allow_signedapps: false
harden_darwin_firewall_blockall_apps_in: true
harden_darwin_fw_program_allowed_in:
  - /opt/local/sbin/nrpe
  - /Library/PreferencePanes/DNSCrypt.prefPane/Contents/Resources/usr/sbin/dnscrypt-proxy
  - /Library/PreferencePanes/DNSCrypt.prefPane/Contents/Resources/usr/bin/hostip
harden_darwin_fw_program_blocked_in:
  - /bin/sh
  - /usr/bin/perl
  - /usr/bin/python
  - /usr/bin/curl
  - /usr/bin/nc
  - /usr/sbin/httpd

#harden_darwin_user: 'myuser'
harden_darwin_disable_bluetooth: true
harden_darwin_disable_wpad: true
harden_darwin_disable_airdrop: true
harden_darwin_disable_iclouddrive: true
harden_darwin_disable_captiveportal: true

harden_darwin_dnscrypt: true

harden_darwin_ransomwhere: false
harden_darwin_fixmacosleak: false
harden_darwin_osquery: true

## Audit Tools
harden_darwin_osxlockdown: 'audit'
#harden_darwin_osxlockdown: 'run'
harden_darwin_osxconfigcheck: true

## install google santa
harden_darwin_santa: true
#cat /var/log/santa.log | awk -F'|' '/path=/ { gsub(/path=/, "", $5); print $5 }'| sort | uniq -c | sort -nr | head -10
#decision ALLOW, DISKAPPEAR/DISKDISAPPEAR (usb/dmg)
harden_darwin_santa_whitelist_cert:
  - /bin/sh
  - /usr/bin/ssh
  - /opt/X11/bin/xauth
  - /System/Library/Frameworks/Python.framework/Versions/2.7/Resources/Python.app/Contents/MacOS/Python
  - /Applications/Firefox.app
  - /Applications/Google\ Chrome.app
  - /Applications/VirtualBox.app/Contents/MacOS/VirtualBox
  - /usr/local/bin/osqueryd

harden_darwin_santa_whitelist_hash: []

```

## Continuous integration

This role has a travis basic test (for github).

## Troubleshooting & Known issues

Sometimes, ansible failed with following error. Temporary workaround, re-execute or try local playbook execution.
* ```failed to create temporary content file: ('The read operation timed out',)```
https://github.com/ansible/ansible/issues/7606
https://github.com/ansible/ansible/issues/18894

* ```Timeout (12s) waiting for privilege escalation prompt```
https://github.com/ansible/ansible/issues/14426
https://github.com/ansible/ansible/issues/13278

* Enabling Santa Lockdown mode have serious impact that you should consider carefully.
Any tasks using ephemeral non-signed binary will probably be blocked like Macports selfupdate, most probably homebrew.
There is no on-execution allow button.
Scripts are whitelisted/blacklisted depending on interpreters and used executables permissions. If you allow python, you allow all python scripts unless it uses a blacklisted binary.
Another limitation, pkg file (XAR Archive) are also 'Whitelisted (Scope)' even if not code-signed.

## License

BSD 2-clause

