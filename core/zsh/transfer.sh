# aliases

# functions
transfer() {
    # credits: https://gist.github.com/nl5887/a511f172d3fb3cd0e42d#gistcomment-2628750
    # check arguments
    if [ $# -eq 0 ]; then
        echo "No arguments specified." >&2
        echo "Usage:" >&2
        echo "  transfer <file|directory>" >&2
        echo "  ... | transfer <file_name>" >&2
        return 1
    fi

    # upload stdin or file
    if tty -s; then
        file="$1"
        if [ ! -e "$file" ]; then
            echo "$file: No such file or directory" >&2
            return 1
        fi

        file_name=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

        # upload file or directory
        if [ -d "$file" ]; then
            # transfer directory
            file_name="$file_name.zip"
            download_link=$((cd "$file" && zip -r -q - .) | curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null)
            echo "${download_link}"
        else
            # transfer file
            download_link=$(cat "$file" | curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null)
            echo "${download_link}"
        fi
    else
        # transfer pipe
        file_name=$1
        download_link=$(curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null)
        echo "${download_link}"
    fi
}