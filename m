Content-Type: multipart/mixed; boundary="===============4240736594788393773=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 5b4ed50902 ("sched/fair: Fix wake_affine() for !NUMA_BALANCING"): BUG: unable to handle kernel paging request at ffffffffffffff80
Date: Thu, 10 Aug 2017 11:02:50 +0200
Message-ID: <20170810090250.gmdkvrdynhlnaiv5@hirez.programming.kicks-ass.net>
In-Reply-To: <20170810085017.vjtazcjkgjuzb5qo@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4240736594788393773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 10:50:17AM +0200, Peter Zijlstra wrote:
> > > +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > ii  gcc-4.8                          4.8.4-1               amd64     =
            GNU C compiler
> > > ii  gcc-4.8-base:amd64               4.8.4-1               amd64     =
            GCC, the GNU Compiler Collection (base package)
> > > ii  gcc-4.8-multilib                 4.8.4-1               amd64     =
            GNU C compiler (multilib files)
> > > ii  gcc-4.8-plugin-dev               4.8.4-1               amd64     =
            Files for GNU GCC plugin development.

Got them from the jessie archives, seems to build now..

--===============4240736594788393773==--

