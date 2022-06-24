ls -1 recipes/* | xargs -L1  awk '
{ if (NR == 1) print $0"%"FILENAME }
' | sort | sed -e 's/^# */- \[/' -e 's/%/\](/' -e 's/$/)/'
