/* File name: cryptoLib.c */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <openssl/sha.h>
#include "k.h"

K Sha256(K inputBytes)
{
    K outputHash;
    if(KG != inputBytes->t)
        return krr("type");
    outputHash= ktn(KG, SHA256_DIGEST_LENGTH);
    SHA256(kG(inputBytes), inputBytes->n, kG(outputHash));
    return outputHash;
}

K Sha512(K inputBytes)
{
    K outputHash;
    if(KG != inputBytes->t)
        return krr("type");
    outputHash= ktn(KG, SHA512_DIGEST_LENGTH);
    SHA512(kG(inputBytes), inputBytes->n, kG(outputHash));
    return outputHash;
}


K decodeToBytes(K inputString)
{
    if(KC != inputString->t)
        return krr("type");
    size_t i = 0;
    int outputByteLength=64;
    const unsigned char *p = kG(inputString);
    K outputHash = ktn(KG, outputByteLength);

    for(i=0; i<outputByteLength; i++) {
        sscanf((char *)p,"%2hhx",&kG(outputHash)[i]);
        p+=2;
    }
    return outputHash;
}
