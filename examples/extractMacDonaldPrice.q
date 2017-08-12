.utl.require "qfactom"

/ Set chain head to the Intrinio McDonald's price chain
/ This is a delayed market data feed, giving the last price every 15 min

chainHead:"737606bad57cbd353ae5387651d5fbf0e35ab449d8a4c268806e1e6efe35ba83"

entries:([]
  entryhash:();
  timestamp:()
 )

quoteData:([]
  source:();            
  quote_date:();       
  sym:();
  price:()
 )

hexToAscii:{[hex] `char$"X"$2 cut hex}

extractChain:{[head] 
  result:.factomd.entry_block[head;{x[`result]}];
  if[result~"";:""];
  `entries insert result[`entrylist];
  jsonEntries:hexToAscii each .factomd.entry[;{x[`result][`content]}] each result[`entrylist][`entryhash];
  raw:@[.j.k;;`source`quote_date`data!("";"";enlist ((enlist `missing)!enlist 0n))] each jsonEntries;
  `quoteData insert delete data from update sym:{key first x }'[data],price:{value first x}'[data] from raw;
  result[`header][`prevkeymr]
 }

// The following iterate command will work back through the chain entry blocks until no previous block is found 
extractChain\[{not ""~x};chainHead];
