
.utl.require "qfactom"

/ Set chain head to the Intrinio McDonald's price chain
/ This is a delayed market data feed, giving the last price every 15 min

chainID:"383d772059bbea739e28a0a9e8a36333de663a3654fd8e42c6cffab37d60cfde"
chainHead:.factomd.chain_head[chainID;{x[`result][`chainhead]}]


entries:([]
  entryhash:();
  timestamp:()
 )

quoteData:([]
  asks:();
  bids:();
  isFrozen:();
  seq:()
 )

hexToAscii:{[hex] `char$"X"$2 cut hex}

extractChain:{[head]
  result:.factomd.entry_block[head;{x[`result]}];
  if[result~"";:""];
  if[result[`header][`prevkeymr]~"0000000000000000000000000000000000000000000000000000000000000000";:""];
  `entries insert result[`entrylist];
  jsonEntries:hexToAscii each .factomd.entry[;{x[`result][`content]}] each result[`entrylist][`entryhash];
  @[insert[`quoteData;];t:exec .j.k each ReturnData from @[.j.k;;([]ReturnData:("{}";"{}"))] each jsonEntries;{[err] show err}];
  result[`header][`prevkeymr]
 }

// The following iterate command will work back through the chain entry blocks until no previous block is found
extractChain\[{not ""~x};chainHead];
