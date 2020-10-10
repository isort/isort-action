#!/usr/bin/env bash
set -euo pipefail

programname=$0

function usage() {
    echo "usage: $programname [OPTIONS]"
    echo "  -c  --check-only      Exit with error if linting fails"
    echo "  -h  --help            Print this message and exit"
    exit 1
}

declare -a SHFMT_ARGS=("-w")
declare -a SHELLCHECK_ARGS=("-x")

while [ $# -ne 0 ]; do
    arg="$1"
    case "$arg" in
        -c | --check-only)
            SHFMT_ARGS=("-d")
            ;;
        -h | --help)
            usage
            ;;
        *)
            usage
            ;;
    esac
    shift
done

SHFMT_ARGS+=("-s" "-i" "4" "-ci" "-sr")

echo "Running shfmt..."
shfmt -f . | xargs shfmt "${SHFMT_ARGS[@]}"

echo "Running shellcheck..."
shfmt -f . | xargs shellcheck "${SHELLCHECK_ARGS[@]}"

echo "Running yamllint..."
yamllint -c /.yamllint .
