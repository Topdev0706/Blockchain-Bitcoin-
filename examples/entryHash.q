.utl.require "qfactom"
entryHash:"be9c9b0f0f5c43c69e120a07632da2bde722fa0c704b092bcdcfd3f57b8c661d"

libPath:hsym `$getenv[`QFACTOM_HOME],"utils/cryptoLib";
Sha256:libPath 2:(`Sha256;1)
Sha512:libPath 2:(`Sha512;1)

computeEntryHash:{[entry]
  entryHash:Sha256 (Sha512 entry),entry;
  entryHash
 }

// Retrieve an entry or transaction in raw format, the data is a hex encoded string.
rawData:.factomd.raw_data[entryHash;{x[`result][`data]}];
derivedEntryHash:computeEntryHash value "0x",rawData;

// Confirm that computeEntryHash logic is correct
derivedEntryHash~value "0x",entryHash
