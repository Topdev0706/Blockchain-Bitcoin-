loadFile:{value "\\l ",x}
$[not ""~getenv[`QFACTOM_HOME];
  [
   loadFile getenv[`QFACTOM_HOME],"lib/q.k";
   loadFile getenv[`QFACTOM_HOME],"lib/requests.q";
   loadFile getenv[`QFACTOM_HOME],"lib/utilities.q";
   loadFile getenv[`QFACTOM_HOME],"lib/tables.q";
   loadFile getenv[`QFACTOM_HOME],"lib/factomd.q";
   loadFile getenv[`QFACTOM_HOME],"lib/factomwallet.q";
  ];
  0N!"Error: QFACTOM_HOME not set - qfactom not loaded"
 ];
