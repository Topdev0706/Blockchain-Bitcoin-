\d .factomwallet

k).Q.hmb:{p:^/`$getenv`$_:\("HTTP";"NO"),\:"_PROXY";u:.Q.hap@-1!x;t:~(^*p)||/(*":"\:u 2)like/:{(("."=*x)#"*"),x}'","\:$p 1;a:$[t;p:.Q.hap@-1!*p;u]1;(4+*r ss d)_r:(-1!`$,/($[t;p;u]0 2))($y)," ",$[t;1_$x;u 3]," HTTP/1.1",s,(s/:("Connection: close";"Host: ",u 2),((0<#a)#,$[t;"Proxy-";""],"Authorization: Basic ",((-c)_.Q.b6@,/64\:'256/:'"i"$0N 3#a,c#0),(c:.q.mod[-#a;3])#"="),$[#z;,/(";" \: z 0;enlist "Content-length: ",$#z 1);()]),(d:s,s:"\r\n"),$[#z;z 1;""]}

k).Q.hg:{.Q.hmb[x;`GET;(y;z)]}
k).Q.hp:{.Q.hmb[x;`POST;(y;z)]}


hostLookup:()!();
hostLookup[`factomd]:`:http://localhost:8088/v2;
hostLookup[`wallet]:`:http://localhost:8089/v2;


defaultPayload:{
  payload:enlist[`]!enlist[()];
  payload[`jsonrpc]:"2.0";
  payload[`id]:0;
  payload[`method]:"properties";
  payload[`params]:"";
  1 _payload
 };


getCmd:{[appName;body]
  .j.k .Q.hg[hostLookup[appName];"Content-Type: text/plain"] .j.j body
 };


postCmd:{[appName;body]
  .j.k .Q.hp[hostLookup[appName];"Content-Type: text/plain"] .j.j body
 };


address:{[factoidAddress;callback]
  body:defaultPayload[];
  body[`method]:"address";
  body[`params]:(enlist `address)!(enlist factoidAddress);
  callback getCmd[`wallet;body]
 };


all_addresses:{[callback]
  body:defaultPayload[];
  body[`method]:"all-addresses";
  body[`params]:"";
  callback getCmd[`wallet;body]
 };


generate_ec_address:{[callback]
  body:defaultPayload[];
  body[`method]:"generate-ec-address";
  body[`params]:"";
  callback getCmd[`wallet;body]
 };


generate_factoid_address:{[callback]
  body:defaultPayload[];
  body[`method]:"generate-factoid-address";
  body[`params]:"";
  callback getCmd[`wallet;body]
 };


get_height:{[callback]
  body:defaultPayload[];
  body[`method]:"get-height";
  body[`params]:"";
  callback getCmd[`wallet;body]
 };


import_addresses:{[privateAddresses;callback]
  body:defaultPayload[];
  body[`method]:"import-addresses";

  if[10h~type privateAddresses & 52~count privateAddresses; 
      privateAddresses:enlist privateAddresses;
  ];

  if[0h~type privateAddresses; 
    body[`params]:(enlist `addresses)!enlist ({(enlist `secret)!(enlist x)} each privateAddresses);
  ];
  callback getCmd[`wallet;body]
 };


import_koinify:{[passPhrase;callback]
  body:defaultPayload[];
  body[`method]:"import-koinify";
  body[`params]:(enlist `words)!(enlist passPhrase);
  callback getCmd[`wallet;body]
 };


wallet_backup:{[callback]
  body:defaultPayload[];
  body[`method]:"wallet-backup";
  body[`params]:"";
  callback getCmd[`wallet;body]
 };


tmp_transactions:{[callback]
  body:defaultPayload[];
  body[`method]:"tmp-transactions";
  body[`params]:"";
  callback postCmd[`wallet;body]
 };


delete_transaction:{[transactionName;callback]
  body:defaultPayload[];
  body[`method]:"delete-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  callback getCmd[`wallet;body]
 };


new_transaction:{[transactionName;callback]
  body:defaultPayload[];
  body[`method]:"new-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  callback getCmd[`wallet;body]
 };


add_input:{[transactionName;publicAddress;numFactoshis;callback]
  body:defaultPayload[];
  body[`method]:"add-input";
  body[`params]:(`$"tx-name";`address;amount)!(transactionName;publicAddress;numFactoshis);
  callback postCmd[`wallet;body]
 };


add_output:{[transactionName;factoidAddress;numFactoshis;callback]
  body:defaultPayload[];
  body[`method]:"add-output";
  body[`params]:(`$"tx-name";`address;amount)!(transactionName;factoidAddress;numFactoshis);
  callback postCmd[`wallet;body]
 };


add_ec_output:{[transactionName;entryCreditAddress;numFactoshis;callback]
  body:defaultPayload[];
  body[`method]:"add-ec-output";
  body[`params]:(`$"tx-name";`address;amount)!(transactionName;entryCreditAddress;numFactoshis);
  callback postCmd[`wallet;body]
 };


add_fee:{[transactionName;factoidAddress;callback]
  body:defaultPayload[];
  body[`method]:"add-fee";
  body[`params]:(`$"tx-name";`address)!(transactionName;factoidAddress);
  callback postCmd[`wallet;body]
 };


sub_fee:{[transactionName;factoidAddress;callback]
  body:defaultPayload[];
  body[`method]:"sub-fee";
  body[`params]:(`$"tx-name";`address)!(transactionName;factoidAddress);
  callback postCmd[`wallet;body]
 };


sign_transaction:{[transactionName;callback]
  body:defaultPayload[];
  body[`method]:"sign-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  callback postCmd[`wallet;body]
 };


compose_transaction:{[transactionName;callback]
  body:defaultPayload[];
  body[`method]:"compose-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  callback postCmd[`wallet;body]
 };


compose_chain:{[entryCreditAddress;exTids;Content;callback]
   body:defaultPayload[];
   body[`method]:"compose-chain";

   firstEntry:enlist[`]!enlist[()];
   firstEntry[`extids]:exTids;
   firstEntry[`content]:Content;
   firstEntry:` _firstEntry;

   chain:(enlist `firstentry)!enlist firstEntry;

   body[`params]:`chain`ecpub!(chain;entryCreditAddress);
   callback postCmd[`wallet;body]
 };


commit_chain:{[message;callback]
  body:defaultPayload[];
  body[`method]:"commit-chain";
  body[`params]:(enlist `message)!(enlist message);
  callback postCmd[`factomd;body]
 };


reveal_chain:{[entry;callback]
  body:defaultPayload[];
  body[`method]:"reveal-chain";
  body[`params]:(enlist `entry)!(enlist entry);
  callback postCmd[`factomd;body]
 };


reveal_entry:{[entry;callback]
  body:defaultPayload[];
  body[`method]:"reveal-entry";
  body[`params]:(enlist `entry)!(enlist entry);
  callback postCmd[`factomd;body]
 };


compose_entry:{[entryCreditAddress;exTids;Content;chainID;callback]
   body:defaultPayload[];
   body[`method]:"compose-entry";

   entry:enlist[`]!enlist[()];
   entry[`chainid]:chainID;
   entry[`extids]:exTids;
   entry[`content]:Content;
   entry:` _entry;

   body[`params]:`entry`ecpub!(entry;entryCreditAddress);
   callback postCmd[`wallet;body]
 };


trans_fact_fact:{[txname;input;output;quantity;callback]
  Data:new_transaction[txname;{x}];
  Data:add_input[txname;input;quantity;{x}];
  Data:add_output[txname;output;quantity;{x}];
  Data:sub_fee[txname;output;{x}];
  Data:sign_transaction[txname;{x}];
  output:compose_transaction[txname;{x}];
  hexString:output[`result][`params][`transaction];
  callback .factomd.factoid_submit[hexString;{x}]
 };


trans_fact_ec:{[txname;input;outputEC;quantity;callback]
  Data:new_transaction[txname;{x}];
  Data:add_input[txname;input;quantity;{x}];
  Data:add_ec_output[txname;outputEC;quantity;{x}];
  Data:add_fee[txname;input;{x}];
  Data:sign_transaction[txname;{x}];
  output:compose_transaction[txname;{x}];
  hexString:output[`result][`params][`transaction];
  callback .factomd.factoid_submit[hexString;{x}]
 };
 
/////////////////////////////////////////////////////////////////////////////
// create_factom_chain[ecAddr;("Database Name";"Database Path";"Table Name";"datetime";"Authentication");"Each entry on this chain is the hash of a Table"]
////////////////////////////////////////////////////////////////////////////
create_factom_chain:{[entryCreditAddress;externalIDStringList;contentsString;callback]

  txid:entryhash:"Empty";	
  composeChainResult:compose_chain[entryCreditAddress;.util.asciiToHex each externalIDStringList;.util.asciiToHex contentsString;{x}];
  $[`error in key composeChainResult;
     [
      -2 "Error: compose_chain function call failed";
      -2 "Error Message: ",composeChainResult[`error][`message];
      :()
     ];
     -1 "Compose chain command successful"
  ];

  commitChainResult:.factomd.commit_chain[composeChainResult[`result][`commit][`params][`message];{x}];
  $[`error in key commitChainResult;
    [
     -2 "Error: commit_chain function call failed";
     -2 "Error Message: ",commitChainResult[`error][`message];
     :()
    ];
    [
     -1 commitChainResult[`result][`message];
     txid:commitChainResult[`result][`txid]
    ]
  ];
   
  revealChainResult:.factomd.reveal_chain[composeChainResult[`result][`reveal][`params][`entry];{x}];
  $[`error in key revealChainResult;
    [
     -2 "Error: reveal_chain function call failed";
     -2 "Error Message: ",revealChainResult[`error][`message];
     :()
    ];
    [
     -1 revealChainResult[`result][`message];
     entryhash:revealChainResult[`result][`entryhash]
    ]
  ];
  callback `txid`entryhash!(txid;entryhash)  
 };	
 
 
append_factom_chain:{[entryCreditAddress;externalIDStringList;contentString;chainID;callback]

  composeEntryResult:compose_entry[entryCreditAddress;.util.asciiToHex each externalIDStringList;contentString;chainID;{x}];
  $[`error in key composeEntryResult;
     [
      -2 "Error: compose_entry function call failed";
      -2 "Error Message: ",composeEntryResult[`error][`message];
      :()
     ];
     -1 "Compose entry command successful"
  ];
  
  commitEntryResult:.factomd.commit_entry[composeEntryResult[`result][`commit][`params][`message];{x}];
  $[`error in key commitEntryResult;
    [ 
     -2 "Error: commit_entry function call failed";
     -2 "Error Message: ",commitEntryResult[`error][`message];
     :()
    ];
    [
     -1 commitEntryResult[`result][`message];
     txid:commitEntryResult[`result][`txid]
    ]
  ];

  revealEntryResult:.factomd.reveal_entry[composeEntryResult[`result][`reveal][`params][`entry];{x}];
  $[`error in key revealEntryResult;
    [
     -2 "Error: reveal_entry function call failed";
     -2 "Error Message: ",revealEntryResult[`error][`message];
     :()
    ];
    [
     -1 revealEntryResult[`result][`message];
     entryhash:revealEntryResult[`result][`entryhash]
    ]
  ];
  callback `txid`entryhash!(txid;entryhash)  
 }
  
  
properties:{[callback]
  body:defaultPayload[];
  body[`method]:"properties";
  body[`params]:"";
  callback getCmd[`wallet;body]
 };

\d .
