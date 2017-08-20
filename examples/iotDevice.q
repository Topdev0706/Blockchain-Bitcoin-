.utl.require "qfactom"

// Load Sha256 hashing function
libPath:hsym `$getenv[`QFACTOM_HOME],"/utils/cryptoLib";
Sha256:libPath 2:(`Sha256;1)


// Define Chain Header
ecAddr:"EC2q1zuA8bnSgRNTfPSxTYnxRuLfaoiriCxjHJztfkPMkbgZ9pYW";
chainExternalIDs:("IoTDemo";"Publish Time: 1 min";"Publish secure: Sha256 applied to serialized data");
chainContentMsg:"Block entries correspond to the Sha256 hash of individual packets published periodically";


// Open a handle to the kdb+ process data will be published to
kdbProcess:@[hopen;5010;{[err] -2 err}];


// Create a new Factom chain
createChain:{[]
  externalIds:.factomd.util.hexEncodeString chainExternalIDs;
  content:.factomd.util.hexEncodeString chainContentMsg;
  out:.factomwallet.create_factom_chain[ecAddr;externalIds;content;{x}];
  out[`entryhash]
 }


// Generate random data, secure on factom, publish
publishIoTData:{[]
  publishTime:.z.t;
  publishDate:.z.d;
  publishData:(4#publishDate;4#.z.t;`S1`S2`S3`S4;4?100.0;4?2000.0);
  externalIds:.factomd.util.hexEncodeString ("Date: ",string[publishDate];"Time: ",string[publishTime];"Table: iotData");
  content:raze string Sha256 -8!publishData;
  .factomwallet.append_factom_chain[`.[`ecAddr];externalIds;content;`.[`chainID];{x}];
  kdbProcess("upd";`iotData;publishData)
 }

.z.ts:{[] 
  publishIoTData[]
 }

init:{[]
  entryHash:createChain[];
  @[`.;`chainID;:;.factomd.entry[entryHash;{x[`result][`chainid]}]];
  show `.[`chainID];
  system "sleep 60";
  value"\\t 60000"
 }

init[]
