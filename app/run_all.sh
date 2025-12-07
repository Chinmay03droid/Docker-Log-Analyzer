# ===== COLORS =====
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
MAGENTA="\e[35m"
RESET="\e[0m"

#!/bin/bash


echo "=== Running Full Log Analysis Suite ==="



bash /app/analyzer.sh

echo


bash /app/export_json.sh

echo


bash /app/export_html.sh

echo


bash /app/export_csv.sh

echo



echo "=== All reports are generated successfully ==="

echo "JSON:  /app/report.json"

echo "HTML:  /app/report.html"

echo "CSV:   /app/report.csv"

