#!/bin/bash


mode="$1"


case "$mode" in

    json)

        bash /app/json_export.sh

        ;;

    html)

        bash /app/html_export.sh

        ;;

    csv)

        bash /app/csv_export.sh

        ;;

    *)


        # Default mode -> your analyzer

        bash /app/analyzer.sh

        ;;


esac
