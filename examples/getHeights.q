.utl.require "qfactom"   // Or use \l factomLoad.q


/ Define a table schema to store blockchain height information
Heights:([]
  time:`time$();
  directoryblockheight:`float$();
  leaderheight:`float$();
  entryblockheight:`float$();
  entryheight:`float$();
  missingentrycount:`float$();
  entryblockdbheightprocessing:`float$();
  entryblockdbheightcomplete:`float$()
 )


/ Define a upd function to be used as a callback
upd:{[Data]
  `Heights insert Data[`result],(!) . enlist@'(`time;.z.t);
 }

.factomd.heights[upd]
