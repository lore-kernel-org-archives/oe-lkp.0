Content-Type: multipart/mixed; boundary="===============8111506722463264156=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/readahead] 793917d997: fio.read_iops -18.8% regression
Date: Wed, 15 Jun 2022 13:36:40 +0100
Message-ID: <YqnSWMQN58xBUEt/@casper.infradead.org>
In-Reply-To: <1e8deaea-5a05-1846-d51c-b834beb9f23e@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8111506722463264156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 02:38:24PM +0800, Yin Fengwei wrote:
> On 4/19/2022 1:08 AM, Matthew Wilcox wrote:
> > =

> > I'm on holiday today, but adding linux-fsdevel and linux-mm so relevant
> > people know about this.
> > =

> > Don't focus on the 18% regression, focus on the 240% improvement on the
> > other benchmark ;-)
> > =

> > Seriously, someone (probably me) needs to dig into what the benchmark
> > is doing and understand whether there's a way to avoid (or decide this
> > regression isn't relevant) while keeping the performance gains elsewher=
e.
> With:
> commit b9ff43dd27434dbd850b908e2e0e1f6e794efd9b
> Author: Matthew Wilcox (Oracle) <willy@infradead.org>
> Date:   Wed Apr 27 17:01:28 2022 -0400
> =

>     mm/readahead: Fix readahead with large folios
> =

> the regression is almost gone:

That makes sense.  I did think at the time that this was probably the
cause of the problem.

> commit:
>   18788cfa236967741b83db1035ab24539e2a21bb
>   b9ff43dd27434dbd850b908e2e0e1f6e794efd9b
> =

> 18788cfa23696774 b9ff43dd27434dbd850b908e2e0
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>        4698:9       -36360%        1426:3     dmesg.timestamp:last
>        3027:9       -22105%        1037:3     kmsg.timestamp:last
>          %stddev     %change         %stddev
>              \          |                \
>       0.39 =C2=B1253%      -0.3        0.09 =C2=B1104%  fio.latency_1000u=
s%
>       0.00 =C2=B1141%      +0.0        0.01        fio.latency_100ms%
>      56.60 =C2=B1  5%     +10.3       66.92 =C2=B1  8%  fio.latency_10ms%
>      15.65 =C2=B1 22%      -1.3       14.39 =C2=B1 17%  fio.latency_20ms%
>       1.46 =C2=B1106%      -0.5        0.95 =C2=B1 72%  fio.latency_2ms%
>      25.81 =C2=B1 25%      -9.2       16.59 =C2=B1 18%  fio.latency_4ms%
>       0.09 =C2=B1 44%      +0.9        1.04 =C2=B1 22%  fio.latency_50ms%
>       0.00 =C2=B1282%      +0.0        0.02 =C2=B1141%  fio.latency_750us%
>      13422 =C2=B1  6%      -1.4%      13233        fio.read_bw_MBps   <--=
---

A stddev of 6% and a decline of 1.4%?  How many tests did you run
to make sure that this is a real decline and not fluctuation of
one-quarter-of-one-standard-devisation?

--===============8111506722463264156==--

