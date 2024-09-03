#!/bin/bash

function get_info() {
    cd $1

    TOTAL_FOLDERS=$(find $1 -type d 2>/dev/null | wc -l)
    TOP5_FOLDERS=$(find $1 -type d -exec du -h {} +  2>/dev/null | sort -hr | head -5 | awk 'BEGIN { i = 1 }{ printf "%d - %s, %s\n", i, $2, $1; ++i }')
    TOTAL_FILES=$(find . -type f 2>/dev/null | wc -l)
    CONFIG_FILES=$(find . -type f -name "*.conf" 2>/dev/null | wc -l)
    TEXT_FILES=$(find . -type f -name "*.txt" 2>/dev/null | wc -l)
    EXEC_FILES=$(find . -type f -executable 2>/dev/null | wc -l)
    LOG_FILES=$(find . -type f -name "*.log" 2>/dev/null | wc -l)
    ARCHIVE_FILES=$(find . -type f \( -name "*.zip" -o -name "*.tar.gz" \) 2>/dev/null | wc -l)                                 
    SYSLINK_FILES=$(find . -type l 2>/dev/null | wc -l)                 
    TOP10_FILES=$(find $1 -type f -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk 'BEGIN { i = 1 }{ split($2, a, "."); printf "%d - %s, %s, %s\n", i, $2, $1, a[length(a)]; ++i }') 
    TOP10_FILES_WITH_HASH=$(find $1 -type f -executable -exec du -sh {} 2>/dev/null + | sort -rh | head -n 10 | 
        awk '{ cmd = ("md5sum " $2 " ")
            while ( ( cmd | getline result ) > 0 ) { 
                $2 = result
            }
            close(cmd);
            }
        {
            split($2,arr," ");
            printf "%d - %s, %s, %s\n", NR, arr[2], $1, arr[1]
        }')
        
    echo -e "Total number of folders (including all nested ones) = $TOTAL_FOLDERS"
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    echo -e "$TOP5_FOLDERS"
    echo -e "Total number of files = $TOTAL_FILES"
    echo "Number of: "
    echo "Configuration files (with the .conf extension) = $CONFIG_FILES"
    echo "Text files = $TEXT_FILES"
    echo "Executable files = $EXEC_FILES"
    echo "Log files (with the extension .log) = $LOG_FILES"
    echo "Archive files = $ARCHIVE_FILES"
    echo "Symbolic links = $SYSLINK_FILES"
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    echo "$TOP10_FILES"
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    echo "$TOP10_FILES_WITH_HASH"
}