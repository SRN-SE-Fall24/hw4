echo "dataset1/file*" | xargs -i sh -c '(grep -c "sample" {} | grep -E ":([1-9][0-9]*)$") && (grep -o "CSC510" {} | uniq -c | sed "s/^[ \t]*//" | cut -d: -f1 | sed "s/\(.*\) \(.*\)/\2:\1/" | grep -E ":([3-9]|[1-9][0-9]+)$") && (wc -c --total=never {} | sed "s/^[ \t]*//" | sed "s/\(.*\) \(.*\)/\2:\1/")' | awk -F':' '{arr[$1] = arr[$1] ? arr[$1] " " $2 : $2} END {for (key in arr) print key, arr[key]}' | awk 'NF == 4' | sort -k3,3nr -k4,4nr | cut -d ' ' -f1 | sed 's/file/filtered/'