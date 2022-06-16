Content-Type: multipart/mixed; boundary="===============5627908584520735696=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [cpuidle] f01f07f0a5: WARNING:at_drivers/cpuidle/cpuidle.c:#cpuidle_enter_state
Date: Thu, 16 Jun 2022 21:37:34 +0800
Message-ID: <20220616133734.GB25633@xsang-OptiPlex-9020>
In-Reply-To: <YpiKWcbyoNnvUU6W@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5627908584520735696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Peter,

On Thu, Jun 02, 2022 at 12:00:57PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 02, 2022 at 05:20:19PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-11):
> > =

> > commit: f01f07f0a50134a775f8e60fdaa559d2f5d63663 ("cpuidle: Move IRQ st=
ate validation")
> > https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/idle
> > =

> > in testcase: netperf
> > version: netperf-x86_64-2.7-0_20220601
> > with following parameters:
> > =

> > 	ip: ipv4
> > 	runtime: 300s
> > 	nr_threads: 1
> > 	cluster: cs-localhost
> > 	send_size: 10K
> > 	test: SCTP_STREAM_MANY
> > 	cpufreq_governor: performance
> > 	ucode: 0xd000331
> > =

> > test-description: Netperf is a benchmark that can be use to measure var=
ious aspect of networking performance.
> > test-url: http://www.netperf.org/netperf/
> > =

> > =

> > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 C=
PU @ 2.60GHz with 128G memory
> =

> I know this is a bit of an ask, but would it at all be possible to
> translate that into a code name; specifically, that "Platinum 8358"
> thing is "Ice Lake".

thanks for great suggestion! we will try to update our report-tool next week
to supply code name as well.

> =

> Our dear marketing department has made it absolutely impossible (without
> just plain googling it) to know what is what :/
> =

> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> =

> Please, start the quote at the "------------[ cut here ]------------"
> marker, that's what it's for. Then you don't miss the actual warning:
> =

> [    4.147181][    T0] ------------[ cut here ]------------
> [    4.147182][    T0] intel_idle leaked IRQ state
>                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^ is the useful bit that=
 went missing.

thanks a lot for education! we will check our report-tool logic why it beha=
ve
like this way and update it to let it give full useful information.

> =

> > [ 4.147200][ T0] WARNING: CPU: 1 PID: 0 at drivers/cpuidle/cpuidle.c:23=
9 cpuidle_enter_state (drivers/cpuidle/cpuidle.c:239 (discriminator 3)) =

> > [    4.147205][    T0] Modules linked in:
> > [    4.147207][    T0] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.18.0=
-11271-gf01f07f0a501 #1
> =

> That's commit c227233ad64c ("intel_idle: enable interrupts before C1 on X=
eons")
> breaking things. Fix below I suppose.
> =

> --- a/drivers/idle/intel_idle.c
> +++ b/drivers/idle/intel_idle.c
> @@ -129,21 +129,36 @@ static unsigned int mwait_substates __in
>   *
>   * Must be called under local_irq_disable().
>   */
> -static __cpuidle int intel_idle(struct cpuidle_device *dev,
> -				struct cpuidle_driver *drv, int index)
> +static __always_inline int __intel_idle(struct cpuidle_device *dev,
> +					struct cpuidle_driver *drv, int index)
>  {
>  	struct cpuidle_state *state =3D &drv->states[index];
>  	unsigned long eax =3D flg2MWAIT(state->flags);
>  	unsigned long ecx =3D 1; /* break on interrupt flag */
>  =

> -	if (state->flags & CPUIDLE_FLAG_IRQ_ENABLE)
> -		local_irq_enable();
> -
>  	mwait_idle_with_hints(eax, ecx);
>  =

>  	return index;
>  }
>  =

> +static __cpuidle int intel_idle(struct cpuidle_device *dev,
> +				struct cpuidle_driver *drv, int index)
> +{
> +	return __intel_idle(dev, drv, index);
> +}
> +
> +static __cpuidle int intel_idle_irq(struct cpuidle_device *dev,
> +				    struct cpuidle_driver *drv, int index)
> +{
> +	int ret;
> +
> +	raw_local_irq_enable();
> +	ret =3D __intel_idle(dev, drv, index);
> +	raw_local_irq_disable();
> +
> +	return ret;
> +}
> +
>  /**
>   * intel_idle_s2idle - Ask the processor to enter the given idle state.
>   * @dev: cpuidle device of the target CPU.
> @@ -1801,6 +1816,9 @@ static void __init intel_idle_init_cstat
>  		/* Structure copy. */
>  		drv->states[drv->state_count] =3D cpuidle_state_table[cstate];
>  =

> +		if (cpuidle_state_table[cstate].flags & CPUIDLE_FLAG_IRQ_ENABLE)
> +			drv->states[drv->state_count].enter =3D intel_idle_irq;
> +
>  		if ((disabled_states_mask & BIT(drv->state_count)) ||
>  		    ((icpu->use_acpi || force_use_acpi) &&
>  		     intel_idle_off_by_default(mwait_hint) &&
--===============5627908584520735696==--

