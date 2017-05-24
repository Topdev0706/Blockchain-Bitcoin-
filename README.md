# qfactom
kdb+ library designed to interact with the Factom Blockchain via 
the factomd client REST API and factom wallet REST API.

Library enables
* Transactions: Both factoid->factoid and factoid->entry credit
* Chain creation: Create and commit to a factom chain
* Utilities: Check balances, block-height, transaction lookups

Combining the speed of kdb+ with the scalability and security of factom enables
millions of records to be secured quickly and safely on the blockchain.

Use cases:

* Securing large data sets. For example, IoT data
* Securing private blockchains through the use of anchoring
* Providing a proof of receipt mechanism
* Making data public.
   See Publication of clear text data. For example, stock market prices https://explorer.factom.org/chain/0464bf13a66ed62d8196c51292caedaecbd8dfe245acdbd1aafdac9ed9d77b1b
* Acting as a smart contract oracle. 
   See https://www.factom.com/blog/smartcontract-factom-announce-collaboration
