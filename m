Content-Type: multipart/mixed; boundary="===============7087834204571972034=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 867853145c: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Wed, 25 May 2016 20:48:39 +0800
Message-ID: <20160525124839.GA12278@wfg-t540p.sh.intel.com>
In-Reply-To: <alpine.LFD.2.20.1605231258170.5796@knanqh.ubzr>
List-Id: <oe-lkp.lists.linux.dev>

--===============7087834204571972034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2016 at 01:18:20PM -0400, Nicolas Pitre wrote:
> On Mon, 23 May 2016, Fengguang Wu wrote:
> =

> > It's a bit special since the first bad commit is a merge commit.
> > Both of your branches' parent commits are fine:
> > =

> > +------------------------------------------+------------+------------+-=
-----------+------------+
> > |                                          | 4bf284b277 | 2441e78b19 | =
867853145c | f490734437 |
> > +------------------------------------------+------------+------------+-=
-----------+------------+
> > | boot_successes                           | 63         | 63         | =
0          | 0          |
> > | boot_failures                            | 0          | 0          | =
22         | 13         |
> > | BUG:unable_to_handle_kernel              | 0          | 0          | =
22         | 13         |
> =

> I can't find commit f490734437 in my repository. It isn't in linux-next
> nor in mainline.
> =

> However I tested commit 867853145c several times and I don't get any =

> kernel bug.  This is with the .config and ramdisk image that you =

> provided, using your script to boot it.
> =

> Please find attached my boot log.

I can no longer reproduce it too, when rebuild the image with the same
parameters. It may be due to the robot does partial builds (no make
distclean) which are in rare cases affected by the previous builds.

Sorry for the noise!

Thanks,
Fengguang

--===============7087834204571972034==--

