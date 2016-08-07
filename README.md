[![Build Status](https://travis-ci.org/juju4/ansible-harden-darwin.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden-darwin)
# Darwin harden ansible role

Ansible role to harden darwin/osx system.

Pay attention to test carefully role and fit to your context unless you want to lock yourself.
This role is continuous work in progress as security landscape is constantly evolving.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0

### Operating systems

Target OSX: 10.10, 10.11

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - harden-darwin
```

Run
```
$ ansible-playbook -i inventory --limit linux osx.yml
```

## Variables

```
...
```

## Continuous integration

This role has a travis basic test (for github).

## Troubleshooting & Known issues

N/A

## License

BSD 2-clause

