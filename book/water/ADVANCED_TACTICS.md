# Table of Contents

1. Introduction
2. [[Timing Variability]] 
3. [[Layer 2]] Solutions and Timing
4. Risks of Using `block.number` for Timing
5. [[EIP-4626 Inflation/Sandwich Attack]]
6. [[Recommendations for Precise Timing]]
7. [[Tools]]
8. Conclusion


The content in [[ADVANCED_TACTICS.md]] discusses the challenges and risks associated with using `block.number` for precise timing in [[Ethereum]]. It highlights the variability in block production times on the Ethereum mainnet and the differences in timing mechanisms between [[Layer 1]] and [[Layer 2]] solutions. The document emphasizes the importance of understanding these timing nuances to avoid inaccuracies in time-sensitive operations.

Furthermore, it delves into the [[EIP-4626 Inflation/Sandwich Attack]], which exploits vulnerabilities in pricing functions to manipulate exchange rates and cause inflation in token pairs. The attack involves depositing to a vault, transferring ERC20 tokens, and front-running victim deposits to manipulate prices. The document suggests using a set of off-chain oracles and taking the mean of prices to mitigate risks associated with [[oracle manipulation attacks]].

Overall, the document provides valuable insights into the intricacies of timing in Ethereum, the risks of relying on `block.number` for timing, and the potential vulnerabilities associated with pricing functions that can be exploited in attacks like the EIP-4626 Inflation/Sandwich Attack. It underscores the importance of understanding these concepts for developers and practitioners in the Ethereum ecosystem to enhance security and precision in their operations.
--- 

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
What Is [[Oracle Manipulation]]? A Comprehensive Guide
Halborn provides an overview of oracle manipulation attacks and strategies for safeguarding your project against oracle exploits.
What Is Oracle Manipulation? A Comprehensive Guide
Medium
EIP-4626 Inflation/ Sandwich Attack Deep Dive And How to Solve It
TL;DR EIP-4626 tokenised vaults are susceptible to inflation attacks if the exchange rate of assets deposited and ERC20 shares minted isn’t…
lol this info cost us 100k

---

Here is the information organized in a table format:

| Concept | Definition |
|---------|------------|
| [[Liquidity Space]] $\mathcal{L}$ | A vector space representing the digital space where token pairs reside, allowing for trading. |
| [[Exploitable Subspace]] $\mathcal{L}^e$ | A subset of $\mathcal{L}$ where token pairs are exploitable, enabling profitable trading opportunities. |
| [[Detection Function]] $\delta$ | A function mapping token pairs to a binary group $\{0, 1\}$, indicating exploitability status. |
| [[Activation Function]] $\sigma$ | A function transforming non-exploitable token pairs into exploitable ones within $\mathcal{L}^e$. |
| Group Structure of $\mathcal{L}$ | $\mathcal{L}$ forms an Abelian group under vector addition, with token pairs as elements. |
| Group Action of $\delta$ | $\delta$ acts as a group homomorphism mapping $\mathcal{L}$ to the Boolean group $\{0, 1\}$. |
| Group Action of $\sigma$ | $\sigma$ acts as a group action of the deformation tensor on $\mathcal{L}$, transforming token pairs. |

| Lemma | Description |
|-------|-------------|
| Lemma 4 (Boundary Condition: [[Subspaces]]) | Defines three disjoint subspaces in the liquidity space: positive, negative, and boundary subspaces. |
| Corollary 1 ([[States Outside the Boundary Conditions]]) | States conditions for token pairs outside the liquidity space, involving zero vectors and the negative subspace. |
| Lemma 5 ([[Pricing Function]]) | Introduces a pricing function consistent with the LP AMM function, connecting token pair prices to subspaces. |
| Lemma 3 ([[Token Pair Conditions]]) | States conditions for token pairs in the liquidity space, ensuring non-zero values for $\vec{x}$ and $\vec{y}$. |
| Lemma 6 ([[Exploitable Subspace]] Definition) | Defines the exploitable subspace as a union of the negative and boundary subspaces. |

| Theorem | Description |
|---------|-------------|
| Theorem 1 (Pricing Function and Subspaces) | Establishes relationships between pricing function consistency, token pair subspaces, and corresponding price vector properties. |
| Theorem 2 (Existence of Exploitable Subspace) | Proves the existence of a subspace where exploitation is possible based on pricing function consistency. |
| Theorem 3 (Correctness of the Detection Function) | Affirms that the detection function correctly identifies the exploitable subspace based on token prices. |

This table provides a concise and organized overview of the key definitions, lemmas, and theorems presented, making it easier to reference and understand the underlying concepts and relationships.

Based on the information provided in the search results, let's explain the EIP-4626 inflation/sandwich attack using a direct proof approach:

