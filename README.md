# qfactom
kdb+ wrapper library designed to interact with the Factom blockchain via 
the factomd client REST API and factom wallet REST API.

Library enables
* Transactions: Both factoid->factoid and factoid->entry credit
* Chain creation: Create and commit to a factom chain
* Utilities: Check balances, block-height, transaction lookups

Combining the speed of kdb+ with the scalability and security of factom enables
millions of records to be secured quickly and safely on the blockchain.

Use cases:

* Securing large data sets. For example, IoT data.
See https://www.ethnews.com/factom-receives-second-dhs-grant-for-blockchain-iot-project
* Securing private blockchains through the use of anchoring.
See http://bitfury.com/content/5-white-papers-research/bitfury_white_paper_on_blockchain_auditability.pdf
* Providing a proof of receipt mechanism.
* Making data public. For example, stock market prices.
  See https://www.factom.com/blog/intrinio-factom-announce-collaboration
  The following link is to the Factom blockchain explorer with the lookup showing a
  sample Intrinio market data entry block
https://explorer.factom.org/chain/0464bf13a66ed62d8196c51292caedaecbd8dfe245acdbd1aafdac9ed9d77b1b
* Acting as a smart contract oracle. In this scenario, a smart contract (running on a decentralized network
  such as RSK or ethereum) can use the factom blockchain to extract reliable/verifiable data and act accordingly.
 See https://www.factom.com/blog/smartcontract-factom-announce-collaboration
