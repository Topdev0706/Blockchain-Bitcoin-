# qfactom
kdb+ API library designed to interact with the Factom blockchain via 
the factomd client REST API and factom wallet REST API. For install and usage instructions see [wiki](https://github.com/jlucid/qfactom/wiki) pages.
Combining the speed of kdb+ with the scalability and security of factom enables
millions of records to be secured quickly and safely on the Bitcoin blockchain.

Library enables
* Transactions: Both factoid->factoid and factoid->entry credit
* Chain creation: Create chains and make entries to those chains
* Chain extraction: Extract all chain entries given a chain id 
* Receipts: Extract cryptographic proof that chain entries are secured with a single hash on the Bitcoin blockchain
* Utilities: Check balances, block-height, transaction lookups

Use cases:

* Securing large data sets. For example, IoT data.
See [Test](https://www.ethnews.com/factom-receives-second-dhs-grant-for-blockchain-iot-project)

* Securing private blockchains through the use of anchoring.
See http://bitfury.com/content/5-white-papers-research/bitfury_white_paper_on_blockchain_auditability.pdf

* Providing a proof of existence.
Anchor hashes in the bitcoin blockchain can provide undisputable cryptographic proof that data was 
at a particular state at a given point in time. 

* Providing an open ledger for public data.
Intrinio use the Factom blockchain to publish stock market prices every 15 minutes for 3000 US stocks. 
See https://www.factom.com/blog/intrinio-factom-announce-collaboration
Entry records are easily accessible via the Factom blockchain explorer. See 
https://explorer.factom.org/entry/bfa8626577553a90906246faf94bf02febad9697339993a942790dd3fb20f9c8

* Acting as a smart contract oracle. In this scenario, a smart contract (running on a decentralized network
  such as RSK or ethereum) can use the factom blockchain to extract reliable/verifiable data.
 See https://www.factom.com/blog/smartcontract-factom-announce-collaboration




