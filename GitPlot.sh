#!/bin/bash

echo -e "\033[1;35m"
echo ""
echo ""
echo " ██████╗ ██╗████████╗██████╗ ██╗      ██████╗ ████████╗";
echo "██╔════╝ ██║╚══██╔══╝██╔══██╗██║     ██╔═══██╗╚══██╔══╝";
echo "██║  ███╗██║   ██║   ██████╔╝██║     ██║   ██║   ██║   ";
echo "██║   ██║██║   ██║   ██╔═══╝ ██║     ██║   ██║   ██║   ";
echo "╚██████╔╝██║   ██║   ██║     ███████╗╚██████╔╝   ██║   ";
echo " ╚═════╝ ╚═╝   ╚═╝   ╚═╝     ╚══════╝ ╚═════╝    ╚═╝   ";
echo "                                                       ";
echo "     ------------- By mr r00t ------------"
echo -e "\033[0m"
echo "--search-files - search configuration files"
echo "--search-ips - search internal IPs"
echo "--search-db-info - search for connections to the database"
echo "--search-api-secrets - search API secrets"
echo "--find-sensitive-files - search for sensitive information in files"
# Default path is the current directory
SEARCH_PATH="."

# Function to search for specific files
function search_files() {
    echo -e "\033[1;34mSearching for files matching patterns in $SEARCH_PATH...\033[0m"
    find "$SEARCH_PATH" -name "*Conexion*.php"
    find "$SEARCH_PATH" -name "*db*.php"
    find "$SEARCH_PATH" -name "*config*.php"
    echo -e "\033[1;32mFile search completed.\033[0m"
}

# Function to search for IP addresses in PHP files
function search_ips_in_php() {
    echo -e "\033[1;34mSearching for IP addresses in PHP files in $SEARCH_PATH...\033[0m"
    grep -r -i --include=\*.php -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}" "$SEARCH_PATH"
    echo -e "\033[1;32mIP search completed.\033[0m"
}

# Function to search for database connections and sensitive keywords in PHP files
function search_db_and_sensitive_info() {
    echo -e "\033[1;34mSearching for database connections and sensitive information in PHP files in $SEARCH_PATH...\033[0m"
    grep -r -i --include=\*.php -e "password" -e "db_" -e "database" -e "user" -e "username" -e "dbname" -e "host" -e "connection" -e "connect" -e "auth" -e "usuario" -e "db" -e "pass" -e "server" -e "servidor" "$SEARCH_PATH"
    echo -e "\033[1;32mDatabase and sensitive information search completed.\033[0m"
}

# Function to search for API connections and secrets in PHP files
function search_api_and_secrets() {
    echo -e "\033[1;34mSearching for API connections and secrets in PHP files in $SEARCH_PATH...\033[0m"
    grep -r -i --include=\*.php -e "api_key" -e "secret" -e "token" -e "apikey" -e "auth" -e "authorization" -e "bearer" -e "client_id" -e "client_secret" -e "access_key" -e "private_key" -e "public_key" "$SEARCH_PATH"
    echo -e "\033[1;32mAPI and secrets search completed.\033[0m"
}

# Function to find sensitive files
function find_sensitive_files() {
    echo -e "\033[1;34mSearching for files that may contain sensitive information in $SEARCH_PATH...\033[0m"
    find "$SEARCH_PATH" -type f \( \
        -iname "*config*" -o \
        -iname "*secret*" -o \
        -iname "*password*" -o \
        -iname "*key*" -o \
        -iname "*token*" -o \
        -iname "*credential*" -o \
        -iname "*db*" -o \
        -iname "*database*" -o \
        -iname "*.env" -o \
        -iname "*.pem" -o \
        -iname "*.crt" -o \
        -iname "*.cer" -o \
        -iname "*.pfx" -o \
        -iname "*.p12" -o \
        -iname "*.json" -o \
        -iname "*.yaml" -o \
        -iname "*.yml" -o \
        -iname "*.sql" \
    \)
    echo -e "\033[1;32mSensitive files search completed.\033[0m"
}

# Main script logic to execute functions based on parameters
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --path)
            SEARCH_PATH="$2"
            shift 2
            ;;
        --search-files)
            search_files
            shift
            ;;
        --search-ips)
            search_ips_in_php
            shift
            ;;
        --search-db-info)
            search_db_and_sensitive_info
            shift
            ;;
        --search-api-secrets)
            search_api_and_secrets
            shift
            ;;
        --find-sensitive-files)
            find_sensitive_files
            shift
            ;;
        *)
            echo -e "\033[1;31mUnknown parameter passed: $1\033[0m"
            shift
            ;;
    esac
done
