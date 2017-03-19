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


address:{[factoidAddress]
  body:defaultPayload[];
  body[`method]:"address";
  body[`params]:(enlist `address)!(enlist factoidAddress);
  getCmd[`wallet;body]
 };


all_addresses:{[]
  body:defaultPayload[];
  body[`method]:"all-addresses";
  body[`params]:"";
  getCmd[`wallet;body]
 };


generate_ec_address:{[]
  body:defaultPayload[];
  body[`method]:"generate-ec-address";
  body[`params]:"";
  getCmd[`wallet;body]
 };


generate_factoid_address:{[]
  body:defaultPayload[];
  body[`method]:"generate-factoid-address";
  body[`params]:"";
  getCmd[`wallet;body]
 };


get_height:{[]
  body:defaultPayload[];
  body[`method]:"get-height";
  body[`params]:"";
  getCmd[`wallet;body]
 };


import_addresses:{[privateAddresses]
  body:defaultPayload[];
  body[`method]:"import-addresses";

  if[10h~type privateAddresses & 52~count privateAddresses; 
      privateAddresses:enlist privateAddresses;
  ];

  if[0h~type privateAddresses; 
    body[`params]:(enlist `addresses)!enlist ({(enlist `secret)!(enlist x)} each privateAddresses);
  ];
  getCmd[`wallet;body]
 };


import_koinify:{[passPhrase]
  body:defaultPayload[];
  body[`method]:"import-koinify";
  body[`params]:(enlist `words)!(enlist passPhrase);
  getCmd[`wallet;body]
 };


wallet_backup:{[]
  body:defaultPayload[];
  body[`method]:"wallet-backup";
  body[`params]:"";
  getCmd[`wallet;body]
 };


tmp_transactions:{[]
  body:defaultPayload[];
  body[`method]:"tmp-transactions";
  body[`params]:"";
  postCmd[`wallet;body]
 };


delete_transaction:{[transactionName]
  body:defaultPayload[];
  body[`method]:"delete-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  getCmd[`wallet;body]
 };


new_transaction:{[transactionName]
  body:defaultPayload[];
  body[`method]:"new-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  getCmd[`wallet;body]
 };


add_input:{[transactionName;publicAddress;numFactoshis]
  body:defaultPayload[];
  body[`method]:"add-input";
  body[`params]:(`$"tx-name";`address;amount)!(transactionName;publicAddress;numFactoshis);
  postCmd[`wallet;body]
 };


add_output:{[transactionName;factoidAddress;numFactoshis]
  body:defaultPayload[];
  body[`method]:"add-output";
  body[`params]:(`$"tx-name";`address;amount)!(transactionName;factoidAddress;numFactoshis);
  postCmd[`wallet;body]
 };


add_ec_output:{[transactionName;entryCreditAddress;numFactoshis]
  body:defaultPayload[];
  body[`method]:"add-output";
  body[`params]:(`$"tx-name";`address;amount)!(transactionName;entryCreditAddress;numFactoshis);
  postCmd[`wallet;body]
 };


add_fee:{[transactionName;factoidAddress]
  body:defaultPayload[];
  body[`method]:"add-fee";
  body[`params]:(`$"tx-name";`address)!(transactionName;factoidAddress);
  postCmd[`wallet;body]
 };


sub_fee:{[transactionName;factoidAddress]
  body:defaultPayload[];
  body[`method]:"sub-fee";
  body[`params]:(`$"tx-name";`address)!(transactionName;factoidAddress);
  postCmd[`wallet;body]
 };


sign_transaction:{[transactionName]
  body:defaultPayload[];
  body[`method]:"sign-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  postCmd[`wallet;body]
 };


compose_transaction:{[transactionName]
  body:defaultPayload[];
  body[`method]:"compose-transaction";
  body[`params]:(enlist `$"tx-name")!(enlist transactionName);
  postCmd[`wallet;body]
 };


compose_chain:{[entryCreditAddress;exTids;Content]
   body:defaultPayload[];
   body[`method]:"compose-chain";

   firstEntry:enlist[`]!enlist[()];
   firstEntry[`extids]:exTids;
   firstEntry[`content]:Content;
   firstEntry:` _firstEntry;

   chain:(enlist `firstentry)!enlist firstEntry;

   body[`params]:`chain`ecpub!(chain;entryCreditAddress);
   postCmd[`wallet;body]
 };


commit_chain:{[message]
  body:defaultPayload[];
  body[`method]:"commit-chain";
  body[`params]:(enlist `message)!(enlist message);
  postCmd[`factomd;body]
 };


reveal_chain:{[entry]
  body:defaultPayload[];
  body[`method]:"reveal-chain";
  body[`params]:(enlist `entry)!(enlist entry);
  postCmd[`factomd;body]
 };


properties:{[]
  body:defaultPayload[];
  body[`method]:"properties";
  body[`params]:"";
  getCmd[`wallet;body]
 };

\d .
