.utl.require "qfactom"

/ Set chain head to the IoT demo chain

chainID:"f6b3c9ef3ff41fb29ce51811edf3bf104cc2f202df5f10341f6e8333658e3cf2"
chainHead:.factomd.chain_head[chainID;{x[`result][`chainhead]}]

entries:([]
  entryhash:();
  timestamp:()
 )

chainData:([]
  factomContent:();            
  factomTime:()      
 )

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
extractChain\[{not ""~x};chainHead];

chainData:`factomTime xasc chainData
