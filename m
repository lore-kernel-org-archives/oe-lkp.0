Content-Type: multipart/mixed; boundary="===============6298455035638243329=="
MIME-Version: 1.0
From: Yury Norov <yury.norov@gmail.com>
To: lkp@lists.01.org
Subject: Re: [oliver.sang@intel.com: [cpumask] b9a7ecc71f: WARNING:at_include/linux/cpumask.h:#__is_kernel_percpu_address]
Date: Tue, 11 Oct 2022 10:16:01 -0700
Message-ID: <Y0Wk0WD6CL4aFEIi@yury-laptop>
In-Reply-To: <20221011170949.upxk3tcfcwnkytwm@kamzik>
List-Id: <oe-lkp.lists.linux.dev>

--===============6298455035638243329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Hi Yury,
> =

> I just wanted to report that the warning fires when doing
> 'cat /proc/cpuinfo' on at least x86 and riscv. I don't think
> those are false positives. I'm guessing a patch should be
> something like the following diff. If you haven't already
> addressed this and I'm not off in left field, then I guess
> we should integrate it into your series.
> =

> Thanks,
> drew
 =

Hi Andrew,

Can you please send it as a patch with a description?

> =

> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 4aa8cd749441..4c5dfa230d4b 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -166,9 +166,12 @@ static void print_mmu(struct seq_file *f)
>  =

>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> -	*pos =3D cpumask_next(*pos - 1, cpu_online_mask);
> -	if ((*pos) < nr_cpu_ids)
> -		return (void *)(uintptr_t)(1 + *pos);
> +	if (*pos < nr_cpu_ids) {
> +		*pos =3D cpumask_next(*pos - 1, cpu_online_mask);
> +		if ((*pos) < nr_cpu_ids)

Braces around *pos are not needed.

> +			return (void *)(uintptr_t)(1 + *pos);
> +	}
> +
>  	return NULL;
>  }
>  =

> diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
> index 099b6f0d96bd..2ea614e78e28 100644
> --- a/arch/x86/kernel/cpu/proc.c
> +++ b/arch/x86/kernel/cpu/proc.c
> @@ -153,9 +153,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  =

>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> -	*pos =3D cpumask_next(*pos - 1, cpu_online_mask);
> -	if ((*pos) < nr_cpu_ids)
> -		return &cpu_data(*pos);
> +	if (*pos < nr_cpu_ids) {
> +		*pos =3D cpumask_next(*pos - 1, cpu_online_mask);
> +		if ((*pos) < nr_cpu_ids)

Here too.

Thanks,
Yury

> +			return &cpu_data(*pos);
> +	}
> +
>  	return NULL;
>  }
>  =

> >  =

> > > I suspect that to avoid any automation noise, you should just rebase
> > > so that the fixes come first. Otherwise we'll end up wasting a lot of
> > > time on the noise.
> > > =

> > > This is not that different from introducing new buil;d-time warnings:
> > > the things they point out need to be fixed before the warning can be
> > > integrated, or it causes bisection problems.
> > =

> > OK, I'll reorder the patches. Thanks for your help.
> >=20
--===============6298455035638243329==--

