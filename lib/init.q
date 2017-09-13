curlLibPath:`$string[.utl.PKGSLOADED["qfactom"]],"/clibs/curlLib";
.factomd.curl:.[2:;(curlLibPath;(`request;5));{[err] -2 "Warning -> Failed to load curl: ",err;:{[a;b;c;d;e] .j.j "curl not set,TLS not enabled"}}];
.utl.require .utl.PKGLOADING,"/q.k"
.utl.require .utl.PKGLOADING,"/requests.q"
.utl.require .utl.PKGLOADING,"/utilities.q"
.utl.require .utl.PKGLOADING,"/tables.q"
.utl.require .utl.PKGLOADING,"/factomd.q"
.utl.require .utl.PKGLOADING,"/factomwallet.q"
