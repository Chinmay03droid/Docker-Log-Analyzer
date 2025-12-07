#!/bin/bash





LOG_DIR="/app/logs"

REPORT_ROOT="/app/reports"


# Colors

RED="\033[0;31m"

GREEN="\033[0;32m"

YELLOW="\033[1;33m"

BLUE="\033[0;34m"

NC="\033[0m"



echo -e "${BLUE}========== DOCKER LOG ANALYZER ==========${NC}"

echo -e "Timestamp: $(date)"

echo -e "Reading logs from: $LOG_DIR"

echo



for file in "$LOG_DIR"/*.log; do

    echo -e "${YELLOW}Analyzing: $(basename "$file")${NC}"

    echo "-------------------------------------"


    # Error count

    ERRORS=$(grep -i "error" "$file" | wc -l)

    echo -e "${RED}Errors   : $ERRORS${NC}"


    # Warning count

    WARNINGS=$(grep -i "warning" "$file" |wc -l)

    echo -e "${YELLOW}Warnings : $WARNINGS${NC}"


    # Info count

    INFO=$(grep -i "info" "$file" | wc -l)

    echo -e "${GREEN}Info     : $INFO${NC}"



    # Most frequent error type
TOP_ERROR=$(grep -i "error" "$file" \
        | awk -F'ERROR:' '{print $2}' \
        | sed 's/^[ \t]*//' \
        | sort \
        | uniq -c \
        | sort -nr \
        | head -1)

if [ -n "$TOP_ERROR" ]; then
    echo -e "\n${RED}Most Frequent Error:${NC}"
    echo "$TOP_ERROR"
fi



    # Largest IP hit count
TOP_IP=$(grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "$file" \
        | sort \
        | uniq -c \
        | sort -nr \
        | head -1)

if [ -n "$TOP_IP" ]; then
    echo -e "\n${BLUE}Top Offending IP:${NC}"
    echo "$TOP_IP"
fi



    # File size warning

    FILE_SIZE=$(du -h "$file" | awk '{print $1}')

    echo -e "\nLog file Size: ${YELLOW}$FILE_SIZE${NC}"


    # Health score

    TOTAL=$((ERRORS + WARNINGS + INFO))

    if [ "$TOTAL" -eq 0 ]; then TOTAL=1; fi


    SCORE=$(( 100 - (ERRORS * 7 + WARNINGS * 3) / TOTAL ))


    if [ "$SCORE" -lt 40 ]; then

        STATUS="${RED}POOR${NC}"


    elif [ "$SCORE" -lt 70 ]; then

        STATUS="${YELLOW}AVERAGE${NC}"


    else

        STATUS="${GREEN}GOOD${NC}"

    fi


    echo -e "Health Score: $SCORE% ($STATUS)"



    # Last 3 errors

    echo -e "\n${RED}Last 3 errors:${NC}"

    grep -i "error" "$file" | tail -3 || echo "No errors found."



    echo -e "\n---------------------------\n"

done


echo -e "${BLUE}Analysis complete.${NC}"
