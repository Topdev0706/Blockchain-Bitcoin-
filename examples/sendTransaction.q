.utl.require "qfactom"   // Or use \l factomLoad.q

/ Set your factoid input and output address
input:"FA2JBeFsF7tTaJuvAqrdsQqhJkGxdPGx65Ti83dxjK3rKt9L3ggR"
output:"FA2KJ1UiWWLxUG1oiGNkiij8NaFxuRAs2TF9DATgkiiHs2iVYeZW"
amount:100000
transactionName:"Test_One_Transaction"

/ Define a table schema to store Transaction information
Transactions:([]
  feespaid:();
  feesrequired:();
  signed:();
  name:();
  timestamp:();
  totalecoutputs:();
  totalinputs:();
  totaloutputs:();
  inputs:();
  outputs:();
  ecoutputs:();
  txid:()
 )

/ Define a upd function to pass as a  callback
upd:{[Data]
  `Transactions insert Data[`result]
 }

.factomwallet.trans_fact_fact[transactionName;input;output;amount;upd]
