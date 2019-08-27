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

echo "Script name: ${__base}"
echo "Executing at ${__root}"

BINARY_NAME=zip

if [ -z "${SRC_FOLDER+x}" ]; then
    SRC_FOLDER="src"
else
    echo "SRC_FOLDER provided: ${SRC_FOLDER}."
fi

if [ -z "${TARGET_FOLDER+x}" ]; then
    TARGET_FOLDER="public"
else
    echo "TARGET_FOLDER provided: ${TARGET_FOLDER}."
fi

if [ -z "${TARGET_FILE+x}" ]; then
    TARGET_FILE="scripts.zip"
else
    echo "TARGET_FILE provided: ${TARGET_FILE}"
fi

TARGET_PATH="${TARGET_FOLDER}/${TARGET_FILE}"

function usage(){
    echo -e "-h | --help: display help."
    echo -e "-o | --only: the name of the file or folder to zip."
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
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

if ! type "${BINARY_NAME}" &> /dev/null; then
    echo "ERROR: ${BINARY_NAME} is not installed. Install it and then re launch"
    exit 1
fi

if [ ! -d "${TARGET_FOLDER}" ]; then
    mkdir -p "${TARGET_FOLDER}"
fi

FILES=""
if [ -f "${SRC_FOLDER}" ]; then
    FILES="${SRC_FOLDER}"
else
    shopt -s dotglob
    for SINGLE_FILE in "${SRC_FOLDER}"/*
    do
        FILES="${FILES} $SINGLE_FILE"
    done
fi

eval "$BINARY_NAME ${TARGET_PATH} ${FILES}"
