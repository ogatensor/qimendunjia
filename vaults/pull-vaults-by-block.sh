#!/bin/bash

# Set the parameters
block_size=100
total_data=1000

# Calculate the number of blocks
num_blocks=$((total_data / block_size))

# SSH command to pull data in blocks
for ((i=0; i<num_blocks; i++))
do
    ssh user@server "pull_data --block $i --size $block_size"
done
