# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2022-11-04

- All inputs changed to use kebab-case: `isort-version`, `sort-paths`, and
  `requirements-files`. The old camelCase arguments will continue to work for
  backward compatibility.
- [Internal] Usage of `set-output` updated to reflect [deprecation](https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/)

## [1.0.0] - 2022-06-01

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
