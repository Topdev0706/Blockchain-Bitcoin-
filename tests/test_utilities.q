.utl.require "qfactom"
.utl.require "qspec"


.tst.desc["Testing utility functions"]{
  should["Test hexEncodeString with single string input"]{
    "5465737420496e707574" musteq .factomd.util.hexEncodeString "Test Input"
  };
  should["Test hexEncodeString with list of string inputs"]{
    ("54657374204f6e65";"546573742054776f") musteq' .factomd.util.hexEncodeString ("Test One";"Test Two")
  };
  should["Test hexToAscii with single string input"]{
    "Test Input" musteq .factomd.util.hexToAscii "5465737420496e707574"
  };
  should["Test hexToAscii with list of string inputs"]{
    ("Test One";"Test Two") musteq' .factomd.util.hexToAscii ("54657374204f6e65";"546573742054776f")
  };
  should["Test base64Encode with first sample credentials"]{
    "dXNlcm5hbWU6cGFzc3dvcmQ=" musteq .factomd.util.base64Encode "username:password"
  };
  should["Test base64Encode with second sample credentials"]{
    "a2RiOnBhc3M=" musteq .factomd.util.base64Encode "kdb:pass"
  };
 }
