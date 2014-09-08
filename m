Content-Type: multipart/mixed; boundary="===============9097824980559438935=="
MIME-Version: 1.0
From: Jiri Kosina <jkosina@suse.cz>
To: lkp@lists.01.org
Subject: Re: [dummy-irq] genirq: Flags mismatch irq 0. 00000080 (dummy_irq) vs. 00015a20 (timer)
Date: Mon, 08 Sep 2014 11:15:37 +0200
Message-ID: <alpine.LNX.2.00.1409081114290.5523@pobox.suse.cz>
In-Reply-To: <20140908091248.GA23776@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============9097824980559438935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Sep 2014, Fengguang Wu wrote:

> This patch is found to trigger a call trace dump during kernel boot.
> Can it be possibly fixed? Thanks!

Hi Fengguang,

from the dmesg it's obvious that dummy-irq is requesting IRQ#0 by default. =

This has been fixed back in 2013 via commit a7b594b490. Are you sure you =

have that commit applied?

Thanks,

-- =

Jiri Kosina
SUSE Labs

--===============9097824980559438935==--

