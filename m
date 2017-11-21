Content-Type: multipart/mixed; boundary="===============8567925413377458271=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: lkp@lists.01.org
Subject: Re: [ata_port_detach] WARNING: CPU: 0 PID: 1 at drivers/ata/libata-core.c:6613 ata_port_detach+0x9b/0x180
Date: Tue, 21 Nov 2017 12:30:25 +0100
Message-ID: <CAK8P3a321sP3H0CK4zC1=506NGaLCGcNN199St45GFUVWZp-nw@mail.gmail.com>
In-Reply-To: <20171121105408.j6yaooeevof2zuvv@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8567925413377458271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 11:54 AM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
> Hello,
>
> FYI this happens in mainline kernel 4.14.0-12891-gc8a0739.
> It at least dates back to v4.11.
>
> It occurs in 4 out of 4 boots.

I see that this is the result of CONFIG_DEBUG_TEST_DRIVER_REMOVE=3Dy,
which tries to remove the device immediately after probing.

The ATA_PFLAG_UNLOADED only gets set in ata_eh_unload(), it looks
like that never gets called when we unload while ATA_PFLAG_INITIALIZING
is still set during async probing.

      Arnd

--===============8567925413377458271==--

