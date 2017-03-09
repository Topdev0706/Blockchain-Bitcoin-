\d .factomd

k).Q.hmb:{p:^/`$getenv`$_:\("HTTP";"NO"),\:"_PROXY";u:.Q.hap@-1!x;t:~(^*p)||/(*":"\:u 2)like/:{(("."=*x)#"*"),x}'","\:$p 1;a:$[t;p:.Q.hap@-1!*p;u]1;(4+*r ss d)_r:(-1!`$,/($[t;p;u]0 2))($y)," ",$[t;1_$x;u 3]," HTTP/1.1",s,(s/:("Connection: close";"Host: ",u 2),((0<#a)#,$[t;"Proxy-";""],"Authorization: Basic ",((-c)_.Q.b6@,/64\:'256/:'"i"$0N 3#a,c#0),(c:.q.mod[-#a;3])#"="),$[#z;,/(";" \: z 0;enlist "Content-length: ",$#z 1);()]),(d:s,s:"\r\n"),$[#z;z 1;""]}

k).Q.hp:{.Q.hmb[x;`POST;(y;z)]}

defaultPayload:{
  payload:enlist[`]!enlist[()];
  payload[`jsonrpc]:"2.0";
  payload[`id]:0;
  payload[`method]:"properties";
  payload[`params]:"";
  1 _payload
 };


postCmd:{[body]
  .j.k .Q.hp[`:http://localhost:8088/v2;"Content-Type: text/plain"]  .j.j body
 }; 


directory_block:{[keyMerkleRoot]
  body:defaultPayload[];
  body[`method]:"directory-block";
  body[`params]:(enlist `KeyMR)!(enlist keyMerkleRoot);
  postCmd[body]
 };


directory_block_head:{[]
  body:defaultPayload[];
  body[`method]:"directory-block-head";
  postCmd[body]
 };


heights:{[]
  body:defaultPayload[];
  body[`method]:"heights";
  postCmd[body]
 };


raw_data:{[hash]
  body:defaultPayload[];
  body[`method]:"raw-data";
  body[`params]:(enlist `hash)!(enlist hash);
  postCmd[body]
 };


dblock_by_height:{[height]
  body:defaultPayload[];
  body[`method]:"dblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  postCmd[body]
 };


ablock_by_height:{[height]
  body:defaultPayload[];
  body[`method]:"ablock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  postCmd[body]
 };


ecblock_by_height:{[height]
  body:defaultPayload[];
  body[`method]:"ecblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  postCmd[body]
 };


fblock_by_height:{[height]
  body:defaultPayload[];
  body[`method]:"fblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  postCmd[body]
 };


receipt:{[merkleRootKey]
  body:defaultPayload[];
  body[`method]:"receipt";
  body[`params]:(enlist `hash)!(enlist merkleRootKey);
  postCmd[body]
 };


entry:{[entryHash]
  body:defaultPayload[];
  body[`method]:"entry";
  body[`params]:(enlist `Hash)!(enlist entryHash);
  postCmd[body]
 };



pending_entries:{[transactionHash]
  body:defaultPayload[];
  body[`method]:"pending-entries";
  body[`params]:()!();
  postCmd[body]
 };


transaction:{[transactionHash]
  body:defaultPayload[];
  body[`method]:"transaction";
  body[`params]:(enlist `hash)!(enlist transactionHash);
  postCmd[body]
 };


factoid_ack:{[txID]
  body:defaultPayload[];
  body[`method]:"factoid-ack";
  body[`params]:(enlist `TxID)!(enlist txID);
  postCmd[body]
 };


entry_ack:{[txID]
  body:defaultPayload[];
  body[`method]:"entry-ack";
  body[`params]:(enlist `TxID)!(enlist txID);
  postCmd[body]
 };


pending_transactions:{[entryCreditAddress]
  body:defaultPayload[];
  body[`method]:"pending-transactions";
  body[`params]:(enlist `Address)!(enlist entryCreditAddress);
  postCmd[body]
 };


chain_head:{[chainID]
  body:defaultPayload[];
  body[`method]:"chain-head";
  body[`params]:(enlist `ChainID)!(enlist chainID);
  postCmd[body]
 };


entry_credit_balance:{[entryCreditAddress]
  body:defaultPayload[];
  body[`method]:"entry-credit-balance";
  body[`params]:(enlist `address)!(enlist entryCreditAddress);
  postCmd[body]
 };


factoid_balance:{[factoidAddress]
  body:defaultPayload[];
  body[`method]:"factoid-balance";
  body[`params]:(enlist `address)!(enlist factoidAddress);
  postCmd[body]
 };


entry_credit_rate:{[]
  body:defaultPayload[];
  body[`method]:"entry-credit-rate";
  postCmd[body]
 };


properties:{[]
  body:defaultPayload[];
  postCmd[body]
 };


factoid_submit:{[transactionHEX]
  body:defaultPayload[];
  body[`method]:"factoid-submit";
  body[`params]:(enlist `transaction)!(enlist transactionHEX);
  postCmd[body]
 };


commit_chain:{[commitChainHEX]
  body:defaultPayload[];
  body[`method]:"commit-chain";
  body[`params]:(enlist `message)!(enlist commitChainHEX);
  postCmd[body]
 };


reveal_chain:{[revealChainHEX]
  body:defaultPayload[];
  body[`method]:"reveal-chain";
  body[`params]:(enlist `entry)!(enlist revealChainHEX);
  postCmd[body]
 };


commit_entry:{[entryCommitHEX]
  body:defaultPayload[];
  body[`method]:"commit-entry";
  body[`params]:(enlist `message)!(enlist entryCommitHEX);
  postCmd[body]
 };


reveal_entry:{[revealEntryHEX]
  body:defaultPayload[];
  body[`method]:"reveal-entry";
  body[`params]:(enlist `entry)!(enlist revealEntryHEX);
  postCmd[body]
 };


\d .
