#!/bin/bash


LOG_DIR="/app/logs"

OUTPUT="/app/report.html"



ERRORS=$(grep -i "error" $LOG_DIR/*.log | wc -l)

WARNINGS=$(grep -i "warning" $LOG_DIR/*.log | wc -l)

INFO=$(grep -i "info" $LOG_DIR/*.log | wc -l)



cat <<EOF > "$OUTPUT"
<html>
<head><title>Log Report</title></head>
<body>
<h1>Docker Log Analyzer Report</h1>
<p><b>Errors:</b> $ERRORS</p>
<p><b>Info:</b> $INFO</p>
<p><i>Generated on $(date)</i></p>
</body>
</html>
EOF


echo "HTML report saved to $OUTPUT"

