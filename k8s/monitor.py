import sys
import os

LOG_FILE = os.getenv("LOG_FILE", "/var/log/dpkg.log")

if len(sys.argv) < 2 and "THRESHOLD" not in os.environ:
    print("Ysage: python monitor.py <threshold_percentage>")
    sys.exit(1)

THRESHOLD = float(os.getenv("THRESHOLD", sys.argv[1]))

error_count = 0
total_lines = 0

with open(LOG_FILE, "r") as file:
    for line in file:
        total_lines += 1
        if "ERROR" in line.upper():
            error_count += 1

if total_lines == 0:
  print("No log data found.")
  exit(0)

error_percentage = (error_count / total_lines) * 100

print("Log Analysis Report")
print("-------------------")
print(f"Total lines processed: {total_lines}")
print(f"Total ERROR lines: {error_count}")
print(f"Percentage of ERROR lines: {error_percentage:.2f}%")
print(f"Threshold     : {THRESHOLD}%")


if error_percentage >= THRESHOLD:
    print("ALERT: Error rate has exceeded the threshold! 🚨")
    sys.exit(1)
else:
    print("Status OK ✅")
    sys.exit(0)
