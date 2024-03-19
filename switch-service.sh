#!/bin/bash

# Function to stop Apache2
stop_apache2() {
    sudo service apache2 stop
}

# Function to start Apache2
start_apache2() {
    sudo service apache2 start
}

# Function to stop Node.js (PM2)
stop_nodejs() {
    pm2 stop all
}

# Function to start Node.js (PM2)
start_nodejs() {
    pm2 start all
}

# Function to stop nginx
stop_nginx() {
    service nginx stop
}

# Function to start nginx
start_nginx() {
    service nginx start
}


# Help function
show_help() {
    echo "Usage: $0 [option]"
    echo "Options:"
    echo "  --help          Show this help message"
    echo "  node            Start Node.js and stop Apache2, nginx"
    echo "  apache          Start Apache2 and stop Node.js, nginx"
    echo "  nginx           Start nginx and stop Node.js, Apache2"
}

# Main script
if [[ $# -eq 0 ]] || [[ $1 == "--help" ]]; then
    show_help
    exit 0
elif [[ $1 == "node" ]]; then
    stop_apache2
    stop_nginx
    start_nodejs
    echo "Node.js is now running."
elif [[ $1 == "apache" ]]; then
    stop_nodejs
    stop_nginx
    start_apache2
    echo "Apache2 is now running."
elif [[ $1 == "nginx" ]]; then
    stop_nodejs
    stop_apache2
    start_nginx
    echo "nginx is now running."

else
    echo "Invalid option: $1"
    show_help
    exit 1
fi
