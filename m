Content-Type: multipart/mixed; boundary="===============4859638846452925047=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [serial] BUG: spinlock bad magic on CPU#0, swapper/0
Date: Sun, 12 Apr 2015 21:04:07 +0800
Message-ID: <20150412130407.GA17108@wfg-t540p.sh.intel.com>
In-Reply-To: <552A6CAB.1080605@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4859638846452925047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2015 at 09:01:31AM -0400, Peter Hurley wrote:
> Hi Fengguang,
> =

> On 04/12/2015 08:41 AM, Fengguang Wu wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > git://git.code.sf.net/p/openipmi/linux-ipmi master-ipmi-rebase
> > =

> > commit ccfb59efb7a78e606516ce878d8dde4690419a5f
> > Author:     Corey Minyard <cminyard@mvista.com>
> > AuthorDate: Mon Mar 19 16:00:55 2012 -0500
> > Commit:     Corey Minyard <cminyard@mvista.com>
> > CommitDate: Fri Apr 10 20:51:46 2015 -0500
> > =

> >     serial: Add a polled interface to the 8250 driver
> >     =

> >     Remove the console code from the 8250 driver and add the poll code =
and
> >     setup to use the console over the polled interface.
> >     =

> >     FIXME - The interactions between the 8250_early and 8250 code need =
to
> >     be analyzed and tested.
> >     =

> >     Signed-off-by: Corey Minyard <minyard@acm.org>
> >     =

> >      drivers/tty/serial/8250.c |  227 ++++++++++++++++++++++-----------=
-------------
> >      1 file changed, 112 insertions(+), 115 deletions(-)
> =

> This is not an upstream bug.

Ah yes, sorry for the noise!

Thanks,
Fengguang

--===============4859638846452925047==--

