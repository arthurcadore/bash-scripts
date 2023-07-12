#!/bin/bash
# Author:Arthur Cadore M. Barcella
# Github: arthurcadore

# Code: Acess device from ssh and aplly any command;
# Execution example: ./access_device.sh 10.0.0.1 "system version"

# first of all, the script verifies if all arguments was passed: 
if [ $# -ne 2 ]; then
    echo "É necessário fornecer o IP e o comando como argumentos."
    echo "Exemplo de uso: $0 endereço_IP 'system version'"
    exit 1
fi

# Get IP (First Argument) and put it to variable "IP":
IP="$1"

# Get the command syntax (Second Argument) and put it to variable "IP":
COMMAND="$2"

# Variáveis de conexão SSH
USUARIO="nome_de_usuário"
SENHA="senha"

# Execute command, 
OUTPUT=$(sshpass -p "$SENHA" ssh -o StrictHostKeyChecking=no $USUARIO@$IP "$COMMAND")

echo "$OUTPUT"
