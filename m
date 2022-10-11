Content-Type: multipart/mixed; boundary="===============2819661925613734554=="
MIME-Version: 1.0
From: Andrew Jones <ajones@ventanamicro.com>
To: lkp@lists.01.org
Subject: Re: [oliver.sang@intel.com: [cpumask] b9a7ecc71f: WARNING:at_include/linux/cpumask.h:#__is_kernel_percpu_address]
Date: Tue, 11 Oct 2022 19:21:26 +0200
Message-ID: <20221011172126.24csegoozshpy34z@kamzik>
In-Reply-To: <Y0Wk0WD6CL4aFEIi@yury-laptop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2819661925613734554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 10:16:01AM -0700, Yury Norov wrote:
> > Hi Yury,
> > =

> > I just wanted to report that the warning fires when doing
> > 'cat /proc/cpuinfo' on at least x86 and riscv. I don't think
> > those are false positives. I'm guessing a patch should be
> > something like the following diff. If you haven't already
> > addressed this and I'm not off in left field, then I guess
> > we should integrate it into your series.
> > =

> > Thanks,
> > drew
>  =

> Hi Andrew,
> =

> Can you please send it as a patch with a description?

Will do. I'll send two patches, one for each arch.

> =

> > =

> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 4aa8cd749441..4c5dfa230d4b 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -166,9 +166,12 @@ static void print_mmu(struct seq_file *f)
> >  =

> >  static void *c_start(struct seq_file *m, loff_t *pos)
> >  {
> > -	*pos =3D cpumask_next(*pos - 1, cpu_online_mask);
> > -	if ((*pos) < nr_cpu_ids)
> > -		return (void *)(uintptr_t)(1 + *pos);
> > +	if (*pos < nr_cpu_ids) {
> > +		*pos =3D cpumask_next(*pos - 1, cpu_online_mask);
> > +		if ((*pos) < nr_cpu_ids)
> =

> Braces around *pos are not needed.

The braces were preexisting, but I'll drop them while indenting.

Thanks,
drew

> =

> > +			return (void *)(uintptr_t)(1 + *pos);
> > +	}
> > +
> >  	return NULL;
> >  }
> >  =

> > diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
> > index 099b6f0d96bd..2ea614e78e28 100644
> > --- a/arch/x86/kernel/cpu/proc.c
> > +++ b/arch/x86/kernel/cpu/proc.c
> > @@ -153,9 +153,12 @@ static int show_cpuinfo(struct seq_file *m, void *=
v)
> >  =

> >  static void *c_start(struct seq_file *m, loff_t *pos)
> >  {
> > -	*pos =3D cpumask_next(*pos - 1, cpu_online_mask);
> > -	if ((*pos) < nr_cpu_ids)
> > -		return &cpu_data(*pos);
> > +	if (*pos < nr_cpu_ids) {
> > +		*pos =3D cpumask_next(*pos - 1, cpu_online_mask);
> > +		if ((*pos) < nr_cpu_ids)
> =

> Here too.
> =

> Thanks,
> Yury
> =

> > +			return &cpu_data(*pos);
> > +	}
> > +
> >  	return NULL;
> >  }
> >  =

> > >  =

> > > > I suspect that to avoid any automation noise, you should just rebase
> > > > so that the fixes come first. Otherwise we'll end up wasting a lot =
of
> > > > time on the noise.
> > > > =

> > > > This is not that different from introducing new buil;d-time warning=
s:
> > > > the things they point out need to be fixed before the warning can be
> > > > integrated, or it causes bisection problems.
> > > =

> > > OK, I'll reorder the patches. Thanks for your help.
> > >=20
--===============2819661925613734554==--

