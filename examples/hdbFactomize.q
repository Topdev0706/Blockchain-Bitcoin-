.utl.require "qfactom"
\d .factomize

// Set the entry credit address which will be spent to make entries
ecAddr:"EC2q1zuA8bnSgRNTfPSxTYnxRuLfaoiriCxjHJztfkPMkbgZ9pYW"

// Set the chainID to which column hashes will be writen to
chainID:"384391a1390c4c8a77e5cafa79c2cc247ac72d6a212a131222ec8c3dfecc165d"

// Load a Sha256 function for performing the hash calculation
libPath:hsym `$getenv[`QFACTOM_HOME],"/lib/clibs/cryptoLib";
Sha256:libPath 2:(`Sha256;1)

// Extract column paths given HDB location, date and table name
getColPaths:{[HDBRoot;Date;Tbl]
  tblPath:("/" sv (HDBRoot;string[Date];string[Tbl])),"/";
  hsym `$tblPath,/:string each (cols `.[Tbl]) except (`date)
 }

// Serialize columns and compute the hash
computeColHash:{[colPaths]
  if[1~count colPaths;colPaths:enlist colPaths];
  colPaths!Sha256 each (-8!'get each colPaths)
 }

// Write an entry to the factom chain
chainAppend:{[Root;Date;Tbl;Entry]
  idFields:("PublishDateTime:",string[.z.p];"HDB:",Root;"Tbl:",string[Tbl];"HDBDate:",string[Date];"ColumnPath:",string[first Entry[0]]);
  .factomwallet.append_factom_chain[ecAddr;.factomd.util.hexEncodeString idFields;raze string[Entry[1]];chainID;{x}];
 }

// Function to be called at EOD to secure data partition data
factomizeHDB:{[HDBRoot;Date;Tbl]
  colPaths:getColPaths[HDBRoot;Date;Tbl];
  chainAppend[HDBRoot;Date;Tbl;]'[flip (key;value)@\:computeColHash[colPaths]]
 }

\d .
