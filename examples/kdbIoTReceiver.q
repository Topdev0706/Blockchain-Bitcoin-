.utl.require "qfactom"
\p 5010

chainID:"f6b3c9ef3ff41fb29ce51811edf3bf104cc2f202df5f10341f6e8333658e3cf2"

// Load Sha256 hashing function

libPath:hsym `$getenv[`QFACTOM_HOME],"/lib/clibs/cryptoLib";
Sha256:libPath 2:(`Sha256;1)

// Define table schemas

iotData:([] 
  publishDate:`date$();
  publishTime:`time$();
  source:`symbol$();
  val1:();
  val2:()
 )

entries:([]
  entryhash:();
  timestamp:()
 )

chainData:([]
  factomContent:();            
  factomTime:()      
 )


// Define upd function to enable update

upd:{[Table;Data]
  Table insert Data
 }

factomHash:{[Table] 
  Sha256 -8!value flip Table
 }

computeExpectedHash:{[]
  select expectedHash:factomHash ([]publishDate;publishTime;source;val1;val2) by publishTime from iotData
 }
 
extractChain:{[head] 
  result:.factomd.entry_block[head;{x[`result]}];
  if[(result~"") | (result[`header][`prevkeymr]~64#"0");:""];
  `entries insert result[`entrylist];
  contents:value each "0x",/:.factomd.entry[;{x[`result][`content]}] each result[`entrylist][`entryhash];
  extids:.factomd.util.hexToAscii each .factomd.entry[;{x[`result][`extids]}] each result[`entrylist][`entryhash];
  factomTimes:"T"$last each " " vs' extids[;1];
  `chainData insert (contents;factomTimes);
  result[`header][`prevkeymr]
 }

// The following iterate command will work back through the chain entry blocks until no previous block is found 
extractChain\[{not ""~x};chinHead:.factomd.chain_head[chainID;{x[`result][`chainhead]}]];
chainData:`factomTime xasc chainData;
