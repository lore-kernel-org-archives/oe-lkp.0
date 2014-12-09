Content-Type: multipart/mixed; boundary="===============0619046748077364516=="
MIME-Version: 1.0
From: Lai Jiangshan <laijs@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] kthread: kthread_bind fails to enforce CPU affinity (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Tue, 09 Dec 2014 10:24:37 +0800
Message-ID: <54865D65.8030906@cn.fujitsu.com>
In-Reply-To: <20141208085405.730577a3@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============0619046748077364516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/08/2014 09:54 PM, Steven Rostedt wrote:
> On Mon,  8 Dec 2014 14:27:01 +1100
> Anton Blanchard <anton@samba.org> wrote:
> =

>> I have a busy ppc64le KVM box where guests sometimes hit the infamous
>> "kernel BUG at kernel/smpboot.c:134!" issue during boot:
>>
>> BUG_ON(td->cpu !=3D smp_processor_id());
>>
>> Basically a per CPU hotplug thread scheduled on the wrong CPU. The oops
>> output confirms it:
>>
>> CPU: 0
>> Comm: watchdog/130
>>
>> The issue is in kthread_bind where we set the cpus_allowed mask, but do
>> not touch task_thread_info(p)->cpu. The scheduler assumes the previously
>> scheduled CPU is in the cpus_allowed mask, but in this case we are
>> moving a thread to another CPU so it is not.
>>
> =

> Does this happen always on boot up, and always with the watchdog thread?
> =

> I followed the logic that starts the watchdog threads.
> =

> watchdog_enable_all_cpus()
>   smpboot_register_percpu-thread() {
> =

>     for_each_online_cpu(cpu) { ... }
> =

> Where watchdog_enable_all_cpus() can be called by
> lockup_detector_init() before SMP is started, but also by
> proc_dowatchdog() which is called by the sysctl commands (after SMP is
> up and running).
> =

> I noticed there's no "get_online_cpus()" anywhere, although the
> unregister_percpu_thread() has it. Is it possible that we created a
> thread on a CPU that wasn't fully online yet?
> =

> Perhaps the following patch is needed? Even if this isn't the solution
> to this bug, it is probably needed as watchdog_enable_all_cpus() can be
> called after boot up too.
> =

> -- Steve


Hi, Steven, tglx

See this https://lkml.org/lkml/2014/7/30/804
"[PATCH] smpboot: add missing get_online_cpus() when register"


Thanks,
Lai

> =

> diff --git a/kernel/smpboot.c b/kernel/smpboot.c
> index eb89e1807408..60d35ac5d3f1 100644
> --- a/kernel/smpboot.c
> +++ b/kernel/smpboot.c
> @@ -279,6 +279,7 @@ int smpboot_register_percpu_thread(struct smp_hotplug=
_thread *plug_thread)
>  	unsigned int cpu;
>  	int ret =3D 0;
>  =

> +	get_online_cpus();
>  	mutex_lock(&smpboot_threads_lock);
>  	for_each_online_cpu(cpu) {
>  		ret =3D __smpboot_create_thread(plug_thread, cpu);
> @@ -291,6 +292,7 @@ int smpboot_register_percpu_thread(struct smp_hotplug=
_thread *plug_thread)
>  	list_add(&plug_thread->list, &hotplug_threads);
>  out:
>  	mutex_unlock(&smpboot_threads_lock);
> +	put_online_cpus();
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> .
> =



--===============0619046748077364516==--

