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
https://tienshaoku.medium.com/eip-4626-inflation-sandwich-attack-deep-dive-and-how-to-solve-it-9e3e320cc3f1
Medium
EIP-4626 Inflation/ Sandwich Attack Deep Dive And How to Solve It
TL;DR EIP-4626 tokenised vaults are susceptible to inflation attacks if the exchange rate of assets deposited and ERC20 shares minted isn’t…
lol this info cost us 100k
Sir Himothy I — 03/16/2024 11:41 AM
the security auditors be keeping secrets lmfaoo
noLE — 03/16/2024 11:45 AM
Hmm
I wonder if that’s how similar the phishing SCs are
I think that’s how I got my wallet wiped
Interact with SC that made a vault between polygon and Ethereum but took my ETH assets idfk but. That’s unique for sure.
Sir Himothy I — 03/16/2024 11:52 AM
someone compromised your wallet?
or you clicked approve on the transaction because you thought it was legit and you were approving the contract to move funds for a subsequent transaction but the approve transaction was actually the tx.send ?
cuz thats what happened to me with my unibot
noLE — 03/16/2024 11:55 AM
I signed a tx over on polygon and it prompted me to make an ETH tx. I declined the ETH tx but for some reason my assets still were gone. Idk it was pretty clever. Only did it cause it was a polygon TX and I had like no funds over there Lmfaoo
Sir Himothy I — 03/16/2024 12:06 PM
damnnnn

This “zero-knowledge” proof is similar to the way Merlin could convince Arthur that Coke and Pepsi have different formulas even if Arthur can’t taste the difference between them. All Merlin would have to do is take repeated blind taste tests; if he can always correctly identify Coke and Pepsi, Arthur must accept that the two drinks are different. 

Sir Himothy I — 08/15/2023 11:19 AM
Then we interpret the data to parse out meaning from the relationships:

Low Density:

Both networks have a density of approximately 0.214, which is quite low. This indicates that only a small fraction of all possible pairs of nodes are directly connected. In the context of investments, this suggests that investors have specific preferences and do not invest in all available funds.

Average Degree:

The average degree of 1.5 suggests that, on average, an investor or a fund is connected to 1.5 other nodes. 

This means that investors tend to invest in around 1 or 2 funds, and funds typically have 1 or 2 investors. 

This could indicate a selective investment strategy or a niche focus of the funds.

Lack of Clustering:

A clustering coefficient of 0.0 means there's no tendency for triadic closure in the network. In simpler terms, if Investor A invests in Fund X and Fund X is also invested in by Investor B, it does not necessarily mean that Investor A and Investor B invest in another common fund. 

This lack of clustering can indicate a variety of investor strategies and preferences, where investors don't necessarily follow or mimic the investment patterns of others.

Network Connectivity:

The fact that the diameter is undefined (because the graph is not connected) suggests that the investment network is fragmented. 

There are isolated components or clusters of investors and funds that don't intermingle with other clusters. 

This could be due to various reasons like different investment goals, risk appetites, or geographical constraints.

Isomorphic Structure:

The fact that the two networks are isomorphic indicates that the overall structure and pattern of investments in commodities and debt securities are similar, despite the nature of the assets being different. 

This might suggest that similar kinds of investors with similar strategies and preferences exist in both investment arenas.

In summary, the investment networks depict a landscape where investors have specific preferences, don't necessarily follow the crowd, and where the investment patterns are similar across different asset classes (commodities and debt securities). The insights can be further enriched with more data, such as the amount of investment, the returns on investment, and the specific characteristics of the investors and the funds.

---

Going back to our investment sphere analogy we can determine several relationships between the commodity investment network and debt security investment network. 
Image
Image
Now with this representation we can walk each node in the graph based on there edges (the lines connecting nodes) and sum up the things we saw as we walked the graph. 

We know by running the scripts that both investment networks are isomorphic to each other.

Commodity Investment Network:

Investor A invests in Commodity Fund 1.
Investor B invests in Commodity Fund 1.
Investor B invests in Commodity Fund 2.
Investor C invests in Commodity Fund 2.
Investor D invests in Commodity Fund 3.
Investor E invests in Commodity Fund 3.

