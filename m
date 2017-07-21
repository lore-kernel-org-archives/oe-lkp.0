Content-Type: multipart/mixed; boundary="===============0300899726177746254=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Fri, 21 Jul 2017 12:03:41 +0200
Message-ID: <20170721100341.GB28857@pathway.suse.cz>
In-Reply-To: <1500628509.29303.161.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0300899726177746254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 2017-07-21 12:15:09, Andy Shevchenko wrote:
> On Fri, 2017-07-21 at 09:59 +0800, Ye Xiaolong wrote:
> > Hi,
> > =

> > On 07/19, Linus Torvalds wrote:
> > > Hmm. I wonder why the kernel test robot ends up having that annoying
> > > line doubling for the dmesg.
> > > =

> > =

> > Hmm, this line doubling issue should be caused by we set both
> > 'earlyprintk=3DttyS0,115200' and 'console=3DttyS0,115200' in cmdline,
> > after I
> > remove any of it, this issue is gone, is it an inappropriate setting?
> > =

> > FYI, the whole kernel command line is:
> > =

> > earlyprintk=3DttyS0,115200
> > console=3DttyS0,115200
> > console=3Dtty0

The order is important here. Early consoles are disabled when
the preferred console (last on the command line) is registered.
Therefore the following order should fix it:

console=3Dtty0
earlyprintk=3DttyS0,115200
console=3DttyS0,115200


Best Regards,
Petr

PS: I have recently spent a lot of time trying to understad this
part of the code. Unfortunately, it is not easy to improve.
The same console might be registered by various aliases.
Therefore it is not easy to check which early console match
a real one. There are match() functions but they have side
effects. It would require some non-trivial redesign.

I am working on some partial clean that would make the
code easier but it is really hard to avoid regressions.

--===============0300899726177746254==--

