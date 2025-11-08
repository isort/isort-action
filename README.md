# isort Github Action

This action runs isort on a Python repository.

It requires that the [`checkout`][github-checkout] action be used first.

## Inputs

### `isort-version`

Optional. Version of `isort` to use. Defaults to latest version of `isort`.

### `sort-paths`

Optional. List of paths to sort, relative to your project root. Defaults to `.`

### `configuration`

Optional. `isort` configuration options to pass to the `isort` CLI. Defaults to `--check-only --diff`.

### `requirements-files`

Optional. Paths to python requirements files to install before running isort.
If multiple requirements files are provided, they should be separated by a space.
If custom package installation is required, dependencies should be installed in a separate step before using this action.

### `output-file`

Optional. Path to write isort output to a file instead of stdout.
Useful for keeping GitHub Actions logs clean when using `--diff` or `--check-only`.
The output file is written relative to the repository root.
If specified, the isort output will be saved to this file without appearing in the job log.

## Outputs

### `isort-result`

Output of the `isort` CLI.

## Example usage

### Basic usage

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

### With output file (to keep logs clean)

```yaml
name: Run isort with file output
on:
  - push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: isort/isort-action@v1
        with:
            output-file: "isort-output.txt"
      - uses: actions/upload-artifact@v4
        if: always()
        with:
            name: isort-output
            path: isort-output.txt
```

## Developing

Before starting on a new feature, please review the [contributing guide][contributors-guide].

All PRs must pass the CI pipeline to be merged.
To validate your code, you may run the test suite locally using `docker compose`.
The full test suite can be run via `docker compose run --rm lint`, which will auto-format the code
or add the `--check-only` flag to exit without formatting code.

[contributors-guide]: CONTRIBUTING.md
[github-checkout]: https://github.com/actions/checkout
