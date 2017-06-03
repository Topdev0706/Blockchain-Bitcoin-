#include<stdlib.h>
#include<string.h>
#include<openssl/sha.h>
#include "k.h"

K sha256(K inputString)
{
  int i,numBytes = SHA256_DIGEST_LENGTH;
  int inputLength = inputString->n;
  unsigned char input[inputLength + 1];
  unsigned char output[numBytes];
  K outputHash = ktn(KG , numBytes);

  for(i=0; i<inputLength; i++)
    {
      input[i] = kC(inputString)[i];
    }

  SHA256(input, inputLength, output);

  for(i=0; i<numBytes; i++)
    {
      kG(outputHash)[i] = output[i];
    }
  return outputHash;
}
