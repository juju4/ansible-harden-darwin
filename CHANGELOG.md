# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Github Action
- Support for 10.15

### Changed
- lint

### Removed
- Travis-ci

## [1.1.0] - 2019-07-18

### Changed
- update software and hashes in testing suites

## [1.0.0] - 2020-02-23

### Changed
- Travis: use ansible.git@devel - global to include ansible#PR57605 (temporary, 2.8.2 NOK)
- Github: rename tags to match semantic versioning: 0.7.0, 0.8.0
- more linting

## [0.9.0] - 2019-02-17

### Changed
- Heavy lint following galaxy new rules following adoption of ansible-lint
https://groups.google.com/forum/#!topic/ansible-project/ehrb6AEptzA
https://docs.ansible.com/ansible-lint/rules/default_rules.html
https://github.com/ansible/ansible-lint
- add gitignore

## [v0.8] - 2018-06-02

### Added
- testing: add speculative execution check
- travis: TLS/openssl state that might affect ansible play
- testing: privilege escalation
- Objective-See tools: Lulu, BlockBlock...

### Changed
- update santa to 0.9.24
- update osquery to 2.9.0
- review certificates trust

## [v0.7] - 2017-01-30

### Added
- Initial commit on Github, include simple travis, kitchen and vagrant tests
