Content-Type: multipart/mixed; boundary="===============0775843457802519055=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [dmaengine] fe364a7d95: UBSAN:array-index-out-of-bounds_in_drivers/acpi/acpica/dswexec.c
Date: Wed, 13 Oct 2021 22:24:09 +0800
Message-ID: <20211013142409.GA9406@xsang-OptiPlex-9020>
In-Reply-To: <YWXZOdYYuQA/Ddq4@smile.fi.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0775843457802519055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi All,


On Tue, Oct 12, 2021 at 09:51:37PM +0300, Andy Shevchenko wrote:
> On Sat, Oct 09, 2021 at 11:56:20PM +0200, Oliver Urbann wrote:
> > Hi all,
> > =

> > this actually crashes s2idle e.g. on Surface Book 1 and Surface Pro 4:
> =

> You mean the mentioned patch?
> =

> It's impossible. Surface Book 1 (at least) has no such devices, which that
> patch touches, at all!

sorry about this, seems a bad bisection maybe due to our test env issues.

but rerun test, we cannot reproduce the issue now.

> -- =

> With Best Regards,
> Andy Shevchenko
> =

>=20
--===============0775843457802519055==--

