#!/usr/bin/env bash

# Web Page of BASH best practices https://kvz.io/blog/2013/11/21/bash-best-practices/
#Exit when a command fails.
set -o errexit
#Exit when script tries to use undeclared variables.
set -o nounset
#The exit status of the last command that threw a non-zero exit code is returned.
set -o pipefail

#Trace what gets executed. Useful for debugging.
#set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename "${__file}" .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)"

VERSION="1.0.0"
BINARY_NAME=shellcheck

SRC_FOLDER="src"

function usage(){
    echo -e "-h | --help: display help."
    echo -e "-o | --only: the name of the file or folder to test."
}

function execute(){
    shopt -s dotglob
    for SINGLE_FILE in "${1}"/*
    do
        echo "Checking ${SINGLE_FILE}..."
        if [ -d "${SINGLE_FILE}" ]; then
            execute "${SINGLE_FILE}"
        else
            if [[ "$SINGLE_FILE" == *".sh" ]];then
                eval "$BINARY_NAME $SINGLE_FILE"
            fi
        fi
    done
}

while [ "${1+x}" != "" ]; do
    PARAM=$(echo "$1" | awk -F= '{print $1}')
    VALUE=$(echo "$1" | awk -F= '{print $2}')
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        -o | --only)
            SRC_FOLDER=$VALUE
            ;;
        -v | --version)
            echo $VERSION
            exit
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

echo "Script name: ${__base}"
echo "Executing at ${__root}"

if ! type "${BINARY_NAME}" &> /dev/null; then
    echo "ERROR: ${BINARY_NAME} is not installed. Install it and then re launch"
    exit 1
fi

if [ -f "${SRC_FOLDER}" ]; then
    eval "$BINARY_NAME ${SRC_FOLDER}"
else
    execute "${SRC_FOLDER}"
fi
