Content-Type: multipart/mixed; boundary="===============4050012081696558331=="
MIME-Version: 1.0
From: Felipe Balbi <balbi@ti.com>
To: lkp@lists.01.org
Subject: Re: [phy] kernel BUG at drivers/base/driver.c:153!
Date: Fri, 10 Jul 2015 14:48:59 -0500
Message-ID: <20150710194859.GB21051@saruman.tx.rr.com>
In-Reply-To: <20150709081208.GA30554@kuha.fi.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4050012081696558331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2015 at 11:12:08AM +0300, Heikki Krogerus wrote:
> On Wed, Jul 08, 2015 at 01:02:45AM +0800, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > =

> > commit 1c14905ef951fb968c8da90e4e64be02c309a2ae
> > Author:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > AuthorDate: Wed May 13 15:26:53 2015 +0300
> > Commit:     Felipe Balbi <balbi@ti.com>
> > CommitDate: Wed May 13 12:07:01 2015 -0500
> > =

> >     phy: add driver for TI TUSB1210 ULPI PHY
> >     =

> >     TUSB1210 ULPI PHY has vendor specific register for eye
> >     diagram tuning. On some platforms the system firmware has
> >     set optimized value to it. In order to not loose the
> >     optimized value, the driver stores it during probe and
> >     restores it every time the PHY is powered back on.
> >     =

> >     Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >     Acked-by: David Cohen <david.a.cohen@linux.intel.com>
> >     Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> >     Signed-off-by: Felipe Balbi <balbi@ti.com>
> =

> This commit will fix the problem:
> https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=3Dte=
sting/next&id=3D6c97f002f678d5047bdf8a9e248dc50656c38ae2
> =

> I think we should consider it as a fix for this issue. Unfortunately
> Felipe is on vacation at the moment. Greg, could help with this?
> =

> I will also be on vacation for the rest of the month and my access to
> internet will be fairly limited.

Oh, I can move that to testing/fixes as soon as I'm back in a few more
days. cheers

-- =

balbi

--===============4050012081696558331==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSlZvQ0dyQUFvSkVJYU9zdUExeXFSRVVSUVArd2UwbDM0cW9wb3dIeW9KQ3FZNnAySHUK
eWQzY0pCZlhGZDBYd0NpSmJuVzh0dENRWGxRaDdjenhGM005OTlrMHZrQnBXSEw3SUdPNkhGVE01
ZWwramJ5OAprbGQ3RlRqSlhHcTdYQ0lFZTJORDdiYS9zN2hZajVIWWJxSm1uU2NHbmpDZWdkMmFL
ZTZBQTRzSThzakRLTjFUCjBLRnpDWThlaGdyU2J4MWFYSURsMDRselZhNklMdlYwZHBxU0wra1dS
VWNmZWxsVnI3cmNWNHBaL0xRdThmM3EKRTJNNGhOQjlkaG9UWlVTYmhjbDRQOEpubEtqYjJUUzhh
VDgzMjhGVG9nVGhvRmZlRWF5S2dOM3c1cGNOc0RvMwpwMm1iMzlZSXRJcFZ1SEZGdGNKcWdvZnVv
UlFBYmN0d2s3UmtrRENLbWVDVXpza2NncnNnTmppaU1MZHBaNEkvCnUwc2tuWGU5WFdBYWNCRXN4
bE0wZ3JsUzlhQzZPQkR0RHRkN2hHSGtISzhwQSs3N3BYd1o2dzhmdGVKN1ZVRHkKbnIzdXRaVEUr
TTVSWlVJKy9qUGowbUdxekpqY0RoTmRVcXFJYzRnaytZcVozL1E3dFFXTzhyZ3JqdjIvUWVHQgo5
Znc5MS9LemxjTXBrY0JnendMa0dJUWdIbEM4SHZxaHdPN0NCWDN1MEUyeXpOZy9DU041NkU5ZExD
aHlVZ0Z1CnI0MUU3Q0cwZW5ESHNaWU55YVNHVWdRWnRhSDhnQVBxdDVNOXlDb0FlcnZLbHVxY1Bt
bFRNYmRvYXlaRUZIYmkKQjhoLzNaY256ZU5kcDBlR2liTWxHNzFTcUtaeXRvUm1HL3pOWG42N0I4
anM1TDE1L0N0OFhlTkZaVm8xZCtxRAp3bXhDdXZ3d2RsYVBNbEhCZDhjcwo9QnJ0VAotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4050012081696558331==--

