#!/bin/bash


LOG_DIR="/app/logs"

OUTPUT="/app/report.json"



ERRORS=$(grep -i "error" $LOG_DIR/*.log | wc -l)

WARNINGS=$(grep -i "warning" $LOG_DIR/*.log | wc -l)

INFO=$(grep -i "info" $LOG_DIR/*.log | wc -l)



cat <<EOF > "$OUTPUT"

{
  "errors": $ERRORS,
  "warnings": $WARNINGS,
  "info": $INFO,
  "timestamp": "$(date)"
}

EOF


echo "Json report saved to $OUTPUT"

