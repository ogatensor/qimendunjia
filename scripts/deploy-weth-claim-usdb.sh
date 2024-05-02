#!/bin/bash

# Define variables
RPC_URL="https://rpc.sepolia.org"
PRIV_KEY="your_private_key_here"
YOUR_ADDRESS="your_wallet_address_here"
USDB_CONTRACT="0x7f11f79DEA8CE904ed0249a23930f2e59b43a385"
WETH_CONTRACT="0x4200000000000000000000000000000000000023"
BRIDGE_CONTRACT="0xc644cc19d2A9388b71dd1dEde07cFFC73237Dca8"
USDB_L2_CONTRACT="0x4200000000000000000000000000000000000022"
MINT_AMOUNT="1000000000000000000000" # $1000 in mock USD with 18 decimals

# Mint USDB on Sepolia L1
echo "Minting USDB..."
cast send --rpc-url=$RPC_URL \
  --private-key=$PRIV_KEY \
  $USDB_CONTRACT \
  "mint(address,uint256)" $YOUR_ADDRESS $MINT_AMOUNT

# Approve the L1 Blast Bridge contract to transfer USDB
echo "Approving L1 Blast Bridge to transfer USDB..."
cast send --rpc-url=$RPC_URL \
  --private-key=$PRIV_KEY \
  $USDB_CONTRACT \
  "approve(address,uint256)" $BRIDGE_CONTRACT $MINT_AMOUNT

# Bridge USDB from L1 to the same address on L2
echo "Bridging USDB to L2..."
cast send --rpc-url=$RPC_URL \
  --private-key=$PRIV_KEY --gas-limit 500000 \
  $BRIDGE_CONTRACT \
  "bridgeERC20(address localToken,address remoteToken,uint256 amount,uint32,bytes)" \
  $USDB_CONTRACT $USDB_L2_CONTRACT $MINT_AMOUNT 500000 0x

# Convert ETH to WETH by sending ETH to the WETH contract address on L2
echo "Converting ETH to WETH..."
cast send --rpc-url=$RPC_URL \
  --private-key=$PRIV_KEY --value=<ETH_amount_in_wei> \
  $WETH_CONTRACT

# Optional: Claim yield for WETH and USDB if applicable
# This step requires additional implementation details about the smart contract methods for claiming yield

echo "Operations completed."