Debt Security Investment Network:

Investor A invests in Debt Security Fund 1.
Investor B invests in Debt Security Fund 1.
Investor C invests in Debt Security Fund 2.
Investor D invests in Debt Security Fund 2.
Investor D invests in Debt Security Fund 3.
Investor E invests in Debt Security Fund 3.
So proceeding with the network analysis using common metrics we saw the following:

Number of Nodes: The total number of nodes in the graph.

Number of Edges: The total number of edges or connections in the graph.

Degree Distribution: The number of connections each node has.

Density: Proportion of potential connections that exist in the graph.

Average Degree: Average number of connections per node.

Clustering Coefficient: Measure of the degree to which nodes in a graph tend to cluster together.

Diameter: The longest shortest path between any two nodes in the network.

Commodity Investment Network:

Number of Nodes: 8
Number of Edges: 6
Density: Approximately 0.214 (indicating a low proportion of potential connections that exist in the graph)
Average Degree: 1.5 (each node, on average, has 1.5 connections)
Clustering Coefficient: 0.0 (nodes in the graph do not tend to cluster together)
Diameter: The graph is not connected, so the diameter cannot be determined.

Debt Security Investment Network:

Number of Nodes: 8
Number of Edges: 6
Density: Approximately 0.214
Average Degree: 1.5
Clustering Coefficient: 0.0
Diameter: The graph is not connected.
 
Sir Himothy I — 08/15/2023 11:19 AM
Then we interpret the data to parse out meaning from the relationships:

Low Density:

Both networks have a density of approximately 0.214, which is quite low. This indicates that only a small fraction of all possible pairs of nodes are directly connected. In the context of investments, this suggests that investors have specific preferences and do not invest in all available funds.

Average Degree:

The average degree of 1.5 suggests that, on average, an investor or a fund is connected to 1.5 other nodes. 

This means that investors tend to invest in around 1 or 2 funds, and funds typically have 1 or 2 investors. 

This could indicate a selective investment strategy or a niche focus of the funds.

Lack of Clustering:

A clustering coefficient of 0.0 means there's no tendency for triadic closure in the network. In simpler terms, if Investor A invests in Fund X and Fund X is also invested in by Investor B, it does not necessarily mean that Investor A and Investor B invest in another common fund. 

This lack of clustering can indicate a variety of investor strategies and preferences, where investors don't necessarily follow or mimic the investment patterns of others.

Network Connectivity:

The fact that the diameter is undefined (because the graph is not connected) suggests that the investment network is fragmented. 

There are isolated components or clusters of investors and funds that don't intermingle with other clusters. 

This could be due to various reasons like different investment goals, risk appetites, or geographical constraints.

Isomorphic Structure:

The fact that the two networks are isomorphic indicates that the overall structure and pattern of investments in commodities and debt securities are similar, despite the nature of the assets being different. 

This might suggest that similar kinds of investors with similar strategies and preferences exist in both investment arenas.

In summary, the investment networks depict a landscape where investors have specific preferences, don't necessarily follow the crowd, and where the investment patterns are similar across different asset classes (commodities and debt securities). The insights can be further enriched with more data, such as the amount of investment, the returns on investment, and the specific characteristics of the investors and the funds. 

---

es yes indeed: so on this: relationships between entities in investment spheres can be represented as vectors.
Since a vector has both magnitude and directionality. This can represent different weights against parameters and the essence of the relationship with respect to other entities and their relationships.
So you always want to match the level of detail with the most advantageous logical or visual representation for the type of analysis or problem you want to solve (and this is a process so we can expect this to be dynamic)
An investment sphere's representation can also be viewed as a matrix which I personally consider an intermediate step between zoom in views (vector representation) and zoom out views (graph data structures (aka networks)) 
And remember due to the graph isomorphism there is a direct identity between graphs and matrices.
but each representation has properties that result in faster results on input data sets
so all investment spheres or leadership structures, business hiearchies and influence maps can be represented as social graphs

---

