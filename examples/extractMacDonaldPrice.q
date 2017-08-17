.utl.require "qfactom"

/ Set chain head to the Intrinio McDonald's price chain
/ This is a delayed market data feed, giving the last price every 15 min

chainID:"0181d4011dda7f3f7dbcbdd7b66ea3be60261b096f7453152102afb95d258783"
chainHead:.factomd.chain_head[chainID;{x[`result][`chainhead]}]

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

extractChain:{[head] 
  result:.factomd.entry_block[head;{x[`result]}];
  if[(result~"") | (result[`header][`prevkeymr]~64#"0");:""];
  `entries insert result[`entrylist];
  jsonEntries:.factomd.util.hexToAscii .factomd.entry[;{x[`result][`content]}] each result[`entrylist][`entryhash];
  raw:@[.j.k;;`source`quote_date`data!("";"";enlist ((enlist `missing)!enlist 0n))] each jsonEntries;
  `quoteData insert delete data from update sym:{key first x }'[data],price:{value first x}'[data] from raw;
  result[`header][`prevkeymr]
 }

// The following iterate command will work back through the chain entry blocks until no previous block is found 
extractChain\[{not ""~x};chainHead];
