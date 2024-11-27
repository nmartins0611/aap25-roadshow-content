#!/bin/bash

export CONTROLLER_URL="https://$HOSTNAME.$_SANDBOX_ID.instruqt.io/api/controller"
echo $CONTROLLER_URL

# Colors for robot-like appearance
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

# # Check if CONTROLLER_URL is set
if [ -z "$CONTROLLER_URL" ]; then
    echo -e "${RED}🤖 ERROR: The environment variable CONTROLLER_URL is not set. Please set it before running this script.${RESET}"
    echo "Example: export CONTROLLER_URL=https://api.example.com"
    exit 1
fi

echo -n -e "${CYAN}🤖 Hello! i am your co-worker simulator S.E.A.N - Please provide your authorization token: ${RESET}"
read -s AUTH_TOKEN
echo -e "\n${CYAN}🤖 Token received. Preparing to execute commands.${RESET}"


# Display menu
function show_menu() {
    echo -e " 
 +++++++++++++++++++++++++++++++#+++++++++++++++++++++++++++++++++++++ 
 +++++++++++++++++++++++++#+#########+###+++++++++++++++++++++++++++++ 
 +++++++++++++++++++++########+#+#############++++++++++++++++++++++++ 
 ++++++++++++++++++++#######################+###++++++++++++++++++++++ 
 ++++++++++++++++++####################++++#+####+++++++++++++++++++++ 
 ++++++++++++++++#####++#############++++++++#####++++++++++++++++++++ 
 ++++++++++++++++####+++++++++++------------++####++++++++++++++++++++ 
 +++++++++++++++####++------------------------++++#+++++++++++++++++++ 
 +++++++++++++++###+++------------------------+++##+++++++++++++++++++ 
 +++++++++++++++###++++-----------------------+##+#+++++++++++++++++++ 
 +++++++++++++++####+++-----------------------+##+#+++++++++++++++++++ 
 ++++++++++++++++###++------------------------+###++++++++++++++++++++ 
 ++++++++++++++++##++++++++++++----++##++++++--+++++++++++++++++++++++ 
 ++++++++++++++++##++++++#####++--++#+####+++---++-++-++++++++++++++++ 
 +++++++++++++++++++++++++++++++---+++-++-------++--+-++++++++++++++++ 
 ++++++++++++++++-+++---------++-----------------++---++++++++++++++++ 
 ++++++++++++++++-+++---------++------------------+--+++++++++++++++++ 
 ++++++++++++++++-++--------+-+------+--------------++++++++++++++++++ 
 +++++++++++++++++-++++--+++++++--++++++++---------+++++++++++++++++++ 
 +++++++++++++++++++++++++++++++#++++--+++++++-----+++++++++++++++++++ 
 +++++++++++++++++++++++++++++++++++--++++++++-+++++++++++++++++++++++ 
 ++++++++++++++++++++++--+++#+++++-++-++----+-++++++++++++++++++++++++ 
 +++++++++++++++++++++++----++++-------------+++++++++++++++++++++++++ 
 ++++++++++++++++++++++++----++------------++++---++++++++++++++++++++ 
 +++++++++++++++++++++++++---+++++++------+++++----+++++++++++++++++++ 
 +++++++++++++++++++++++++++-------------+++++-------+++++++++++++++++ 
 +++++++++++++++++++++++++++++---------++++++---------++++++++++++++++ 
 ++++++++++++++++++++++-++++++++++++++++++++-------------+++++++++++++ 
 +++++++++++++++++-----+#+++++++++++++++++++----------------++++++++++ 
 +++++++++++-----------+#++++++++++++++++++---------------------++++++ 
 +++++++--------------++#+++++++++++++++++-------------------------+++ 
 ++++-----------------++#++++++++++--+++------------------------------ 
 ++----------------+#+-+++++++---------------------------------------- 
 +----------------+##+--++++++---------------------------------------- 
                                                                       "
    echo -e "${GREEN}"
    echo "1. Simulate the faulty Web Change"
    echo "2. Reset Web Application Config"
    echo "3. Break the network!"
    echo "4. Patch in a new device"
    echo "5. Exit"
    echo -e "${RESET}"
}

# Perform action based on user choice
function perform_action() {
    case $1 in
        1)
            echo -e "${CYAN}🤖 Sending POST request to AAP API...${RESET}"
            sleep 5
            curl -k -X POST "$CONTROLLER_URL/v2/job_templates/15/launch" -H "Content-Type: application/json" -H "Authorization: Bearer $AUTH_TOKEN" > /dev/null 2>&1 & clear
            ;;

        2)
            echo -e "${CYAN}🤖 Sending POST request to AAP API...${RESET}"
            sleep 5
            curl -k -X POST "$CONTROLLER_URL/v2/job_templates/14/launch" -H "Content-Type: application/json" -H "Authorization: Bearer $AUTH_TOKEN" > /dev/null 2>&1 & clear
            ;;


        3)
            echo -e "${CYAN}🤖 Sending POST request to AAP API...${RESET}"
            sleep 5
            curl -k -X POST "$CONTROLLER_URL/v2/job_templates/11/launch" -H "Content-Type: application/json" -H "Authorization: Bearer $AUTH_TOKEN" > /dev/null 2>&1 & clear
            ;;

        4)
            echo -e "${CYAN}🤖 Sending POST request to AAP API...${RESET}"
            sleep 5
            curl -k -X POST "$CONTROLLER_URL/v2/job_templates/13/launch" -H "Content-Type: application/json" -H "Authorization: Bearer $AUTH_TOKEN" > /dev/null 2>&1 & clear
            ;;

        5)
            echo -e "${RED}🤖 Shutting down... Goodbye, Co-Worker!${RESET}"
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
