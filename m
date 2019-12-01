Content-Type: multipart/mixed; boundary="===============2815716395054691396=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/pat: Fix off-by-one bugs in interval tree search
Date: Sun, 01 Dec 2019 20:55:21 +0100
Message-ID: <20191201195521.GC3615@gmail.com>
In-Reply-To: <alpine.DEB.2.21.1912010906030.2748@hp-x360n>
List-Id: <oe-lkp.lists.linux.dev>

--===============2815716395054691396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Kenneth R. Crudup <kenny@panix.com> wrote:

> =

> On Sun, 1 Dec 2019, Ingo Molnar wrote:
> =

> > So it would be nice if everyone who is seeing this bug could test the
> > patch below against Linus's latest tree - does it fix the regression?
> =

> The patch fixes the issue for me.

Great, thanks!

> > If not then please send the before/after dump of
> > /sys/kernel/debug/x86/pat_memtype_list - and even if it works please se=
nd
> > the dumps so we can double check it all.
> =

> I don't have the "before patch" (but could if it is absolutely needed) but
> here's the "after patch":

> uncached-minus @ 0xfed91000-0xfed92000
> uncached-minus @ 0xff340000-0xff341000
> write-combining @ 0x4000000000-0x4010000000
> uncached-minus @ 0x4010000000-0x4010001000

I believe this is the region that caused the problem, the 0x4010000000 =

'end' address of the WC region is the same as the 0x4010000000 'start' =

address of the UC- region that follows it.

> write-combining @ 0x604a800000-0x604b000000
> uncached-minus @ 0x604b100000-0x604b110000

This WC region was probably unaffected by the bug.

Thanks,

	Ingo
--===============2815716395054691396==--

