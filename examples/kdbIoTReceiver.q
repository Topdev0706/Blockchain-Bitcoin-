\p 5010

// Load Sha256 hashing function
libPath:hsym `$getenv[`QFACTOM_HOME],"/utils/cryptoLib";
Sha256:libPath 2:(`Sha256;1)

iotData:([] 
  publishDate:`date$();
  publishTime:`time$();
  source:`symbol$();
  val1:();
  val2:()
 )

upd:{[Table;Data]
  Table insert Data
 }

factomHash:{[Table] 
  Sha256 -8!value flip Table
 }

computeExpectedHash:{[]
  select expectedHash:factomHash ([]publishDate;publishTime;source;val1;val2) by publishTime from iotData
 }
