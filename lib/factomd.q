\d .factomd


hostLookup:`factomd`wallet!`$":http://localhost:",/:("8088/v2";"8089/v2")
passLookup:`factomd`wallet!("";"")


initHost:{[hostAddr]
  @[`.factomd;`hostLookup;,;(!) . enlist@'(`factomd;hostAddr)];
 }


initPass:{[hostPass]
  @[`.factomd;`passLookup;,;(!) . enlist@'(`factomd;.factomd.util[`base64Encode] hostPass)];
 }


defaultPayload:{
  (!) . (`jsonrpc`id`method`params;("2.0";0;"properties";""))
 }


directory_block:{[keyMerkleRoot;callback]
  body:defaultPayload[];
  body[`method]:"directory-block";
  body[`params]:(enlist `KeyMR)!(enlist keyMerkleRoot);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


directory_block_head:{[callback]
  body:defaultPayload[];
  body[`method]:"directory-block-head";
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


heights:{[callback]
  body:defaultPayload[];
  body[`method]:"heights";
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


raw_data:{[hash;callback]
  body:defaultPayload[];
  body[`method]:"raw-data";
  body[`params]:(enlist `hash)!(enlist hash);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


dblock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"dblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


ablock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"ablock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


ecblock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"ecblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


fblock_by_height:{[height;callback]
  body:defaultPayload[];
  body[`method]:"fblock-by-height";
  body[`params]:(enlist `height)!(enlist height);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


entrycredit_block:{[keyMR;callback]
  body:defaultPayload[];
  body[`method]:"entrycredit-block";
  body[`params]:(enlist `keyMR)!(enlist keyMR);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


factoid_block:{[keyMR;callback]
  body:defaultPayload[];
  body[`method]:"factoid-block";
  body[`params]:(enlist `keyMR)!(enlist keyMR);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


receipt:{[hash;callback]
  body:defaultPayload[];
  body[`method]:"receipt";
  body[`params]:(enlist `hash)!(enlist hash);
  callback .Q.postCmd[hostLookup[`factomd];body]
  }


admin_block:{[keyMR;callback]
  body:defaultPayload[];
  body[`method]:"admin-block";
  body[`params]:(enlist `keyMR)!(enlist keyMR);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


entry_block:{[keyMR;callback]
  body:defaultPayload[];
  body[`method]:"entry-block";
  body[`params]:(enlist `keyMR)!(enlist keyMR);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


entry:{[entryHash;callback]
  body:defaultPayload[];
  body[`method]:"entry";
  body[`params]:(enlist `Hash)!(enlist entryHash);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


pending_entries:{[callback]
  body:defaultPayload[];
  body[`method]:"pending-entries";
  body[`params]:()!();
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


transaction:{[transactionHash;callback]
  body:defaultPayload[];
  body[`method]:"transaction";
  body[`params]:(enlist `hash)!(enlist transactionHash);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


ack:{[hash;chainid;callback]
  body:defaultPayload[];
  body[`method]:"ack";
  body[`params]:(`hash`chainid)!(hash;chainid);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }

factoid_ack:{[txID;callback]
  body:defaultPayload[];
  body[`method]:"factoid-ack";
  body[`params]:(enlist `TxID)!(enlist txID);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


entry_ack:{[txID;callback]
  body:defaultPayload[];
  body[`method]:"entry-ack";
  body[`params]:(enlist `TxID)!(enlist txID);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


pending_transactions:{[entryCreditAddress;callback]
  body:defaultPayload[];
  body[`method]:"pending-transactions";
  body[`params]:(enlist `Address)!(enlist entryCreditAddress);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


chain_head:{[chainID;callback]
  body:defaultPayload[];
  body[`method]:"chain-head";
  body[`params]:(enlist `ChainID)!(enlist chainID);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


entry_credit_balance:{[entryCreditAddress;callback]
  body:defaultPayload[];
  body[`method]:"entry-credit-balance";
  body[`params]:(enlist `address)!(enlist entryCreditAddress);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


factoid_balance:{[factoidAddress;callback]
  body:defaultPayload[];
  body[`method]:"factoid-balance";
  body[`params]:(enlist `address)!(enlist factoidAddress);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


entry_credit_rate:{[callback]
  body:defaultPayload[];
  body[`method]:"entry-credit-rate";
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


properties:{[callback]
  body:defaultPayload[];
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


factoid_submit:{[transactionHEX;callback]
  body:defaultPayload[];
  body[`method]:"factoid-submit";
  body[`params]:(enlist `transaction)!(enlist transactionHEX);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


commit_chain:{[commitChainHEX;callback]
  body:defaultPayload[];
  body[`method]:"commit-chain";
  body[`params]:(enlist `message)!(enlist commitChainHEX);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


reveal_chain:{[revealChainHEX;callback]
  body:defaultPayload[];
  body[`method]:"reveal-chain";
  body[`params]:(enlist `entry)!(enlist revealChainHEX);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


commit_entry:{[entryCommitHEX;callback]
  body:defaultPayload[];
  body[`method]:"commit-entry";
  body[`params]:(enlist `message)!(enlist entryCommitHEX);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


reveal_entry:{[revealEntryHEX;callback]
  body:defaultPayload[];
  body[`method]:"reveal-entry";
  body[`params]:(enlist `entry)!(enlist revealEntryHEX);
  callback .Q.postCmd[hostLookup[`factomd];body]
 }


\d .
