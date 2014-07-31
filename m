Content-Type: multipart/mixed; boundary="===============1660747458746391502=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [scheduler] BUG: unable to handle kernel paging request at 000000000000ce50
Date: Thu, 31 Jul 2014 18:42:26 +0800
Message-ID: <20140731104226.GB9455@localhost>
In-Reply-To: <alpine.DEB.2.11.1407300954420.4608@gentwo.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1660747458746391502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Christoph,

On Wed, Jul 30, 2014 at 09:55:29AM -0500, Christoph Lameter wrote:
> On Wed, 30 Jul 2014, Fengguang Wu wrote:
> =

> > FYI, this commit seems to convert some kernel boot hang bug into
> > different BUG messages.
> =

> Hmmm. Still a bit confused as to why these messages occur.. Does this
> patch do any good?

Sorry I find that next-20140730 no long show the BUG. So there is no
way to test whether this patch fixed the problem.

Thanks,
Fengguang

> =

> Subject: vmstat ondemand: Fix online/offline races
> =

> Do not allow onlining/offlining while the shepherd task is checking
> for vmstat threads.
> =

> On offlining a processor do the right thing cancelling the vmstat
> worker thread if it exista and also exclude it from the shepherd
> process checks.
> =

> Signed-off-by: Christoph Lameter <cl@linux.com>
> =

> Index: linux/mm/vmstat.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/mm/vmstat.c	2014-07-30 09:35:54.602662306 -0500
> +++ linux/mm/vmstat.c	2014-07-30 09:43:07.109037043 -0500
> @@ -1317,6 +1317,7 @@ static void vmstat_shepherd(struct work_
>  {
>  	int cpu;
> =

> +	get_online_cpus();
>  	/* Check processors whose vmstat worker threads have been disabled */
>  	for_each_cpu(cpu, cpu_stat_off)
>  		if (need_update(cpu) &&
> @@ -1325,6 +1326,7 @@ static void vmstat_shepherd(struct work_
>  			schedule_delayed_work_on(cpu, &per_cpu(vmstat_work, cpu),
>  				__round_jiffies_relative(sysctl_stat_interval, cpu));
> =

> +	put_online_cpus();
> =

>  	schedule_delayed_work(&shepherd,
>  		round_jiffies_relative(sysctl_stat_interval));
> @@ -1380,8 +1382,8 @@ static int vmstat_cpuup_callback(struct
>  		break;
>  	case CPU_DOWN_PREPARE:
>  	case CPU_DOWN_PREPARE_FROZEN:
> -		if (!cpumask_test_and_set_cpu(cpu, cpu_stat_off))
> -			cancel_delayed_work_sync(&per_cpu(vmstat_work, cpu));
> +		cancel_delayed_work_sync(&per_cpu(vmstat_work, cpu));
> +		cpumask_clear_cpu(cpu, cpu_stat_off);
>  		break;
>  	case CPU_DOWN_FAILED:
>  	case CPU_DOWN_FAILED_FROZEN:

--===============1660747458746391502==--

