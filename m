Content-Type: multipart/mixed; boundary="===============8844637967164513795=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 5057f55e543: +1307.4% time.involuntary_context_switches
Date: Tue, 03 Jun 2014 15:53:30 +0800
Message-ID: <20140603075330.GA11909@localhost>
In-Reply-To: <538D4C35.8000506@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8844637967164513795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 03, 2014 at 12:16:53PM +0800, Jet Chen wrote:
> On 06/03/2014 11:18 AM, Fengguang Wu wrote:
> > On Tue, Jun 03, 2014 at 10:49:11AM +0800, Jet Chen wrote:
> >> TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >> CC: LKML <linux-kernel@vger.kernel.org>
> >> CC: lkp(a)01.org
> >>
> >> FYI, we noticed the below changes on
> >>
> >> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rc=
u/fixes
> >> commit 5057f55e543b7859cfd26bc281291795eac93f8a ("rcu: Bind RCU grace-=
period kthreads if NO_HZ_FULL")
> >>
> >> Here highlight some major changes:
> > =

> > What's the kernels it's comparing?  The headers here should not be
> > removed.
> > =

> >>       7946 ~13%   +1307.4%     111846 ~ 2%  TOTAL time.involuntary_con=
text_switches
> >>  2.127e+09 ~ 0%     -23.5%  1.628e+09 ~ 4%  TOTAL qperf.udp.recv_bw
> >>  2.128e+09 ~ 0%     -23.3%  1.633e+09 ~ 4%  TOTAL qperf.udp.send_bw
> >>  2.101e+10 ~ 2%     -18.7%  1.707e+10 ~ 2%  TOTAL iperf.tcp.receiver.b=
ps
> >>  2.101e+10 ~ 2%     -18.7%  1.707e+10 ~ 2%  TOTAL iperf.tcp.sender.bps
> >>  6.115e+09 ~ 5%     -17.9%  5.022e+09 ~ 6%  TOTAL qperf.sctp.bw
> >>   2.83e+09 ~ 1%     -12.5%  2.476e+09 ~ 3%  TOTAL qperf.tcp.bw
> >>      26070 ~ 0%      -1.2%      25768 ~ 0%  TOTAL will-it-scale.per_pr=
ocess_ops
> >>       0.40 ~ 0%      +1.9%       0.41 ~ 1%  TOTAL will-it-scale.scalab=
ility
> >>    1113433 ~ 7%    +137.1%    2639530 ~ 3%  TOTAL cpuidle.C4-ATM.time
> >>        786 ~20%     +71.8%       1350 ~15%  TOTAL cpuidle.POLL.usage
> >>      47106 ~ 8%     +53.8%      72472 ~ 3%  TOTAL cpuidle.C1E-ATM.usage
> >>        659 ~ 7%     +50.6%        992 ~ 3%  TOTAL cpuidle.C3-IVT.usage
> >>       3026 ~ 8%     +42.9%       4324 ~ 3%  TOTAL cpuidle.C4-ATM.usage
> >>    5062629 ~ 4%     +26.6%    6408492 ~ 2%  TOTAL cpuidle.C1E-ATM.time
> >>     402345 ~ 2%     -18.9%     326211 ~ 0%  TOTAL cpuidle.C6-IVT.usage
> >>        944 ~ 9%     +17.0%       1105 ~ 8%  TOTAL cpuidle.C1E-IVT.usage
> >>     403926 ~ 0%     -17.3%     333985 ~ 1%  TOTAL cpuidle.C7-SNB.usage
> >>     124425 ~ 0%     -16.4%     103999 ~ 0%  TOTAL cpuidle.C6-ATM.usage
> >>
> >>
> >> full comparison result:
> > =

> > What's the command for producing the full result?
> =

> here I use
> 	compare -a 5057f55e543b7859cfd26bc281291795eac93f8a~ 5057f55e543b7859cfd=
26bc281291795eac93f8a
> =


OK, I got it. The above output is "compare -a | grep TOTAL".

Will you report it out? As per our recent discussions, these numbers
can be directly reported, except that absolute power consumption
numbers should be hold back.

Thanks,
Fengguang

--===============8844637967164513795==--

