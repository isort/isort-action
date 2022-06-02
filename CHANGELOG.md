
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Contributing guide
- Continuous Integration test suite

### Changed

- Default to using the latest version of `isort`, if the `isortVersion` input is not specified
- Include pip install output in the log outputs instead of suppressing it.

### Fixed

- Configuration parameter parsing in run_isort
- Only attempt to pip install from a requirements file if listed in the configuration

## [0.1.0] - 2020-10-04

### Added

- Initial release
