#!/bin/bash

# Exit on any error
set -e

# Variables
REPO_URL="https://github.com/nodertc-io/nodertc-installer/raw/v1.0.0/nodertc-client-agent"
BINARY_NAME="nodertc-client-agent"
DOWNLOAD_PATH="/tmp/$BINARY_NAME"
INSTALL_PATH="/usr/local/bin"
SERVICE_NAME="nodertc-client-agent"

# Color codes
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
WHITE='\033[1;37m'
GREEN='\033[0;32m'
NC='\033[0m'  # No Color

# Function to download the binary
download_binary() {
    echo -e "${BLUE}Downloading $BINARY_NAME from $REPO_URL...${NC}"
    curl -L $REPO_URL -o $DOWNLOAD_PATH
    chmod +x $DOWNLOAD_PATH
}

# Function to install the binary
install_binary() {
    echo -e "${YELLOW}Installing $BINARY_NAME to $INSTALL_PATH...${NC}"
    sudo mv $DOWNLOAD_PATH $INSTALL_PATH
}

# Function to create systemd service file
create_service_file() {
    echo -e "${WHITE}Creating systemd service file for $BINARY_NAME...${NC}"
    sudo bash -c "cat > /etc/systemd/system/$SERVICE_NAME.service <<EOL
[Unit]
Description=$BINARY_NAME Service
After=network.target

[Service]
ExecStart=$INSTALL_PATH/$BINARY_NAME
Restart=always
User=nobody
Group=nogroup

[Install]
WantedBy=multi-user.target
EOL"
}

# Function to reload systemd and enable/start the service
setup_service() {
    echo -e "${GREEN}Reloading systemd daemon...${NC}"
    sudo systemctl daemon-reload

    echo -e "${GREEN}Enabling and starting $SERVICE_NAME service...${NC}"
    sudo systemctl enable $SERVICE_NAME
    sudo systemctl start $SERVICE_NAME

    echo -e "${GREEN}Checking status of $SERVICE_NAME service...${NC}"
    sudo systemctl status $SERVICE_NAME
}

# Main script execution
main() {
    download_binary
    install_binary
    create_service_file
    setup_service
    echo -e "${GREEN}Installation and service setup completed successfully.${NC}"
}

# Execute main function
main
