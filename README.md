# qfactom
Is a kdb+ library which interacts with the Factom blockchain via the factomd client and wallet REST APIs. 
The library allows records, in the form of kdb+ tables,lists etc, to be easily secured on the Bitcoin blockchain, via a single Factom anchor hash. Entries made to factom chains can serve as a [Proof of Existence](http://www.newsbtc.com/proof-of-existence/, enabling cryptographically secured audit trails to be constructed.

Combining the speed of kdb+ with the scalability and security of factom enables
millions of records to be secured quickly and safely on the Bitcoin blockchain.

For install and usage instructions see [wiki](https://github.com/jlucid/qfactom/wiki) pages.

## Functionality
* Transactions: Both factoid->factoid and factoid->entry credit
* Chain creation: Create chains and make entries to those chains
* Chain extraction: Extract all chain entries given a chain id 
* Receipts: Extract cryptographic proof that chain entries are secured with a single hash on the Bitcoin blockchain
* Utilities: Check balances, block-height, transaction lookups

## Use cases

* Securing large IOT data sets. 
See [Blockchain IOT Project](https://www.ethnews.com/factom-receives-second-dhs-grant-for-blockchain-iot-project)
* Securing private blockchains through the use of anchoring.
See [Blockchain Auditing](http://bitfury.com/content/5-white-papers-research/bitfury_white_paper_on_blockchain_auditability.pdf)
* Providing a proof of existence.
Anchor hashes in the bitcoin blockchain can provide indisputable cryptographic proof that data was 
at a particular state at a given point in time. 
See [PoE Explained](http://www.newsbtc.com/proof-of-existence/)
* Providing an open ledger for public data.
Intrinio use the Factom blockchain to publish stock market prices every 15 minutes for 3000 US stocks. 
See [Intrinio Article](https://www.factom.com/blog/intrinio-factom-announce-collaboration).  
Entry records are easily accessible via the Factom blockchain explorer. 
See [Factom Market Data Entry](https://explorer.factom.org/entry/bfa8626577553a90906246faf94bf02febad9697339993a942790dd3fb20f9c8)
* Acting as a smart contract oracle. In this scenario, a smart contract (running on a decentralized network
  such as RSK or ethereum) can use the factom blockchain to extract reliable/verifiable data.
See [Smart Contracts Article](https://www.factom.com/blog/smartcontract-factom-announce-collaboration)


## Prerequisites

* kdb+ v3.4 or higher
* [qutil](https://github.com/nugend/qutil) - Required if you wish to load the library using qutil.
  If not, an alternative method is provided. See below.
* A factomd client and wallet application for the library to communicate with.  

## Installing

To load using qutil, follow the steps below.

Create a link named "qfactom" in the QPATH directory which points to qfactom/lib. This will enable qutil 'require' function to find the init.q file and load the library. You can confirm the library is loaded correctly by checking that the .factomd and .factomwallet namespaces are present in the q session.

    q).utl.require "qfactom"
    q)key `
    `q`Q`h`j`o`util`factomd`factomwallet    // .factomd and .factomwallet namespace loaded
    
Alternatively, the library can be loaded using the provided factomLoad.q script.
First set the environmental variable 
QFACTOM_HOME to where you placed the qfactom folder locally.

    $export QFACTOM_HOME=/home/test/library/qfactom/
    $q $QFACTOM_HOME/lib/factomLoad.q
    q)key `
    `q`Q`h`j`o`util`factomd`factomwallet   

## License

This code is licensed under an MIT license.  See [LICENSE](https://github.com/jlucid/qfactom/blob/master/LICENSE) for
the full text.

## Contact

Jeremy Lucid  
jlucid@kx.com  
https://github.com/jlucid  




