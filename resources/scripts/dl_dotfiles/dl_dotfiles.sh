: " My Configs & Dotfiles repository friendly utility script

- WIP
- Author : Asura
- Created date: 2022-02-09 2123H
- Modified:
    [0] 2022-02-09 2123H, Asura
    [1] 2022-02-20 0947H, Asura

#========
# Steps
#========
1. Download 'table of contents' file => containing all dotfiles/configs in the repository
2. Read 'table of contents' file into Associative Array (declare -A) => Key : File Name, Value : Path to store dotfiles
3. Loop through associative array and download all files from remote repository (URL = raw.githubusercontent.com/path/to/repository/[file_name])
4. Copy all files into their respective directories (value of associative array)
5. Sanitize => Delete script
"

dl_github_raw()
{
    : "
        1. Download 'Table of Contents' file
    "
    author="$1"
    repository="$2"
    branch="$3"
    fpath="$4"
    argv="$@"
    url="https://raw.githubusercontent.com/$author/$repository/$branch/$fpath"
    curl -L -O $url $argv

    echo "$?" # Return the exit code
}

read_file()
{
    : "
        2. Read in File and Process
    "
    fname="$1"
    declare -A toc=$2

    if [[ -f "$fname" ]]; then
        # If File Exists - Read in file
        while IFS== read -r key value; do
            toc[$key]=$value
        done < "$fname"     # 'while ... do... done < $fname' to read in file
    fi
}


main()
{
    echo "Hello World"

    # 1. Download 'table of contents' file
    ret_code=`dl_github_raw "Thanatisia" "my_dotfiles" "main" "./table_of_contents.txt"`

    if [[ $ret_code -eq 0 ]]; then
        # If Return Code is 0 (Success)
        declare -A toc={}

        # 2. Read in Table of Contents File and Process into an Associative Array
        read_file "table_of_contents.txt" $toc

        # 3. Loop Associative Array and 
        # - Download all files in [key]
        for dotfile in "${!toc[@]}"; do
            target_loc="${toc[$dotfile]}"
            ret_code=`dl_github_raw "Thanatisia" "my_dotfiles" "main" "./$dotfile"`

            if [[ $ret_code -eq 0 ]]; then
                # Success
                # 4. Copy File to [value]
                cp $dotfile $target_loc
            fi
        done
    fi

    # 5. Sanitize
    rm $0   # Delete itself
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    : "
        Equivalent to 'if_main'
    "
    main "$@"
fi
