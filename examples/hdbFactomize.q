.utl.require "qfactom"
\d .factomize

ecAddr:
chainID:
libPath:hsym `$getenv[`QFACTOM_HOME],"/lib/clibs/cryptoLib";
Sha256:libPath 2:(`Sha256;1)

getColPaths:{[HDBRoot;Date;Tbl]
  tblPath:("/" sv (HDBRoot;string[Date];string[Tbl])),"/";
  hsym `$tblPath,/:string each (cols `.[Tbl]) except (`date)
 }

computeColHash:{[colPaths]
  if[1~count colPaths;colPaths:enlist colPaths];
  colPaths!Sha256 each (-8!'get each colPaths)
 }

chainAppend:{[Root;Date;Tbl;Entry]
  idFields:("PublishDateTime:",string[.z.p];"HDB:",Root;"Tbl:",string[Tbl];"HDBDate:",string[Date];"ColumnPath:",string[Entry[0]]);
  .factomwallet.append_factom_chain[ecAddr;.factomd.util.hexEncodeString idFields;string[Entry[1]];chainID;{x}];
 }

factomizeHDB:{[HDBRoot;Date;Tbl]
  colPaths:getColPaths[HDBRoot;Date;Tbl];
  chainAppend[HDBRoot;Date;Tbl;]'[flip (key;value)@\:computeColHash[colPaths]]
 }

\d .
