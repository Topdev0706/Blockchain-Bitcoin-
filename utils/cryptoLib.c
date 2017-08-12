/* File name: cryptoLib.c */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <openssl/sha.h>
#include "k.h"

K Sha256(K inputString) {
  K outputHash;
  if(KG != inputString->t)
    return krr("type");
  outputHash= ktn(KG, SHA256_DIGEST_LENGTH);
  SHA256(kG(inputString), inputString->n, kG(outputHash));
  return outputHash;
}


K decodeToBytes(K inputString){
  size_t i = 0;
  int outputByteLength=64;
  const char *p = kG(inputString);
  K outputHash = ktn(KG, outputByteLength);

  for(i=0;i<outputByteLength;i++){
    sscanf(p,"%2hhx",&kG(outputHash)[i]);
    p+=2;
  }
  return outputHash;
}
