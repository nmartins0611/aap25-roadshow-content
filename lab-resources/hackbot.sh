#!/bin/bash

# Colors for robot-like appearance
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

# Check if CONTROLLER_URL is set
if [ -z "$CONTROLLER_URL" ]; then
    echo -e "${RED}🤖 ERROR: The environment variable CONTROLLER_URL is not set. Please set it before running this script.${RESET}"
    echo "Example: export CONTROLLER_URL=https://api.example.com"
    exit 1
fi

# Robot greeting
echo -e "${CYAN}🤖 Hello, Human! I am your friendly robot assistant. Ready to execute your commands via API!${RESET}"

# Display menu
function show_menu() {
    echo -e "${GREEN}"
    echo "1. Fetch weather information"
    echo "2. Retrieve user data"
    echo "3. Get system status"
    echo "4. Send a notification"
    echo "5. Exit"
    echo -e "${RESET}"
}

# Perform action based on user choice
function perform_action() {
    case $1 in
        1)
            echo -e "${CYAN}🤖 Sending POST request to Weather API...${RESET}"
            curl -k -X POST "$CONTROLLER_URL/api/controller/v2/job_templates/14/launch" -H "Content-Type: application/json"'
            ;;
        2)
            echo -e "${CYAN}🤖 Sending POST request to User Data API...${RESET}"
            curl -k -X POST "$CONTROLLER_URL/api/controller/v2/job_templates/10/launch" -H "Content-Type: application/json"'
            ;;
        3)
            echo -e "${CYAN}🤖 Sending POST request to System Status API...${RESET}"
            curl -k -X POST "$CONTROLLER_URL/api/controller/v2/job_templates/14/launch" -H "Content-Type: application/json"'
            ;;
        4)
            echo -e "${CYAN}🤖 Sending POST request to Notification API...${RESET}"
            curl -k -X POST "$CONTROLLER_URL/api/controller/v2/job_templates/14/launch" -H "Content-Type: application/json"'
            ;;
        5)
            echo -e "${RED}🤖 Shutting down... Goodbye, Human!${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}🤖 Invalid choice. Please select a valid option.${RESET}"
            ;;
    esac
}

# Main loop
while true; do
    show_menu
    echo -n -e "${CYAN}🤖 What would you like me to do? Enter your choice: ${RESET}"
    read choice
    perform_action $choice
    echo -e "${CYAN}🤖 Task complete!${RESET}"
    echo ""
done