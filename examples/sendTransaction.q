.utl.require "qfactom"   // Or use \l factomLoad.q

/ Set your factoid input and output address
input:"FA2JBeFsF7tTaJuvAqrdsQqhJkGxdPGx65Ti83dxjK3rKt9L3ggR"
output:"FA2KJ1UiWWLxUG1oiGNkiij8NaFxuRAs2TF9DATgkiiHs2iVYeZW"
amount:100000
transactionName:"Test_One_Transaction"

.factomwallet.trans_fact_fact[transactionName;input;output;amount;{x}];

show flip 0!.factomwallet.Transactions
