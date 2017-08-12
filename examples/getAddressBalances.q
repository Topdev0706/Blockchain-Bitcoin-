.utl.require "qfactom"

/ Get table of Factoid and Entry Credit addresses from wallet
Addresses:.factomwallet.all_addresses[{x[`result][`addresses]}]

/ Request balance infromation from factom client 
getBalance:{x[`result][`balance]}

/ Update balance for Factoid addresses
update balance:.factomd.factoid_balance[;getBalance]'[public] from `Addresses where public like "FA*"

/ Update balance for Entry Credit addresses
update balance:.factomd.entry_credit_balance[;getBalance]'[public] from `Addresses where public like "EC*"
