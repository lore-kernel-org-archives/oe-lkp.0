Content-Type: multipart/mixed; boundary="===============4973500370682260973=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 7bb39313cd: netperf.Throughput_tps -4.5% regression
Date: Tue, 19 Jan 2021 23:09:03 +0800
Message-ID: <20210119150903.GA21908@shbuild999.sh.intel.com>
In-Reply-To: <20210119131759.GL27433@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============4973500370682260973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Tue, Jan 19, 2021 at 02:17:59PM +0100, Borislav Petkov wrote:
> On Tue, Jan 19, 2021 at 08:15:05PM +0800, Feng Tang wrote:
> > On Tue, Jan 19, 2021 at 11:02:55AM +0100, Borislav Petkov wrote:
> > > On Mon, Jan 18, 2021 at 08:27:21PM -0800, Paul E. McKenney wrote:
> > > > I bet that the results vary depending on the type of CPU, and also =
on
> > > > the kernel address-space layout, which of course also varies based =
on
> > > > the Kconfig options.  Let's see how the maintainers would like to p=
roceed.
> > > =

> > > So I ran the "reproduce" script in the original mail on a KBL box here
> > > with the .config tailored for it:
> > > =

> > > cpu family      : 6
> > > model           : 158
> > > model name      : Intel(R) Core(TM) i5-9600K CPU @ 3.70GHz
> > > stepping        : 12
> > > microcode       : 0xd6
> > =

> > I will also try to find a similar KBL in 0day to run the job. This
> > -4.5% comes from a CascadeLake AP which is 4 nodes, 96C/192T.
> > =

> > > and I get mixed results. But I'd need to know how exactly they genera=
te
> > > the metrics "netperf.Throughput_total_tps" and "netperf.Throughput_tp=
s"
> > > =

> > > Feng?
> > =

> > I have to admit I'm just a dumb user of 0day :) I'll leave this question
> > to Philip/Oliver/Rong who are from 0day team.
> > =

> > I assumed you've cloned the lkp-tests.git, and seems one Ruby file
> > https://github.com/intel/lkp-tests/blob/master/stats/netperf is used to
> > process the output of the netperf.
> =

> $ ../lkp-tests/stats/netperf  < rc2.log
> Throughput_tps: 12759.701875000002
> Throughput_total_tps: 204155.23000000004
> workload: 61246569.000000015
> =

> $ ../lkp-tests/stats/netperf  < with-holdout.log
> Throughput_tps: 12863.416875
> Throughput_total_tps: 205814.67
> workload: 61744401.00000001
> =

> So this definitely depends on the .config because in my case, *with* the
> holdout patch it is better vs plain 5.11-rc2.

Yes, that can happen. I started a 4 tasks netperf on a 4C/8T KBL desktop,
and also saw around 2% improvement. Both the kernel config and the
platform matters.

For the performance changes I have checked, sometimes the change can be
reproduced on platforms of different generations (the exact delta number
may differs), sometimes it can only be reproduced on one specific platform,
like some old generation, or special one like Xeon Phi.

Thanks,
Feng

> Thx.
> =

> -- =

> Regards/Gruss,
>     Boris.
> =

> https://people.kernel.org/tglx/notes-about-netiquette
--===============4973500370682260973==--

