Content-Type: multipart/mixed; boundary="===============7837372532483357257=="
MIME-Version: 1.0
From: huang ying <huang.ying.caritas@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched/core] 9edfbfed3f5: +88.2% hackbench.time.involuntary_context_switches
Date: Mon, 09 Feb 2015 16:47:07 +0800
Message-ID: <CAC=cRTN3VKmgM4BYUrN=rMfg8stiP-F_oWR+2LSPFR9m1Wmfqg@mail.gmail.com>
In-Reply-To: <20150209083120.GL5029@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7837372532483357257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2015 at 4:31 PM, Peter Zijlstra <peterz@infradead.org> wro=
te:

> On Mon, Feb 09, 2015 at 01:58:33PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> > commit 9edfbfed3f544a7830d99b341f0c175995a02950 ("sched/core: Rework
> rq->clock update skips")
> >
> >
> > testbox/testcase/testparams:
> xps2/hackbench/performance-1600%-process-socket
> >
> > cebde6d681aa45f9  9edfbfed3f544a7830d99b341f
> > ----------------  --------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >    1839273 =C4=85  6%     +88.2%    3462337 =C4=85  4%
> hackbench.time.involuntary_context_switches
> >   41965851 =C4=85  5%      +5.6%   44307403 =C4=85  1%
> hackbench.time.voluntary_context_switches
> >        388 =C4=85 39%     -58.6%        160 =C4=85 10%
> sched_debug.cfs_rq[1]:/.tg_load_contrib
> >      12957 =C4=85 14%     -60.5%       5117 =C4=85 11%
> sched_debug.cfs_rq[2]:/.tg_load_avg
> >      30505 =C4=85 14%     -57.7%      12905 =C4=85  6%
> sched_debug.cfs_rq[3]:/.tg_load_avg
> >       2790 =C4=85 24%     -65.4%        964 =C4=85 32%
> sched_debug.cfs_rq[3]:/.blocked_load_avg
> >       2915 =C4=85 23%     -62.2%       1101 =C4=85 29%
> sched_debug.cfs_rq[3]:/.tg_load_contrib
> >    1839273 =C4=85  6%     +88.2%    3462337 =C4=85  4%
> time.involuntary_context_switches
> >       1474 =C4=85 28%     -61.7%        565 =C4=85 43%
> sched_debug.cfs_rq[2]:/.tg_load_contrib
> >      11830 =C4=85 15%     +63.0%      19285 =C4=85 11%
> sched_debug.cpu#4.sched_goidle
> >      19319 =C4=85 29%     +91.1%      36913 =C4=85  7%
> sched_debug.cpu#3.sched_goidle
> >       5899 =C4=85 31%     -35.6%       3801 =C4=85 11%
> sched_debug.cfs_rq[4]:/.blocked_load_avg
> >       5999 =C4=85 30%     -34.5%       3929 =C4=85 11%
> sched_debug.cfs_rq[4]:/.tg_load_contrib
> >      37884 =C4=85 13%     -33.5%      25207 =C4=85  7%
> sched_debug.cfs_rq[4]:/.tg_load_avg
> >     229547 =C4=85  5%     +47.9%     339519 =C4=85  5%  cpuidle.C1-NHM.=
usage
> >      35712 =C4=85  3%     +31.7%      47036 =C4=85  9%  cpuidle.C3-NHM.=
usage
> >       5010 =C4=85  9%     -29.0%       3556 =C4=85 20%
> sched_debug.cfs_rq[6]:/.blocked_load_avg
> >       5139 =C4=85  9%     -28.2%       3690 =C4=85 19%
> sched_debug.cfs_rq[6]:/.tg_load_contrib
> >      49568 =C4=85  6%     +24.8%      61867 =C4=85  7%
> sched_debug.cpu#1.sched_goidle
> >      26369 =C4=85 35%     -42.0%      15289 =C4=85 29%  cpuidle.C6-NHM.=
usage
> >         18 =C4=85 16%     +36.5%         25 =C4=85  7%
> sched_debug.cpu#4.nr_running
> >       1.41 =C4=85 12%     -19.3%       1.14 =C4=85 13%
> perf-profile.cpu-cycles.sock_wfree.unix_destruct_scm.skb_release_head_sta=
te.skb_release_all.consume_skb
> >         25 =C4=85 15%     +28.7%         32 =C4=85  9%
> sched_debug.cpu#3.nr_running
> >       1.63 =C4=85 11%     -18.0%       1.34 =C4=85 12%
> perf-profile.cpu-cycles.unix_destruct_scm.skb_release_head_state.skb_rele=
ase_all.consume_skb.unix_stream_recvmsg
> >       0.57 =C4=85  8%      +9.6%       0.62 =C4=85  5%  turbostat.CPU%c1
> >        148 =C4=85 11%     -16.7%        123 =C4=85  7%
> sched_debug.cfs_rq[1]:/.load
> >        109 =C4=85  6%     +17.1%        128 =C4=85  6%
> sched_debug.cpu#6.cpu_load[0]
> >       2.41 =C4=85  8%     -13.3%       2.09 =C4=85 11%
> perf-profile.cpu-cycles.skb_release_head_state.skb_release_all.consume_sk=
b.unix_stream_recvmsg.sock_aio_read
> >        147 =C4=85 12%     -16.4%        123 =C4=85  7%  sched_debug.cpu=
#1.load
> >        111 =C4=85  5%     +15.4%        129 =C4=85  5%
> sched_debug.cpu#6.cpu_load[2]
> >        110 =C4=85  5%     +14.9%        127 =C4=85  5%
> sched_debug.cfs_rq[6]:/.runnable_load_avg
> >        112 =C4=85  5%     +14.5%        128 =C4=85  4%
> sched_debug.cpu#6.cpu_load[3]
> >        113 =C4=85  5%     +13.2%        128 =C4=85  3%
> sched_debug.cpu#6.cpu_load[4]
> >     789953 =C4=85  2%     -10.8%     704528 =C4=85  4%  sched_debug.cpu=
#3.avg_idle
> >      15471 =C4=85  5%      -7.7%      14278 =C4=85  2%  sched_debug.cpu=
#5.curr->pid
> >    2675106 =C4=85 10%     +16.2%    3109411 =C4=85  1%
> sched_debug.cpu#4.nr_switches
> >    2675140 =C4=85 10%     +16.2%    3109440 =C4=85  1%
> sched_debug.cpu#4.sched_count
> >     155201 =C4=85  5%     +14.6%     177901 =C4=85  3%  softirqs.RCU
> >       8.64 =C4=85  6%      -9.6%       7.82 =C4=85  5%
> perf-profile.cpu-cycles.skb_release_all.consume_skb.unix_stream_recvmsg.s=
ock_aio_read.sock_aio_read
> >    2658351 =C4=85 11%     +13.7%    3021564 =C4=85  2%
> sched_debug.cpu#5.sched_count
> >    2658326 =C4=85 11%     +13.7%    3021539 =C4=85  2%
> sched_debug.cpu#5.nr_switches
> >      71443 =C4=85  5%      +9.9%      78486 =C4=85  0%  vmstat.system.cs
> >       8209 =C4=85  5%      +7.3%       8805 =C4=85  0%  vmstat.system.in
> >
>
> OK, so the interesting number is total runtime; I cannot find it.
>

There are no distinguishable difference between the parent and the child
for hackbench throughput number.

Usually you will not consider statistics such as involuntary context
switches?


> Therefore I cannot say what if anything changed. This is just a bunch of
> random numbers afaict.
>
> > To reproduce:
> >
> >         apt-get install ruby ruby-oj
>
> Mostly likely, you requiring ruby just means I will not be reproducing.
>

Sorry.  The test tool is developed with ruby.  Maybe we can make some
improvement in the future to require only bash to reproduce.

Best Regards,
Huang, Ying

--===============7837372532483357257==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5PbiBNb24sIEZlYiA5LCAyMDE1IGF0IDQ6MzEgUE0sIFBldGVyIFppamxzdHJhIDxz
cGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnBldGVyekBpbmZyYWRlYWQub3JnIiB0
YXJnZXQ9Il9ibGFuayI+cGV0ZXJ6QGluZnJhZGVhZC5vcmc8L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6
PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAu
OGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xh
c3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPk9uIE1vbiwgRmViIDA5LCAyMDE1IGF0IDAxOjU4
OjMzUE0gKzA4MDAsIEh1YW5nIFlpbmcgd3JvdGU6PGJyPg0KJmd0OyBGWUksIHdlIG5vdGljZWQg
dGhlIGJlbG93IGNoYW5nZXMgb248YnI+DQomZ3Q7PGJyPg0KJmd0OyBnaXQ6Ly88YSBocmVmPSJo
dHRwOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0
IiB0YXJnZXQ9Il9ibGFuayI+Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RpcC90aXAuZ2l0PC9hPiBzY2hlZC9jb3JlPGJyPg0KJmd0OyBjb21taXQgOWVkZmJmZWQzZjU0
NGE3ODMwZDk5YjM0MWYwYzE3NTk5NWEwMjk1MCAoJnF1b3Q7c2NoZWQvY29yZTogUmV3b3JrIHJx
LSZndDtjbG9jayB1cGRhdGUgc2tpcHMmcXVvdDspPGJyPg0KJmd0Ozxicj4NCiZndDs8YnI+DQom
Z3Q7IHRlc3Rib3gvdGVzdGNhc2UvdGVzdHBhcmFtczogeHBzMi9oYWNrYmVuY2gvcGVyZm9ybWFu
Y2UtMTYwMCUtcHJvY2Vzcy1zb2NrZXQ8YnI+DQomZ3Q7PGJyPg0KJmd0OyBjZWJkZTZkNjgxYWE0
NWY5wqAgOWVkZmJmZWQzZjU0NGE3ODMwZDk5YjM0MWY8YnI+DQomZ3Q7IC0tLS0tLS0tLS0tLS0t
LS3CoCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCAl
c3RkZGV2wqAgwqAgwqAlY2hhbmdlwqAgwqAgwqAgwqAgwqAlc3RkZGV2PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIFzCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
XDxicj4NCiZndDvCoCDCoCAxODM5MjczIMSFwqAgNiXCoCDCoCDCoCs4OC4yJcKgIMKgIDM0NjIz
MzcgxIXCoCA0JcKgIGhhY2tiZW5jaC50aW1lLmludm9sdW50YXJ5X2NvbnRleHRfc3dpdGNoZXM8
YnI+DQomZ3Q7wqAgwqA0MTk2NTg1MSDEhcKgIDUlwqAgwqAgwqAgKzUuNiXCoCDCoDQ0MzA3NDAz
IMSFwqAgMSXCoCBoYWNrYmVuY2gudGltZS52b2x1bnRhcnlfY29udGV4dF9zd2l0Y2hlczxicj4N
CiZndDvCoCDCoCDCoCDCoCAzODggxIUgMzklwqAgwqAgwqAtNTguNiXCoCDCoCDCoCDCoCAxNjAg
xIUgMTAlwqAgc2NoZWRfZGVidWcuY2ZzX3JxWzFdOi8udGdfbG9hZF9jb250cmliPGJyPg0KJmd0
O8KgIMKgIMKgIDEyOTU3IMSFIDE0JcKgIMKgIMKgLTYwLjUlwqAgwqAgwqAgwqA1MTE3IMSFIDEx
JcKgIHNjaGVkX2RlYnVnLmNmc19ycVsyXTovLnRnX2xvYWRfYXZnPGJyPg0KJmd0O8KgIMKgIMKg
IDMwNTA1IMSFIDE0JcKgIMKgIMKgLTU3LjclwqAgwqAgwqAgMTI5MDUgxIXCoCA2JcKgIHNjaGVk
X2RlYnVnLmNmc19ycVszXTovLnRnX2xvYWRfYXZnPGJyPg0KJmd0O8KgIMKgIMKgIMKgMjc5MCDE
hSAyNCXCoCDCoCDCoC02NS40JcKgIMKgIMKgIMKgIDk2NCDEhSAzMiXCoCBzY2hlZF9kZWJ1Zy5j
ZnNfcnFbM106Ly5ibG9ja2VkX2xvYWRfYXZnPGJyPg0KJmd0O8KgIMKgIMKgIMKgMjkxNSDEhSAy
MyXCoCDCoCDCoC02Mi4yJcKgIMKgIMKgIMKgMTEwMSDEhSAyOSXCoCBzY2hlZF9kZWJ1Zy5jZnNf
cnFbM106Ly50Z19sb2FkX2NvbnRyaWI8YnI+DQomZ3Q7wqAgwqAgMTgzOTI3MyDEhcKgIDYlwqAg
wqAgwqArODguMiXCoCDCoCAzNDYyMzM3IMSFwqAgNCXCoCB0aW1lLmludm9sdW50YXJ5X2NvbnRl
eHRfc3dpdGNoZXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAxNDc0IMSFIDI4JcKgIMKgIMKgLTYxLjcl
wqAgwqAgwqAgwqAgNTY1IMSFIDQzJcKgIHNjaGVkX2RlYnVnLmNmc19ycVsyXTovLnRnX2xvYWRf
Y29udHJpYjxicj4NCiZndDvCoCDCoCDCoCAxMTgzMCDEhSAxNSXCoCDCoCDCoCs2My4wJcKgIMKg
IMKgIDE5Mjg1IMSFIDExJcKgIHNjaGVkX2RlYnVnLmNwdSM0LnNjaGVkX2dvaWRsZTxicj4NCiZn
dDvCoCDCoCDCoCAxOTMxOSDEhSAyOSXCoCDCoCDCoCs5MS4xJcKgIMKgIMKgIDM2OTEzIMSFwqAg
NyXCoCBzY2hlZF9kZWJ1Zy5jcHUjMy5zY2hlZF9nb2lkbGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqA1
ODk5IMSFIDMxJcKgIMKgIMKgLTM1LjYlwqAgwqAgwqAgwqAzODAxIMSFIDExJcKgIHNjaGVkX2Rl
YnVnLmNmc19ycVs0XTovLmJsb2NrZWRfbG9hZF9hdmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqA1OTk5
IMSFIDMwJcKgIMKgIMKgLTM0LjUlwqAgwqAgwqAgwqAzOTI5IMSFIDExJcKgIHNjaGVkX2RlYnVn
LmNmc19ycVs0XTovLnRnX2xvYWRfY29udHJpYjxicj4NCiZndDvCoCDCoCDCoCAzNzg4NCDEhSAx
MyXCoCDCoCDCoC0zMy41JcKgIMKgIMKgIDI1MjA3IMSFwqAgNyXCoCBzY2hlZF9kZWJ1Zy5jZnNf
cnFbNF06Ly50Z19sb2FkX2F2Zzxicj4NCiZndDvCoCDCoCDCoDIyOTU0NyDEhcKgIDUlwqAgwqAg
wqArNDcuOSXCoCDCoCDCoDMzOTUxOSDEhcKgIDUlwqAgY3B1aWRsZS5DMS1OSE0udXNhZ2U8YnI+
DQomZ3Q7wqAgwqAgwqAgMzU3MTIgxIXCoCAzJcKgIMKgIMKgKzMxLjclwqAgwqAgwqAgNDcwMzYg
xIXCoCA5JcKgIGNwdWlkbGUuQzMtTkhNLnVzYWdlPGJyPg0KJmd0O8KgIMKgIMKgIMKgNTAxMCDE
hcKgIDklwqAgwqAgwqAtMjkuMCXCoCDCoCDCoCDCoDM1NTYgxIUgMjAlwqAgc2NoZWRfZGVidWcu
Y2ZzX3JxWzZdOi8uYmxvY2tlZF9sb2FkX2F2Zzxicj4NCiZndDvCoCDCoCDCoCDCoDUxMzkgxIXC
oCA5JcKgIMKgIMKgLTI4LjIlwqAgwqAgwqAgwqAzNjkwIMSFIDE5JcKgIHNjaGVkX2RlYnVnLmNm
c19ycVs2XTovLnRnX2xvYWRfY29udHJpYjxicj4NCiZndDvCoCDCoCDCoCA0OTU2OCDEhcKgIDYl
wqAgwqAgwqArMjQuOCXCoCDCoCDCoCA2MTg2NyDEhcKgIDclwqAgc2NoZWRfZGVidWcuY3B1IzEu
c2NoZWRfZ29pZGxlPGJyPg0KJmd0O8KgIMKgIMKgIDI2MzY5IMSFIDM1JcKgIMKgIMKgLTQyLjAl
wqAgwqAgwqAgMTUyODkgxIUgMjklwqAgY3B1aWRsZS5DNi1OSE0udXNhZ2U8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAxOCDEhSAxNiXCoCDCoCDCoCszNi41JcKgIMKgIMKgIMKgIMKgMjUgxIXCoCA3
JcKgIHNjaGVkX2RlYnVnLmNwdSM0Lm5yX3J1bm5pbmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAxLjQx
IMSFIDEyJcKgIMKgIMKgLTE5LjMlwqAgwqAgwqAgwqAxLjE0IMSFIDEzJcKgIHBlcmYtcHJvZmls
ZS5jcHUtY3ljbGVzLnNvY2tfd2ZyZWUudW5peF9kZXN0cnVjdF9zY20uc2tiX3JlbGVhc2VfaGVh
ZF9zdGF0ZS5za2JfcmVsZWFzZV9hbGwuY29uc3VtZV9za2I8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAyNSDEhSAxNSXCoCDCoCDCoCsyOC43JcKgIMKgIMKgIMKgIMKgMzIgxIXCoCA5JcKgIHNjaGVk
X2RlYnVnLmNwdSMzLm5yX3J1bm5pbmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAxLjYzIMSFIDExJcKg
IMKgIMKgLTE4LjAlwqAgwqAgwqAgwqAxLjM0IMSFIDEyJcKgIHBlcmYtcHJvZmlsZS5jcHUtY3lj
bGVzLnVuaXhfZGVzdHJ1Y3Rfc2NtLnNrYl9yZWxlYXNlX2hlYWRfc3RhdGUuc2tiX3JlbGVhc2Vf
YWxsLmNvbnN1bWVfc2tiLnVuaXhfc3RyZWFtX3JlY3Ztc2c8YnI+DQomZ3Q7wqAgwqAgwqAgwqAw
LjU3IMSFwqAgOCXCoCDCoCDCoCArOS42JcKgIMKgIMKgIMKgMC42MiDEhcKgIDUlwqAgdHVyYm9z
dGF0LkNQVSVjMTxicj4NCiZndDvCoCDCoCDCoCDCoCAxNDggxIUgMTElwqAgwqAgwqAtMTYuNyXC
oCDCoCDCoCDCoCAxMjMgxIXCoCA3JcKgIHNjaGVkX2RlYnVnLmNmc19ycVsxXTovLmxvYWQ8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgMTA5IMSFwqAgNiXCoCDCoCDCoCsxNy4xJcKgIMKgIMKgIMKgIDEy
OCDEhcKgIDYlwqAgc2NoZWRfZGVidWcuY3B1IzYuY3B1X2xvYWRbMF08YnI+DQomZ3Q7wqAgwqAg
wqAgwqAyLjQxIMSFwqAgOCXCoCDCoCDCoC0xMy4zJcKgIMKgIMKgIMKgMi4wOSDEhSAxMSXCoCBw
ZXJmLXByb2ZpbGUuY3B1LWN5Y2xlcy5za2JfcmVsZWFzZV9oZWFkX3N0YXRlLnNrYl9yZWxlYXNl
X2FsbC5jb25zdW1lX3NrYi51bml4X3N0cmVhbV9yZWN2bXNnLnNvY2tfYWlvX3JlYWQ8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgMTQ3IMSFIDEyJcKgIMKgIMKgLTE2LjQlwqAgwqAgwqAgwqAgMTIzIMSF
wqAgNyXCoCBzY2hlZF9kZWJ1Zy5jcHUjMS5sb2FkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIDExMSDE
hcKgIDUlwqAgwqAgwqArMTUuNCXCoCDCoCDCoCDCoCAxMjkgxIXCoCA1JcKgIHNjaGVkX2RlYnVn
LmNwdSM2LmNwdV9sb2FkWzJdPGJyPg0KJmd0O8KgIMKgIMKgIMKgIDExMCDEhcKgIDUlwqAgwqAg
wqArMTQuOSXCoCDCoCDCoCDCoCAxMjcgxIXCoCA1JcKgIHNjaGVkX2RlYnVnLmNmc19ycVs2XTov
LnJ1bm5hYmxlX2xvYWRfYXZnPGJyPg0KPC9kaXY+PC9kaXY+Jmd0O8KgIMKgIMKgIMKgIDExMiDE
hcKgIDUlwqAgwqAgwqArMTQuNSXCoCDCoCDCoCDCoCAxMjggxIXCoCA0JcKgIHNjaGVkX2RlYnVn
LmNwdSM2LmNwdV9sb2FkWzNdPGJyPg0KJmd0O8KgIMKgIMKgIMKgIDExMyDEhcKgIDUlwqAgwqAg
wqArMTMuMiXCoCDCoCDCoCDCoCAxMjggxIXCoCAzJcKgIHNjaGVkX2RlYnVnLmNwdSM2LmNwdV9s
b2FkWzRdPGJyPg0KJmd0O8KgIMKgIMKgNzg5OTUzIMSFwqAgMiXCoCDCoCDCoC0xMC44JcKgIMKg
IMKgNzA0NTI4IMSFwqAgNCXCoCBzY2hlZF9kZWJ1Zy5jcHUjMy5hdmdfaWRsZTxicj4NCiZndDvC
oCDCoCDCoCAxNTQ3MSDEhcKgIDUlwqAgwqAgwqAgLTcuNyXCoCDCoCDCoCAxNDI3OCDEhcKgIDIl
wqAgc2NoZWRfZGVidWcuY3B1IzUuY3Vyci0mZ3Q7cGlkPGJyPg0KJmd0O8KgIMKgIDI2NzUxMDYg
xIUgMTAlwqAgwqAgwqArMTYuMiXCoCDCoCAzMTA5NDExIMSFwqAgMSXCoCBzY2hlZF9kZWJ1Zy5j
cHUjNC5ucl9zd2l0Y2hlczxicj4NCiZndDvCoCDCoCAyNjc1MTQwIMSFIDEwJcKgIMKgIMKgKzE2
LjIlwqAgwqAgMzEwOTQ0MCDEhcKgIDElwqAgc2NoZWRfZGVidWcuY3B1IzQuc2NoZWRfY291bnQ8
YnI+DQomZ3Q7wqAgwqAgwqAxNTUyMDEgxIXCoCA1JcKgIMKgIMKgKzE0LjYlwqAgwqAgwqAxNzc5
MDEgxIXCoCAzJcKgIHNvZnRpcnFzLlJDVTxicj4NCiZndDvCoCDCoCDCoCDCoDguNjQgxIXCoCA2
JcKgIMKgIMKgIC05LjYlwqAgwqAgwqAgwqA3LjgyIMSFwqAgNSXCoCBwZXJmLXByb2ZpbGUuY3B1
LWN5Y2xlcy5za2JfcmVsZWFzZV9hbGwuY29uc3VtZV9za2IudW5peF9zdHJlYW1fcmVjdm1zZy5z
b2NrX2Fpb19yZWFkLnNvY2tfYWlvX3JlYWQ8YnI+DQomZ3Q7wqAgwqAgMjY1ODM1MSDEhSAxMSXC
oCDCoCDCoCsxMy43JcKgIMKgIDMwMjE1NjQgxIXCoCAyJcKgIHNjaGVkX2RlYnVnLmNwdSM1LnNj
aGVkX2NvdW50PGJyPg0KJmd0O8KgIMKgIDI2NTgzMjYgxIUgMTElwqAgwqAgwqArMTMuNyXCoCDC
oCAzMDIxNTM5IMSFwqAgMiXCoCBzY2hlZF9kZWJ1Zy5jcHUjNS5ucl9zd2l0Y2hlczxicj4NCiZn
dDvCoCDCoCDCoCA3MTQ0MyDEhcKgIDUlwqAgwqAgwqAgKzkuOSXCoCDCoCDCoCA3ODQ4NiDEhcKg
IDAlwqAgdm1zdGF0LnN5c3RlbS5jczxicj4NCiZndDvCoCDCoCDCoCDCoDgyMDkgxIXCoCA1JcKg
IMKgIMKgICs3LjMlwqAgwqAgwqAgwqA4ODA1IMSFwqAgMCXCoCA8YSBocmVmPSJodHRwOi8vdm1z
dGF0LnN5c3RlbS5pbiIgdGFyZ2V0PSJfYmxhbmsiPnZtc3RhdC5zeXN0ZW0uaW48L2E+PGJyPg0K
Jmd0Ozxicj4NCjxicj4NCk9LLCBzbyB0aGUgaW50ZXJlc3RpbmcgbnVtYmVyIGlzIHRvdGFsIHJ1
bnRpbWU7IEkgY2Fubm90IGZpbmQgaXQuPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48
ZGl2PlRoZXJlIGFyZSBubyBkaXN0aW5ndWlzaGFibGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBw
YXJlbnQgYW5kIHRoZSBjaGlsZCBmb3IgaGFja2JlbmNoIHRocm91Z2hwdXQgbnVtYmVyLjxicj48
YnI+PC9kaXY+PGRpdj5Vc3VhbGx5IHlvdSB3aWxsIG5vdCBjb25zaWRlciBzdGF0aXN0aWNzIHN1
Y2ggYXMgaW52b2x1bnRhcnkgY29udGV4dCBzd2l0Y2hlcz88YnI+PC9kaXY+PGRpdj7CoDwvZGl2
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4
O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KVGhlcmVmb3Jl
IEkgY2Fubm90IHNheSB3aGF0IGlmIGFueXRoaW5nIGNoYW5nZWQuIFRoaXMgaXMganVzdCBhIGJ1
bmNoIG9mPGJyPg0KcmFuZG9tIG51bWJlcnMgYWZhaWN0Ljxicj4NCjxzcGFuIGNsYXNzPSIiPjxi
cj4NCiZndDsgVG8gcmVwcm9kdWNlOjxicj4NCiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBh
cHQtZ2V0IGluc3RhbGwgcnVieSBydWJ5LW9qPGJyPg0KPGJyPg0KPC9zcGFuPk1vc3RseSBsaWtl
bHksIHlvdSByZXF1aXJpbmcgcnVieSBqdXN0IG1lYW5zIEkgd2lsbCBub3QgYmUgcmVwcm9kdWNp
bmcuPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PlNvcnJ5LsKgIFRoZSB0ZXN0
IHRvb2wgaXMgZGV2ZWxvcGVkIHdpdGggcnVieS7CoCBNYXliZSB3ZSBjYW4gbWFrZSBzb21lIGlt
cHJvdmVtZW50IGluIHRoZSBmdXR1cmUgdG8gcmVxdWlyZSBvbmx5IGJhc2ggdG8gcmVwcm9kdWNl
Ljxicj48YnI+QmVzdCBSZWdhcmRzLDxicj5IdWFuZywgWWluZzxicj48L2Rpdj48L2Rpdj48YnI+
PC9kaXY+PC9kaXY+DQo=

--===============7837372532483357257==--

