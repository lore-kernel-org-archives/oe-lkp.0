Content-Type: multipart/mixed; boundary="===============7491332514456183871=="
MIME-Version: 1.0
From: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
To: lkp@lists.01.org
Subject: Re: [genirq] cbe16f35be: will-it-scale.per_thread_ops -5.2% regression
Date: Wed, 28 Apr 2021 07:01:35 +0000
Message-ID: <d392cc91241641df865217d82368eba8@hisilicon.com>
In-Reply-To: <20210428050758.GB52098@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7491332514456183871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Feng Tang [mailto:feng.tang(a)intel.com]
> Sent: Wednesday, April 28, 2021 5:08 PM
> To: Thomas Gleixner <tglx@linutronix.de>
> Cc: kernel test robot <oliver.sang@intel.com>; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>; Ingo Molnar <mingo@kernel.org>; LKML
> <linux-kernel@vger.kernel.org>; lkp(a)lists.01.org; lkp(a)intel.com;
> ying.huang(a)intel.com; zhengjun.xing(a)intel.com; x86(a)kernel.org
> Subject: Re: [genirq] cbe16f35be: will-it-scale.per_thread_ops -5.2%
> regression
> =

> Hi Thomas,
> =

> On Tue, Apr 27, 2021 at 01:42:12PM +0200, Thomas Gleixner wrote:
> > Folks,
> >
> > On Tue, Apr 27 2021 at 17:00, kernel test robot wrote:
> >
> > > Greeting,
> > >
> > > FYI, we noticed a -5.2% regression of will-it-scale.per_thread_ops du=
e to
> commit:
> > >
> > > commit: cbe16f35bee6880becca6f20d2ebf6b457148552 ("genirq: Add
> > > IRQF_NO_AUTOEN for request_irq/nmi()")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> > > master
> >
> > this is the second report in the last week which makes not a lot of sen=
se.
> > And this oneis makes absolutely no sense at all.
> >
> > This commit affects request_irq() and the related variants and has
> > exactly ZERO influence on anything related to that test case simply
> > because.
> >
> > I seriously have to ask the question whether this test infrastructure
> > is actually measuring what it claims to measure.
> >
> > As this commit clearly _cannot_ have the 'measured' side effect, this
> > points to some serious issue in the tests or the test infrastructure
> > itself.
> =

> 0day has reported about 20 similar cases that the bisected commit has not=
hing
> to do with the benchmark case, and we were very confused too back then. A=
nd
> our debug showed many of them changed the code alignment of kernel data o=
r text
> of other modules which is relevant with the benchmark, though some cases =
are
> not well explained yet. Following are links of some explained cases.
> =

> https://lore.kernel.org/lkml/20200305062138.GI5972(a)shao2-debian/
> https://lore.kernel.org/lkml/20200330011254.GA14393(a)feng-iot/
> https://lore.kernel.org/lkml/20201102091543.GM31092(a)shao2-debian/
> =

> And to debug code alignment case, one debug patch to force all function a=
ddress
> aligned to 32 bytes was merged in v5.9
> =

> 09c60546f04f ./Makefile: add debug option to enable function aligned on 3=
2 bytes
> =

> =

> For this particular case, the commit changes the code size of
> request_threaded_irq(), and many following functions' alignment are chang=
ed.
> =


If so, the performance impact of code change would be random.

> So I extended the debug patch to force 64 bytes aligned, then this commit=
 will
> cause _no_ performance change for the same test case on same platform.
> =

> diff --git a/Makefile b/Makefile
> =

>  ifdef CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_32B
> -KBUILD_CFLAGS +=3D -falign-functions=3D32
> +KBUILD_CFLAGS +=3D -falign-functions=3D64
>  endif
> =

> Though I don't know the detail of how exactly this code alignment affects=
 the
> case.

Guess it is related with icache.
But it is still an irrelevant problem.

> =

> Thanks,
> Feng
> =

> > Thanks,
> >
> >         tglx

Thanks
Barry

--===============7491332514456183871==--

