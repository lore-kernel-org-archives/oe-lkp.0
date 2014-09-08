Content-Type: multipart/mixed; boundary="===============6465029182552828653=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [dummy-irq] genirq: Flags mismatch irq 0. 00000080 (dummy_irq) vs. 00015a20 (timer)
Date: Mon, 08 Sep 2014 17:22:28 +0800
Message-ID: <20140908092228.GA24801@localhost>
In-Reply-To: <alpine.LNX.2.00.1409081114290.5523@pobox.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6465029182552828653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 08, 2014 at 11:15:37AM +0200, Jiri Kosina wrote:
> On Mon, 8 Sep 2014, Fengguang Wu wrote:
> =

> > This patch is found to trigger a call trace dump during kernel boot.
> > Can it be possibly fixed? Thanks!
> =

> Hi Fengguang,
> =

> from the dmesg it's obvious that dummy-irq is requesting IRQ#0 by default=
. =

> This has been fixed back in 2013 via commit a7b594b490. Are you sure you =

> have that commit applied?

Ah yes! Sorry I looked at the wrong line of the table.. it becomes
obvious when listing the dummy_irq line alone: it no longer shows up
in next-20140905.

+------------------------------------------------------+------------+------=
------+---------------+
|                                                      | 4c6e22b8a9 | 54f69=
b92f0 | next-20140905 |
+------------------------------------------------------+------------+------=
------+---------------+

| genirq:Flags_mismatch_irq.(dummy_irq)vs.(timer)      | 0          | 20   =
      |               |

--===============6465029182552828653==--

