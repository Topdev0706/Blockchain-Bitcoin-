asciiToHex:{[ascii]
  hex:"0123456789abcdef";
  hd:{hex[16 vs/:x]};
  raze hd each 6h$ascii
 }
