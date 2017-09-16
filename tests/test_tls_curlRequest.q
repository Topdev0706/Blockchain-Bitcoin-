//////////////////////////////////
// To run this test, first start factomd 
// with tls enabled
// $./factomd -tls=true -selfaddr=domain.net,123.23.111.44
//////////////////////////////////
.utl.require "qfactom"
.utl.require "qspec"

.tst.certificatePath:"/root/.factom/m2/factomdAPIpub.cert"


.tst.desc["Test TLS enabling logic"]{
  alt{
   should["Confirm that by default .factomd.request is set to .factomd.qRequest"]{
     .factomd.request mustmatch .factomd.qRequest;
   };
   should["Confirm that on startup the tls file path is initially empty"]{
     "" mustmatch .factomd.tlsLookup[`factomd];
   };
   should["Confirm that tlsEnabled variable is 0b by default"]{
     0b musteq .factomd.tlsEnabled;
   };
   should["Confirm that connection attempt to factomd returns a dictionary"]{
     99h musteq type .factomd.properties[{x}];
   };
   should["Confirm that connection attempt to factomd returns a dictionary with key `error"]{
     `error musteq key .factomd.properties[{x}];
   };
   should["Confirm that error reason is close"]{
     "close" mustmatch .factomd.properties[{x[`error]}];
   };
  };
  alt{
   before{ 
     .factomd.initTLS[.tst.certificatePath]
   };
   should["Confirm that tlsLookup for factomd is no longer empty"]{
     "" mustnmatch .factomd.tlsLookup[`factomd];
   };
  };
  should["Confirm that TLS certificate file path for factomd is same as that passed to initTLS function"]{
    .tst.certificatePath mustmatch .factomd.tlsLookup[`factomd];
  };
  should["Confirm that tlsEnabled variable is 1b"]{
    1b musteq .factomd.tlsEnabled;
  };
  should["Confirm that .factomd.request has been set to .factomd.curlRequest"]{
    .factomd.request musteq .factomd.curlRequest;
  };
  should["Confirm that connection to factomd returned a dictionary"]{
    99h musteq type .factomd.properties[{x}];
  };
  should["Confirm that dictionary does not contain a key named `error"]{
    `error mustnin key .factomd.properties[{x}];
  };
  should["Confirm that dictionary contains key `result"]{
    `result mustin key .factomd.properties[{x}];
  };
 };
