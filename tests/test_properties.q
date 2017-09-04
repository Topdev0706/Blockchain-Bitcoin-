.utl.require "qfactom"
.utl.require "qspec"


.tst.desc["Testing connection to factomd and factom-walletd - Try both qRequest and curlRequest functions"]{
  before{ .factomd.request:.factomd.qRequest };
  should[".factomd.properties[] with .Q.hp -> Test output is of type dictionary"]{
    99h musteq type .factomd.properties[{x}];
  };
  should[".factomd.properties[] with .Q.hp -> Test output dictionary keys are as expected"]{
    `jsonrpc`id`result musteq' key .factomd.properties[{x}];
  };
  should[".factomd.properties[] with .Q.hp -> Test result element contains factomdversion and factomdapiversion keys"]{
    `factomdversion`factomdapiversion musteq' key .factomd.properties[{x[`result]}];
  };
  should[".factomwallet.properties[] with .Q.hp -> Test output is of type dictionary"]{
    99h musteq type .factomwallet.properties[{x}];
  };
  should[".factomwallet.properties[] with .Q.hp -> Test output dictionary keys are as expected"]{
    `jsonrpc`id`result musteq' key .factomwallet.properties[{x}];
  };
  should[".factomwallet.properties[] with .Q.hp -> Test result element contains walletversion and walletapiversion keys"]{
    `walletversion`walletapiversion musteq' key .factomwallet.properties[{x[`result]}];
  };
  alt{
   before{ .factomd.request:.factomd.curlRequest };
   should[".factomd.properties[] with curl-> Test output is of type dictionary"]{
     99h musteq type .factomd.properties[{x}];
   };
   should[".factomd.properties[] with curl -> Test output dictionary keys are as expected"]{
     `jsonrpc`id`result musteq' key .factomd.properties[{x}];
   };
   should[".factomd.properties[] with curl -> Test result element contains factomdversion and factomdapiversion keys"]{
     `factomdversion`factomdapiversion musteq' key .factomd.properties[{x[`result]}];
   };
   should[".factomwallet.properties[] with curl -> Test output is of type dictionary"]{
     99h musteq type .factomwallet.properties[{x}];
   };
   should[".factomwallet.properties[] with curl -> Test output dictionary keys are as expected"]{
     `jsonrpc`id`result musteq' key .factomwallet.properties[{x}];
   };
   should[".factomwallet.properties[] with curl -> Test result element contains walletversion and walletapiversion keys"]{
     `walletversion`walletapiversion musteq' key .factomwallet.properties[{x[`result]}];
   };
  };
 };
