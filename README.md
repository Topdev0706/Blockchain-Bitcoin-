# qfactom
kdb+ API library designed to interact with the Factom blockchain via 
the factomd client REST API and factom wallet REST API. For usage instructions see [wiki](https://github.com/jlucid/qfactom/wiki) pages.

Library enables
* Transactions: Both factoid->factoid and factoid->entry credit
* Chain creation: Create and commit to a factom chain
* Utilities: Check balances, block-height, transaction lookups

Combining the speed of kdb+ with the scalability and security of factom enables
millions of records to be secured quickly and safely on the Bitcoin blockchain.

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
https://explorer.factom.org/entry/bfa8626577553a90906246faf94bf02febad9697339993a942790dd3fb20f9c8
* Acting as a smart contract oracle. In this scenario, a smart contract (running on a decentralized network
  such as RSK or ethereum) can use the factom blockchain to extract reliable/verifiable data and act accordingly.
 See https://www.factom.com/blog/smartcontract-factom-announce-collaboration
