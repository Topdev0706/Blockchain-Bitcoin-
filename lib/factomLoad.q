loadFile:{value "\\l ",x}
$[not ""~QFACTOM_HOME:getenv[`QFACTOM_HOME];
  [
   curlLibPath:hsym `$QFACTOM_HOME,"/lib/clibs/curlLib";
   .factomd.curl:.[2:;(curlLibPath;(`request;5));{[err] -2 "Warning -> Failed to load curl: ",err;:{[a;b;c;d;e] .j.j "curl not set,TLS not enabled"}}];
   loadFile QFACTOM_HOME,"/lib/q.k";
   loadFile QFACTOM_HOME,"/lib/requests.q";
   loadFile QFACTOM_HOME,"/lib/utilities.q";
   loadFile QFACTOM_HOME,"/lib/tables.q";
   loadFile QFACTOM_HOME,"/lib/factomd.q";
   loadFile QFACTOM_HOME,"/lib/factomwallet.q";
  ];
  [
   -2 "Error -> Environmental variable QFACTOM_HOME not set";
   exit 1
  ]
 ];
