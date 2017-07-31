\d .Q

getCmd:{[hostName;body]
  .j.k .Q.hg[hostName;"Content-Type: text/plain"] .j.j body
 }

postCmd:{[hostName;body]
  .j.k .Q.hp[hostName;"Content-Type: text/plain"] .j.j body
 }

\d .
