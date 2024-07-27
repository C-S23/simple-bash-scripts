#!/bin/bash

# Function to safely read a file
safe_cat() {
    if [ -f "$1" ]; then
        cat "$1"
    else
        echo "N/A"
    fi
}

# Gather battery information
status=$(safe_cat /sys/class/power_supply/BAT0/status)
capacity=$(safe_cat /sys/class/power_supply/BAT0/capacity)
health=$(safe_cat /sys/class/power_supply/BAT0/health)
manufacturer=$(safe_cat /sys/class/power_supply/BAT0/manufacturer)
model_name=$(safe_cat /sys/class/power_supply/BAT0/model_name)
serial_number=$(safe_cat /sys/class/power_supply/BAT0/serial_number)
voltage_now=$(safe_cat /sys/class/power_supply/BAT0/voltage_now)
current_now=$(safe_cat /sys/class/power_supply/BAT0/current_now)
power_now=$(safe_cat /sys/class/power_supply/BAT0/power_now)

# Create HTML report
cat <<EOF > battery_report.html
<!DOCTYPE html>
<html>
<head>
    <title>Battery Report</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { width: 50%; border-collapse: collapse; margin: 25px 0; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Battery Report</h1>
    <table>
        <tr><th>Attribute</th><th>Value</th></tr>
        <tr><td>Status</td><td>${status}</td></tr>
        <tr><td>Capacity</td><td>${capacity}%</td></tr>
        <tr><td>Health</td><td>${health}</td></tr>
        <tr><td>Manufacturer</td><td>${manufacturer}</td></tr>
        <tr><td>Model Name</td><td>${model_name}</td></tr>
        <tr><td>Serial Number</td><td>${serial_number}</td></tr>
        <tr><td>Voltage Now</td><td>${voltage_now} µV</td></tr>
        <tr><td>Current Now</td><td>${current_now} µA</td></tr>
        <tr><td>Power Now</td><td>${power_now} µW</td></tr>
    </table>
</body>
</html>
EOF

echo "Battery report generated: battery_report.html"


