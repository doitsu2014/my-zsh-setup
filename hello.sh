#!/usr/bin/env bash

# Colors
RESET="\033[0m"
BOLD="\033[1m"
CYAN="\033[36m"
BRIGHT_CYAN="\033[96m"
BLUE="\033[34m"
BRIGHT_BLUE="\033[94m"
YELLOW="\033[33m"
BRIGHT_YELLOW="\033[93m"
GREEN="\033[32m"
BRIGHT_GREEN="\033[92m"
MAGENTA="\033[35m"
BRIGHT_MAGENTA="\033[95m"
WHITE="\033[97m"
DIM="\033[2m"

# System info
USER_NAME=$(whoami)
HOSTNAME=$(hostname -s)
OS=$(uname -s)
SHELL_NAME=$(basename "$SHELL")
DATE=$(date "+%A, %d %b %Y")
TIME=$(date "+%H:%M")

print_line() {
    printf "${BRIGHT_CYAN}  ══════════════════════════════════════════════════════${RESET}\n"
}

printf "\n"
print_line
printf "${BRIGHT_CYAN}  ║${RESET}                                                      ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${BOLD}${BRIGHT_YELLOW}██████╗ ████████╗███████╗ ██████╗██╗  ██╗${RESET}          ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${BOLD}${YELLOW}██╔══██╗╚══██╔══╝██╔════╝██╔════╝██║  ██║${RESET}          ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${BOLD}${BRIGHT_GREEN}██║  ██║   ██║   █████╗  ██║     ███████║${RESET}          ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${BOLD}${GREEN}██║  ██║   ██║   ██╔══╝  ██║     ██╔══██║${RESET}          ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${BOLD}${BRIGHT_BLUE}██████╔╝   ██║   ███████╗╚██████╗██║  ██║${RESET}          ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${BOLD}${BLUE}╚═════╝    ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝${RESET}          ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}                                                      ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${WHITE}Welcome back,${RESET} ${BOLD}${BRIGHT_MAGENTA}${USER_NAME}${RESET}${DIM}@${HOSTNAME}${RESET}                       ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}                                                      ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${DIM}  Date :${RESET}  ${WHITE}${DATE}${RESET}                      ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${DIM}  Time :${RESET}  ${BOLD}${BRIGHT_YELLOW}${TIME}${RESET}                                    ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${DIM}    OS :${RESET}  ${WHITE}${OS}${RESET}                                    ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}  ${DIM} Shell :${RESET}  ${WHITE}${SHELL_NAME}${RESET}                                     ${BRIGHT_CYAN}║${RESET}\n"
printf "${BRIGHT_CYAN}  ║${RESET}                                                      ${BRIGHT_CYAN}║${RESET}\n"
print_line
printf "\n"
