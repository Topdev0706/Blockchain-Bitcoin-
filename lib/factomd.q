\d .factomd

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
 }


postCmd:{[appName;body]
  .j.k .Q.hp[hostLookup[appName];"Content-Type: text/plain"]  .j.j body
 }


directory_block:{[keyMerkleRoot;callback]
  body:defaultPayload[];
  body[`method]:"directory-block";
  body[`params]:(enlist `KeyMR)!(enlist keyMerkleRoot);
  callback postCmd[`factomd;body]
 }


directory_block_head:{[callback]
  body:defaultPayload[];
  body[`method]:"directory-block-head";
  callback postCmd[`factomd;body]
 }


heights:{[callback]
  body:defaultPayload[];
  body[`method]:"heights";
  callback postCmd[`factomd;body]
 }


raw_data:{[hash;callback]
  body:defaultPayload[];
  body[`method]:"raw-data";
  body[`params]:(enlist `hash)!(enlist hash);
  callback postCmd[`factomd;body]
 }


dblock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"dblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback postCmd[`factomd;body]
 }


ablock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"ablock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback postCmd[`factomd;body]
 }


ecblock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"ecblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback postCmd[`factomd;body]
 }


fblock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"fblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback postCmd[`factomd;body]
 }


receipt:{[hash;callback]
  body:defaultPayload[];
  body[`method]:"receipt";
  body[`params]:(enlist `hash)!(enlist hash);
  callback postCmd[`factomd;body]
  }


entry_block:{[keyMR;callback]
  body:defaultPayload[];
  body[`method]:"entry-block";
  body[`params]:(enlist `keyMR)!(enlist keyMR);
  callback postCmd[`factomd;body]
 }


entry:{[entryHash;callback]
  body:defaultPayload[];
  body[`method]:"entry";
  body[`params]:(enlist `Hash)!(enlist entryHash);
  callback postCmd[`factomd;body]
 }


pending_entries:{[callback]
  body:defaultPayload[];
  body[`method]:"pending-entries";
  body[`params]:()!();
  callback postCmd[`factomd;body]
 }


transaction:{[transactionHash;callback]
  body:defaultPayload[];
  body[`method]:"transaction";
  body[`params]:(enlist `hash)!(enlist transactionHash);
  callback postCmd[`factomd;body]
 }


factoid_ack:{[txID;callback]
  body:defaultPayload[];
  body[`method]:"factoid-ack";
  body[`params]:(enlist `TxID)!(enlist txID);
  callback postCmd[`factomd;body]
 }


entry_ack:{[txID;callback]
  body:defaultPayload[];
  body[`method]:"entry-ack";
  body[`params]:(enlist `TxID)!(enlist txID);
  callback postCmd[`factomd;body]
 }


pending_transactions:{[entryCreditAddress;callback]
  body:defaultPayload[];
  body[`method]:"pending-transactions";
  body[`params]:(enlist `Address)!(enlist entryCreditAddress);
  callback postCmd[`factomd;body]
 }


chain_head:{[chainID;callback]
  body:defaultPayload[];
  body[`method]:"chain-head";
  body[`params]:(enlist `ChainID)!(enlist chainID);
  callback postCmd[`factomd;body]
 }


entry_credit_balance:{[entryCreditAddress;callback]
  body:defaultPayload[];
  body[`method]:"entry-credit-balance";
  body[`params]:(enlist `address)!(enlist entryCreditAddress);
  callback postCmd[`factomd;body]
 }


factoid_balance:{[factoidAddress;callback]
  body:defaultPayload[];
  body[`method]:"factoid-balance";
  body[`params]:(enlist `address)!(enlist factoidAddress);
  callback postCmd[`factomd;body]
 }


entry_credit_rate:{[callback]
  body:defaultPayload[];
  body[`method]:"entry-credit-rate";
  callback postCmd[`factomd;body]
 }


properties:{[callback]
  body:defaultPayload[];
  callback postCmd[`factomd;body]
 }


factoid_submit:{[transactionHEX;callback]
  body:defaultPayload[];
  body[`method]:"factoid-submit";
  body[`params]:(enlist `transaction)!(enlist transactionHEX);
  callback postCmd[`factomd;body]
 }


commit_chain:{[commitChainHEX;callback]
  body:defaultPayload[];
  body[`method]:"commit-chain";
  body[`params]:(enlist `message)!(enlist commitChainHEX);
  callback postCmd[`factomd;body]
 }


reveal_chain:{[revealChainHEX;callback]
  body:defaultPayload[];
  body[`method]:"reveal-chain";
  body[`params]:(enlist `entry)!(enlist revealChainHEX);
  callback postCmd[`factomd;body]
 }


commit_entry:{[entryCommitHEX;callback]
  body:defaultPayload[];
  body[`method]:"commit-entry";
  body[`params]:(enlist `message)!(enlist entryCommitHEX);
  callback postCmd[`factomd;body]
 }


reveal_entry:{[revealEntryHEX;callback]
  body:defaultPayload[];
  body[`method]:"reveal-entry";
  body[`params]:(enlist `entry)!(enlist revealEntryHEX);
  callback postCmd[`factomd;body]
 }


\d .
