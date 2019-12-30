#!/bin/bash
# Set up some functionality and aliases to make todo.txt work
# better with local directories, while still maintaining a 
# global todo list as well.

function todo {
    cfg_file=""
    global=""
    if [[ "${1}" == 'clean' ]] ; then
        clean_todo_local
        return
    fi
    if [[ "${1}" == 'create' ]] || [[ "${1}" == "local" ]] ; then
        touch todo.txt
        shift
    elif [[ "${1}" == 'global' ]] ; then
        global="true"
        shift
    fi
    if [[ ${1:0:3} == 'bug' ]] ; then
        shift
        cfg_file="-d${HOME}/.todo/bugs.config"
    fi

    if [ -f "todo.txt" ] && [ -z "${cfg_file}" ] ; then
        cfg_file="-d${HOME}/.todo/local.config"
    fi
    if [ -n "${global}" ] ; then
        cfg_file=""
    fi
    
    if [ -z "${cfg_file}" ] ; then
        todo.sh "${@:-list}"
    else
        todo.sh "${cfg_file}" "${@:-list}"
    fi
}
export -f todo

function clean_todo_local {
    echo "Removing empty todo files."
    for _f in todo.txt bugs.txt .todo.done .todo.report .bugs.done .bugs.report ; do
        if [ -f "${_f}" ] ; then
            grep -q '[^[:space:]]' < "${_f}" || rm "${_f}"
        fi
    done
}
export -f clean_todo_local

# Now create some aliases for speed:
alias t="todo"
alias tl="todo list"
alias tc="todo add"
alias ta="todo add"
alias tam="todo addm"
alias g="todo global"
alias b="todo bug"
alias tdone="todo do"
