.utl.require "qfactom"   // Or use \l factomLoad.q


/ Define a table schema to store wallet address information
Addresses:([]
  public:();
  secret:()
 )


/ Define a upd function to use as a callback
upd:{[Data]
  `Addresses insert Data[`result;`addresses];
 }

.factomwallet.all_addresses[upd]
