Content-Type: multipart/mixed; boundary="===============0573132489825581508=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [genirq] f91f694540 BUG: unable to handle kernel NULL pointer dereference at 0000000000000078
Date: Sun, 19 Feb 2017 08:18:44 +0100
Message-ID: <alpine.DEB.2.20.1702190817490.3574@nanos>
In-Reply-To: <20170218235306.ulfaecfg66fzt6ks@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0573132489825581508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 19 Feb 2017, Fengguang Wu wrote:

> On Sat, Feb 18, 2017 at 01:30:14PM +0800, Fengguang Wu wrote:
> > Hi Thomas,
> > =

> > FYI, here is another bisect result.
> =

> Attached is a reproduce script for this issue.

Thanks for the report. I zapped the commit in question, it's broken on x86

Thanks,

	Thomas




--===============0573132489825581508==--

