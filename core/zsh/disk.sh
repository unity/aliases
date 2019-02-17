# aliases

# functions
ndu() {
    if [[ -z "$1" ]]; then
        ncdu -x $(pwd)
    else
        ncdu -x $1
    fi
}