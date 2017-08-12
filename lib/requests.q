\d .Q

getCmd:{[hostName;body]
  .j.k @[.Q.hg[hostName;"Content-Type: text/plain"];.j.j body;{[err] -2 "Error: getCmd: ",err;:"{}"}]
 }

postCmd:{[hostName;body]
  .j.k @[.Q.hp[hostName;"Content-Type: text/plain"];.j.j body;{[err] -2 "Error: postCmd: ",err;:"{}"}]
 }

\d .
