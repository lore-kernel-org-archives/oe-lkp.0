Content-Type: multipart/mixed; boundary="===============1821313820191225005=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 7bb39313cd: netperf.Throughput_tps -4.5% regression
Date: Tue, 19 Jan 2021 20:15:05 +0800
Message-ID: <20210119121505.GA111354@shbuild999.sh.intel.com>
In-Reply-To: <20210119100255.GC27433@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============1821313820191225005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 11:02:55AM +0100, Borislav Petkov wrote:
> On Mon, Jan 18, 2021 at 08:27:21PM -0800, Paul E. McKenney wrote:
> > I bet that the results vary depending on the type of CPU, and also on
> > the kernel address-space layout, which of course also varies based on
> > the Kconfig options.  Let's see how the maintainers would like to proce=
ed.
> =

> So I ran the "reproduce" script in the original mail on a KBL box here
> with the .config tailored for it:
> =

> cpu family      : 6
> model           : 158
> model name      : Intel(R) Core(TM) i5-9600K CPU @ 3.70GHz
> stepping        : 12
> microcode       : 0xd6

I will also try to find a similar KBL in 0day to run the job. This
-4.5% comes from a CascadeLake AP which is 4 nodes, 96C/192T.

> and I get mixed results. But I'd need to know how exactly they generate
> the metrics "netperf.Throughput_total_tps" and "netperf.Throughput_tps"
> =

> Feng?

I have to admit I'm just a dumb user of 0day :) I'll leave this question
to Philip/Oliver/Rong who are from 0day team.

I assumed you've cloned the lkp-tests.git, and seems one Ruby file
https://github.com/intel/lkp-tests/blob/master/stats/netperf is used to
process the output of the netperf.

Thanks,
Feng

> -- =

> Regards/Gruss,
>     Boris.
> =

> https://people.kernel.org/tglx/notes-about-netiquette
--===============1821313820191225005==--

