Bitcoin Core version 0.13.3 is now available from:

https://bitcoincore.org/bin/bitcoin-core-0.13.3/

This is a new minor version release, including the implementation of a development fund, various bugfixes and performance improvements, as well as updated translations.

Please report bugs using the issue tracker at GitHub:

https://github.com/bitcoin/bitcoin/issues

To receive security and update notifications, please subscribe to:

https://bitcoincore.org/en/list/announcements/join/

Compatibility
==============

Microsoft ended support for Windows XP on April 8th, 2014,
an OS initially released in 2001. This means that not even critical security
updates will be released anymore. Without security updates, using a bitcoin
wallet on a XP machine is irresponsible at least.

In addition to that, with 0.12.x there have been varied reports of Bitcoin Core
hanging on Windows XP. It is not clear what the source of these hangs is, but it is
likely that upstream libraries such as Qt are no longer being tested on XP.

We do not have time nor resources to provide support for an OS that is
end-of-life. From 0.13.0 on, Windows XP is no longer supported. Users are
suggested to upgrade to a newer version of Windows, or install an alternative OS
that is supported.

No attempt is made to prevent installing or running the software on Windows XP,
you can still do so at your own risk, but do not expect it to work: do not
report issues about Windows XP to the issue tracker.

From 0.13.1 onwards OS X 10.7 is no longer supported. 0.13.0 was intended to work on 10.7+,
but severe issues with the libc++ version on 10.7.x keep it from running reliably.
0.13.1 now requires 10.8+, and will communicate that to 10.7 users, rather than crashing unexpectedly.

Notable changes
===============

Development Fund Implementation
------------------------------

A development fund has been implemented to support ongoing development of the software. The fund allocates 20% of the block reward to specific addresses within defined block ranges:

- Mainnet: Blocks 365000-3547800
- Testnet: Blocks 90650-3547800
- Regtest: Blocks 1-150

The development fund addresses are as follows:

**Mainnet**:
- 3P3UvT6vdDJVrbB2mn6WrP8gywpu2Knx8C
- 34cGTrxRD4VvfbDri6RhQDKPBokfLTNJse
- 37NpTG2p6gjVeZDmAiPLKNs6Nhj5EfTR55

**Testnet**:
- 3PM5bKKhggNFzYjLnLsbUF7XHNSuA4bSVY
- 39Ak9GuMHfpWL3VoTm9NigyELzPC5toiE4
- 35tfGskRDxU3tWU3n5n2uvCqeHmGDKorVN

**Regtest**:
- 3PSpnu5Fdt34u2EEdHZjfaogcVCMC72h24

Mineraddress Parameter
---------------------

A new `-mineraddress=<addr>` parameter has been added to allow miners to specify where their rewards should go. This parameter works both with and without the development fund being active.

When using this parameter, ensure that the address provided is a valid Bitcoin address. If an invalid address is provided, the node will not start.

Getblocktemplate RPC Updates
---------------------------

The `getblocktemplate` RPC has been updated to include development fund information in the response:

```json
"developmentfund": {
  "active": true|false,       // whether the development fund is active for this block
  "address": "xxxx",          // the development fund address for this block height
  "amount": n,                // the amount going to the development fund (in Satoshis)
  "percent": n                // the percentage of the block reward going to the development fund
},
"mineraddress": "xxxx"        // the miner address specified by -mineraddress (if provided)
```

0.13.3 Change log
=================

Detailed release notes follow. This overview includes changes that affect
behavior, not code moves, refactors and string updates. For convenience in locating
the code changes and accompanying discussion, both the pull request and
git merge commit are mentioned.

### Mining
- Implementation of development fund allocating 20% of block rewards to specified addresses
- Added `-mineraddress` parameter to specify where mining rewards should go
- Updated `getblocktemplate` RPC to include development fund information

Credits
=======

Thanks to everyone who directly contributed to this release:

- The Bitcoin Core Development Team
- The Classic2 Development Team

As well as everyone that helped translating on [Transifex](https://www.transifex.com/projects/p/bitcoin/).
