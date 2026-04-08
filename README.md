# 🐳 Docker Log Analyzer

A DevOps-focused log analysis tool that automatically parses server logs, generates health scores, and exports detailed reports — all packaged in Docker.

## 🚀 What It Does

- ✅ Parses `.log` files for **Errors, Warnings, and Info** events
- ✅ Calculates a **System Health Score** (0-100%)
- ✅ Detects **most frequent error types**
- ✅ Identifies **top offending IP addresses**
- ✅ Exports reports in **JSON, HTML, and CSV** formats
- ✅ Colorized CLI output for easy readability
- ✅ Fully containerized with **Docker & Docker Compose**
- ✅ CI/CD ready with **GitHub Actions**

## 🛠️ Tech Stack

- Bash Scripting
- Docker & Docker Compose
- GitHub Actions (CI/CD)
- Linux

## 📦 Project Structure

\`\`\`
Docker-Log-Analyzer/
├── Dockerfile
├── docker-compose.yml
├── .github/
│   └── workflows/       # GitHub Actions CI/CD
└── app/
    ├── analyzer.sh       # Core log analysis engine
    ├── export_json.sh    # JSON report generator
    ├── export_html.sh    # HTML report generator
    ├── export_csv.sh     # CSV report generator
    ├── run_all.sh        # Master script - runs everything
    ├── entrypoint.sh     # Docker entrypoint
    └── logs/
        └── sample.log    # Sample log file for testing
\`\`\`

## ⚡ Quick Start

### Using Docker Compose (Recommended)
\`\`\`bash
git clone https://github.com/Chinmay03droid/Docker-Log-Analyzer.git
cd Docker-Log-Analyzer
docker-compose up
\`\`\`

### Using Docker directly
\`\`\`bash
docker build -t docker-log-analyzer .
docker run docker-log-analyzer
\`\`\`

## 📊 Sample Output

\`\`\`
========== DOCKER LOG ANALYZER ==========
Timestamp: Wed Apr 8 2026
Reading logs from: /app/logs

Analyzing: sample.log
-------------------------------------
Errors   : 2
Warnings : 1
Info     : 2

Most Frequent Error: Failed to connect to database
Log file Size: 4.0K
Health Score: 72% (GOOD)
\`\`\`

## 📁 Generated Reports

After running, the following reports are created:
- `report.json` — Machine-readable JSON report
- `report.html` — Visual HTML report for browsers
- `report.csv`  — Spreadsheet-compatible CSV report

## 🔁 CI/CD Pipeline

This project includes a GitHub Actions workflow that automatically builds and tests the Docker image on every push.

## 👨‍💻 Author

**Chinmay** — Aspiring DevOps Engineer  
[GitHub](https://github.com/Chinmay03droid)
