Content-Type: multipart/mixed; boundary="===============0695727528888025225=="
MIME-Version: 1.0
From: Markus Pargmann <mpa@pengutronix.de>
To: lkp@lists.01.org
Subject: Re: [sched/core] 9edfbfed3f5: +88.2% hackbench.time.involuntary_context_switches
Date: Tue, 10 Feb 2015 08:26:34 +0100
Message-ID: <20150210072634.GZ16879@pengutronix.de>
In-Reply-To: <20150209083120.GL5029@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0695727528888025225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 09, 2015 at 09:31:20AM +0100, Peter Zijlstra wrote:
> On Mon, Feb 09, 2015 at 01:58:33PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> > commit 9edfbfed3f544a7830d99b341f0c175995a02950 ("sched/core: Rework rq=
->clock update skips")
> > =

> > =

> > testbox/testcase/testparams: xps2/hackbench/performance-1600%-process-s=
ocket
> > =

> > cebde6d681aa45f9  9edfbfed3f544a7830d99b341f  =

> > ----------------  --------------------------  =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >    1839273 =C2=B1  6%     +88.2%    3462337 =C2=B1  4%  hackbench.time.=
involuntary_context_switches
> >   41965851 =C2=B1  5%      +5.6%   44307403 =C2=B1  1%  hackbench.time.=
voluntary_context_switches
> >        388 =C2=B1 39%     -58.6%        160 =C2=B1 10%  sched_debug.cfs=
_rq[1]:/.tg_load_contrib
> >      12957 =C2=B1 14%     -60.5%       5117 =C2=B1 11%  sched_debug.cfs=
_rq[2]:/.tg_load_avg
> >      30505 =C2=B1 14%     -57.7%      12905 =C2=B1  6%  sched_debug.cfs=
_rq[3]:/.tg_load_avg
> >       2790 =C2=B1 24%     -65.4%        964 =C2=B1 32%  sched_debug.cfs=
_rq[3]:/.blocked_load_avg
> >       2915 =C2=B1 23%     -62.2%       1101 =C2=B1 29%  sched_debug.cfs=
_rq[3]:/.tg_load_contrib
> >    1839273 =C2=B1  6%     +88.2%    3462337 =C2=B1  4%  time.involuntar=
y_context_switches
> >       1474 =C2=B1 28%     -61.7%        565 =C2=B1 43%  sched_debug.cfs=
_rq[2]:/.tg_load_contrib
> >      11830 =C2=B1 15%     +63.0%      19285 =C2=B1 11%  sched_debug.cpu=
#4.sched_goidle
> >      19319 =C2=B1 29%     +91.1%      36913 =C2=B1  7%  sched_debug.cpu=
#3.sched_goidle
> >       5899 =C2=B1 31%     -35.6%       3801 =C2=B1 11%  sched_debug.cfs=
_rq[4]:/.blocked_load_avg
> >       5999 =C2=B1 30%     -34.5%       3929 =C2=B1 11%  sched_debug.cfs=
_rq[4]:/.tg_load_contrib
> >      37884 =C2=B1 13%     -33.5%      25207 =C2=B1  7%  sched_debug.cfs=
_rq[4]:/.tg_load_avg
> >     229547 =C2=B1  5%     +47.9%     339519 =C2=B1  5%  cpuidle.C1-NHM.=
usage
> >      35712 =C2=B1  3%     +31.7%      47036 =C2=B1  9%  cpuidle.C3-NHM.=
usage
> >       5010 =C2=B1  9%     -29.0%       3556 =C2=B1 20%  sched_debug.cfs=
_rq[6]:/.blocked_load_avg
> >       5139 =C2=B1  9%     -28.2%       3690 =C2=B1 19%  sched_debug.cfs=
_rq[6]:/.tg_load_contrib
> >      49568 =C2=B1  6%     +24.8%      61867 =C2=B1  7%  sched_debug.cpu=
#1.sched_goidle
> >      26369 =C2=B1 35%     -42.0%      15289 =C2=B1 29%  cpuidle.C6-NHM.=
usage
> >         18 =C2=B1 16%     +36.5%         25 =C2=B1  7%  sched_debug.cpu=
#4.nr_running
> >       1.41 =C2=B1 12%     -19.3%       1.14 =C2=B1 13%  perf-profile.cp=
u-cycles.sock_wfree.unix_destruct_scm.skb_release_head_state.skb_release_al=
l.consume_skb
> >         25 =C2=B1 15%     +28.7%         32 =C2=B1  9%  sched_debug.cpu=
#3.nr_running
> >       1.63 =C2=B1 11%     -18.0%       1.34 =C2=B1 12%  perf-profile.cp=
u-cycles.unix_destruct_scm.skb_release_head_state.skb_release_all.consume_s=
kb.unix_stream_recvmsg
> >       0.57 =C2=B1  8%      +9.6%       0.62 =C2=B1  5%  turbostat.CPU%c1
> >        148 =C2=B1 11%     -16.7%        123 =C2=B1  7%  sched_debug.cfs=
_rq[1]:/.load
> >        109 =C2=B1  6%     +17.1%        128 =C2=B1  6%  sched_debug.cpu=
#6.cpu_load[0]
> >       2.41 =C2=B1  8%     -13.3%       2.09 =C2=B1 11%  perf-profile.cp=
u-cycles.skb_release_head_state.skb_release_all.consume_skb.unix_stream_rec=
vmsg.sock_aio_read
> >        147 =C2=B1 12%     -16.4%        123 =C2=B1  7%  sched_debug.cpu=
#1.load
> >        111 =C2=B1  5%     +15.4%        129 =C2=B1  5%  sched_debug.cpu=
#6.cpu_load[2]
> >        110 =C2=B1  5%     +14.9%        127 =C2=B1  5%  sched_debug.cfs=
_rq[6]:/.runnable_load_avg
> >        112 =C2=B1  5%     +14.5%        128 =C2=B1  4%  sched_debug.cpu=
#6.cpu_load[3]
> >        113 =C2=B1  5%     +13.2%        128 =C2=B1  3%  sched_debug.cpu=
#6.cpu_load[4]
> >     789953 =C2=B1  2%     -10.8%     704528 =C2=B1  4%  sched_debug.cpu=
#3.avg_idle
> >      15471 =C2=B1  5%      -7.7%      14278 =C2=B1  2%  sched_debug.cpu=
#5.curr->pid
> >    2675106 =C2=B1 10%     +16.2%    3109411 =C2=B1  1%  sched_debug.cpu=
#4.nr_switches
> >    2675140 =C2=B1 10%     +16.2%    3109440 =C2=B1  1%  sched_debug.cpu=
#4.sched_count
> >     155201 =C2=B1  5%     +14.6%     177901 =C2=B1  3%  softirqs.RCU
> >       8.64 =C2=B1  6%      -9.6%       7.82 =C2=B1  5%  perf-profile.cp=
u-cycles.skb_release_all.consume_skb.unix_stream_recvmsg.sock_aio_read.sock=
_aio_read
> >    2658351 =C2=B1 11%     +13.7%    3021564 =C2=B1  2%  sched_debug.cpu=
#5.sched_count
> >    2658326 =C2=B1 11%     +13.7%    3021539 =C2=B1  2%  sched_debug.cpu=
#5.nr_switches
> >      71443 =C2=B1  5%      +9.9%      78486 =C2=B1  0%  vmstat.system.cs
> >       8209 =C2=B1  5%      +7.3%       8805 =C2=B1  0%  vmstat.system.in
> > =

> =

> OK, so the interesting number is total runtime; I cannot find it.
> Therefore I cannot say what if anything changed. This is just a bunch of
> random numbers afaict.

The total runtime of hackbench in v3.19 compared to v3.15 to v3.18 is
shown here [1] (Group 5 -> linux_perf.hackbench). It is not the same
project so the profiling data is not related and not recorded. The
results should be reproducable by simply running hackbench with the same
options as cbenchsuite [2] did. The options are always listed in the
result browser [1] below the plots.

Best Regards,

Markus

[1] http://results.cbenchsuite.org/plots/2015-02-09__v3.15-v3.19-quad/detai=
led/
[2] http://cbenchsuite.org


--===============0695727528888025225==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSlUyYktxQUFvSkVFcGNnS3RjRUdRUU1tSVAvMUZQTmNldlBUYjZtMlY3T1ZrY1JJQUEK
aEhzT1RhMDBVV3hKQUUzUytscnFCWUpLbzV4alkvN1lMQ1BaRHgycWJGb3RmbXVqb01iZ0l4Rlp4
L3BUVmVvZQpla0tZRnAyK1N1UUp5ZjIzWGlIbk84bmFZcGYxQXRSMTg0a0RkT3dnWWNSRzFmVmNn
ZkJTU1pFL3orTGhCVUtaCjhGZ1ZGNHNFNGFaeHM3SUk4SU5ldkpiWjY1RU1BQjdwejFUYjBWbngr
b3hXc2paRkY1OHNYMHVOVkVZTjcrQS8KNXI1enpxVkFMd3g0dHVxRUN4RmNBMU9kREZBczdLNmdj
S3d6UWpNQWZoOHNMVHloSXltOHFyODFUOGNMaDRSTwpNaDBzSDc2VG5CRUR2VThJajJ0bU1sK0Jz
ejZmblErQ0Z4YlBwSkEzeG1yQXVYUWliWnBBWndEV0czRnNKeWx1CjhUY1F5WW9aSUpJMEc2VGRG
UXZZbWFIWmxNNHIxdGx1MkxkMzdXTTh1dkhzTCt6cXlLNnR5NTFaR0dJTkxwdk0KVkUySVVFNDNS
SCtGbWp3UnhVUVFTRjlvcE5CeGhFUDdENzM5ZXEwZk52dnMyMUFwb0w2Z0huMEJQNEY2RG50Vwps
V0ZMT2NIcFlobU5aaU1tR1M3b0xlYWcwdTBuQk5telhSdE1odlFZRHRDcGc4NW9YTFBja0xtZHJX
UHpROHlpClBsd2RBQ3Vsbk1hcWFyKzhLU0xic3NiclZYVEJiSFZ2MzFOb2p0OFVOVExScGladXNY
eGpoeDQrZnllVVJXS24KeTdwNlF1OFNpYm9zL2lySE9YeG5Zd3FMbE8yTjlHZDY2a1RRYlAwclFu
b3A0bzE4RWg5T2o2U00wVHp2SFJiOQpZaHNRNjM1c20wek5uRldNUmh3MQo9QUtZawotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============0695727528888025225==--

