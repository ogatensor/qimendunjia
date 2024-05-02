#!/bin/bash

# Bash: deposit.sh

# Prompt for user input
read -p "Enter your Infura key: " INFURA_KEY
read -p "Enter your Ethereum address: " YOUR_ADDRESS
read -p "Enter the amount of ETH to deposit: " DEPOSIT_AMOUNT

# Check if foundry is installed
if ! command -v foundry &> /dev/null
then
    echo "foundry could not be found. Please install it and try again."
    exit
fi

# Depositing Sepolia ETH 
if ! foundry cast send -i 0xc644cc19d2A9388b71dd1dEde07cFFC73237Dca8 --value ${DEPOSIT_AMOUNT}ether --rpc-url https://sepolia.infura.io/v3/$INFURA_KEY
then
    echo "Deposit transaction failed. Please check your inputs and try again."
    exit
fi

# Confirming the bridged ETH on Blast
if ! foundry cast balance $YOUR_ADDRESS --rpc-url https://sepolia.blast.io
then
    echo "Failed to check balance on Blast. Please check your inputs and try again."
    exit
fi

# Converting to WETH (Rebasing)
if ! foundry cast send -i 0x4200000000000000000000000000000000000023 --value ${DEPOSIT_AMOUNT}ether --rpc-url https://sepolia.blast.io 
then
    echo "Failed to convert ETH to WETH. Please check your inputs and try again."
    exit
fi

echo "Deposit and conversion to WETH successful."