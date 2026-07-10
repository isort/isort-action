# isort Github Action

This action runs isort on a Python repository.

It requires that the [`checkout`][github-checkout] action be used first.

## Inputs

### `isort-version`

Optional. Version of `isort` to use. Defaults to latest version of `isort`.

A bare version is pinned exactly, so `isort-version: 5.12.0` installs `isort==5.12.0`.
Alternatively, any value beginning with a [version specifier][version-specifiers]
is passed to `pip` as written:

```yaml
- uses: isort/isort-action@v1
  with:
    # Upgrade to 8.0.1 or 8.1.0, but not 9.0.0
    isort-version: "~=8.0"
```

```yaml
- uses: isort/isort-action@v1
  with:
    isort-version: ">=7,<8"
```

### `sort-paths`

Optional. List of paths to sort, relative to your project root. Defaults to `.`

### `configuration`

Optional. `isort` configuration options to pass to the `isort` CLI. Defaults to `--check-only --diff`.

### `requirements-files`

Optional. Paths to python requirements files to install before running isort.
If multiple requirements files are provided, they should be separated by a space.
If custom package installation is required, dependencies should be installed in a separate step before using this action.

## Outputs

### `isort-result`

Output of the `isort` CLI.

## Example usage

```yaml
name: Run isort
on:
  - push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: isort/isort-action@v1
        with:
            requirements-files: "requirements.txt requirements-test.txt"
```

## Developing

Before starting on a new feature, please review the [contributing guide][contributors-guide].

All PRs must pass the CI pipeline to be merged.
To validate your code, you may run the test suite locally using `docker compose`.
The full test suite can be run via `docker compose run --rm lint`, which will auto-format the code
or add the `--check-only` flag to exit without formatting code.

[contributors-guide]: CONTRIBUTING.md
[github-checkout]: https://github.com/actions/checkout
[version-specifiers]: https://packaging.python.org/en/latest/specifications/version-specifiers/#id5
