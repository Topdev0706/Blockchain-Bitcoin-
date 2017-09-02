# qfactom
qfactom is a kdb+ wrapper library designed to interact with the Factom blockchain via the factomd client (*factomd*) and wallet (*factom-walletd*) REST APIs. 
The library allows records, in the form of kdb+ tables, lists etc, to be easily secured on the Factom blockchain through the use of simple q function. Entries made to Factom chains can serve as a [Proof of Existence](http://www.newsbtc.com/proof-of-existence/), enabling cryptographically secure audit trails to be constructed. Data stored on existing Factom chains, like those used to hold Stock market prices, can also be easily extracted and coverted to kdb+ table format, see [example](https://github.com/jlucid/qfactom/wiki/Extracting-a-Chain).

Combining the speed and scalability of kdb+, with the security and scalability of Factom, enables
millions of records to be secured quickly and safely.

For install and usage instructions see [wiki](https://github.com/jlucid/qfactom/wiki) pages.

## Functionality
* Transactions: Both factoid->factoid and factoid->entry credit, see [Transactions](https://github.com/jlucid/qfactom/wiki/Performing-Transactions).
* Chain creation: Create chains and make entries to those chains, see [Creating Chains](https://github.com/jlucid/qfactom/wiki/Creating-Factom-chains).
* Chain extraction: Extract all chain entries given a chain id, see [Chain extraction](https://github.com/jlucid/qfactom/wiki/Extracting-a-Chain). 
* Receipts: Extract cryptographic proof that chain entries are secured with a single  
            hash on the Bitcoin blockchain, see [Anchors](https://github.com/jlucid/qfactom/wiki/Bitcoin-Anchor-proof).
* Utilities: Check balances, block-height, transaction status, see [State information](https://github.com/jlucid/qfactom/wiki/State-information).

## Use cases

* Securing large IoT data sets, see [Blockchain IoT Project](https://www.ethnews.com/factom-receives-second-dhs-grant-for-blockchain-iot-project) and [kdb+ mock example](https://github.com/jlucid/qfactom/wiki/Securing-Streaming-IoT-data)
* Securing private blockchains through the use of anchoring, see [Blockchain Auditing](http://bitfury.com/content/5-white-papers-research/bitfury_white_paper_on_blockchain_auditability.pdf)   
* Auditing and Compliance tool.
For example, in the Mortgage insustry, see [Factom Harmony](https://www.factom.com/products/harmony/video), [Factom Apollo](https://vimeo.com/154918515).
* Providing a proof of existence.
Anchor hashes in the bitcoin blockchain can provide indisputable cryptographic proof that data was 
at a particular state at a given point in time, see [PoE Explained](http://www.newsbtc.com/proof-of-existence/)
* Providing an open ledger for public data.
Intrinio use the Factom blockchain to publish stock market prices every 15 minutes for 3000 US stocks, 
see [Intrinio Article](https://www.factom.com/blog/intrinio-factom-announce-collaboration).  
Entry records are easily accessible via the Factom blockchain explorer. see [Factom Market Data Entry](https://explorer.factom.org/entry/bfa8626577553a90906246faf94bf02febad9697339993a942790dd3fb20f9c8)
* Acting as a smart contract oracle, see [Smart Contracts Article](https://www.factom.com/blog/smartcontract-factom-announce-collaboration)


## Prerequisites

* kdb+ v3.4 or higher
* [qutil](https://github.com/nugend/qutil) - Required if you wish to load the library using qutil.
  If not, an alternative method is provided. See below.
* A factomd client and wallet application for the library to communicate with.  

## Installing

To load using [qutil](https://github.com/nugend/qutil), follow the steps below.

Create a link named "qfactom" in the QPATH directory which points to qfactom/lib. This will enable .utl.require function to find the init.q file and load all q files. You can confirm the library is loaded correctly by checking that the .factomd and .factomwallet namespaces are present in the q session. The namespace name contains all supported v2 API calls for the associated application.

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


## Configure

By default, qfactom assumes the *factomd* and *factom-walletd* applications are running on your localhost server.
If they are hosted elsewhere, then run the following commands to change the default

    q).factomd.initHost["http://remotehost:8088/v2]       // Change factomd host location
    q).factomwallet.initHost["http://remotehost:8089/v2"]  // Change factom-walletd host location
    
If you are running *factomd* with username and password enabled, as shown below 

    ./factomd -rpcuser <username> -rpcpass <password>

Then run the following command to ensure the authentication credentials are passed on the API calls

    q).factomd.initPass[username;password]

An easy way to confirm that the hostname and authentication credentials are set up correctly, is to execute the "properties" function which will make a simple request for the version properties.

    q).factomd.properties[{x}]
    jsonrpc| "2.0"
    id     | 0f
    result | `factomdversion`factomdapiversion!("0.4.2.1";"2.0")

    q).factomwallet.properties[{x}]
    jsonrpc| "2.0"
    id     | 0f
    result | `walletversion`walletapiversion!("0.2.2.3";"2.0")


Incorrect username and password credentials will result in the following error

    q).factomd.properties[{x}]
    Error: illegal char U at 4 .Q.hp returned: 401 Unauthorized.


## Tests

[qspec](https://github.com/nugend/qspec) tests are currently under construction.  
See [Test Folder](https://github.com/jlucid/qfactom/tree/master/tests)


## License

This code is licensed under an MIT license.  See [LICENSE](https://github.com/jlucid/qfactom/blob/master/LICENSE) for
the full text.

## Contact

Jeremy Lucid  
jlucid@kx.com  
https://github.com/jlucid  




