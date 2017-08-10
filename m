Content-Type: multipart/mixed; boundary="===============6755726100884668559=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 5b4ed50902 ("sched/fair: Fix wake_affine() for !NUMA_BALANCING"): BUG: unable to handle kernel paging request at ffffffffffffff80
Date: Thu, 10 Aug 2017 10:43:32 +0200
Message-ID: <20170810084332.vkdonrqyfq6rojjs@hirez.programming.kicks-ass.net>
In-Reply-To: <20170810021516.i2b6lzeiwrzd3mvl@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6755726100884668559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 10:15:16AM +0800, Fengguang Wu wrote:
> > > So what .config did you use with gcc-4.8?
> > =

> > Attached is the .config for 5b4ed509027a ("sched/fair: Fix wake_affine(=
) for !NUMA_BALANCING")

Thanks, I'll go give that a spin.

> The build servers have these Debian packages installed:
> =

> Desired=3DUnknown/Install/Remove/Purge/Hold
> | Status=3DNot/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Tr=
ig-pend
> |/ Err?=3D(none)/Reinst-required (Status,Err: uppercase=3Dbad)
> ||/ Name                             Version               Architecture  =
        Description
> +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ii  gcc-4.8                          4.8.4-1               amd64         =
        GNU C compiler
> ii  gcc-4.8-base:amd64               4.8.4-1               amd64         =
        GCC, the GNU Compiler Collection (base package)
> ii  gcc-4.8-multilib                 4.8.4-1               amd64         =
        GNU C compiler (multilib files)
> ii  gcc-4.8-plugin-dev               4.8.4-1               amd64         =
        Files for GNU GCC plugin development.

My dev boxes seem to have:

# dpkg -l | grep gcc-4.8
ii  gcc-4.8                                4.8.4-4 amd64        GNU C compi=
ler
ii  gcc-4.8-base:amd64                     4.8.4-4 amd64        GCC, the GN=
U Compiler Collection (base package)
ii  libgcc-4.8-dev:amd64                   4.8.4-4 amd64        GCC support=
 library (development files)

slightly newer but should be similar enough I suppose.

--===============6755726100884668559==--

