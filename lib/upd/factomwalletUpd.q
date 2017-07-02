\d .factomwallet


upd:enlist[`]!enlist[]


upd.Addresses:{[Data]
  @[`.factomwallet;`Addresses;:;Data[`result;`addresses]]
 }

upd.Transactions:{[Data]
  `.factomwallet.Transactions insert Data[`result]
 }

\d .
