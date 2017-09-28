.utl.require "qfactom"
\c 2000 2000

monitorAddr:"EC2q1zuA8bnSgRNTfPSxTYnxRuLfaoiriCxjHJztfkPMkbgZ9pYW"   // Entry Credit address to monitor and top up
factoidAddr:"FA2JBeFsF7tTaJuvAqrdsQqhJkGxdPGx65Ti83dxjK3rKt9L3ggR"   // Factoid address used to top up entry credit address

triggerBalance:100                                                   // Entry Credit Balance below which the top up will trigger 
topupAmount:10                                                       // Entry Credit top up amount, to be specified in entry credit units
currentECBalance:0f                                                  // Variable used to store current Entry Credit balance
currentECRate:4500f                                                  // Variable used to store current Entry Credit rate
checkFrequency:string[value"\\t"],"ms";                              // Variable used to store timer frequency (-t) passed at run time


printMsg:{[Message]
  -1 string[.z.p]," ",Message;
 }


throwError:{[ErrorMessage]
  -2 string[.z.p]," ",ErrorMessage;
  (!) . enlist@'(`error;ErrorMessage)
 }


getBalance:{[Address]
  prefix:2#Address;
  $["EC"~prefix;
    .factomd.entry_credit_balance[Address;{x[`result]}];
    "FA"~prefix;
    .factomd.factoid_balance[Address;{x[`result]}];
    throwError["Error checkBalance: Address prefix not FA or EC -> ",prefix]
  ]
 }


.z.ts:{

  return:.factomd.entry_credit_rate[{x[`result]}];
  $[`error in key return;
    -2"Error ,"return[`error];
    [
      @[`.;`currentECRate;:;return[`rate]];
      printMsg["Current EC Rate:",string[currentECRate]];
    ]
  ];

  return:getBalance[monitorAddr];
  $[`error in key return;
    -2"Error ,"return[`error];
    [
      @[`.;`currentECBalance;:;return[`balance]];
      printMsg["Current Balance:",string[currentECBalance]," Trigger:",string[triggerBalance]," Freq:",checkFrequency];
    ]
  ];

  status:.factomd.pending_transactions[monitorAddr;{x[`result]}];
  if[not ()~status;
    printMsg["Pending topUp transaction: ",(last status)[`TransactionID]]
  ];

  if[(currentECBalance<triggerBalance) & (not `error in key return) & (()~status);
    printMsg["Warning! Current Balance:",string[currentECBalance]," Trigger:",string[triggerBalance]];
    trans:.factomwallet.trans_fact_ec["TX_",string[`long$.z.p];factoidAddr;monitorAddr;currentECRate*topupAmount;{x[`result]}];
    $[`error in key trans;
      -2 "Error ",$[99h~type trans[`error];trans[`error][`data];trans[`error]];
      printMsg[trans[`message]]
    ] 
  ];
 } 
