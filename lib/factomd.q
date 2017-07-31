\d .factomd

hostLookup:()!();
hostLookup[`factomd]:`:http://localhost:8088/v2;
hostLookup[`wallet]:`:http://localhost:8089/v2;


defaultPayload:{
  (!) . (`jsonrpc`id`method`params;("2.0";0;"properties";""))
 }

getCmd:{[hostName;body]
  .j.k .Q.hg[hostName;"Content-Type: text/plain"] .j.j body
 }


postCmd:{[hostName;body]
  .j.k .Q.hp[hostName;"Content-Type: text/plain"] .j.j body
 }


directory_block:{[keyMerkleRoot;callback]
  body:defaultPayload[];
  body[`method]:"directory-block";
  body[`params]:(enlist `KeyMR)!(enlist keyMerkleRoot);
  callback postCmd[hostLookup[`factomd];body]
 }


directory_block_head:{[callback]
  body:defaultPayload[];
  body[`method]:"directory-block-head";
  callback postCmd[hostLookup[`factomd];body]
 }


heights:{[callback]
  body:defaultPayload[];
  body[`method]:"heights";
  callback postCmd[hostLookup[`factomd];body]
 }


raw_data:{[hash;callback]
  body:defaultPayload[];
  body[`method]:"raw-data";
  body[`params]:(enlist `hash)!(enlist hash);
  callback postCmd[hostLookup[`factomd];body]
 }


dblock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"dblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback postCmd[hostLookup[`factomd];body]
 }


ablock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"ablock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback postCmd[hostLookup[`factomd];body]
 }


ecblock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"ecblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback postCmd[hostLookup[`factomd];body]
 }


fblock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"fblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback postCmd[hostLookup[`factomd];body]
 }


receipt:{[hash;callback]
  body:defaultPayload[];
  body[`method]:"receipt";
  body[`params]:(enlist `hash)!(enlist hash);
  callback postCmd[hostLookup[`factomd];body]
  }


entry_block:{[keyMR;callback]
  body:defaultPayload[];
  body[`method]:"entry-block";
  body[`params]:(enlist `keyMR)!(enlist keyMR);
  callback postCmd[hostLookup[`factomd];body]
 }


entry:{[entryHash;callback]
  body:defaultPayload[];
  body[`method]:"entry";
  body[`params]:(enlist `Hash)!(enlist entryHash);
  callback postCmd[hostLookup[`factomd];body]
 }


pending_entries:{[callback]
  body:defaultPayload[];
  body[`method]:"pending-entries";
  body[`params]:()!();
  callback postCmd[hostLookup[`factomd];body]
 }


transaction:{[transactionHash;callback]
  body:defaultPayload[];
  body[`method]:"transaction";
  body[`params]:(enlist `hash)!(enlist transactionHash);
  callback postCmd[hostLookup[`factomd];body]
 }


factoid_ack:{[txID;callback]
  body:defaultPayload[];
  body[`method]:"factoid-ack";
  body[`params]:(enlist `TxID)!(enlist txID);
  callback postCmd[hostLookup[`factomd];body]
 }


entry_ack:{[txID;callback]
  body:defaultPayload[];
  body[`method]:"entry-ack";
  body[`params]:(enlist `TxID)!(enlist txID);
  callback postCmd[hostLookup[`factomd];body]
 }


pending_transactions:{[entryCreditAddress;callback]
  body:defaultPayload[];
  body[`method]:"pending-transactions";
  body[`params]:(enlist `Address)!(enlist entryCreditAddress);
  callback postCmd[hostLookup[`factomd];body]
 }


chain_head:{[chainID;callback]
  body:defaultPayload[];
  body[`method]:"chain-head";
  body[`params]:(enlist `ChainID)!(enlist chainID);
  callback postCmd[hostLookup[`factomd];body]
 }


entry_credit_balance:{[entryCreditAddress;callback]
  body:defaultPayload[];
  body[`method]:"entry-credit-balance";
  body[`params]:(enlist `address)!(enlist entryCreditAddress);
  callback postCmd[hostLookup[`factomd];body]
 }


factoid_balance:{[factoidAddress;callback]
  body:defaultPayload[];
  body[`method]:"factoid-balance";
  body[`params]:(enlist `address)!(enlist factoidAddress);
  callback postCmd[hostLookup[`factomd];body]
 }


entry_credit_rate:{[callback]
  body:defaultPayload[];
  body[`method]:"entry-credit-rate";
  callback postCmd[hostLookup[`factomd];body]
 }


properties:{[callback]
  body:defaultPayload[];
  callback postCmd[hostLookup[`factomd];body]
 }


factoid_submit:{[transactionHEX;callback]
  body:defaultPayload[];
  body[`method]:"factoid-submit";
  body[`params]:(enlist `transaction)!(enlist transactionHEX);
  callback postCmd[hostLookup[`factomd];body]
 }


commit_chain:{[commitChainHEX;callback]
  body:defaultPayload[];
  body[`method]:"commit-chain";
  body[`params]:(enlist `message)!(enlist commitChainHEX);
  callback postCmd[hostLookup[`factomd];body]
 }


reveal_chain:{[revealChainHEX;callback]
  body:defaultPayload[];
  body[`method]:"reveal-chain";
  body[`params]:(enlist `entry)!(enlist revealChainHEX);
  callback postCmd[hostLookup[`factomd];body]
 }


commit_entry:{[entryCommitHEX;callback]
  body:defaultPayload[];
  body[`method]:"commit-entry";
  body[`params]:(enlist `message)!(enlist entryCommitHEX);
  callback postCmd[hostLookup[`factomd];body]
 }


reveal_entry:{[revealEntryHEX;callback]
  body:defaultPayload[];
  body[`method]:"reveal-entry";
  body[`params]:(enlist `entry)!(enlist revealEntryHEX);
  callback postCmd[hostLookup[`factomd];body]
 }


\d .
