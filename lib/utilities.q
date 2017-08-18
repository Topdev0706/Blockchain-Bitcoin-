\d .factomd

util:enlist[`]!enlist[{}]

util[`hexEncodeString]:{[stringText] 
  $[0h~type stringText;raze each;raze] string `byte$stringText
 }

util[`hexToAscii]:{[hexString] 
  $[0h~type hexString;{`char$"X"$2 cut x}';`char$"X"$2 cut][hexString] 
 }

util[`base64Encode]:{[String]
  if[not count String;:""];
  remainder:count[String]mod 3;
  pc:count p:(0x;0x0000;0x00)remainder;
  b:.Q.b6 2 sv/: 6 cut raze 0b vs/: String,p;
  first 76 cut(neg[pc] _ b),pc#"="
 }

\d .
