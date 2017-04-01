\d .util

hex:"0123456789abcdef";

decimalToHex:{[decimal]
  hex[16 vs/:decimal]
 }

asciiToHex:{[ascii]
  raze decimalToHex each 6h$ascii
 }

hexToAscii:{[hex]
  `char$"X"$2 cut hex
 }

\d .
