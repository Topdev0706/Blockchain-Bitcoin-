.utl.require "qfactom"
.utl.require "qspec"


// Load functions from cryptoLib shared object
libPath:hsym `$getenv[`QFACTOM_HOME],"utils/cryptoLib";
Sha256:libPath 2:(`Sha256;1)
Sha512:libPath 2:(`Sha512;1)
decodeToBytes:libPath 2:(`decodeToBytes;1)


// Set input and output samples for tests
.tst.Sha256Input:0xbe9c9b0f0f5c43c69e120a07632da2bde722fa0c704b092bcdcfd3f57b8c661d
.tst.Sha256Output:0x9e9c9712e008874ecadbdfd4acce7eb5624b4a7227e7e7a1d8cdc4c969f0c3bd
.tst.Sha512Input:0xbe9c9b0f0f5c43c69e120a07632da2bde722fa0c704b092bcdcfd3f57b8c661d
.tst.Sha512Output:0x1434122246afe4b661855d2c743f871c2f0e7b5cd0bd19f57e6c005d3fdeb077972503bc348727e012a520bd7902daeabcde02e535c1e31b1310c23348a9455c
.tst.decodeInput:"a845276339eccc5c4b27464b0a07d71bffc8530d84d4aedd93dd29370f11e2a5e759271f91cd81c31645a95fef73944048734152e544daf178af0e54551c2c3f"
.tst.decodeOutput:0xa845276339eccc5c4b27464b0a07d71bffc8530d84d4aedd93dd29370f11e2a5e759271f91cd81c31645a95fef73944048734152e544daf178af0e54551c2c3f


// Test input and output along with error handling
.tst.desc["Testing cryptoLib functions"]{
  should["Test Sha256 func returns a type error for string input type"]{
    "type" musteq @[Sha256;"Input";{[err] :err}];
  };
  should["Test Sha256 func returns correct output for byte input"]{
    .tst.Sha256Output musteq Sha256 .tst.Sha256Input;
  };
  should["Test Sha512 func returns a type error for string input type"]{
    "type" musteq @[Sha512;"Input";{[err] :err}];
  };
  should["Test Sha512 func returns correct output for byte input"]{
    .tst.Sha512Output musteq Sha512 .tst.Sha512Input;
  };
  should["Test decodeToBytes func returns a type error for non string input"]{
    "type" musteq @[decodeToBytes;`Input;{[err] :err}];
  };
  should["Test decodeToBytes func returns correct output for string input"]{
    .tst.decodeOutput musteq decodeToBytes .tst.decodeInput;
  };
 }
