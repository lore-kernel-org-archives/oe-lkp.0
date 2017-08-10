Content-Type: multipart/mixed; boundary="===============6706715290629701066=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 5b4ed50902 ("sched/fair: Fix wake_affine() for !NUMA_BALANCING"): BUG: unable to handle kernel paging request at ffffffffffffff80
Date: Thu, 10 Aug 2017 10:50:17 +0200
Message-ID: <20170810085017.vjtazcjkgjuzb5qo@hirez.programming.kicks-ass.net>
In-Reply-To: <20170810084332.vkdonrqyfq6rojjs@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6706715290629701066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 10:43:32AM +0200, Peter Zijlstra wrote:

> > Desired=3DUnknown/Install/Remove/Purge/Hold
> > | Status=3DNot/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/=
Trig-pend
> > |/ Err?=3D(none)/Reinst-required (Status,Err: uppercase=3Dbad)
> > ||/ Name                             Version               Architecture=
          Description
> > +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ii  gcc-4.8                          4.8.4-1               amd64       =
          GNU C compiler
> > ii  gcc-4.8-base:amd64               4.8.4-1               amd64       =
          GCC, the GNU Compiler Collection (base package)
> > ii  gcc-4.8-multilib                 4.8.4-1               amd64       =
          GNU C compiler (multilib files)
> > ii  gcc-4.8-plugin-dev               4.8.4-1               amd64       =
          Files for GNU GCC plugin development.
> =

> My dev boxes seem to have:
> =

> # dpkg -l | grep gcc-4.8
> ii  gcc-4.8                                4.8.4-4 amd64        GNU C com=
piler
> ii  gcc-4.8-base:amd64                     4.8.4-4 amd64        GCC, the =
GNU Compiler Collection (base package)
> ii  libgcc-4.8-dev:amd64                   4.8.4-4 amd64        GCC suppo=
rt library (development files)
> =

> slightly newer but should be similar enough I suppose.

Hurm.. :-( Current debian doesn't feature plugin crud for the old
compiler.


# apt-cache search plugin-dev
gcc-6-plugin-dev - Files for GNU GCC plugin development.
gcc-6-plugin-dev-aarch64-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-arm-linux-gnueabi - Files for GNU GCC plugin development.
gcc-6-plugin-dev-arm-linux-gnueabihf - Files for GNU GCC plugin development.
gcc-6-plugin-dev-mips-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-mips64el-linux-gnuabi64 - Files for GNU GCC plugin develop=
ment.
gcc-6-plugin-dev-mipsel-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-powerpc64le-linux-gnu - Files for GNU GCC plugin developme=
nt.
gcc-6-plugin-dev-s390x-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-alpha-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-hppa-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-m68k-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-mips64-linux-gnuabi64 - Files for GNU GCC plugin developme=
nt.
gcc-6-plugin-dev-powerpc-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-powerpc-linux-gnuspe - Files for GNU GCC plugin developmen=
t.
gcc-6-plugin-dev-powerpc64-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-sh4-linux-gnu - Files for GNU GCC plugin development.
gcc-6-plugin-dev-sparc64-linux-gnu - Files for GNU GCC plugin development.
gcc-7-plugin-dev - Files for GNU GCC plugin development.

# apt-cache search gcc-4.8
gcc-4.8-base - GCC, the GNU Compiler Collection (base package)
libgcc-4.8-dev - GCC support library (development files)
gcc-4.8 - GNU C compiler


Let me see if I can find it on the intar-tubes someplace..

--===============6706715290629701066==--

