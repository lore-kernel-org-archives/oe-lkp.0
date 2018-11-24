Content-Type: multipart/mixed; boundary="===============6475723604963656307=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: dad4f140ed ("Merge branch 'xarray' of .."): Mem-Info:
Date: Sat, 24 Nov 2018 17:04:44 +0800
Message-ID: <20181124090444.GA3141@intel.com>
In-Reply-To: <20181124035803.GX3065@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6475723604963656307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2018 at 07:58:03PM -0800, Matthew Wilcox wrote:
> On Sat, Nov 24, 2018 at 09:20:38AM +0800, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > =

> > commit dad4f140edaa3f6bb452b6913d41af1ffd672e45
> =

> I think you've got the wrong bisection point, confused by other messages.
> Here's the messages I think you intend to chase:
> =

> [  155.389297] BUG: workqueue lockup - pool cpus=3D0 node=3D0 flags=3D0x0=
 nice=3D0 stuck
>  for 52s!
> [  155.409004] BUG: workqueue lockup - pool cpus=3D0 flags=3D0x4 nice=3D0=
 stuck for 40
> s!
> [  155.420377] Showing busy workqueues and worker pools:
> [  155.428445] workqueue events: flags=3D0x0
> [  155.434634]   pwq 0: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1=
/256
> [  155.437904]     pending: cache_reap
> [  155.449671] workqueue events_power_efficient: flags=3D0x82
> [  155.458000]   pwq 2: cpus=3D0 flags=3D0x4 nice=3D0 active=3D3/256
> [  155.461269]     pending: neigh_periodic_work, do_cache_clean, check_li=
fetime
> =

> =

> but you're getting hung up on the testsuite problems.
thanks for pointing out this. Kindly ignore this report, which is false pos=
itive.

> =

>=20

--===============6475723604963656307==--

