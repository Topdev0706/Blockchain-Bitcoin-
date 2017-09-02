\d .factomd

curlLibPath:hsym `$getenv[`QFACTOM_HOME],"/utils/curlLib";
curl:curlLibPath 2:(`request;5)


qRequest:{[hostName;body]
  credentials:.factomd.util[`base64Encode] .factomd.passLookup[.factomd.hostLookup?hostName];
  out:@[.Q.hpfact[hostName;"Authorization: Basic ",credentials,";Content-Type: text/plain"];.j.j body;{[err] -2 "Error: postCmd: ",err;:"{}"}];
  @[.j.k;;{[out;err] -2 "Error: ",err," .Q.hp returned: ",out}[out;]] out 
 }

curlRequest:{[hostName;body]
   serviceName:.factomd.hostLookup?hostName;   
   header:`$"Content-Type: text/plain";
   body:`$.j.j body;
   tlsCert:`$.factomd.tlsLookup[serviceName];
   host:$[`~tlsCert;`$1 _string[hostName];`$1 _ssr[string[hostName];"http";"https"]];
   userpass:`$.factomd.passLookup[serviceName];
   out:@[.factomd.curl[host;body;header;tlsCert;];userpass;{[err] -2 "Error: curlRequest: ",err;:"{}"}];
   @[.j.k;;{[out;err] -2 "Error: ",err," .Q.hp returned: ",out}[out;]] out
 }

request:qRequest
\d .
