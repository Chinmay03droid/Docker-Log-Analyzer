
#!/bin/bash

set -euo pipefail

LOG_DIR="/app/logs"
OUTPUT="/app/report.csv"

echo "Generating CSV  report ...."

echo "filename,error_count,warning_count,info_count" > "$OUTPUT"

shopt -s nullglob

files=( "$LOG_DIR"/*.log )

if [ ${#files[@]} -eq 0 ]; then
  echo "No log files found in $LOG_DIR" >&2

else
  for file in "${files[@]}"; do

  errors=$(grep -c "ERROR" "$file" || true)

  warnings=$(grep -c "WARNING" "$file" || true)

  info=$(grep -c "INFO" "$file" || true )


  echo "$(basename "$file"),$errors,$warnings,$info"  >> "$OUTPUT"
 done

fi

echo "CSV report saved to $OUTPUT"


