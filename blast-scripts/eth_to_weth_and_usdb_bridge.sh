#!/bin/bash

# Define variables
INFURA_KEY="your_infura_key_here"
YOUR_ADDRESS="your_wallet_address_here"
DEPOSIT_AMOUNT="your_deposit_amount_here"
RPC_URL="https://rpc.sepolia.org"
PRIV_KEY="your_private_key_here"
USDB_CONTRACT="0x7f11f79DEA8CE904ed0249a23930f2e59b43a385"
WETH_CONTRACT="0x4200000000000000000000000000000000000023"
BRIDGE_CONTRACT="0xc644cc19d2A9388b71dd1dEde07cFFC73237Dca8"
USDB_L2_CONTRACT="0x4200000000000000000000000000000000000022"
MINT_AMOUNT="1000000000000000000000" # $1000 in mock USD with 18 decimals

# Function to deposit ETH and convert to WETH
function deposit_and_convert() {
    foundry cast send -i 0xc644cc19d2A9388b71dd1dEde07cFFC73237Dca8 --value ${DEPOSIT_AMOUNT}ether --rpc-url https://sepolia.infura.io/v3/$INFURA_KEY
    foundry cast balance $YOUR_ADDRESS --rpc-url https://sepolia.blast.io
    foundry cast send -i 0x4200000000000000000000000000000000000023 --value ${DEPOSIT_AMOUNT}ether --rpc-url https://sepolia.blast.io 
}

# Function to mint USDB, approve transfer, and bridge to L2
function mint_approve_bridge() {
    cast send --rpc-url=$RPC_URL --private-key=$PRIV_KEY $USDB_CONTRACT "mint(address,uint256)" $YOUR_ADDRESS $MINT_AMOUNT
    cast send --rpc-url=$RPC_URL --private-key=$PRIV_KEY $USDB_CONTRACT "approve(address,uint256)" $BRIDGE_CONTRACT $MINT_AMOUNT
    cast send --rpc-url=$RPC_URL --private-key=$PRIV_KEY --gas-limit 500000 $BRIDGE_CONTRACT "bridgeERC20(address localToken,address remoteToken,uint256 amount,uint32,bytes)" $USDB_CONTRACT $USDB_L2_CONTRACT $MINT_AMOUNT 500000 0x
}

# Execute the functions
deposit_and_convert
mint_approve_bridge

echo "Operations completed."