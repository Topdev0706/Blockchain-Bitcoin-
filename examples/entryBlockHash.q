.utl.require "qfactom"

libPath:hsym `$getenv[`QFACTOM_HOME],"utils/cryptoLib";
Sha256:libPath 2:(`Sha256;1)

blockHash:"a54792917ac6c174143a8093f6446c415d63810c6ee281fe512c52e6cdd12edc"

rawData:.factomd.raw_data[blockHash;{x[`result][`data]}]
Sha256 value "0x",rawData;
