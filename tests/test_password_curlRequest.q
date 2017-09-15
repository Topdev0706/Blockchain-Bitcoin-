//////////////////////////////////
// To run this test, first start factomd with the 
// following username and password credentials
// $$./factomd -rpcuser testUser -rpcpass testPass
//////////////////////////////////
.utl.require "qfactom"
.utl.require "qspec"


.tst.desc["Test username and password authentication logic using curl request function"]{
  alt{
   before{ 
     .factomd.request:.factomd.curlRequest
   };
   should["Confirm that on startup the password value is an empty string for factomd"]{
     "" mustmatch .factomd.passLookup[`factomd];
   };
   should["Confirm that userpassEnabled variable is 0b by default"]{
     0b musteq .factomd.userpassEnabled;
   };
   should["Confirm that when connection to factomd fails a dictionary is returned"]{
     99h musteq type .factomd.properties[{x}];
   };
   should["Confirm that when connection to factomd fails the returned dictionary has key `error"]{
     `error musteq key .factomd.properties[{x}];
   };
   should["Confirm that when connection to factomd fails the reason is unauthorized"]{
     "401 Unauthorized.\n"  musteq .factomd.properties[{x[`error]}];
   };
  };
  alt{
   before{ 
     .factomd.initPass["testUser";"testPass"]
   };
   should["Confirm that password for factomd is not an empty string"]{
     "" mustnmatch .factomd.passLookup[`factomd];
   };
  };
  should["Confirm that password for factomd is the same as that passed to initPass function"]{
    "testUser:testPass" mustmatch .factomd.passLookup[`factomd];
  };
  should["Confirm that userpassEnabled variable is 1b"]{
    1b musteq .factomd.userpassEnabled;
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
