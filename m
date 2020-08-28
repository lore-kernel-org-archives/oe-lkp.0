Content-Type: multipart/mixed; boundary="===============5031702508059836741=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Fri, 28 Aug 2020 19:48:39 +0200
Message-ID: <20200828174839.GD19448@zn.tnic>
In-Reply-To: <20200825062305.GA83850@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5031702508059836741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 02:23:05PM +0800, Feng Tang wrote:
> Also one good news is, we seem to identify the 2 key percpu variables
> out of the list mentioned in previous email:  =

> 	'arch_freq_scale'
> 	'tsc_adjust'
> =

> These 2 variables are accessed in 2 hot call stacks (for this 288 CPU
> Xeon Phi platform):
> =

>   - arch_freq_scale is accessed in scheduler tick =

> 	  arch_scale_freq_tick+0xaf/0xc0
> 	  scheduler_tick+0x39/0x100
> 	  update_process_times+0x3c/0x50
> 	  tick_sched_handle+0x22/0x60
> 	  tick_sched_timer+0x37/0x70
> 	  __hrtimer_run_queues+0xfc/0x2a0
> 	  hrtimer_interrupt+0x122/0x270
> 	  smp_apic_timer_interrupt+0x6a/0x150
> 	  apic_timer_interrupt+0xf/0x20
> =

>   - tsc_adjust is accessed in idle entrance
> 	  tsc_verify_tsc_adjust+0xeb/0xf0
> 	  arch_cpu_idle_enter+0xc/0x20
> 	  do_idle+0x91/0x280
> 	  cpu_startup_entry+0x19/0x20
> 	  start_kernel+0x4f4/0x516
> 	  secondary_startup_64+0xb6/0xc0
> =

> From systemmap file, for bad kernel these 2 sit in one cache line, while
> for good kernel they sit in 2 separate cache lines.
> =

> It also explains why it turns from a regression to an improvement with
> updated gcc/kconfig, as the cache line sharing situation is reversed.
> =

> The direct patch I can think of is to make 'tsc_adjust' cache aligned
> to separate these 2 'hot' variables. How do you think?
> =

> --- a/arch/x86/kernel/tsc_sync.c
> +++ b/arch/x86/kernel/tsc_sync.c
> @@ -29,7 +29,7 @@ struct tsc_adjust {
>  	bool		warned;
>  };
>  =

> -static DEFINE_PER_CPU(struct tsc_adjust, tsc_adjust);
> +static DEFINE_PER_CPU_ALIGNED(struct tsc_adjust, tsc_adjust);

So why don't you define both variables with DEFINE_PER_CPU_ALIGNED and
check if all your bad measurements go away this way?

You'd also need to check whether there's no detrimental effect from
this change on other, i.e., !KNL platforms, and I think there won't
be because both variables will be in separate cachelines then and all
should be good.

Hmm?

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 36809=
, AG N=C3=BCrnberg
--===============5031702508059836741==--

