\d .factomwallet


initHost:{[hostAddr]
  @[`.factomd;`hostLookup;,;(!) . enlist@'(`wallet;hostAddr)];
 }


initPass:{[hostPass]
  @[`.factomd;`passLookup;,;(!) . enlist@'(`wallet;.factomd.util[`base64Encode] hostPass)];
 }


defaultPayload:{
  (!) . (`jsonrpc`id`method`params;("2.0";0;"properties";""))
 }


timeout:$[.z.o in `w32`w64;"timeout 20 > NUL";.z.o in `l32`l65;"sleep 20";""]


address:{[factoidAddress;callback]
  body:defaultPayload[];
  body[`method]:"address";
  body[`params]:(enlist `address)!(enlist factoidAddress);
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


all_addresses:{[callback]
  body:defaultPayload[];
  body[`method]:"all-addresses";
  body[`params]:"";
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


generate_ec_address:{[callback]
  body:defaultPayload[];
  body[`method]:"generate-ec-address";
  body[`params]:"";
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


generate_factoid_address:{[callback]
  body:defaultPayload[];
  body[`method]:"generate-factoid-address";
  body[`params]:"";
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


get_height:{[callback]
  body:defaultPayload[];
  body[`method]:"get-height";
  body[`params]:"";
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


import_addresses:{[privateAddresses;callback]
  body:defaultPayload[];
  body[`method]:"import-addresses";
  if[10h~type privateAddresses & 52~count privateAddresses; 
      privateAddresses:enlist privateAddresses;
  ];
  if[0h~type privateAddresses; 
    body[`params]:(enlist `addresses)!enlist ({(enlist `secret)!(enlist x)} each privateAddresses);
  ];
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


import_koinify:{[passPhrase;callback]
  body:defaultPayload[];
  body[`method]:"import-koinify";
  body[`params]:(enlist `words)!(enlist passPhrase);
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


wallet_backup:{[callback]
  body:defaultPayload[];
  body[`method]:"wallet-backup";
  body[`params]:"";
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


tmp_transactions:{[callback]
  body:defaultPayload[];
  body[`method]:"tmp-transactions";
  body[`params]:"";
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


delete_transaction:{[transactionName;callback]
  body:defaultPayload[];
  body[`method]:"delete-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


new_transaction:{[transactionName;callback]
  body:defaultPayload[];
  body[`method]:"new-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }


add_input:{[transactionName;publicAddress;numFactoshis;callback]
  body:defaultPayload[];
  body[`method]:"add-input";
  body[`params]:(`$"tx-name";`address;`amount)!(transactionName;publicAddress;numFactoshis);
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


add_output:{[transactionName;factoidAddress;numFactoshis;callback]
  body:defaultPayload[];
  body[`method]:"add-output";
  body[`params]:(`$"tx-name";`address;`amount)!(transactionName;factoidAddress;numFactoshis);
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


add_ec_output:{[transactionName;entryCreditAddress;numFactoshis;callback]
  body:defaultPayload[];
  body[`method]:"add-ec-output";
  body[`params]:(`$"tx-name";`address;`amount)!(transactionName;entryCreditAddress;numFactoshis);
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


add_fee:{[transactionName;factoidAddress;callback]
  body:defaultPayload[];
  body[`method]:"add-fee";
  body[`params]:(`$"tx-name";`address)!(transactionName;factoidAddress);
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


sub_fee:{[transactionName;factoidAddress;callback]
  body:defaultPayload[];
  body[`method]:"sub-fee";
  body[`params]:(`$"tx-name";`address)!(transactionName;factoidAddress);
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


sign_transaction:{[transactionName;callback]
  body:defaultPayload[];
  body[`method]:"sign-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


compose_transaction:{[transactionName;callback]
  body:defaultPayload[];
  body[`method]:"compose-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


compose_chain:{[entryCreditAddress;exTids;Content;callback]
  body:defaultPayload[];
  body[`method]:"compose-chain";
  firstEntry:enlist[`]!enlist[()];
  firstEntry[`extids]:exTids;
  firstEntry[`content]:Content;
  firstEntry:` _firstEntry;
  chain:(enlist `firstentry)!enlist firstEntry;
  body[`params]:`chain`ecpub!(chain;entryCreditAddress);
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


compose_entry:{[entryCreditAddress;exTids;Content;chainID;callback]
  body:defaultPayload[];
  body[`method]:"compose-entry";
  entry:enlist[`]!enlist[()];
  entry[`chainid]:chainID;
  entry[`extids]:exTids;
  entry[`content]:Content;
  entry:` _entry;
  body[`params]:`entry`ecpub!(entry;entryCreditAddress);
  callback .Q.postCmd[.factomd.hostLookup[`wallet];body]
 }


checkTransError:{[output]
  $[`error in key output;
    [
     -2 "Transaction Error: ",(string output[`error][`code])," ", raze value (`code _ output[`error]);
     :1b
    ];
   :0b
  ]
 }


trans_fact_fact:{[txname;input;output;quantity;callback]
  Output:new_transaction[txname;callback];
  if[checkTransError[Output];:()];
  Output:add_input[txname;input;quantity;callback];
  if[checkTransError[Output];:()];
  Output:add_output[txname;output;quantity;callback];
  if[checkTransError[Output];:()];
  Output:sub_fee[txname;output;callback];
  if[checkTransError[Output];:()];
  sign_transaction[txname;callback];
  Output:compose_transaction[txname;{x}];
  hexString:Output[`result][`params][`transaction];
  .factomd.factoid_submit[hexString;{x}]
 }


trans_fact_ec:{[txname;input;outputEC;quantity;callback]
  Output:new_transaction[txname;callback];
  if[checkTransError[Output];:()];
  Output:add_input[txname;input;quantity;callback];
  if[checkTransError[Output];:()];
  Output:add_ec_output[txname;outputEC;quantity;callback];
  if[checkTransError[Output];:()];
  Output:add_fee[txname;input;callback];
  if[checkTransError[Output];:()];
  sign_transaction[txname;callback];
  Output:compose_transaction[txname;{x}];
  hexString:Output[`result][`params][`transaction];
  .factomd.factoid_submit[hexString;{x}]
 }
 

errorCheck:{[output]
  $[`error in key output;
    [
     -2 "Error Message: ",output[`error][`message];
     :1b
    ];    
   :0b
  ]
 } 


create_factom_chain:{[entryCreditAddress;externalIDStringList;contentsString;callback]
  composeChainResult:compose_chain[entryCreditAddress;externalIDStringList;contentsString;{x}];
  if[errorCheck[composeChainResult];:()];
  commitChainResult:.factomd.commit_chain[composeChainResult[`result][`commit][`params][`message];{x}];
  if[errorCheck[commitChainResult];:()];
  txid:commitChainResult[`result][`txid];
  system timeout; 
  revealChainResult:.factomd.reveal_chain[composeChainResult[`result][`reveal][`params][`entry];{x}];
  if[errorCheck[revealChainResult];:()];
  entryhash:revealChainResult[`result][`entryhash];
  callback `txid`entryhash!(txid;entryhash)  
 }	

 
append_factom_chain:{[entryCreditAddress;externalIDStringList;contentString;chainID;callback]
  composeEntryResult:compose_entry[entryCreditAddress;externalIDStringList;contentString;chainID;{x}];
  if[errorCheck[composeEntryResult];:()];
  commitEntryResult:.factomd.commit_entry[composeEntryResult[`result][`commit][`params][`message];{x}];
  if[errorCheck[commitEntryResult];()];
  txid:commitEntryResult[`result][`txid];
  system timeout;
  revealEntryResult:.factomd.reveal_entry[composeEntryResult[`result][`reveal][`params][`entry];{x}];
  if[errorCheck[revealEntryResult];()];
  entryhash:revealEntryResult[`result][`entryhash];
  callback `txid`entryhash!(txid;entryhash)  
 }
  
  
properties:{[callback]
  body:defaultPayload[];
  callback .Q.getCmd[.factomd.hostLookup[`wallet];body]
 }

\d .
