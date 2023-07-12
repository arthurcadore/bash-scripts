#Author:Arthur Cadore M. Barcella
# Github: arthurcadore

# Code: Acess device from ssh and aplly any command;
# Execution example: ./access_device.sh 10.0.0.1 Admin@01

# first of all, the script verifies if all arguments was passed: 
if [ $# -ne 2 ]; then
	    echo "Its necessary to input IP address and password to execute!"
	        echo "Command example: $0 <IP_address> <Password>"
		    exit 1
fi

# Get IP (First Argument) and put it to variable "IP":
IP="$1"

# Get Password (Second Argument) and put it to variable "PASSW":
PASSW="$2"

# VariÃ¡veis de conexÃ£o SSH
USUARIO="admin"

# Execute command, 
sshpass -p "$PASSW" ssh -o StrictHostKeyChecking=no $USUARIO@$IP << EOF

    logread
    ubus call uci get {config:network}

EOF

# echo "$OUTPUT"
