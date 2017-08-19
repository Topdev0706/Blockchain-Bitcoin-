\d .Q

getCmd:{[hostName;body]
  credentials:.factomd.passLookup[.factomd.hostLookup?hostName];
  out:@[.Q.hgfact[hostName;"Authorization: Basic ",credentials,";Content-Type: text/plain"];.j.j body;{[err] -2 "Error: getCmd: ",err;:"{}"}];
  @[.j.k;;{[out;err] -2 "Error: ",err," .Q.hg returned: ",out}[out;]] out 
 }

postCmd:{[hostName;body]
  credentials:.factomd.passLookup[.factomd.hostLookup?hostName];
  out:@[.Q.hpfact[hostName;"Authorization: Basic ",credentials,";Content-Type: text/plain"];.j.j body;{[err] -2 "Error: postCmd: ",err;:"{}"}];
  @[.j.k;;{[out;err] -2 "Error: ",err," .Q.hp returned: ",out}[out;]] out 
 }

\d .
