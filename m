Content-Type: multipart/mixed; boundary="===============9107899877297345270=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Mon, 24 Aug 2020 18:12:38 +0200
Message-ID: <20200824161238.GI4794@zn.tnic>
In-Reply-To: <20200824153300.GA56944@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9107899877297345270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 11:33:00PM +0800, Feng Tang wrote:
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/cor=
e.c
> index 43b1519..2c020ef 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -95,7 +95,7 @@ struct mca_config mca_cfg __read_mostly =3D {
>  	.monarch_timeout =3D -1
>  };
>  =

> -static DEFINE_PER_CPU(struct mce, mces_seen);
> +static DEFINE_PER_CPU_ALIGNED(struct mce, mces_seen);
>  static unsigned long mce_need_notify;
>  static int cpu_missing;
>  =

> @@ -148,7 +148,7 @@ void mce_setup(struct mce *m)
>  	m->microcode =3D boot_cpu_data.microcode;
>  }
>  =

> -DEFINE_PER_CPU(struct mce, injectm);
> +DEFINE_PER_CPU_ALIGNED(struct mce, injectm);
>  EXPORT_PER_CPU_SYMBOL_GPL(injectm);

I don't think this is the right fix. Lemme quote Tony from a previous
email:

"The answer isn't to tinker with "struct mce". Other changes could
trigger this same change in alignment. Anything that is this perfomance
sensitive needs to have some "__attribute__((aligned(64)))" (or
whatever) to make sure arbitrary changes elsewhere don't do this."

And yes, your diff is not tinkering with struct mce but it is tinkering
with percpu vars which are of type struct mce.

However, the proper fix is...

> :)  Right, this is what I'm doing right now. Some test job is queued on
> the test box, and it may needs some iterations of new patch. Hopefully we
> can isolate some specific variable given some luck.

... yes, exactly, you need to identify the contention where this
happens, causing a cacheline to bounce or a variable straddles across a
cacheline boundary, causing the read to fetch two cachelines and thus
causes that slowdown. And then align that var to the beginning of a
cacheline.

Also, maybe I missed this but, do you trigger this only on Xeon Phi or
on "normal" x86 too?

Because if it is Xeon Phi only, then that might explain the size of the
slowdown and that it happens only there because it is a, well, "strange"
machine. :-)

Thx.

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 36809=
, AG N=C3=BCrnberg
--===============9107899877297345270==--

