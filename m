Content-Type: multipart/mixed; boundary="===============3772254825536976444=="
MIME-Version: 1.0
From: Luck, Tony <tony.luck@intel.com>
To: lkp@lists.01.org
Subject: Re: [EDAC, sb_edac] 2c1ea4c700: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Tue, 24 May 2016 17:12:56 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F3A0D6070@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <20160524061736.GB2519@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3772254825536976444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> [   55.677523] EDAC sbridge: ECC is disabled. Aborting

Works on my HSW-EX. Maybe it depends on memory configuration or some BIOS s=
ettings?

The EDAC driver is looking at the MCMTR register to determine whether ECC i=
s enabled (and this
change in the code shouldn't really affect that).

What does:

# setpci -d 8086:2fa8 0x7c.L

say? It should print a hex number for each socket. The 0x4 bit is the ECC e=
nable bit. On my machine it
says:

00017d0d

for all four sockets ... so ECC is enabled every place we look.

The kmsg file is a bit confusing too.  There are 32 "ECC is disabled" messa=
ges.  16 seem to be a repeat
(is this a serial log ... so we get all the messages up to some point, then=
 see a re-run when the main
console is enabled?).  But it looks like the driver was attempted to be loa=
ded multiple times.

-Tony

--===============3772254825536976444==--