Proof:

1. **Exploitable Subspace $\mathcal{L}^e$**: According to Lemma 6, the exploitable subspace $\mathcal{L}^e$ is defined as the union of the negative and boundary subspaces within the liquidity space $\mathcal{L}$. This means that token pairs within $\mathcal{L}^e$ are vulnerable to exploitation.

2. **Pricing Function and Subspaces**: Theorem 1 establishes the relationship between the pricing function, token pair subspaces, and corresponding price vector properties. Specifically, it states that if the pricing function is consistent with the LP AMM function, then the price vector will have properties corresponding to the positive, negative, and boundary subspaces.

3. **Existence of [[Exploitable Subspace]]**: Theorem 2 proves the existence of an exploitable subspace $\mathcal{L}^e$ based on the pricing function consistency. This means that there is a non-empty subset of the liquidity space where token pairs can be exploited.

4. **[[Sandwich Attack Mechanism]]**: The search results[^1](https://tienshaoku.medium.com/eip-4626-inflation-sandwich-attack-deep-dive-and-how-to-solve-it-9e3e320cc3f1), [^2](https://medium.com/@0x.offchain/eip4626-inflation-attack-briefly-explained-250f8a8e424e), and [^3](https://ethereum-magicians.org/t/address-eip-4626-inflation-attacks-with-virtual-shares-and-assets/12677) explain the mechanism of the EIP-4626 inflation/sandwich attack:
   - The attacker deposits to the vault to mint shares.
   - The attacker also transfers ERC20 tokens directly to the vault.
   - The victim (depositor) then deposits, and the attacker can front-run the victim's deposit, manipulating the exchange rate and causing inflation.

5. **Correctness of Detection Function**: Theorem 3 affirms that the detection function $\delta$ correctly identifies the exploitable subspace $\mathcal{L}^e$. This means that the detection mechanism can reliably identify the token pairs that are vulnerable to the inflation/sandwich attack.

In conclusion, the direct proof shows that the existence of an exploitable subspace $\mathcal{L}^e$ within the liquidity space $\mathcal{L}$, as defined by Lemma 6 and proven by Theorem 2, enables the EIP-4626 inflation/sandwich attack mechanism. The attacker can exploit the inconsistencies in the pricing function and front-run the victim's deposit to manipulate the exchange rate and cause inflation, as described in the search results. The correctness of the detection function, as stated in Theorem 3, can help identify the vulnerable token pairs within the exploitable subspace.

[^1](https://tienshaoku.medium.com/eip-4626-inflation-sandwich-attack-deep-dive-and-how-to-solve-it-9e3e320cc3f1)
[^2](https://medium.com/@0x.offchain/eip4626-inflation-attack-briefly-explained-250f8a8e424e)
[^3](https://ethereum-magicians.org/t/address-eip-4626-inflation-attacks-with-virtual-shares-and-assets/12677)

The provided information discusses the unreliability of using block.number for precise timing in Ethereum due to block time variability and differences between Layer 1 and Layer 2 solutions. It also warns against vulnerabilities like flash loan attacks when relying solely on block time or oracles for critical operations. Additionally, it delves into the EIP-4626 inflation/sandwich attack, which exploits inconsistencies in pricing functions to manipulate exchange rates and cause inflation in token pairs.

---

More sophisticated adversaries develop tradecraft to perform passive mapping, a tactic whereby the attacker collects information about a target without interacting directly with it (without actively scanning it with Nmap, for example). Another passive mapping tactic is the interpretation of packets captured from a network interface in promiscuous mode, which configures a network interface to record and inspect all network communications; this is the opposite of non-promiscuous mode in which only communication the network addresses to itself is recorded and inspected. You would use promiscuous mode to gain an understanding of the neighboring hosts, traffic flow, services, and protocols used on the network without ever actively interacting with it.

Another method for mapping a network without directly interacting with it is to collect a network admin’s emails as they leave the network, searching for network maps of the target in an external file storage-sharing environment, or looking in third-party troubleshooting help forums where the admin may post logs/errors, router configurations, network debugging/tracert/ping, or other technical details that disclose the layout and configuration of the network.

## Backlinks
- [[INDEX]]
- [[Timing Variability]]
- [[Layer 2]]
- [[EIP-4626 Inflation/Sandwich Attack]]
- [[Recommendations for Precise Timing]]
- [[Oracle Manipulation]]
- [[Liquidity Space]]
- [[Exploitable Subspace]]
- [[Detection Function]]
- [[Activation Function]]
- [[Subspaces]]
- [[States Outside the Boundary Conditions]]
- [[Pricing Function]]
- [[Token Pair Conditions]]
- [[Sandwich Attack Mechanism]]
- [[Sabotage]]
