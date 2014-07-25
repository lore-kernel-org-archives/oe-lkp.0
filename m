Content-Type: multipart/mixed; boundary="===============2815148126163362334=="
MIME-Version: 1.0
From: Mike Galbraith <umgwanakikbuti@gmail.com>
To: lkp@lists.01.org
Subject: Re: [rcu] c0f489d2c6f: -1.5% netperf.Throughput_tps
Date: Fri, 25 Jul 2014 11:44:21 +0200
Message-ID: <1406281461.5162.38.camel@marge.simpson.net>
In-Reply-To: <53D20FD0.90204@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2815148126163362334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-07-25 at 16:05 +0800, Aaron Lu wrote: =

> On 07/25/2014 03:35 PM, Mike Galbraith wrote:
> > On Fri, 2014-07-25 at 14:45 +0800, Aaron Lu wrote: =

> >> FYI, we noticed the below changes on
> >>
> >> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
> >> commit c0f489d2c6fec8994c642c2ec925eb858727dc7b ("rcu: Bind grace-peri=
od kthreads to non-NO_HZ_FULL CPUs")
> >>
> >> abaa93d9e1de2c2  c0f489d2c6fec8994c642c2ec  =

> >> ---------------  -------------------------  =

> >>      12654 ~ 0%      -1.5%      12470 ~ 0%  ivb43/netperf/300s-25%-TCP=
_CRR
> >>      12654 ~ 0%      -1.5%      12470 ~ 0%  TOTAL netperf.Throughput_t=
ps
> > =

> > Out of curiosity, what parameters do you use for this test?  In my
> =

> The cmdline for this test is:
> netperf -t TCP_CRR -c -C -l 300

Thanks.  That doesn't switch as heftily as plain TCP_RR, but I'd still
expect memory layout etc to make bisection frustrating as heck.  But no
matter, I was just curious.

Aside: running unbound, the load may get beaten up pretty bad by nohz if
it's enabled.  Maybe for testing the network stack it'd be better to
remove that variable?  Dunno, just a thought.  I only mention it because
your numbers look very low unless the box is ancient or CPU is dinky.

-Mike


--===============2815148126163362334==--

