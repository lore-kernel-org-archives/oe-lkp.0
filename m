Content-Type: multipart/mixed; boundary="===============0145286277014056090=="
MIME-Version: 1.0
From: Mike Galbraith <umgwanakikbuti@gmail.com>
To: lkp@lists.01.org
Subject: Re: [rcu] c0f489d2c6f: -1.5% netperf.Throughput_tps
Date: Fri, 25 Jul 2014 09:35:21 +0200
Message-ID: <1406273721.5162.9.camel@marge.simpson.net>
In-Reply-To: <53D1FD0E.4080406@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0145286277014056090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-07-25 at 14:45 +0800, Aaron Lu wrote: =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit c0f489d2c6fec8994c642c2ec925eb858727dc7b ("rcu: Bind grace-period =
kthreads to non-NO_HZ_FULL CPUs")
> =

> abaa93d9e1de2c2  c0f489d2c6fec8994c642c2ec  =

> ---------------  -------------------------  =

>      12654 ~ 0%      -1.5%      12470 ~ 0%  ivb43/netperf/300s-25%-TCP_CRR
>      12654 ~ 0%      -1.5%      12470 ~ 0%  TOTAL netperf.Throughput_tps

Out of curiosity, what parameters do you use for this test?  In my
piddling around with high frequency switching loads, they tend to have
too much build to build and boot to boot variance to track 1.5%.

-Mike


--===============0145286277014056090==--

