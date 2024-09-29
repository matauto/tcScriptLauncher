#!/bin/sh

#----------------------------------------------
#Author: Mateusz O.
#Description:
#   close all aps for tcScriptLauncher
#Date: 28 September 2024
#----------------------------------------------

#global variables
#script_dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

print_help(){
    #EOF makes that cat will print  until next EOF
    cat<<EOF
    close_apps.sh [-h]
    close all apps for tcScriptLauncher
    options:
        -h              print help
EOF
    exit 0
}

#parsing parameters
#here getopts approach is used, because it is built in
parse_param(){
    while getopts ":h:" options; do
        case $options in
            h)
                print_help
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
            :)
                echo "Option -$OPTARG need argument." >&2
                exit 1
                ;;
        esac
    done
}

main(){
    parse_param "$@"

    kill $(ps -e | grep mplayer | awk '{print $1}')
}

#invoke main function
main "$@"
