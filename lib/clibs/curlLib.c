#define KXVER 3
#include <string.h>
#include <stdlib.h>
#include <curl/curl.h>
#include "k.h"

struct string {
    char *ptr;
    size_t length;
};

int initString(struct string *s)
{
    s->length = 0;
    s->ptr = malloc(s->length+1);
    if (s->ptr == NULL) 
        return 1;
    s->ptr[0] = '\0';
    return 0;
}

size_t writeFunc(void *buffer, size_t size, size_t nmemb, struct string *s)
{
    size_t new_len = s->length + size*nmemb;
    s->ptr = realloc(s->ptr, new_len+1);
    if (s->ptr == NULL)
        return 0;

    memcpy(s->ptr+s->length, buffer, size*nmemb);
    s->ptr[new_len] = '\0';
    s->length = new_len;
    return size*nmemb;
}

K request(K url, K params, K header, K tlsCert, K userPass)
{
    char error[CURL_ERROR_SIZE];
    char *hdr;
    struct string s;
    CURL *curl;

    // Return type error to q process if input args are not all symbols
    if(url->t != -KS || params->t != -KS || header->t != -KS || tlsCert->t != -KS || userPass->t != -KS) 
        return krr("Error curl: type");

    if(initString(&s))
        return krr("Error curl: malloc failed");

    hdr = strtok(header->s, ";");

    if(!(curl=curl_easy_init()))
        return krr("Error curl: easy_init");

    struct curl_slist *chunk = NULL;
    while(hdr!=NULL) {
        chunk = curl_slist_append(chunk, hdr);
        hdr = strtok(NULL, ";");
    }

    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0);
    // If tlsCert argument is not a null symbol, enable TLS

    if(0 != strlen(tlsCert->s)){
        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 1L);
        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 2L);
        curl_easy_setopt(curl, CURLOPT_CAINFO,        tlsCert->s);
    }

    // If userPass argument is not a null symbol, enable username password authentication
    if(0 != strlen(userPass->s)) 
        curl_easy_setopt(curl, CURLOPT_USERPWD,   userPass->s);

    curl_easy_setopt(curl, CURLOPT_URL,           url->s);
    curl_easy_setopt(curl, CURLOPT_ERRORBUFFER,   error);

    curl_easy_setopt(curl, CURLOPT_POSTFIELDS,    params->s);
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER,    chunk);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writeFunc);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA,     &s);

    if(CURLE_OK!=curl_easy_perform(curl))
        return krr(error);

    curl_easy_cleanup(curl);
    curl_slist_free_all(chunk);
    return kp(s.ptr);
}
