\d .factomd

util:enlist[`]!enlist[{}]

util[`hexEncodeString]:{[stringText] 
  $[0h~type stringText;raze each;raze] string `byte$stringText
 }

util[`hexToAscii]:{[hexString] 
  $[0h~type hexString;{`char$"X"$2 cut x}';`char$"X"$2 cut][hexString] 
 }

\d .
