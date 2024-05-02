

noLE — 03/07/2024 10:19 AM

.eth (@7) on X
block.number is NOT a reliable source of timing information for short terms.

On Arbitrum it reflects the L1 block number, which is updated once per minute.

Also, block time may change on the same chain over time:

Twitter•03/07/2024 10:12 AM
Layer 1: Ethereum Mainnet

Timing Variability: Ethereum blocks on the mainnet (Layer 1) are targeted to be produced at a regular interval (approximately every 13-15 seconds), but this is not guaranteed. The actual block production rate can vary due to network conditions, changes in the difficulty level, and protocol upgrades. Thus, using block.number as a direct measure of time can lead to inaccuracies.

Block Time as an Estimate: While block.number can provide a rough estimate of time passed (e.g., 100 blocks ~ 1300 to 1500 seconds), it's not reliable for precise timing needs due to the variability in block times.
Layer 2: Scaling Solutions
Different Timing Mechanisms: Layer 2 solutions are built on top of Ethereum to provide scalability and efficiency improvements. They include technologies like Rollups, State Channels, and Plasma. Each of these may operate with its own set of rules for transaction processing and finality.
Dependence on Layer 1: While L2 solutions use L1 for security and finality, they can process transactions faster or differently than L1. This means that a block on L2 doesn't correspond directly to a block on L1, and relying on L1's block.number for timing can be misleading for events or actions happening within an L2.
Batch Processing: Some L2s aggregate multiple transactions into batches before submitting them to L1. The timing of these batches doesn't necessarily align with L1 block production, leading to potential discrepancies if block.number is used as a timing reference.
Implications
Using block.number as a timing mechanism can be especially problematic for applications that require precision in timing or synchronization between L1 and L2 activities. For applications where timing is critical, it's recommended to explore other mechanisms, such as using the block timestamp (with its own considerations for reliability) or relying on off-chain timekeeping solutions integrated with smart contract logic.

For L2-specific designs, understanding the specific L2's operation, finality mechanisms, and its relationship with L1 blocks is crucial. Developers should consider these factors when architecting systems that span both layers or when timing is a critical component of the system's functionality.
Sir Himothy I — 03/16/2024 11:34 AM
yea
using block number or relying strictly on block time as though its constant will breed flash loan attacks
not only that simply using an oracle to retrieve price for impact calculations will open you up to oracle manipulation attacks
and inflation attacks
a less niave solution would be to use a set of off-chain chainlink, pyth, <insert investor> oracles, then take the mean not the average of those prices as "ground truth" for that particular tick.
https://docs.pyth.network/price-feeds/how-pyth-works
https://www.halborn.com/blog/post/what-is-oracle-manipulation-a-comprehensive-guide
What Is Oracle Manipulation? A Comprehensive Guide
Halborn provides an overview of oracle manipulation attacks and strategies for safeguarding your project against oracle exploits.
What Is Oracle Manipulation? A Comprehensive Guide

Medium
EIP-4626 Inflation/ Sandwich Attack Deep Dive And How to Solve It
TL;DR EIP-4626 tokenised vaults are susceptible to inflation attacks if the exchange rate of assets deposited and ERC20 shares minted isn’t…
lol this info cost us 100k