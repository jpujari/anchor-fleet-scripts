#!/bin/bash

usage() { echo "Usage: $0 [-r <Release Id>] [-e <Environment>]" 1>&2; exit 1; }

while getopts ":r:e:" o; do
    case "${o}" in
        r)
            r=${OPTARG}
            ;;
        e)
            e=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${r}" ]; then
    usage
fi

if [ -z "${e}" ]; then
   e="prod"
fi

ssh -i ~/.ssh/OYOaf-jp -oStrictHostKeyChecking=no deploy@adminssh.$r.$e.oyo.f.nchr.io


