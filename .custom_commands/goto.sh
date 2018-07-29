#!/bin/bash

function goto(){
    alias_file="$(echo ~)/.custom_commands/goto_alias.txt"
    subcommand=$1
    alias=$2
    dir=$3


    if [ ! -f "${alias_file}" ]; then
        echo "making alias file at ${alias_file}..."
        touch "${alias_file}"
    fi

    if [ -z "$subcommand" ]; then
        subcommand="help"
    fi

    case $subcommand in
        "make")
            make_alias "$alias" "$dir"
            ;;
        "list")
            list_alias
            ;;
        "remove")
            remove_alias "$alias"
            ;;
        "help")
            print_help
            ;;
        *)
            goto_alias "$subcommand"
    esac
}

make_alias(){
    if [ "$1" = "make" ]; then
        echo "alias name cannot be \"make\" :("
        return 1
    fi

    if [ ! -d "$2" ]; then
        echo "dir: must be a working directory"
        return 1
    fi

    echo "$1 $(pwd)/$2" >> "${alias_file}"
    echo "goto alias made!"
    return 0
}

list_alias(){
    cat "${alias_file}"
    return 0
}

remove_alias(){
    while read -r line
    do
        args=($line)
        if [ "${args[0]}" = "$1" ]; then
            sed -Ei "s@${line}@@" "${alias_file}"
            return 0
        fi
    done < "${alias_file}"

    echo "No alias found with name $1"
    return 1
}

print_help(){
    echo "usage: goto [alias]"
    echo "usage: goto make [alias] [dir]"
    echo "usage: goto list"
    echo "usage: goto remove [alias] [dir]"
    echo "usage: goto help"
    return 0
}

goto_alias(){
    while read -r line
    do
        args=($line)
        if [ "${args[0]}" = "$1" ]; then
            cd "${args[1]}"
            return 0
        fi
    done < "${alias_file}"

    echo "No alias found with that name"
    return 1
}