Content-Type: multipart/mixed; boundary="===============7631603969311820131=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [workqueue] d5bff968ea: WARNING:at_kernel/workqueue.c:#process_one_work
Date: Wed, 27 Jan 2021 16:04:25 +0800
Message-ID: <4dce2be8-b4f7-fd33-b344-87b3f809375c@linux.intel.com>
In-Reply-To: <20210126073925.1962-1-hdanton@sina.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7631603969311820131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/26/2021 3:39 PM, Hillf Danton wrote:
> On 26 Jan 2021 10:45:21 +0800 Xing Zhengjun wrote:
>> On 1/25/2021 5:29 PM, Hillf Danton wrote:
>>> On 25 Jan 2021 16:31:32 +0800 Xing Zhengjun wrote:
>>>> On 1/22/2021 3:59 PM, Hillf Danton wrote:
>>>>> On Fri, 22 Jan 2021 09:48:32 +0800 Xing Zhengjun wrote:
>>>>>> On 1/21/2021 12:00 PM, Hillf Danton wrote:
>>>>>>> On Wed, 20 Jan 2021 21:46:33 +0800 Oliver Sang wrote:
>>>>>>>> On Fri, Jan 15, 2021 at 03:24:32PM +0800, Hillf Danton wrote:
>>>>>>>>> Thu, 14 Jan 2021 15:45:11 +0800
>>>>>>>>>>
>>>>>>>>>> FYI, we noticed the following commit (built with gcc-9):
>>>>>>>>>>
>>>>>>>>>> commit: d5bff968ea9cc005e632d9369c26cbd8148c93d5 ("workqueue: br=
eak affinity initiatively")
>>>>>>>>>> https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.g=
it dev.2021.01.11b
>>>>>>>>>>
>>>>>>>>> [...]
>>>>>>>>>>
>>>>>>>>>> [   73.794288] WARNING: CPU: 0 PID: 22 at kernel/workqueue.c:219=
2 process_one_work
>>>>>>>>>
>>>>>>>>> Thanks for your report.
>>>>>>>>>
>>>>>>>>> We can also break CPU affinity by checking POOL_DISASSOCIATED at =
attach
>>>>>>>>> time without extra cost paid; that way we have the same behavior =
as at
>>>>>>>>> the unbind time.
>>>>>>>>>
>>>>>>>>> What is more the change that makes kworker pcpu is cut because th=
ey are
>>>>>>>>> going to not help either hotplug or the mechanism of stop machine.
>>>>>>>>
>>>>>>>> hi, by applying below patch, the issue still happened.
>>>>>>>
>>>>>>> Thanks for your report.
>>>>>>>>
>>>>>>>> [ 4.574467] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
>>>>>>>> [ 4.575651] pci 0000:00:01.0: Activating ISA DMA hang workarounds
>>>>>>>> [ 4.576900] pci 0000:00:02.0: Video device with shadowed ROM at [m=
em 0x000c0000-0x000dffff]
>>>>>>>> [ 4.578648] PCI: CLS 0 bytes, default 64
>>>>>>>> [ 4.579685] Unpacking initramfs...
>>>>>>>> [ 8.878031] -----------[ cut here ]-----------
>>>>>>>> [ 8.879083] WARNING: CPU: 0 PID: 22 at kernel/workqueue.c:2187 pro=
cess_one_work+0x92/0x9e0
>>>>>>>> [ 8.880688] Modules linked in:
>>>>>>>> [ 8.881274] CPU: 0 PID: 22 Comm: kworker/1:0 Not tainted 5.11.0-rc=
3-gc213503139bb #2
>>>>>>>
>>>>>>> The kworker bond to CPU1 runs on CPU0 and triggers the warning, whi=
ch
>>>>>>> shows that scheduler breaks CPU affinity, after 06249738a41a
>>>>>>> ("workqueue: Manually break affinity on hotplug"), though quite lik=
ely
>>>>>>> by kworker/1:0 for the initial workers.
>>>>>>>
>>>>>>>> [ 8.882518] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS 1.12.0-1 04/01/2014
>>>>>>>> [ 8.887539] Workqueue: 0x0 (events)
>>>>>>>> [ 8.887838] EIP: process_one_work+0x92/0x9e0
>>>>>>>> [ 8.887838] Code: 37 64 a1 58 54 4c 43 39 45 24 74 2c 31 c9 ba 01 =
00 00 00 c7 04 24 01 00 00 00 b8 08 1d f5 42 e8 74 85 13 00 ff 05 b8 30 04 =
43 <0f> 0b ba 01 00 00 00 eb 22 8d 74 26 00 90 c7 04 24 01 00 00 00 31
>>>>>>>> [ 8.887838] EAX: 42f51d08 EBX: 00000000 ECX: 00000000 EDX: 00000001
>>>>>>>> [ 8.887838] ESI: 43c04720 EDI: 42e45620 EBP: de7f23c0 ESP: 43d7bf08
>>>>>>>> [ 8.887838] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 0=
0010002
>>>>>>>> [ 8.887838] CR0: 80050033 CR2: 00000000 CR3: 034e3000 CR4: 000406d0
>>>>>>>> [ 8.887838] Call Trace:
>>>>>>>> [ 8.887838] ? worker_thread+0x98/0x6a0
>>>>>>>> [ 8.887838] ? worker_thread+0x2dd/0x6a0
>>>>>>>> [ 8.887838] ? kthread+0x1ba/0x1e0
>>>>>>>> [ 8.887838] ? create_worker+0x1e0/0x1e0
>>>>>>>> [ 8.887838] ? kzalloc+0x20/0x20
>>>>>>>> [ 8.887838] ? ret_from_fork+0x1c/0x28
>>>>>>>> [ 8.887838] _warn_unseeded_randomness: 63 callbacks suppressed
>>>>>>>> [ 8.887838] random: get_random_bytes called from init_oops_id+0x2b=
/0x60 with crng_init=3D0
>>>>>>>> [ 8.887838] --[ end trace ac461b4d54c37cfa ]--
>>>>>>>
>>>>>>>
>>>>>>> Instead of creating the initial workers only on the active CPUS, re=
bind
>>>>>>> them (labeled pcpu) and jump to the right CPU at bootup time.
>>>>>>>
>>>>>>> --- a/kernel/workqueue.c
>>>>>>> +++ b/kernel/workqueue.c
>>>>>>> @@ -2385,6 +2385,16 @@ woke_up:
>>>>>>>      		return 0;
>>>>>>>      	}
>>>>>>>      =

>>>>>>> +	if (!(pool->flags & POOL_DISASSOCIATED) && smp_processor_id() !=
=3D
>>>>>>> +								pool->cpu) {
>>>>>>> +		/* scheduler breaks CPU affinity for us, rebind it */
>>>>>>> +		raw_spin_unlock_irq(&pool->lock);
>>>>>>> +		set_cpus_allowed_ptr(worker->task, pool->attrs->cpumask);
>>>>>>> +		/* and jump to the right seat */
>>>>>>> +		schedule_timeout_interruptible(1);
>>>>>>> +		goto woke_up;
>>>>>>> +	}
>>>>>>> +
>>>>>>>      	worker_leave_idle(worker);
>>>>>>>      recheck:
>>>>>>>      	/* no more worker necessary? */
>>>>>>> --
>>>>>>>
>>>>>> I test the patch, the warning still appears in the kernel log.
>>>>>
>>>>> Thanks for your report.
>>>>>>
>>>>>> [  230.356503] smpboot: CPU 1 is now offline
>>>>>> [  230.544652] x86: Booting SMP configuration:
>>>>>> [  230.545077] smpboot: Booting Node 0 Processor 1 APIC 0x1
>>>>>> [  230.545640] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
>>>>>> [  230.545675] masked ExtINT on CPU#1
>>>>>> [  230.593829] ------------[ cut here ]------------
>>>>>> [  230.594257] WARNING: CPU: 0 PID: 257 at kernel/workqueue.c:2192 p=
rocess_one_work+0x92/0x9e0
>>>>>> [  230.594990] Modules linked in: rcutorture torture mousedev input_=
leds
>>>>>> led_class pcspkr psmouse evbug tiny_power_button button
>>>>>> [  230.595961] CPU: 0 PID: 257 Comm: kworker/1:3 Not tainted 5.11.0-=
rc3-gdcba55d9080f #2
>>>>>
>>>>> Like what was reported, kworker bond to CPU1 runs on CPU0 and triggers
>>>>> warning, due to scheduler breaking CPU affinity for us. What is new, =
the
>>>>> affinity was broken at offline time instead of bootup.
>>>>>
>>>>>> [  230.596621] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)=
, BIOS 1.12.0-1 04/01/2014
>>>>>> [  230.597322] Workqueue:  0x0 (rcu_gp)
>>>>>> [  230.597636] EIP: process_one_work+0x92/0x9e0
>>>>>> [  230.598005] Code: 37 64 a1 58 54 4c 43 39 45 24 74 2c 31 c9 ba 01=
 00
>>>>>> 00 00 c7 04 24 01 00 00 00 b8 08 1d f5 42 e8 f4 85 13 00 ff 05 cc 30=
 04
>>>>>> 43 <0f> 0b ba 01 00 00 00 eb 22 8d 74 26 00 90 c7 04 24 01 00 00 00 =
31
>>>>>> [  230.599569] EAX: 42f51d08 EBX: 00000000 ECX: 00000000 EDX: 000000=
01
>>>>>> [  230.600100] ESI: 43d94240 EDI: df4040f4 EBP: de7f23c0 ESP: bf5f1f=
08
>>>>>> [  230.600629] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: =
00010002
>>>>>> [  230.601203] CR0: 80050033 CR2: 01bdecbc CR3: 04e2c000 CR4: 000406=
d0
>>>>>> [  230.601735] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000000=
00
>>>>>> [  230.602265] DR6: fffe0ff0 DR7: 00000400
>>>>>> [  230.602594] Call Trace:
>>>>>> [  230.602813]  ? process_one_work+0x20e/0x9e0
>>>>>> [  230.603181]  ? worker_thread+0x32d/0x700
>>>>>> [  230.603522]  ? kthread+0x1ba/0x1e0
>>>>>> [  230.603818]  ? create_worker+0x1e0/0x1e0
>>>>>> [  230.604157]  ? kzalloc+0x20/0x20
>>>>>> [  230.604524]  ? ret_from_fork+0x1c/0x28
>>>>>> [  230.604850] ---[ end trace 06b1e66b5e17fa85 ]---
>>>>>> [  230.605504] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
>>>>>> [  230.766960] smpboot: CPU 1 is now offline
>>>>>> [  230.814803] x86: Booting SMP configuration:
>>>>>> [  230.815306] smpboot: Booting Node 0 Processor 1 APIC 0x1
>>>>>> [  230.815964] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
>>>>>
>>>>>
>>>>> Unlike the above diff that is at most papering over the problem
>>>>> sitting somewhere in the scheduler, add change to creating worker
>>>>> by skipping set_cpus_allowed_ptr() because we will wake it up after
>>>>> attaching it to worker pool.
>>>>>
>>>>> If we can ignore rescuer for now, then the allowed ptr is only
>>>>> updated at on/offline time; lets see the difference at boot time.
>>>>>
>>>>>
>>>>> --- a/kernel/workqueue.c
>>>>> +++ b/kernel/workqueue.c
>>>>> @@ -1844,16 +1844,10 @@ static struct worker *alloc_worker(int n
>>>>>      * cpu-[un]hotplugs.
>>>>>      */
>>>>>     static void worker_attach_to_pool(struct worker *worker,
>>>>> -				   struct worker_pool *pool)
>>>>> +				   struct worker_pool *pool,
>>>>> +				   int update_cpus_allowed)
>>>>>     {
>>>>>     	mutex_lock(&wq_pool_attach_mutex);
>>>>> -
>>>>> -	/*
>>>>> -	 * set_cpus_allowed_ptr() will fail if the cpumask doesn't have any
>>>>> -	 * online CPUs.  It'll be re-applied when any of the CPUs come up.
>>>>> -	 */
>>>>> -	set_cpus_allowed_ptr(worker->task, pool->attrs->cpumask);
>>>>> -
>>>>>     	/*
>>>>>     	 * The wq_pool_attach_mutex ensures %POOL_DISASSOCIATED remains
>>>>>     	 * stable across this function.  See the comments above the flag
>>>>> @@ -1867,6 +1861,9 @@ static void worker_attach_to_pool(struct
>>>>>     	list_add_tail(&worker->node, &pool->workers);
>>>>>     	worker->pool =3D pool;
>>>>>     =

>>>>> +	if (update_cpus_allowed)
>>>>> +		set_cpus_allowed_ptr(worker->task, pool->attrs->cpumask);
>>>>> +
>>>>>     	mutex_unlock(&wq_pool_attach_mutex);
>>>>>     }
>>>>>     =

>>>>> @@ -1942,8 +1939,11 @@ static struct worker *create_worker(stru
>>>>>     	set_user_nice(worker->task, pool->attrs->nice);
>>>>>     	kthread_bind_mask(worker->task, pool->attrs->cpumask);
>>>>>     =

>>>>> -	/* successful, attach the worker to the pool */
>>>>> -	worker_attach_to_pool(worker, pool);
>>>>> +	/*
>>>>> +	 * attach the worker to the pool without asking scheduler to
>>>>> +	 * update CPUs allowed
>>>>> +	 */
>>>>> +	worker_attach_to_pool(worker, pool, 0);
>>>>>     =

>>>>>     	/* start the newly created worker */
>>>>>     	raw_spin_lock_irq(&pool->lock);
>>>>> @@ -2508,7 +2508,7 @@ repeat:
>>>>>     =

>>>>>     		raw_spin_unlock_irq(&wq_mayday_lock);
>>>>>     =

>>>>> -		worker_attach_to_pool(rescuer, pool);
>>>>> +		worker_attach_to_pool(rescuer, pool, 1);
>>>>>     =

>>>>>     		raw_spin_lock_irq(&pool->lock);
>>>>>     =

>>>>> --
>>>>>
>>>> I test the patch, the warning still appears in the kernel log.
>>>
>>> Thanks.
>>>>
>>>> [   55.754187] smpboot: Booting Node 0 Processor 1 APIC 0x1
>>>> [   55.785594] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
>>>> [   55.785646] masked ExtINT on CPU#1
>>>> [   55.920602] ------------[ cut here ]------------
>>>> [   55.921355] WARNING: CPU: 0 PID: 160 at kernel/workqueue.c:2192 pro=
cess_one_work+0x92/0x9e0
>>>> [   55.922583] Modules linked in: rcutorture torture mousedev evbug
>>>> input_leds led_class tiny_power_button psmouse pcspkr button
>>>> [   55.924294] CPU: 0 PID: 160 Comm: kworker/1:2 Not tainted 5.11.0-rc=
3-00186-g77bf4e461cfa #2
>>>
>>> Same issue as before.
>>>
>>>> [   55.925552] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS 1.12.0-1 04/01/2014
>>>> [   55.926763] Workqueue:  0x0 (rcu_gp)
>>>> [   55.927298] EIP: process_one_work+0x92/0x9e0
>>>> [   55.927950] Code: 37 64 a1 58 54 4c 43 39 45 24 74 2c 31 c9 ba 01 00
>>>> 00 00 c7 04 24 01 00 00 00 b8 08 1d f5 42 e8 94 85 13 00 ff 05 b8 30 04
>>>> 43 <0f> 0b ba 01 00 00 00 eb 22 8d 74 26 00 90 c7 04 24 01 00 00 00 31
>>>> [   55.930726] EAX: 42f51d08 EBX: 00000000 ECX: 00000000 EDX: 00000001
>>>> [   55.931642] ESI: 43d90540 EDI: df48c0f4 EBP: de7f23c0 ESP: bfb47f08
>>>> [   55.932590] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00=
010002
>>>> [   55.933609] CR0: 80050033 CR2: 024e994c CR3: 7fd80000 CR4: 000406d0
>>>> [   55.934555] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
>>>> [   55.935457] DR6: fffe0ff0 DR7: 00000400
>>>> [   55.936041] Call Trace:
>>>> [   55.936534]  ? process_one_work+0x20e/0x9e0
>>>> [   55.937305]  ? worker_thread+0x2dd/0x6a0
>>>> [   55.938018]  ? kthread+0x1ba/0x1e0
>>>> [   55.938598]  ? create_worker+0x1e0/0x1e0
>>>> [   55.939315]  ? kzalloc+0x20/0x20
>>>> [   55.940000]  ? ret_from_fork+0x1c/0x28
>>>> [   55.940627] ---[ end trace d155e9e6402de179 ]---
>>>> [   55.941641] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
>>>> [   56.155271] smpboot: CPU 1 is now offline
>>>> [   56.193613] x86: Booting SMP configuration:
>>>> [   56.194400] smpboot: Booting Node 0 Processor 1 APIC 0x1
>>>
>>> The changes in the diff below are
>>>
>>> 1/ at rescue time, change CPU affinity only if POOL_DISASSOCIATED
>>> is not set, and print warning the same way as offline time.
>>>
>>> 2/ at offine time, dont update allowed CPUs after setting
>>> POOL_DISASSOCIATED because we no longer have interest in affinity.
>>>
>>> 3/ at online time, mark pcpu before binding affinity.
>>>
>>> Though one change a diff is appreciated, by the WARNs, we can tell
>>> which is what if any warning goes into dmesg.
>>>
>>> --- a/kernel/workqueue.c
>>> +++ b/kernel/workqueue.c
>>> @@ -1844,25 +1844,23 @@ static struct worker *alloc_worker(int n
>>>     * cpu-[un]hotplugs.
>>>     */
>>>    static void worker_attach_to_pool(struct worker *worker,
>>> -				   struct worker_pool *pool)
>>> +				   struct worker_pool *pool, int set)
>>>    {
>>>    	mutex_lock(&wq_pool_attach_mutex);
>>>    =

>>>    	/*
>>> -	 * set_cpus_allowed_ptr() will fail if the cpumask doesn't have any
>>> -	 * online CPUs.  It'll be re-applied when any of the CPUs come up.
>>> -	 */
>>> -	set_cpus_allowed_ptr(worker->task, pool->attrs->cpumask);
>>> -
>>> -	/*
>>>    	 * The wq_pool_attach_mutex ensures %POOL_DISASSOCIATED remains
>>>    	 * stable across this function.  See the comments above the flag
>>>    	 * definition for details.
>>>    	 */
>>>    	if (pool->flags & POOL_DISASSOCIATED)
>>>    		worker->flags |=3D WORKER_UNBOUND;
>>> -	else
>>> +	else {
>>>    		kthread_set_per_cpu(worker->task, true);
>>> +		if (set)
>>> +			WARN_ON_ONCE(set_cpus_allowed_ptr(worker->task,
>>> +						pool->attrs->cpumask) < 0);
>>> +	}
>>>    =

>>>    	list_add_tail(&worker->node, &pool->workers);
>>>    	worker->pool =3D pool;
>>> @@ -1943,7 +1941,7 @@ static struct worker *create_worker(stru
>>>    	kthread_bind_mask(worker->task, pool->attrs->cpumask);
>>>    =

>>>    	/* successful, attach the worker to the pool */
>>> -	worker_attach_to_pool(worker, pool);
>>> +	worker_attach_to_pool(worker, pool, 0);
>>>    =

>>>    	/* start the newly created worker */
>>>    	raw_spin_lock_irq(&pool->lock);
>>> @@ -2508,7 +2506,7 @@ repeat:
>>>    =

>>>    		raw_spin_unlock_irq(&wq_mayday_lock);
>>>    =

>>> -		worker_attach_to_pool(rescuer, pool);
>>> +		worker_attach_to_pool(rescuer, pool, 1);
>>>    =

>>>    		raw_spin_lock_irq(&pool->lock);
>>>    =

>>> @@ -4923,7 +4921,6 @@ static void unbind_workers(int cpu)
>>>    =

>>>    		for_each_pool_worker(worker, pool) {
>>>    			kthread_set_per_cpu(worker->task, false);
>>> -			WARN_ON_ONCE(set_cpus_allowed_ptr(worker->task, cpu_possible_mask) =
< 0);
>>>    		}
>>>    =

>>>    		mutex_unlock(&wq_pool_attach_mutex);
>>> @@ -4977,9 +4974,9 @@ static void rebind_workers(struct worker
>>>    	 * from CPU_ONLINE, the following shouldn't fail.
>>>    	 */
>>>    	for_each_pool_worker(worker, pool) {
>>> +		kthread_set_per_cpu(worker->task, true);
>>>    		WARN_ON_ONCE(set_cpus_allowed_ptr(worker->task,
>>>    						  pool->attrs->cpumask) < 0);
>>> -		kthread_set_per_cpu(worker->task, true);
>>>    	}
>>>    =

>>>    	raw_spin_lock_irq(&pool->lock);
>>> --
>>>
>> I test the patch, the warning still appears in the kernel log, but the
> =

> Thanks.
> =

>> warning is different from before.
>>
>> [    0.054803] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
>> [    0.054803] masked ExtINT on CPU#1
>> [    0.054803] smpboot: CPU 1 Converting physical 0 to logical die 1
>> [    1.890338] ------------[ cut here ]------------
>> [    1.890338] WARNING: CPU: 1 PID: 18 at kernel/kthread.c:508 kthread_s=
et_per_cpu+0x156/0x180
>> [    1.890338] Modules linked in:
>> [    1.890338] CPU: 1 PID: 18 Comm: cpuhp/1 Not tainted 5.11.0-rc3-00186=
-ged03082352b2 #2
> =

> This warning is better than the one in process_one_work() which is too
> late, though, it has something to say.
> =

>> [    1.890338] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.12.0-1 04/01/2014
>> [    1.890338] EIP: kthread_set_per_cpu+0x156/0x180
>> [    1.890338] Code: 00 00 00 00 ff 05 68 4e 04 43 83 c4 08 5b 5e 5f c3
>> 8d 76 00 ff 05 34 50 04 43 0f 0b e9 f9 fe ff ff 8d 76 00 ff 05 2c 4e 04
>> 43 <0f> 0b eb 9d 8d b6 00 00 00 00 ff 05 40 4e 04 43 0f 0b e9 45 ff ff
>> [    1.890338] EAX: 42f52ce0 EBX: 00000001 ECX: 00000000 EDX: 00000001
>> [    1.890338] ESI: 43d76300 EDI: 43c0de00 EBP: de7f2564 ESP: 43d6beb8
>> [    1.900350] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 0001=
0202
>> [    1.901303] CR0: 80050033 CR2: 00000000 CR3: 034e3000 CR4: 000406d0
>> [    1.902280] Call Trace:
>> [    1.902682]  ? workqueue_online_cpu+0x12b/0x640
>> [    1.903415]  ? workqueue_prepare_cpu+0xa0/0xa0
> =

> By the prepare function we know it is a warning at boot time.
> =

>> [    1.904155]  ? cpuhp_invoke_callback+0x1ed/0x1340
>> [    1.904941]  ? cpuhp_thread_fun+0x28f/0x460
>> [    1.905630]  ? cpuhp_thread_fun+0x49/0x460
>> [    1.906298]  ? smpboot_thread_fn+0x446/0x620
>> [    1.910275]  ? kthread+0x1ba/0x1e0
>> [    1.910857]  ? __smpboot_create_thread+0x260/0x260
>> [    1.911659]  ? kzalloc+0x20/0x20
>> [    1.912368]  ? ret_from_fork+0x1c/0x28
>> [    1.913016] ---[ end trace 6f6c005278241eba ]---
>> [    1.913971] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
>> [    1.920012] smp: Brought up 1 node, 2 CPUs
>> [    1.920299] smpboot: Max logical packages: 2
>> [    1.921019] smpboot: Total of 2 processors activated (10774.03 BogoMI=
PS)
> =

> After staring at it again, the change added in rebind_workers() is
> incorrect for a CPU getting back online after bootup, because the
> CPU affinity has been broken at offline time.
> =

> But the warning in the latest report occurs at boot time, after going
> through steps like,
> =

> 	kthread_create_on_node();
> =

> 	kthread_bind_mask(worker->task, pool->attrs->cpumask);
> =

> 	/* successful, attach the worker to the pool */
> 	worker_attach_to_pool(worker, pool, 0);
> =

> 	/* start the newly created worker */
> 	wake_up_process(worker->task);
> =

> =

> without triggering the warning at kernel/kthread.c:507.
> =

> Before finding an answer (wake_up_new_task()) to the question,
> who changed the allowed ptr?  revert the change at online time,
> and as a compensation, clear POOL_DISASSOCIATED as early as we can.
> =

> =

> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -1844,25 +1844,23 @@ static struct worker *alloc_worker(int n
>    * cpu-[un]hotplugs.
>    */
>   static void worker_attach_to_pool(struct worker *worker,
> -				   struct worker_pool *pool)
> +				   struct worker_pool *pool, int set)
>   {
>   	mutex_lock(&wq_pool_attach_mutex);
>   =

>   	/*
> -	 * set_cpus_allowed_ptr() will fail if the cpumask doesn't have any
> -	 * online CPUs.  It'll be re-applied when any of the CPUs come up.
> -	 */
> -	set_cpus_allowed_ptr(worker->task, pool->attrs->cpumask);
> -
> -	/*
>   	 * The wq_pool_attach_mutex ensures %POOL_DISASSOCIATED remains
>   	 * stable across this function.  See the comments above the flag
>   	 * definition for details.
>   	 */
>   	if (pool->flags & POOL_DISASSOCIATED)
>   		worker->flags |=3D WORKER_UNBOUND;
> -	else
> +	else {
>   		kthread_set_per_cpu(worker->task, true);
> +		if (set)
> +			WARN_ON_ONCE(set_cpus_allowed_ptr(worker->task,
> +						pool->attrs->cpumask) < 0);
> +	}
>   =

>   	list_add_tail(&worker->node, &pool->workers);
>   	worker->pool =3D pool;
> @@ -1943,7 +1941,7 @@ static struct worker *create_worker(stru
>   	kthread_bind_mask(worker->task, pool->attrs->cpumask);
>   =

>   	/* successful, attach the worker to the pool */
> -	worker_attach_to_pool(worker, pool);
> +	worker_attach_to_pool(worker, pool, 0);
>   =

>   	/* start the newly created worker */
>   	raw_spin_lock_irq(&pool->lock);
> @@ -2508,7 +2506,7 @@ repeat:
>   =

>   		raw_spin_unlock_irq(&wq_mayday_lock);
>   =

> -		worker_attach_to_pool(rescuer, pool);
> +		worker_attach_to_pool(rescuer, pool, 1);
>   =

>   		raw_spin_lock_irq(&pool->lock);
>   =

> @@ -4923,7 +4921,6 @@ static void unbind_workers(int cpu)
>   =

>   		for_each_pool_worker(worker, pool) {
>   			kthread_set_per_cpu(worker->task, false);
> -			WARN_ON_ONCE(set_cpus_allowed_ptr(worker->task, cpu_possible_mask) < =
0);
>   		}
>   =

>   		mutex_unlock(&wq_pool_attach_mutex);
> @@ -5954,6 +5951,7 @@ void __init workqueue_init_early(void)
>   		i =3D 0;
>   		for_each_cpu_worker_pool(pool, cpu) {
>   			BUG_ON(init_worker_pool(pool));
> +			pool->flags &=3D ~POOL_DISASSOCIATED;
>   			pool->cpu =3D cpu;
>   			cpumask_copy(pool->attrs->cpumask, cpumask_of(cpu));
>   			pool->attrs->nice =3D std_nice[i++];
> --
> =

I test the patch, the warning still appears in the kernel log.

[    0.043584] masked ExtINT on CPU#1
[    0.043584] smpboot: CPU 1 Converting physical 0 to logical die 1
[    1.681867] ------------[ cut here ]------------
[    1.681867] WARNING: CPU: 1 PID: 18 at kernel/workqueue.c:5015 =

workqueue_online_cpu+0x336/0x640
[    1.681867] Modules linked in:
[    1.681867] CPU: 1 PID: 18 Comm: cpuhp/1 Not tainted =

5.11.0-rc3-00186-g178826956ca7 #2
[    1.681867] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =

BIOS 1.12.0-1 04/01/2014
[    1.681867] EIP: workqueue_online_cpu+0x336/0x640
[    1.681867] Code: 01 00 00 00 eb 89 8d b6 00 00 00 00 8b 5c 24 0c 89 =

d8 e8 3d 39 19 01 e9 1c fd ff ff 8d b4 26 00 00 00 00 90 ff 05 dc 20 04 =

43 <0f> 0b e9 07 ff ff ff 8d 76 00 ff 05 2c 21 04 43 0f 0b e9 12 fe ff
[    1.681867] EAX: 42f51168 EBX: 0000000c ECX: 00000000 EDX: 00000001
[    1.681867] ESI: 00000000 EDI: 43c04720 EBP: de7f2564 ESP: 43d6bed0
[    1.681867] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010002
[    1.681867] CR0: 80050033 CR2: 00000000 CR3: 034e3000 CR4: 000406d0
[    1.681867] Call Trace:
[    1.681867]  ? workqueue_prepare_cpu+0xa0/0xa0
[    1.681867]  ? cpuhp_invoke_callback+0x1ed/0x1340
[    1.681867]  ? cpuhp_thread_fun+0x28f/0x460
[    1.681867]  ? cpuhp_thread_fun+0x49/0x460
[    1.681867]  ? smpboot_thread_fn+0x446/0x620
[    1.681867]  ? kthread+0x1ba/0x1e0
[    1.681867]  ? __smpboot_create_thread+0x260/0x260
[    1.681867]  ? kzalloc+0x20/0x20
[    1.681867]  ? ret_from_fork+0x1c/0x28
[    1.681867] ---[ end trace 3e853d8ad82e44ac ]---
[    1.691939] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
[    1.705909] smp: Brought up 1 node, 2 CPUs
[    1.706605] smpboot: Max logical packages: 2

[   85.402803] smpboot: Booting Node 0 Processor 1 APIC 0x1
[   85.442465] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
[   85.442602] masked ExtINT on CPU#1
[   85.541391] ------------[ cut here ]------------
[   85.542250] WARNING: CPU: 1 PID: 18 at kernel/kthread.c:508 =

kthread_set_per_cpu+0x156/0x180
[   85.543664] Modules linked in: rcutorture torture mousedev evbug =

input_leds led_class psmouse pcspkr tiny_power_button button
[   85.545530] CPU: 1 PID: 18 Comm: cpuhp/1 Tainted: G        W =

5.11.0-rc3-00186-g178826956ca7 #2
[   85.547006] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =

BIOS 1.12.0-1 04/01/2014
[   85.548454] EIP: kthread_set_per_cpu+0x156/0x180
[   85.549231] Code: 00 00 00 00 ff 05 68 4e 04 43 83 c4 08 5b 5e 5f c3 =

8d 76 00 ff 05 34 50 04 43 0f 0b e9 f9 fe ff ff 8d 76 00 ff 05 2c 4e 04 =

43 <0f> 0b eb 9d 8d b6 00 00 00 00 ff 05 40 4e 04 43 0f 0b e9 45 ff ff
[   85.552236] EAX: 42f52ce0 EBX: 00000001 ECX: 00000000 EDX: 00000001
[   85.556663] ESI: bfb70000 EDI: 45e61000 EBP: de7f2564 ESP: 43d6beb8
[   85.559168] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
[   85.561991] CR0: 80050033 CR2: 00000000 CR3: 034e3000 CR4: 000406d0
[   85.563040] Call Trace:
[   85.563463]  ? workqueue_online_cpu+0x17f/0x640
[   85.564222]  ? rapl_cpu_online+0xb7/0x1a0
[   85.564904]  ? workqueue_prepare_cpu+0xa0/0xa0
[   85.565643]  ? cpuhp_invoke_callback+0x1ed/0x1340
[   85.566424]  ? cpuhp_thread_fun+0x28f/0x460
[   85.567140]  ? cpuhp_thread_fun+0x49/0x460
[   85.567844]  ? smpboot_thread_fn+0x446/0x620
[   85.568569]  ? kthread+0x1ba/0x1e0
[   85.569162]  ? __smpboot_create_thread+0x260/0x260
[   85.569961]  ? kzalloc+0x20/0x20
[   85.570918]  ? ret_from_fork+0x1c/0x28
[   85.575418] ---[ end trace 3e853d8ad82e44ae ]---
[   85.577919] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
[   85.580973] ------------[ cut here ]------------
[   85.581747] WARNING: CPU: 0 PID: 87 at kernel/workqueue.c:2190 =

process_one_work+0x92/0x9e0
[   85.583058] Modules linked in: rcutorture torture mousedev evbug =

input_leds led_class psmouse pcspkr tiny_power_button button
[   85.584850] CPU: 0 PID: 87 Comm: kworker/1:2 Tainted: G        W =

     5.11.0-rc3-00186-g178826956ca7 #2
[   85.586456] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =

BIOS 1.12.0-1 04/01/2014
[   85.587753] Workqueue:  0x0 (rcu_gp)
[   85.588347] EIP: process_one_work+0x92/0x9e0
[   85.589018] Code: 37 64 a1 58 54 4c 43 39 45 24 74 2c 31 c9 ba 01 00 =

00 00 c7 04 24 01 00 00 00 b8 d8 1c f5 42 e8 14 85 13 00 ff 05 a4 30 04 =

43 <0f> 0b ba 01 00 00 00 eb 22 8d 74 26 00 90 c7 04 24 01 00 00 00 31
[   85.595358] EAX: 42f51cd8 EBX: df4080f8 ECX: 00000000 EDX: 00000001
[   85.596319] ESI: 43d94840 EDI: df4080f4 EBP: de7f23c0 ESP: 45505f08
[   85.597291] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010002
[   85.598410] CR0: 80050033 CR2: 372c2004 CR3: 7fa9f000 CR4: 000406d0
[   85.599401] Call Trace:
[   85.599804]  ? process_one_work+0x20e/0x9e0
[   85.600474]  ? worker_thread+0x40d/0x6a0
[   85.601096]  ? kthread+0x1ba/0x1e0
[   85.601635]  ? create_worker+0x1e0/0x1e0
[   85.602246]  ? kzalloc+0x20/0x20
[   85.602907]  ? ret_from_fork+0x1c/0x28
[   85.603512] ---[ end trace 3e853d8ad82e44af ]---
[   85.699976] smpboot: CPU 1 is now offline
[   85.771891] x86: Booting SMP configuration:
[   85.772532] smpboot: Booting Node 0 Processor 1 APIC 0x1



-- =

Zhengjun Xing

--===============7631603969311820131==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj5YxhlxldADKYSqt8kKSEWvAZo7Ydv/tz/AJuxJZ5vBF3
0cBaGDaudJVpU5nIU3ICatAOyRoDgsgw6LNN2YAnmjHhL7hNy39WP09NXJZdAKP4SsrktEQsTfeE
xQHoUbhBtY61/9COZmhY/q6SW/Bi/0ZcadKfX++vGPNAQv4ugUZgzrXwXen8Qv8NIkELqVYZD+es
bbcNSvB/pUyieqSiwBE0GsRJGgzWCrFxiQOv0+xVpGPSI0nQJYh5i4G3uyyZOfOim+6PmZStyf6P
9bzYZW46Qt3DsKHqnNt3LJOk8uAm0nmGJxHyK/CcdksyNY0uYxrHRkl2EvylPcUXKIhJb9PMHi1+
pFXL9WLYliZn+KBDaKzqxIhAwi7U9qqqXE3TeuFYJg6HyvyfMT+pdb7wQyOaYKtpEgOaI9KW4yeI
XdFOuFniJeik/7Khn23QNvKrv+EWMVwtV3yQBO4Yc9DzGMCn9nHNdkDTl0SMbLTWnytczaWeeGqp
M0XWLnZknmi3XMIfJdAbt02mvm+tuW7uSi6tOHZyMCu2joIKTeO5KMIHPu9HoQFWbMOrEUQpYbfK
xQ2eu29N6W6RGXqD9vxO4JaJWD31dKR+5ISvWzpV7PzYUrVbS8C+R5DC3jTgEBlthgF7CCwG537O
nMdhXXS49RiMpow4Dt7PcIKheHzGLhJse+d60GUukIu831dqZ/DF1Yq9MJKH/MemWgLwxYADjGUR
5OoMJOBJU2wZpXD50W1bUcLXArdtHdg1ZSoZVZ9hmsR9L8MEaagMQqpksBxe84Y08MiA8tDrJcKI
QVVRF91wuE+P6MwQDSAO77CyQLg5EdZQOrokJzWHISF87iykp6NJyen03x8M+x3JxUnD71tFOPGv
ovNWVt/nRNuffAAj4jc32Mbhzih5Ty1oDNU4T1I0VuB0xNq9W/zEJt10v5Z9uLsA0af1y6v1/IUp
gyTYKHl805FWkbVEnnlPRUvx/YeiMehtn9UcRzQUoKEqG1IsRGUX8rkp2bRN1NqLsVA2pTadrkI3
1TyKySMoRtaVRDYKmYMo2QloTmc77foxtThTQofPqHq086NMH2BnVAFl+/hsEcAKwGODuboVeOjZ
Kd8bJWN5uJA+nd6TEVGRr0VbrqRCvrSizR8wdJWq5Tx9cQSwaGY4iOW5AKkiCdM6VjMmlJvgfPMm
+YLSX3Eo9wwmIWpIAoH1OcUC/OU5whEwKuyNwNE9D7U7BBTm+3N5Unp3tKdRLLy2hnR8RkkkwAeu
sgxcnlBkSIUL2Nc/WxWz8RRhHtF64qv5XA0WCyU9lhz3mUpgAms8fcmARvbtk2O29LNV4yr/hZhi
0Zn6fTh1eGTEc5Pe5Rc2eksHkI6LDTBFterq9YleZSAbkP7a8oPJU4GOYQGS2gCMwMoM1WAhCvwL
8Aq3WuC1FpTyv5EVmEpQ0sZ9m8YiabBpGKGGB7GHzj9IJwlyzhE2o9J+qo3/Y7HZSYQBZNgi8S3Y
OJUSNNw98+ImI+v7IxNTJLOPVY+v/fJy/iFPSl1rs3MtK1mMKgqSY/VzC0v+3Vz7H5buWuNR6GYD
KvPjsC/SV+B4WJ1qyGrX++ijaMmpJxZmMziwAYyThwlESIyY/j8QlUS9sMCE/P1QDzBg+NThdUpG
ijeAwhxruv/ifYgcefSWxGPUklLooJSDnXZbEtCuAUfOQ7HaZWwjky6QNuy+/HnE/IycYsHjKdtO
OVVIdKSBLW216AKbSPaVCPfcVz0w1hbAFcZSmRh+c8kqcIsi5ImQWX4hOS++AnDvMqqvoDYqVxOo
eK2yvaTpWxBJu981Pvjm/S0KVmlm0ApavS5VfDjqejvsSRKQC9AHa9774XJcmkF7hL1W0BzvIuGg
wen9mok5/weMWSR2o+erhk4wsENe1DqSNRCvZOi0o+HFuFpbDcUGCdmn30B1DVgMOw01vmDPy11m
TFGUx33tUtq/2kD4oASJGe38vfdIZBrbrfqJKFGinLeVfWZ3GnOpdpPWJ1z7YPjGyMfdvAF7raJ6
2JGbSGUR7JhlZM44Qex+1kARWZJq+NhUPX9xw3NOdeAXRcU1wKfDbu7VczRQkYzg3eNXCo6BjnqA
u2Nv9jxWNVI0TUfymmhhqZXGCEcCSWHy5BRkGG6qUDFiioiIgAlL4MUXFLjsWADCxoBX6hcKZJ9l
mlgv2lb8wy6GHHPa5Z1t2NjOS1cPVmPQnF4p+Pr/DasFY505sAGjWP5zpmHWhwgUhOm5E1sBOWzZ
QqPYY0+ELuIozEVD+Bzmc8wCf/t8qWA28ElGhp4f0TyaTWC513QxNst29wktdy892aIkAMnj7VdH
enrKSmnZWB70YwD+RSsSRlc/tjy4PZ7POhaVzu+hgR5Otu4GXV+zgoURwiQNuKJDDU2/V87ABY2p
tqrZWZyA1XgFOz5TA8LHkEqmfMXYIgQUHlwwqByDYipvWU9R4JbpTGL1WXb1GzFVlkWFm7VS2LPt
oJxEVTsguWZx/XScohN6gF/PmFX5U2uS9OrhYVdwPB3WeifeMuXmbcN3k6plfKIgJKdu09TNFjdD
iZ0vuj5RvDtQbE+M4gDepzFMQyR0bIoEt8fvALtXj7H5I/QRoJA12peaFPoMd0N9/cQsxG7N38mT
dmTUjIqwGaJ3Fhqf7xGd08Fcne2hJweAjTBi5ovh57PbNGgs9a2sxQJZUhdGopcd/D21X32W7XJL
RkuHlHMc463Fpk81ZkJmFfVF1XCoLuBxXx8HGe3GescULFvgLUr0KysIG17ZLEPeHansibHUY7i8
6e5gEFEASVxQS1sbPgVAAtNnBJetww75UhfPtCrl66ht9P++U3N2vP6Cc509s0gJlM2+V7AKZn/U
nn8i2V/jpDE+zV/UH30G5VnuU3lPcYtIMcvsVDrITaDkvKFwdkukcoa3htXFygpftptwguHw70LZ
iklYZ1+2gUAZ1LXuX8VYDUW+LgoFFYFUpBVwf62Ny77coZEwd4y1CzVhWwcznY6pRH6rkPmBm/Ox
D0GtQqvVTtB/K/fKIT1C10bkVipTPeDJAOteJUjVbi4qleACj+gtnaUUkjkzb05UsTyDEIHdN6g8
nUBPqAK4X1HB2rs1JlSbJjI/nvY2eYH7QgqFxUq5UjpwTN3J8OwD61pK8L/frmuVKJeMO/yBmcpP
n9BrLi/D9YoBWrR9vQiEnMSZVMktZKoX/ayftHzV14j0TABE3qDRcQmhRh1PwkOACzrsOLCDEROZ
2FR8dRSy24pr+SacVlsW2E9vXcQCC+dTY+4xGzKUBmfwqF0QV+cHw6P/M+ZZlw9Uww9Blyfg+02H
HO2bGN1ephQstpPC0sCLO8ZAKsAQXMCvezCiSybZQ3W+rEBjqK+h1Z1/hjuRsUSGzQtkyJeYlmZt
kMpP3dMKok6O0RWzc7+FI73YcHzljjN8Cu5yO+Ue6PJBOjdh4iyH7LaYzyQcj9j8pRK1ZQulr9T1
GyLafJqUnfs0c/l36M9IDktuEFdoNRpaatlPG2yLHoV0jdskWTNt80YNMkqWISd9bNIfEukkLCLE
go6R1f/knY/xq9WCJOWNLOJdHb8k0zzJ1FkHiOlJu2jd16WbSx/e+lWI+PbRRCToz34ozB77N/7p
q+RBdcKrBzQuRC80rBWo1+bVADvbX9VugpwP5zjnwu4NYLghjiGhd7W6E0kP8z4n69eJjsCOU/ad
OXPdav/OO/HUcP4cQVl5rC1bOkuu50NmOoZkGBJ2VUxK/R8DBiiorWGinkAKHOS7zED1wwAzFP4d
w4o2G0EfKwlSoTZBu0+A0C9exRasL+ktQvpltC9rUuUVXA8/aacGDjbhpZMJs+Qd62+5qBRtblre
PKtrKMSNw64SyiX/lQk8geLHZp2lAOqkpejquZ8R1woGN9+zkYQwfg8Tq1mLxqcMKVdECeGQK9bu
Yh7Gq0aQJIWfUMP2X63/aWOzxGSnPfPch7xlapOd0yaLKpa368ETWe5mYFd+3QjItnp+AMO7b2DW
aKmv048Pi7lx46mbnPINgSjbD5s8V8WjrH2T4oez2O+JIkE6X5BQRgq7CrvaosfYfMe09VkGs3XT
/lZBTSOK6b3IoicPItT7u6/SNloJ4ykraTTWp9Q5AxD26+veoVMn7RooveKHmuYFxp30yh2e1Q7O
Rr1yu9Qc9bMcRyU1ajmiyMgeSu/2JVIdr6pWJ0T/W+QDtseHTdd68x7baCPCw/tt47fsSSYFiJIT
gnymNWNDBUc3KoQMIueKdpC7QqyJD2SCQM4wCtno/wTjyE6l9uCvl+p4/NrEg4Rggl3jhIte40B/
BJ30Y/sOmwyou6gFYXrFpvz9fHnaEG+WmNFWbeZA+02aRqUxVtPNUrRO/QPAYJwrquF1dxGVTbBH
9VA32xpnE7kpQY7OuVPyb82Jp2ghi4cMldhtjd+eFRmIiusoGCBoYYqTDKSMcYyiOZNsHgpKdmGL
JIRquGjBOn5Ur40g5gbeW6Bs2/Fi0dvgiVJcOqzIp8dkXlGbggdIgz8wG+238EhpioQ7oJHaPpHT
jN5jr2W4o1UNLVHbFrWaVfwlYtp15xXJOsNyiix049J70B6h7PJAUeFWfLuOMGASzUyfCAXZAy8S
qEkFDX7EUl06g6Xa5iJMzed3JrIK/aRcTjD8HNGi/veaNQg9miTswHdd/U4SkL3m4PoigJKzQjCl
Fv0HpN+3+gpiuBtSS0A9KadDz7hs0G/OI4Ufk7lHornrZ1GUhF51l5k4Or+DzENCVk9W+LyvBZ04
TR+WPzbSDTASWcCBTZfyHyD27S6YFLpQzIiOG0fFWcRfvl/4ZEAJEN55oKMGZ++/xqO7JMBRCeO6
TASpPGbXHZAvpYFT0OqTm3oIJTGCeuMPs8Zz70Q+TY0fWYPI6AoBO3llBY89uP2nNdsz54MkqSov
muOdfzlsWToUwwGa/azIKslbNoF5pW/cH0v5yxtlRwxVodkmIXIAHmkVlpCBvHEogAwILjs4JGvK
O2F3Ry7P9nObXvuBopVeXbBwrFRE2zsZpEGHIIdCSM20u9hSRoMeGuYJlj8fFr0CaTkuEibUMMjn
4AFAkrpGWiJtj2kxMGeV+5SdaBgzDdFdN9+UwwpwMEGIBzNNQxINN2TCNYglcx1YOSwdVgD9UzGN
yAV84GnikRkJ7A1W9WKWzL1rfloCpe/s0uz9sZ2nkHpmHF8pMr2dqx8CNuQtVUbvuqyxGiqkSENx
Ke34bE1u2Rtzf7vZDj9z0f19RZX+s0XA4uUMxUaqHytt500/9KhqwY61VhU0GD58FlGMXYOpr+LS
pdc0oj7UiEqPLvlPhm/3iKVDNa0aSvehc0dWUI0qmP2lcf/VVi0B5DGknxfss4xPz2hSPYXkFYUN
F8dZm0Xa5mOBjZDhEMXIcmv9YM4Wegowom8vQCZxVNk7nDG39Fo6Zu+BMVKI7HjCjwhibUFhqNxM
4n9kkWqxj6rm1xUop1uzIScj2XRiUqJMTaoY5hGbSQ8EbujIQ36cF52W53Dt63J+AMZ3fgU76Bka
H/x+RFj2xyZdbr5+pZp0Xjkq7wbhN2QjggP+wtWjxfw2xdYTTE/k8ziG/Akwch1HbW+0kWFHAHj0
XAeS684PBHR534Q6zF9e6NbF3hbN6NHMD3VScylVrFyVUZfUDZWz6OjKRDde6+S3S0CAxoUQfLg2
Vfc4TguLlIH9BMC3WlDBfB9A0/+KF1Uaps0cAqb2qO7DXe/YXGmAhoUo7Ssa/dwmtUC6UxQ06UV6
wvQ9z0i10R7RoZ/05iVs8FMDhQHcrn+WF7tGjXFtXlb82G/CObzC2tUQAE4D1w607RQZtPbmgZvC
8dynPSGakydrXqFvDteEiDZjyRdPKG8QcXUR0q5kMFPX5+/v7tWcxIRJ6//R5YPlVAbShxMidtJK
uoSAuwFeEg9XufRkMEinoJ4se8qFhBwzaTsL/GyUFHZcbCXRS+xd3oHrXxQ1t39gq6Sf6sD/k0xa
vGpa4mpyiqo0jchfDmmXUtsr7k880LTh0W+ok33fnb1ey8w+vMeJQAoETPboh6E5z4WyUxM16bPt
+A8D9kCImu/0D5AojHeaZXvNsfRQgooQec52MyUYUrUFt6PgPQ0584G2nQGlXhEOklUS+BARS+XN
CXnsydoy86rZ2UuJOtqIQ6WJEURoaquQijZfzHlT/Ewh31T2lhEZNrgEBXcsF+4UHJ91WZJKHFRL
dOljulTSUhzb5xTPjQjFWuoy1A0yZtByR0QOH3nsAk+RS2HLrHa6+z7MG1K7nE1BoRJ5FQB/sJxy
VUzSlTo//vKqPXJvOLanscVHtRMhf4+7l496pBpm5nyzVOUq2J+LmHZpA0dVYpJTN0AZEsaw5yQj
vNkKlY2vNx1tguIQUu0a+TnAEBkFzGQEDNRAPiLUWr0E/YOitj4YyyuGgd9Lln9TDMJrGUsGFZ/3
o2Mv/BQBhf37g13tLuH4/bxyVVWzevAKLbDlj/FlRuNpMdB1Yed8C/F2NsJHow7HSNkf0pBglea2
0AU/67cVa7e4swVxGtvFQ/1bjDBGH9OBN75Y9nZm9wC+TQ2HLrvNA5kEOrFnji99Cd+7rbYTHtwA
FwgLm77cS8N3fKqLF19zXLpf0baLnk5hkI2l3UjH/N39d6tj19a8/qxQPjRBdROZjPTj59fLWLPs
DGyytRQqOsa0dMzFHyK10fPRyBbrvWWIpAHtMJ8hakZUp0WSM65qYm9QUDhWkLgT9ZFcsuNnXlQi
Q2SlpJXGQbZ7WJgu3qnJDhR9siZ/HfWoeoAF8Rtugc/4g4l8TEs5a+/C0qhEP8/qaNutsb6yBKMR
Vz0krqZwd5tQwtopuEo3NntD4FEuS8NrPJHOjLnLBA3lVd6Py9UqOiMf5rKB7PoTU6wJ4MObxi3n
IoSjiANyXhBzY3Jdqr8W5M7eizFWQDaxzpgtQOogGx99Fqve124ovG1H+lEnWxgK5p9ZguOs7ibd
+fy7M6tlDiq+3A4rY0Vlj2h8K0nhElWAd4w/2EJdC/HuRMaqwDmqx5+uyYS6MW9AvOh3oWEUNUvJ
mZHJwto6pUwhR7+oSu3fZ4Eawl83A9sAYXea0fLzH3P65GpWjW8nwZnHwra/7i7/SUl6aXKnnTIK
K9UIqb171IncTRZFJoCAm8d0r0oSQQ3Dezio+lojYCDFRyCgr8tPu3e8DAQoN0Mw61vtsE1TqjX5
0jiR7O/1U4X5zOpj9/nD4NbxZCtI56RT6xGH/HC8J0f2Evt9Eu7m6eqpzwgAcmr2IIq0vkcfc+ss
hiaErm8AoNRz0tl0bYfLHju24jovHoL6vRMQ1wNpvc/1hUKphIXhHBj68VIxUhyUG5AUQf8GExig
PnvqTCXhtjIpIjsJ+Kliqg1NoF/zoYfTYhLly1Fl9dYLaJJg6BU6xDpI57BOH6oPKzJ8OlLd8OZP
vQRhJNUlXvOK7jNyXqjHNhU73bcm6S718yaUEb0Dyw3XZDYEVkY3AyhsGdxIvqKDFXaUpOCcfBVg
mAxQHPHxfk8G1cGs9/TrjqfckbHzFA7eaV9IVLlI3s6VULjT50AWWfNABhpUAzmmg5D+WkId+dNG
Y1v9ehBB+4eEfwgOyadU+ZdTLjJBBwuF4yWFiYOoQ3hP2Rgu+GWpbgF/5NFug/yqjsMjHWCsurRx
X953494ISnn9rqGAOPxkHuBvMtQNVaU+h3PKoSZXcNsChrLPmqOj/bJnsbO6AdunEdrFHqYzP4Jk
2URU+eNizFf4FVsbPv803w5qd25+aNL33gyJoGRs0qec8mYB1OsX76oeXHa38QvqdheAYRQZwJBZ
9mQ/cOfS9ymDvRY7RvkIEfM5HiAdIaBhsauMb4oYDnSLyez7ErevN2LIWcbuYXUwa4JsyTrdSFVH
vdIWvc7j2sJuwmqwzIn6I9dlOH84W/7KkdotFAu39wdnz7O95Kmz7dJ1GtKYt8iLRfBAu/+eBEbP
vorVHicJaWR6gu8MxbUbJG9vL7pD2dkZLHEiKF/f/d0ol8AYUiESCCEU/NAhT5ztnUHc50Di6eQU
sGhJPwoSdoJFe4HUPf8nHvT6rEFNxeeYpQ4uhp6yARtk1osZmxlM1scMLP8VXo4fKMBJCX0uLPbM
WRQFp6JS58XqSrCS3zzmYWlVhW4YfC2Z2F997TNcP1Izw43nLfHPBC5JnvhvR1HrCtjVj9TKlf+u
rV/FoyUSZ2trH1Lzb3/kL30rB//bcF+g2nmB6aQ3jKhekFuKVR1UihDI8OL/C7L8h6NoZdKKBz2O
bX44xFu8cn6TPDPGnNCGm5nLWdaqHMlUrsO1yDK8UO1EPGnnjdiWKefMpnehk87YthxvyHVwPsIZ
WzFwnElFqVxRlkK1bxL1s6wmai8jhipFLx390zmdzvitIuO9UYn29p3ITNiXsbwaf5G91DFZ+XUf
sVtzQ3aOfbgBRYBOdfejSn+z0vAPlTIX89/Ajl9KCYgckj6sDpVJyre/Xa9p8bk3ZpeOGPdrlMmJ
2yRHGhuVQHD310opY+Z3/gQaM+cA1b19//FAUxCczROG81uDIXMfAG5HswT5TqPyQ2/B/Q+dhNJ3
vej68Q4tC1xyq8T/QsLaNyjlcjzQ/XP/uGxNA09PNw12T/B55N66jZ0sAyL01aDma4a6+NVs01w4
LF2BsxF0HUektXUfwDw6tEnAB9LEa8fJUxr0dgA2moDJcfcko1OO5xxCRReJoJiMnrQL38AcvJRz
xQHzwAUPRYd0dYOP49n3sjrCma3015nXBZ+GY0bgdYV8qo/zCvP34uRp6tm1lDAvWCpR808q47PR
gmyTaJlpX27xqnmtHdP++qCyv83HFhChNSNP1EY2W0TRx2gxWL9WyVOlU9rb1lSAviD+Pb/EVC1M
EmY8U2OmTJW0s++RcDdWnj8Jg7Xs6X2us340fvqAAwiYFbE3HrudUM9j2s+fCM1Yua9lebYGRwd+
miUE1QVM9nlNI7d2OpwtPmD92bcetSkKdRJm9AueWxzxAPnOtttF1q8tQAfyCVHTwVto3IIe/uVX
pX+Bnf6rMNIxOJp6d8y2sC/Dqbf5JtfIGmoTzHKNPqqxQ77tcueSpwV4nhbUoeOmUnX4Rcn0UVZI
/eqBaeTGzWZghHYCQdIsQIX9mFJlzUA4XjOY/TxlcNcQuc4/YpcT3USVQAxGTyMoPlOWiaqSU/OC
dlq+YkkzHU/MSlPYxKKFF4m0UJ0Gg72ZcYyJF56agUqPA9Iln53BhIdvdDKLX77MW/H2OHQ9j9hU
95QfMO9/btJAdHC6DNMyXxc4qDTsLkkIn8JVTFJ38/w7OnzVKBvf8r2cpg1ql5xtT/y46/+k3ZUC
pPno4VX9uBx3gTPv5I7WNFbHkTF3Lv7vDtAGGe1/CWl53iBOqN6tnmga0K4xr5Ae6kgcb7j/FI6t
gLY1/m0P5DqzaViZ3Xpu1f8K8Jk6SCLVvB4u+145Q1ck1e5LxoNNdA4uPgI7ZJ7tfFE9cRbEFBWs
VKo2dOnewP+8KH3vmzpaMCfMTuPC7LVLvAJSXQ6dduJCW6Rnm/brqrbbb2e/xdHIro1AIyfOY7Or
HIbhbPkrjxVPAzhzBprYhRhUpzWlE5eU8loeN8iCLfTwUGufQcQD+CzZk79/hb7oywVldqNCbM+q
cTOMsUGM0KiXCqBZkUWwlPwHOzAWIAoILAPW422JyiAjVVONxgG+wcc84Anhkx7+2T6binBFA23K
rJa8aMba7YylegCrTpBSDobJa8Mmn1IdSb88hs0eLz14knawAR7TIYTNoa9qicqfh1QhoMuggpGl
KyCRx2QkFPoX810psH0RkRkLultCTjzos59iWL2CENl397RQFaKb8jEDfRCw7gksZhmKfdRUUi5L
VIYIC1e8htx+nIbcO0R8T96Xxi1AnDEC9yxa+9JvZCLLnpaxKHaKyA780Auq6YPbGAEjxEhPnZww
hcf8y2wUsALgQ0Di2Ew8brXNTv0D8CyW+uIopdg/yVdHHS3WISqUVKY42/BCF/WvpXjyhZxDJNFk
2vzOnj8/5WZAndqf3ztfmHOd6xFOVzX0hcX9X9MtVxP/R3jiqeTtZvT/yRXenLwv7WD9fh6teB7b
a9wRy/GJBGSQAbEcTSYnzXq+2IhzLtRQPLGS8JY5nn9w8rgo0fLy1PC7lYBWE6NCk2HR9S9oUUca
UjrC2whQVdP7QUIr9TQckfz40uEfpUrAUo0QUq4d53FdkOGK846JPQ99kemoi8CnKS0Uc7jPrFDO
2hyxtg+LZWABHpUnnN+S+QUqdFX7Yn2qP3jdcBvkr6AA1W0z7z6zQiZxJ8UKaJ1Jul4AQLe9yrsN
TulGt18Jaq8pghR7NcFgkUC47MOpOK7EulPhhpwHchuGvGOEtqMKxO3Lz+87X7MQmo5Z2S/JlNpI
fZABqHT0so1TfI7pdAebcA1uJ3iLZBEJqtlHONftdhiaWbujo/8IWzyogRfhkdOao0loDDQ4IKva
aglTW2O2wtL34D9PrSG5gwmTe/SCLEQAnrOXk2c6+Set7pyq9Ie2K4DUte8/PTDs3o1K4zjtzejg
FRACNsVqmZAthwwPCqGJr58N+CopVrtn03/obGyZfyRy5ooTAnp96WEnDCFXnyIuInJBRF8sufwi
7Vknp5/WXgoSAc67QDugYbCPuXUuyWGeiDvjWgSwjXQKUBGFn3RPhXacRugslN89JRMpH1+Y3O/K
9VtGxSL+pcOoqjAVP9ySQgUQFypDqwDgDlPM/k6h7zoRw1tuxPIe/IP69PCFXc1VYKdcSZ6G93ms
JAEijxM3WDZduax+WLXRO0T6FvT4h1QpQqsibtfYgyH21r6KUA8cqjESe446PESL0TXtk8FJTxg0
80rlNDiMVeD3T1ifAgSDBqS0oFsLVqclz4oIWhqhdmdYifzjFp79NsXQL4l0w+fhtrF/+1BRry+a
UT/ZnXn3/2B41wkS3DoC07++HJoXgwiJhG3cFGrw3bZA7aDFmxLOmSA8ZDtiUaIyBgBVrR8IYoL9
N43gipuIy6k70aADS8TDbSklsCd1vOgunUCas2oSGcxEBs6Bfl9O2LYMifmSS3tpp75zTMDRvWnL
+gHdw/k68gGx+rXb8mhQ4xmYP2c7/ixCVooQe8fwfvS+frJjAdEZu1tQX4p//bWEqNDek97z16nD
lTW+HVKHuKCnmha9uTPmlFtZLqP0ApmnIzl3bBJQc4BP+DoWjsvacYH2zpJEJPjccqRKpvs48NGv
NwRNxXxE4iv66otox8Og/w1pPeBUt5SHbskfJxXX1mRnQdClDkcUSjM521la9Eb7ZkgavJ5x6jgZ
jgurbMrQ1L/do+ZoK1GnPMYUkvZ4MSpIo5f2v3OE1jFQbikoXhEZLDG77hrIwjmlVc6c2riPy5v4
G8zC6wHdycjchBJ8nhSDI1FteeM8ZHv30h+CMRrQlhdy48j/1LLFE8h50oSTFRjLDW03gRyCJBCO
8Y8zY88+Q8EYY9+0JN5neICjfkFGSynI2P9SiThEJO3kpr+9VqNOXCoGNlrF0K7SlBHBukmLA13q
cphRrqLnQ2mupW2LHvdpFISXvwW++P6yzPNMwdn1DvQPTFIn5ci74UIB8vBAZ2gfvcCNyqsJOff6
7u2WCaTr1f8H7qphXxRTxsFOmqDbyBaQ21C/lvJ1j3vJBQZQVKOsyE6AAIEGIkUlvNU0BoIOCIuE
Cv1wIPpGizc2F4RygPGjIl6N24sWGue6Q3ugW2zrKy9OZEaB5X7rgEQ6ADj3ok6LKLQL08mM8m08
EUC1aIONUUSiIbXEmhsiunPJT3NlujprxUxjKeruOuHgrkX8a4AP0EMqKW9NuMWFFPtSnckQ6R8B
Iok0zddrVN6eFW8SkeWGkZx1tah0NN7cnO4sjzak+UDTqC0HoILAnJC80HiXFCp/7PgeEQVONQ4g
MkPUqB2zM1ixbd6AoSq+Lv3G3GuF8i+QCz4t3G3D8AB3eyYyt5dl/qKmKu1lsc6gsJMFoTw2AT/A
wbz/5fmw0w3jMJGUeQMSa/lcOEEP/70zIJgH6acNtnVmP8JrSf5uHTlgWhju3Rs8Zo3POJpLRUH4
0XB7s1zk0uKxeeWhb4HOM1e+nRZwvThF1BFEX/1VQ9w3qPkW4w6H4/LnaEXK2FIu1OxmpxvGXTZe
GAnMfUHw5Yhzng44jgt1BvJV+so//CbX1pw/88JMnR018T0yTGkHT4tLAuiaMakIDDtSjMY5MAyO
z74+HuUVapc8YPgiYWpe4W9bnTZhkJZDvuHq5bIyUNdp+hHfK36NOz7Yy4dGWk/zE+FdruBFGx7X
2jgFZn7vanHFUs0aJG0fPsZAhOwOxhiF8/XQfk6yknO1gUcAZpIvJAqW0f/mro8mkqWO2o+YBrD9
Aue+WGKghLrG1I6kJ62GxkJ9YnDQ922Gq0NbtKyrJEtj4Puck/+qUEAPax1GqZPrjCkS4OUxpgWM
RV5zQ4QDZ369aiSitTqlWkuNhbWDPQ+UemUED9TJKQGwy71gOK+KTjogNB5sILcFSV6FDEoegpFu
7NIpldwYWXoPl6nXMxZX0C00PlZOduzxT9rR/wA9yXnKlpTrGuj5sCtMidYY0QelOv6gwtwmjrDT
Je6f7HR2JSoOBQOCMUZ12FNTVvwmQrFd5mZWVgyCOmktVjcA0VOlqUPxYNW+gePyA2kVpbMpM5sy
nTUMObpOMOAwmi7nz0S2gZ5C6z7g5DHcD9aFbnWdX+WUiZ2YYtPqNKqHrVVbhFDe2POfdQBT6rXZ
QzgeDRCFb2rCal5reZsHOef0PtjB7VkCZyYGGXEZC1dFhMUi8ORqd7GJUqbhnIcYBDOu8urJV8z6
QazkOzdeWzAmLfCh17nACYJY6ggweOUZ+RR33gpOYUhLLWWeQ2EKT4yr/PIJs8MwKDzDj3kaEx3W
Nq9Ro6vW8Wj6xI1YB1XJvMBSVpqzlFU4EB+cs7NSsdpsKcQ/vuG2kmjwmaz3X6pEybZwb/kyO0C/
q6lUVGkYx/quQtr5GuwDMX4rW78G+hPs/z7UhhC9MF5aHO1+J0X//tazKqKMnFSnuZkdJAtXgKMm
q+Ly9w7Ms65++2e72H1aix4j6VzWc1eoYO0Gufpxum7xaPkHsTPC/Rmenu52HX8TTwajzITmB6os
Xbo8KE8zSdl4/R2qwlpZTnWDc4r+ELJI2433TKY9yVvElVHku1WHB9bJAcvTrdF1KxyMwqLX3hUb
2oSxEmki964gfV/ibTYiaOVTIGmKMfHjiEmOfFekNU11rX35izIvoH7h8OUUDtbCAOrbW50Dpw10
RI8GPVExVChYmmvGx6/qaIo3h85w44JX3SvZK748AoiL/Xyn9d3UzNqTkIpo6Rk0tOlTl1ilbspT
jenb3X+D/NLDW6jBGkAqr2vcIolFCr4GoUqgHXI3HbFx3qSi4Zo4F3KNqwb/oWTotaaYlFDS7r1k
71MBaz0PFczKalVMNla7y6qH7xr3OVSSaPMoH20ZbQyK5ndNj6tTlmdrl4FfBfIBZWm+RetaLz09
CoyZ++quu2KLZ502VgtQOuDra/O5NvPWEk67N0hoHd87k5gLU/d7kNknxFyqCWvVp0Cq7k3lwlsw
0HvKunB32/nBolV1C4qj3SGFOSWsttcXrxM0l67P2Jq7hnFTGqyBTWH9u+JI17CT3H9qMrP4TfcG
eM+rYI2Bouo3PkM3KngIvHSYZ/f6F11M6sQcncf1s2JZTAXjA2rkADOGaNizzbkGpG4tQrRuV/Zd
W1f4mU2WRN1XTR0sVSMF9KTF/tiWKl0APEyQOvQlFZpYI0sFKGxKMZHH48UWaCaFaF5mCSkuPHa0
FmhB+UDghZU/hd5x829eAINuBMlhhR4CSzcqiVmjm1sZrDGslxU8AdR06jqDs4HwIbD7UUdCOQzV
2M4X1Rqz3YVALyq17+w5w6W2aY1OYRNK5oYEqqSzFuvvakOoELf9xa4rjlFwqJ2ZZjrXA1nrKgNK
2QQtYHQCrZoxejO/ZlutlV9rTnoEJeyRfs0o9087PxHgjm4be2Y4dP4EXwzc6lNVjSBLv8MNMIf5
kzri8D+e7uq9jFZzwo+HK9Hdda0FvZpI8Oq47Ftj5Uqs5caJ4fpvjQQLyTrj54nkG4uTEyePy3JG
6p7hTixPCYLPLPSBqsqJrmu2UP9g1MPLBunO3dj9D8FDjonyl9S+TmLc2t8adkj/XwCoKx2iRTqs
8Oyv47cm6kOVi+LQRfCJAX3YzY2r43xC68PuH8l4fxFkP7hC4XfMhOQO/dYAO1cMFDRrwgztmIcD
Oj2GgZP9SoLZukTrwP0QfGE3O3gnuXcRhZGRX+sKreO7GO4WdcJ+glOOu7/Z9FpMh/9EgbC+phuF
j9G1/aqeMhcQtiHKfI8SXSMRebCMJtB0J69W370msGF0g3Tmf7e6TLrfiS78lDr1i4l+4YBb2Qdb
S3c55GLY4PE/TALcpqwNFmGH8zPIY6tmbuZES86WtXbiUMT80c+P1EmqkoP6jw2X8rrjQ+KJRSDy
OfRoPaSShSXnyyy/x7YWF8uqh6DWFGGZX+hAQVmENvJY6XE+0OlCt6KaCjovbkBHkZpMqh8WTXOq
wxnWgnwEXSGvi5J0tht6D+itUTcw04H2aHyJYZH3Ia04Q2RGaPL1T2W2jyBUwmnAb+LRBQMIm1/p
i5tVkZ9EQAJ8a8DaJJzaUBWA6ViBJBs/cwmHFXdVrlIYiT2dH3TC51i/eanLU4M4k+4fVNisD5vj
yvrHKnzc8Ren1hGUeks0H93MOZ0imgmNVatzsEggHJaM63oF5zekd4Ec8RH+1p1TW+0m3sCchqVz
qxevJh7wsxOhEiL+u8JP9/gMzgwwUTd8gs7ysfPYpJmgaI3RvDFhFuOwyEbrM7vDoMkvmsVCclo6
j1WW2eE0B5jYwp/yD0ac08ZRZpOfyLbps0UMk2YBMwYHIAkWSVqHauU3/yz1vZMzsqUUPDLLN7My
BaCm93JxeuK69qDk/acYityn25mbb/H3E25tnijPT2JbtAyZqhVEt5k5FlEVufdiP5p2CwfcE7ix
bWAk3uEm/gW+N1BUIuxh6qUATpKpGr2kwFqSkaVS+S14JnspKDaHC80R0Gqre1FKnpOvTkC/IK/j
C0wm+x06uIsoNZ7YA0aritBEjyQ/5bAp2gV7yin11XLolBRZzQ6miXhttAyrybbMUfzqnJLNVmet
ZM7ApzMq2T+AuHIv7xNvwaUuZ78uaLBSWMbsQvkSeLYmnw1B9xko6QuaR9UXnz38r513TBT4yoOb
73Q3t1K93s1Dby1s+u/h5mDrREx6L3otwpuogAWp4EjamXPwTJW6v9kFKHCWmWV/dSApL9dxzj6x
uJsBzrKTPXnIHiqqD+PLrVTe+05U2cUdwMKxpPZq8ofCVbX9DTbTvsxDUL+3cgm1j41Rhb4ge/jP
Mt79H/lP5/tgA5mQoknz9QGmgMHKwAdmzEeEvQ7Mnmfn9KqHFkNhsgpCqMjeywIeh54clP3uB2Mq
20/DBpAqxLq76yUhTNzPP3RW78hFoO/g+3eJxNrxb6pJc2XMpSnnuGsCgm+XUXKpCQoSQLFKEfpG
6oTL8ICO0fM5hiWvQ+TP1DSPSLLqn7y7NcBsO/oK3wfQIfNbVWEC3PlARfgexk7Gwj0z0edzWVbQ
NpcRpj4O3EcSKo0kbXiuAqdZ3Bxq5PoP3zlozvkBfDhnXR/KoeDA97O+PhTr57vRIM5U8ZP0Lqr9
HZqib6BKG8nN6pfQ+wwcBb6FyK0voeSEUvo32uJxvU/PNNXp0DsTg1g0PdPI+XyVodCElPH9sE8X
lhQk9oHMr/3oaLOCm+veltQElMjQtgNMIc7Bxl1UWtDLJZTBchIzEwO+rlrRWDgVZyRS7JDtCmWx
BMBecY7us4SID7wtKD+dk5gJ2E8TUQn+Yufe6fgoJLt1HrL+4x3mNMEBDqhBbgOxRdnXa1ubxU1Y
UjVEuWu/YWDoweAjo8VNQAITFULJ52WpfWiTgApmF45odOYryRwKSXQxdmhrNuKbjmJASJ0B7K5T
fCNx1VtMt7q0v3AGkV0Q79OW5utasR7OBF5DK8KXDubofwEZM5+6VzAGJ5AS2qUbZSfrtC7GL6/K
5OmGu8Jwb5f9tuMakS7GI77TwJGjw7PJFZOYHLjLmQiNjuIOrhMZtMdIaaYcnDqzp9OeOVo3dKaW
JQXJ8ay4HuEE8DUIDR6DgZLl6hJWW0AOuGpc+9MqFIdaCndG4LHS5FOYrRELt/6ldXDFxmZ1K7EI
1xiEMJsI6+N8tR2yzyAB54NLlbZD606W5YQ4XWF9SQRKfZ/aULhSpt1sEYalTIMgzoFZC53SLNHY
CqS0qZa0zoP1Ojf6so2eO8tYivQ3Y23Tmr4NvIBLc61v+7HVFiek7fh46WQknYwnI12//huuph5u
LBAuweCKe6NpfWILkblp5EnhVkwGs8Mvpzi2sZOwzAOytwGC2lIoGhHisjzRH8AfngyufjFNO/dQ
auxf7Aj/kgCEd0qscY61InW4gNMhkAwLOP1+Npy1QxpHXqRKcEP3UgG4JZ3yTdWTxBJFCdNWD6/2
o9+Lw+U1vNQ/2T8X4EB9nmL7nHPVhDCH5RHTTm4d7oLyHnwxYz+w5TMqHKfWEkpM27JLHu73dAY6
mjF4RGBS3S6qRl1N1odhC/WhvHcHQn3E8eso+7lzybK6Mggz3Tx5KkxQNqoTgkaPSh4rdGedCcyM
dpdKA1IcgaGVEXPa6kRGgXT7Ny7dL7gTll/LnozdbTF7fuv5fLBLccBMt0R7Wip5dYLEI+LXdWLr
3SiTj2osKarWFkS5TbOGOoikXEcTiySYC4Rk967UbLprNcwiiSuUCRi5MHNgWpmGQD2+1bhft2ya
yxJ1UGnuYOH4lB59Y0n/WCE/zStysdlACBznpS+CMdwI0Ri0+nNpXCs9BWZu51mhDGkGsfsJNJUL
aL/IKDC08mKxSq7dUxZXEQhChz3L5KkknnrbHnIHXLnqIDFMUbffpTvVRlgeAe+TNJTMlveotTeL
6GLjAdJ7c6CoAVN27YQ5o0MyvPMjsoRTmVQAp50gFO5xz5IdB32OeKmGw/UtVEfIPQdv80UXluGU
iQb0hOMwPBIMswFTT6OjRp4wRQjPSE30wkZMEVlLuTp09gembIJ0IQ/cI0T6jvnxpxvwGZT8RlEA
dELayVtPe8RuC8/nYnaiXtKpU1ri9SPHhjrIZqQO0iDoSAgwJYV+robyS1stK5e8FQWbjkeao+Ba
y9QTAa2YPVX5t5U2z19Oawyli3J7m5GDGiqNLKF7fHJVznWs88dt7QDO3btUDWfuSq/4AZA0JRUI
QLGhb4sa1vm3Vfa0vHYi7cGBBkYzT0Q3IVtCiS7hBz9Ab6MB4wUrXDF9bYLHwq79YwDxUTg3CbOS
E3G0Co4SEDpwZNge0JADgg7nDJvCaD5eb157To10v3udOvL81aJ3CiFHAX3xrnI0YDmLrhDhvKuL
e6hl8RC9cmmZ7kfpemrzodHBbvJpGWeqkTJC1rhBovNFSZZbRuBq+shlcZmWm5u45/tW23Zc3icz
9z6kZRcHstBmooyqWxw07Nr3JGccgERsW1PNzszD17O4Bh5Hg3rd//B6UZKcidiQ3Azm9DL8MRIj
mxUkSPUKsp2uNJxk1MJjbc3PksHrw8EyNwiOJKfg75EYzaeGj5Egul8m5Qbl47BCHjc0KvkYqXQv
Of/eicNJ/e2QS3C8Ykonof7vin4bVJVGPNol0eW7Z/vh8m5HjTqV1foNAGqzTPHCZFhkAWXBRitq
DuNu4r5Vjou4TPqu5ibHzMK9MBoL/Svtg06kluuM1XRezryP9AIpr0zwaVkIwDDTT1WYl+Lbaa2s
tYmSs14YnJ5zdCCffXC89ULy+hvtSLmpKDP8igl29Vowri+H7Z8LUmI9Q54uxKamk4fmmcq1xkyT
+tezk7SPfdt6HcjnnnoNZytbIsCPp/qVMUp2X+MhpvIfC0bfBJP5Prf4FDqPrHMn8kmmDektxIaV
QmRUU/0gaXQyF5F0Y/KdMkp1pa5MevukVvswcrYVPwooiajFm3xpDFCCWdt2hdqhyzmQJcziYVs3
lmdbrMLR0nfuV37v4kesYoa7p8L/XfUD9ssZkakMLT4VNp9gQ1kEqPW+RX/pzvlzyPpIulowh/uC
MJRiK+FfHFkCSY01eO4kKlcTXToq2CO4HLvOkvZKBmncGHrlqFLkX0UA5PgnvkbomYlcHFcFo3oj
pmNA+RQ1+wM7Pkg7ZJvNdGxrbOm2GA5x8ajwtWTHlrN+dHyXnd+aNlqr44KcpUq8KEonndUu3ORt
scgakkz1fQAktZx3NeeuakiRmD6UkpMxenakbhmRXYdJ7h21NDFpeFNcEK2bVGJBmaSE0KBKvFxs
ryZ3T0a6XmYYgn5m0dnymkAY90OauurHjcnO7QU5vWcK+/UBMoOe4LE5B09gRIVvbAhgDi+vtxKz
F0u7LF3bmlBqss5xWKHQHST+F3PwIggW3s1xtTBYTJWRfF5CP47mSLW6cDIQ0Abog0Z3XwY5EDwA
/6dSoYsgXdee+7f1eM/jdBQTJSjXJcKqQ32h0gi9+HajFqByO3icGtd/FUmDRpxGkWLO0zJVHhz9
z6b31OhlJsrJcb+8lenjJTK2Qs0v9tYSUj+2MvSzbWrYUlZjvczb8cx4z/SWYANRlCwwCeAIB7WW
knSu6EJNpfXh4JOmWzSzQalDj5RIPkm5BuPFC+WXzKO3O5tZ10hcUjYaAlNJNBye7Kl8hOePxVxW
UsO3hlB86vgPMP26PlmIq9XYxiDq+c8QbP3FrT6lHi/CArZJTlZTTw6ngTSqZAlDLESPeEVUJ8Pd
Z7t4PBlk7EVPgzBiIYJOXXmG/STISNDl1LCRZUqy9+prCd8feiXeLqVkwgKnQilqiXemSYiT+91X
vDsRqSDYdv6FNrBUwQiHmuUblzFFGnys9be8pTn4zi7uTw4Al4nbTDGfPBrbVeWgWvio5xns4eqS
UmfmuCo4fw4BtN9u+7waPOj7HHuzShW16YfcVUjj8CaU41Dqo/Cq+zigs6UnzXz/VsBGgDS+UZDj
roGq/LHdLpv2R3fnyWHJU/RbIuMQiylbZ9ar4Op5l22KfACQwwa+1G1V5TJwZ2o4pc12mwx+05D5
CBwYpKjAMAikt8JF1TKsU01vl3dWoyFkyeURH4Qm/9KyVpB9/Zz4Ks1/jPIBU3Nt8iSIaGrG/tnd
WSJvwJ0Qb4bg6w8QLLOjFWKtWhYwgE6hSmmvypMSn7Vt27zh1IUKuHn9dAv961ZxlxGAj+Vn4THM
DF87uYRAzQbYZNhxmNNhjqx8UeAtu7ll2bfZ4rQDW1jOa8lvlDc3HwTgQzhidJx8VNiKfk1cV6Kr
nnQQDd6SFBQRngCygVIhW6m6t4clzIMP5Zf9CKvLLpyyQbMEUsq2u3QViKbhJPf6ikNu/NR82y+a
e2wOABqzEIRiJW+Tp/ALZ2FH7Rq+zzxe6+ess17+XqCFhRlSTQv05xRUxYs9AfZszEO2VqSKBADi
aY4pM+RpevxZICjwc/J9JB6KdJc37q5YEojy2H7Sjcmjfg0VI0LcZNKBw/vaqek6lgzgv0nmWWuv
jG8k1fpGZS7UYHJ/H2/2PAy6GjtTj0isUYXwe10Seg8QWW/VISWy3xPkGlbTu2HppaGw77sMROIm
b8uEykSEB+yJ2JjOxRagbVUyaFU0Z5FQMER9m/QPujfJ8ju0gjfoZtoSCaJRfh18zDyzETPFMCq7
LWDzrKssggEEBruB4mzhPlNhzPkoinK1KqBV9SYjn3kmc/6p5Ohl3VP0WLKnWSJ04mAHbjsZybI+
901RAYEL4OH/A4g7z9HBc7mti/b6rFUfm9+sni0gB0v9xRjCm70kdtf+6YOnOZfg7AzX6Pz8qVbs
YGub6welJG+BXxGDj4uRPW+bO3eibAlwvxPSFZRrroKiAcFNL+zCKDc4ORAuChn5xPSGRb8R/G8R
+esszyG28hgG1fEoXY123w0vBYTNDrx4IdsUiNsSgVESgE4UVwzpXil4ENPSSqA26G/Ridm+I/Vt
wZYuiyQrT3gqRiAVzk6RVhuylpQLLuv0/0PglOR0Zxrj9otVnmFAC3r/m8IT5T+kEksI2gmb2N+o
JcnwfMfznmT2u6KzMO2xahfGoQ7VjyksTLdUyjkYJuV4TRiyti140PVMwi18A+A5OF64ZMeOJ+GI
Q5p503m30dHYMXq+3zdgiX8mAIvXG/9G6R1Dgfff4fIXKz06ApfvNQD2hGBLGeWQ2GOB3KpHRBKw
igXIj7aReeyZIfcLm6wEi+lnkGblGLeo8mIxFjwT+ixlRw02fZ1+81ifHlRpRnKqf1abPxwe6t74
l8ZhegyHk8AaDuWu8cjguIZYoUySH8qfB/elK4Mee7uO+1nUIPCoDn0YhxLSVcpUhZbEZkk6Q0Fc
/Iw3UN4iKCWJ2Prs9Sxr6LbBsEoJyeD2ereaTNCAyG1z+GeB0Rh+DDQHilsPpAcgCH3s46mDP7a7
2D/E5AHrupNr7lBJvk7SGCnIEWXO8ZrvTK2mI6O4RVhEEPPoNdzEh2OSHbwtj6rpBlNuH9zwOnV3
s3O470un20H/Hjh2zdbMp4KoVFuLJKQPhjwpe84SS/ojRT94tEAFW/NFOL/L0fZO5iCcO7R1XXp4
dQ5zUX87ISEwml6Qn0/aSYiEPLz1ghImGNpJDZSzJooA+o+BhHlrTbdxYFyEk9LKuOmhBmTCQJqT
Pxym1NKQ36wPlc1fznxMoLYUgQnSd6mvvbBqIwDLmTeYZy6pws1TX1T7In3OLVXpWusJi4LrpQ6w
hVXIQitfLxmDpHiNTJaXVrKN5Ks1W6Sr3Hn/hUJRZz/6BPSDZVci73U7YOqrUhBS2hp1//7ZqZvg
XBq605gH1tMhX5XZj/drW1yBI+FLnNvqNSR6Q5EKuOVd6zOH9j0VWs5XJn4XMNmzioUPQn/w7YnT
GTs7+pEsBwZ6COd9Z9V4hsYmH1eGDFb45sN49fAoYRxUSLSanD8kDZzXPy1KpUrZ6Hn232wTm0gQ
NQ2xxAn+TqQYGbOGih+XldgyF9cpN3232CrENKumZByxUBHcUoO/UBCsDoRJA3tYzfEkWhwiN8nn
CD9L8rQciJ3JemSPtIZhE87Yrmp3PW2/05EMiy3V2qWmL1Ip2mUFOA8Y2BvVZGejF3pjqyKz+i62
KU4zwg0mcJVQwf3hEaTVQ58RK6DijC+S7K7rmVkzHmh3uXKaDmiBftqHZ7msiLNXI0JFqM43oHrK
FKsdigqn/M8zt7W22yixZnwSRTlhoGqblpiKx+l1wtl8zudios+7MgG7TynFiSoPZUbXy6PuAB4K
YBsJmrP8I5GcACm6dwILbWOO/v08gbPSbqBqmzP2jzMHU/4FFmvXnOFAobYqjrt6dtjftl829t7M
dSb8MwnhmW89JCD8KzXtxXRMfQ/7xAGmkE1FGj4fn/VbmAGSSZJ/XJQIliD3ZMgDzih3FQdlPlHm
LkU+ctDBu+5qqcYPjkFVZ4FkrpXdWO8oSQWqfAe8re1Z4NAjvWfZQEiq3uE53JKWlbBqZaFtZ6kR
VK7pG9QSVKVdmzXRmMqffiH6DNYIQ5xkeeqgNX2WhmZNSlbKvIp2UXesC4FtoIC9TjIpEZu+SkHO
Hb5QLaRk3b9eQ5idA1fGkcOlPyi7g3gT2D9wFJH9QfinoxIyuuiwk9USR79cwr1kp20oTxIbBQp5
uAsQP5O5AnNUAjFf54Xz1PbahFYDDfTRvyScTS42u7qW+Yj+5EG66C0qeLhzXIDOTQQgvsDcfqPG
rRwXpu7HpIFrYQ4un6Im7sW7pz+IrYvIu3Ma2JcDKjJbizXXVgEPFBPlf2T0v1G6iIoUNnKROMae
TnaVkt8Gcyz3TChNBJoaW9cU90vRx7ssuDvPffvK2JT780kFYXFq73FirJlCTWY/l4If3LhBgG8f
E+nTruSo2pz3QKKwXm4MdCyHf9l4IX+8eMiHRsrsUGWKW38ESKeFv/QfftN1wZuu346Z1MmP0npc
FPkXyKKWZ2oeclepl6eHdjflvWk2H/s4kMGeUvgGtLJiC0BMHZdjxF3RlmdzbwZ6uv6s1BsyklNV
RfnSGeuy27GotU4ewBnBlEqd6X0NB/amj13zhYHAJkaghV+08RFc286FbrB/zxSNZ6VvJqqROdjN
LVHws+wiB4BsTjBRt+bFYNQzG3HlvCV9hsi9KL5yBKHxydvQzN66CmpmtRsy4UECH9MiQmqpVBHu
elda45W0OjSD1Z/ffFYU/IIqG8DU3KfA/6s4stsw0kS1ICNO4GJrYZBH5Ah2oJj/EnKb+gPHDeAP
WeJuFFBmgPmQvKdEVKz6LJppxmZ8cHAlOcJUQyRG0mSAMsK8F0NCTMOEd+6yNZpkRhgBtZFwM5Kg
hY9kBNpKAU492Ch1Un+diLPKISxi5Jz+k1DZCRlF/9JWASHTfpROZg8gsNaKOsUg/isu8qOYVXdA
TpfGVzCHjOQh3mYnp8nTa/SPzDfWvihK2W6n+hS18Wp7CJX87fWrzD1kz32w9epCV7QCamMqCTT6
/OUu1zXy5vo7femCB+iKwtj6hpMeE1p2LgTif2lpogUbHREJtdFxGkSzbBTbkWfdNO6erd/T8+n2
NdK9KA6YmlbqTdCFSCCmh+MEcQf4h1B+5j8SgZzQP9A76CMmv1EflO8XOY7Zss3mhxPxG7WAca+P
6KrnBSeSLwGSBGGs2AeOZJmxzC9zB8dBqcXAjCy357ic4R/a37liXtqUzdZZyAgMfgJH3SOWUfBg
S6+YYq5R+9coFRrGGWLHTBA1kpPqSIpE+GhqQjaD/7S31vAkjl48ZQPPzcq2tubFSif9ukwnSfpC
sLgEXS5TlnoyaIwizEGavGklyUpaFAR5FnpX7DPXylUQ0rVPXfpaNHHUNbuPz7MGAm1dvJO44Nro
ecXrbOHQrFidR1psk5gOS5svAJl2tISIcECOd7lhy8ecUXDiDmYtOYos4E8hfhhSydowCfqsg7zK
W9yUdUFShUZKODvRe4DRj3Kz8nYS+DzO8WanEcfElA6uGrV14NczPDgJqriFb066Yvl80I63X757
TAByE7lz2c+Hg/bPBDTmX0CBR0Z7ocYfulu0IEqreDNNJq/7XvJpvmAwDA6m2v44iaqXpl1Um+rc
m0wx8b6qYoHXMq1EcoVFERRZdwub8VQ0DqVihI7aCiVJDy60CbKCVuJJj5LXTu+sWXsI3ir3SFJv
c8kEq5cDltIJWijci54KyWvcfnhxmy9x1lTg52sH9hzSHt1LThjP1pgCB3qKq+OeRMe4i5hNmo7x
8Tl/BOzNeF6aN8G7g4WJKlnfWPhRXX3dZ0xS6UaKrP2W+gcq3HjTsAoGbDwBz0eGlOwHOn+EkAj0
mSaFvDcob0brFitCLSF8J2XzedGmJJ2TWB6KcqwGx4MUELYM0lEyKA4VJQnSXIvp/cQ7ixHAHJIt
2VM8Zt0HwUFq7eoFqDb9n4wPEWnpZfeGuTLyH9gmttavnqIsfFFbRLbSUN0BW+KFdFawrUjzCvmY
fhFOzEuGD58/xesw7Vlb4548GKhE4iObH1A2BAmCiQ2TZ3xemyn4CyDqJRzIe+nTx22cxk2arBnc
d5BmED+K3CPFB1rnx+/slGuZLgc9X8CFwlxkJTDm7sA+ChVX3gEN4uOt+iYnIX3ebnsrl3X3uXUR
FIdMB0KdyipQweEEQNaXWXNutUCzUiLz5Fnc1zZrsT06GYLEJ+WqEftHPVDHERsNYdTiaTISaTWN
Ey05riA+n6h18XRqu37uEpwG4JP7BVPLZHPQF45OBNrj9r7ray1SlkAKWs0KM04Bu06ThavRCME1
/ZytAfYtZHxsMZWjckJjO1BGPWeYODVaODfk0qsDrYa6c45RScO4fYrHT57ouxsYy68T1B3rgPYk
Npk5iC6J24A4GpRuc3/1rxv3YpYSQKu197R0fGrShyLcl4MuJO3D4wDsdD8bqqscauJplrLoXrvV
et2G1Ob7t8kOUTuWZc1x/aVgmtQO9wWQK+bhuwcIpoxtWcPUniax4fqb6BzJJB/taYbz/WLN8W4x
i2XSX9EF1ivvlVGwCwHzsS8MruBsGPMWVIzmqPu2gVxQ0dc2zT3mjb79VOpDpfXqlFuM+cd8x1LO
7j8PiUgjaGytJMuXEFgqyeazwyWaRPFphIIrrMQ9JZl7NW4jGAaFe7DgZ1lDL4p/VJlES/NlRa0z
yihXSS7L1MFcYocgQDkPROteN1kACxHZgLlYl3DvYJxJ/nLziqR+gdeUYKw0dDeSHFD+RQKwDN0p
AUdp+KNl1+kEzAlUY9Dvtpu1qZzV4ceDaheL+FUJsfOCvba//0d19E+5v2zwrT70HMNvVy6vZGn7
FFe1dt3G2I/vNLeZLVRu3xl9zGkJp4EeHOWdZ+zZEEJ5motLG2e1TEli5aazFvyZZm+gVyFCS6aW
TpR/QZM+meexuPYcZq880mXSSKXuosu/2ggmTGiZfNCNLUmEuLn6NDLraDoWOVBnlaEXFYOKGWhe
NXGxtpQX5xiIH/nSo+SWo8gjt98QxWGhqdx+aMnwpczo3DVOW7fl3HxPauT75mR+ePiv/iLoaYt6
ofQ6Zd8r0AnKa5Gos4FrLBCIlJF5MIk2PF3uzD/6CGTUojSuVRcUGfWnIKBYY95nGZh4vL1Sma3l
8kCW8pGWFklpJpc/aZi/eKWLeduwTuHlGTz9RUcZmg+z8+DHg9PfeGJW6ktIphdMiKZb1xsUXVoE
0JGLq8ZbTet48vS0XLg8J2OXtQSvc/WXOPJ7S7jYSbxlKDoeg1vMujpUD8QNSVGm92/YgfvAHDNE
/mlsheUzs4B19FbXpeq56cpZJIU0ldb8Z3tOSuCJixIfpt0PJ/ihO1c886kWCEEooSpM427+V8oD
Z9c6+73uuyDriUrgH7Eyx08OLN5fMrVOQZitQnXWwgqVjUnrJ7y9e6JnkKf5EOpBDJkqS6tWB8i8
zsPKsdrcg/2hNXpyl4uPL7+skAWU0aKLIyOUCMwwJmree16PaWFsCVJdaHhIiuvLcoPj5KHWsiVI
/5Y8bdsoQIDsxvrUa3GNWA9mskqMPWFl3/XBw5QG/n2lEalleuwsFt+iowyeZHQ14P5fF+mMTOzj
IqrnkfkY/1Q3xQBpcSihvvBUyxJ1mluvWRq/OnOlb0n01M0j8cDLjlSDNsWurFgUIwuXOZQ/1XOa
yLyJfhvMcZ9aV1oL48wpqeor+txMYu92Rb5xVztIGvmgm+RiehFSrI3wzg3yM44AVanbDHFqmxT7
iAL0oukPsUy/5Gn4wsW+/r1fj/jiTKe4tEAzXo0SpcPaGoHyUOJx08U+DIsB7Z9XJC23EyBfp7R9
SwuVEanV7emyNgacp6XB3JmP8J9qFFD2ZzbZt/UN2JqvMcRh/7ELu6TLG7rcgfzFLO5Nz54wRee1
vg5y11X0Y5kLISyUNJdrrnNY4IvqwihcUmLEr4kldLe9/0hj9ZYinL2oydTbsCn2tOpgaFHwNM2x
Oq/7j36Bx8mKLx2wWRf8yyT1mXDm5/UgOf3Ng+Gz74CGmXHvUKRuKp5F3GV8be0HlrUm+NlaBepm
DZMAc/i05kDYEwaOvd01Obe/hKAM0y7K3gS7knFLGgPvRtv0X77oCCOtcBYPgid1yIfMMt7NCT6h
tBeYvmunloZuj+mH0RAVVHFjmOk5e5FnvgSxn4/9z9i7axFtfKMt2ljrKA9tGTYkMGzKhlp2lTC/
1c+AACWO5q6TTNKxPjCUGvIhog4E3ixcxT4YeUo6pVjdVdRoFhc1RQVg8/C8ZGAWPTI3nQo2dMg7
Hjzon+G05+V2AXSMhS+LSP6gBJjrj9lyDKeIS+Y/ppUjC8hWiy01f/zLcJHH2sQ/6A8BPsVJWz6f
uueDtq5+OmYvyc/pjG2LNQkOAeaeLbO5/e93Tm2mFmFvreqKidDVSgYbEjXtWDRjGaE5L814P708
HonIYJfIPaTNIl0BKxMipBmSulEd8cGBI0bHcIXUqO+tgSKzubA/LwLdL3KzZK8Tg6ESXssyPPv9
lWzwNh9QdX/Xcw/fhy2QKRnA9biaFOltBClLaYzhrL9wZlup7PPXA0RjmVEJhdNOeVnSVh8dDcY1
54EeZJo6xNKSgwq1Q6o0n/8NGmFayvLC1n6S1rQX3sTG/7eEEG0jNS41GdnuoAwaj/yNm3mMwP7P
xoTUsVEWl3bD5zs1ss7lFJhlAkeAjqGFg1nWDTSUFuubdeO/ua07VEHS3SSS7Nn8O/VilNLOGpA+
iWdz4IXqhsANc4kEuhqPGqPgheCqHQdFQEWuCF7xXLkun2UkZ+TBZtVU2V92crnOClnS9FqaGebe
wbjiF1sPKEvXGKwBliasSwqae+nhMTer5TGno05oExP/azPsLAUSJ8JUTatjMRZEaPH+SZKTETYz
tCdvfXGI06DCKa2PrwZSDaPjTi1THmmVN4tLxFIZaPzkQQuIWqWeVJ3tOMAvONjQd1XMlaSXDiUS
AbNB24USGqq1cCYvuoNUQPN5OFf2176DjiLo3FO4qfDDiyNp6e2XhAeY+G8Qo2dXIZd3ZNxUeNJT
LsEC3CPaaf+TsyzxH89vCmBpH8Mz9ZVDm2pJtTAxCKkoaoROkpNaVIno2taBr26ajMaVMmigNfLf
Fr6vpILlTafe0UGZzfGPMo1eZJhobi7gB8VzGvXIDWVDUKc9Y3S+RwPDSlxrMmEzl1ypFCAiKoLN
OOOsknsuyeQiFL4jKBzbRzvIQW680UxWIYTsOQ3KA7JVA0QI+otMoFagiQePUA47j0XXY6vljnAj
35sssdjRstSrXny0zhDYiu3nHkTB1zjoQCSIw89eJNXH402tef/dfotojtMongeNoLFcf9fEQsrn
fsN+v1V2OT2OE3ScndPcoc/NfA8lyWCKUnG4YxBILk554iGYiawac5cYxHwwEb1L9cP4Bhtu1B0t
LG/Z13+7F2ubv/ymEE4M6soh1XgI1yMOLbgCMYJa45WIBtob828t1hlLkv4UUCqpEQYKvBBDqmga
RJY0+1tU3QBBiMdAtumLvSGpoM1d3QpPeLxcdT38Zg3DT7T9CPPkwl4u9fgGdkMDn+AFQySkyiPG
AqOy/ngP0eaw4nnQFUHca7Lfcf1zAKwSw2mTD3OrWeh9yz5FdRv6wdkpYaYR8+k2xt4T5A33VayS
XEnSwDWf4lwGoFua0zx441fedbd6Pc3uxsTq9j3NyRSTx6m/8LDhavZyxID1JSW0BYEbMDZDcEr2
VQtZNUMI/w3sR3BIWHZ294r5DBF/RG3s3tS/biH9gLuUe+dS1kypIiEBagP+LeoaKKS5vxLEK8z1
5/aKyEw6aP+/ViAqigUuAf9qAruC1+D1epqlAyD/6lTD+tjbLfV/2WUOewBfWAgr1mdcso51NM74
rl6bLiLhvkcanA51AfMInyd14DgJENaslA2kLjnou8MmOKVLPJ02IxNd8rYBKOjR17+g+lnN9FdH
9zwoXxjF9CqViiV+rIKN5U42h9pFp9B461HvTydRKqbzj/FyK2ZqUOdW5AKgf+mjtxtj7KfB8+NA
63ErmtzEbcNSFzBonBVvzDW130Vr57ufDS/M4S0db6/h5PdRZsLVXYvwub5ZX2y6fYfsYm3zKDKY
o6kPACCV/xlk6uZ/fFA6b2SIb7shyfaYuOpaiHqaXM86pyz9+VG+E0mLf3TTEqw5e2IIBQgE9Kqv
FddgAM9N66VNP5Ttdpf0jH/Rvu4xuObKRKt51ox0rRtmQsM6QNrDAiH6BFo8t6bSeeEmGELYK9Zr
+4uAcLK2NXKPOfL8mhW3eABgtElcKPQ4YziKjZAKPW+ZqRDFi/SfnxP2wMcJjjBdGPdWNB97DSG2
LugSA9hPx75+IeMdRmhvBV9sZkE2ytWHmzIs20zS461hY+oQwAGpSfnOnEI5XJS4Fuha5gNjdk5/
ZfwaU1v9ajmCySHmha6xH5nWQTyLbIhya53EqedMUy363frJUWHo9VBdZcIc0alLhNoPji6/yTad
Xv7a6wJDvZj03N717F5E63lmX/0280VyfzLFAJdouW/GvR+i0cXx9RYtKJVYk/SHJLUgnFFJmzXC
DNtg+f/+vrNszT4zaDnrzkHpT2C0uor9EjWs3pQzOBy4+SGP/eVYsXqdDHpJZcvqWYqnOfgX+GAU
fEtpL6OK3w/w55zsC30vvxzWAYgz8sTZjEO/6cHhotXrA9FNj2TtPch/SErXslzCEL4gS06PvL5k
9r2WPjYWQXhZq6+VGsd9wksMc+WIsdF7yYdGNkpWhgph18RjaeROIeGAWAKeJAvjfO/yl0MFYFkn
VI2T7iRaiIS83rXj9gSJlINvGSqzeaR8uMMtynJg+7bDduMMrN3MzETphr/YP2lgfOSEG0Y+CCk3
luyDUhBYKDbpeAWI2DNgt86uT+56wZH8n8LYqKjbeF1q9Gn6k+ynMk7A6pVnnzyGRv8F/Nept+08
bFskRi2e4jf7mfYjP8aOhJ5GB8iQxnHqC1fGqOakCZc/jKWDLtZqrAu1GdKW05myeyPcm4gN5iUs
UWNe+o8cCSWzOsbXEoOZtl/YZ6tNtQm2WNMANm4HWAhAr2x/kdWu+nBWXSVTI2xeP1gX3oo4J1RW
a3eXMT2wIT8Ul+UXvTI6qV1UyBdPR8mOUMRA6wq1Qk15nX7UO8MNZuer9KBYaJeyYWoIClR0Yiyd
hjV+Smyf+GhXmOKWMTreQ1kukdyK76KYCbkK3ufkQMmTLDlWDW6KlbKFbc3y1byE90ASQKfA3B1M
uRiL93uy793Kgp2dGz8j2Qnv4rdLBEO2owRBYhMkJIx/VonyQmm78O91psYbweCTPtutTGBp15jp
GUZ4lT/RVHqFdYnALTUjWH2LR58q+OoYXtT8ysQIz932VaShCHrgLQzEcYJX3Kj2GDdVQ55TPARS
l1hCnOfK4bxGXJQwbLbkXVPQTWre+poV+VUQ2Dw+TO0DNKDlVMf0EFEfhThp/Xy5KxtE2afl+NFd
q95jjNqR9jj0BP4HvO0gGbCsGfpGhEjBt9K3HZaZDPvVqAkHXOH0ABWYsGreleCE4FdxRfCRrTO1
QjIxKIggR7DNURYavzsHvm4gH3/N0JNeD6aLjMBEwrEUJ8bmsPNlonSPSWMXhxVuAiiP2fTpEh50
CxNU7DlFS+3bso+Hnqjxg1JywOdgULyE0hz0TEFdKPQIAt4MbFvdeDt3YO/q6m5Qg+bSWsYKaWB6
7OR6Rjgg0zLWkFuuRbHkL/x4AyoHkLNxaZDoq2AtDPIjENw5PLJa2CggEe/Nu/5y7hCMu0hVm+35
V4uQUTorxcMJyKZtwivAQpolDcFAtaF6pjXEFtdUYCbVxlMbqpBS5FvT3zCxI7s8hw7/+8pcvdaY
Tmng+Un+y/gKAbg9DUAvi3DUTigl7LWClQZG0Fm5T6oC+0A8oCzROpEIt1GPeIGb5s1KYU2nJw3i
cWm0RRjKyl53OuTDSoAe29KR0oE1wn4cXGPhq7eyuaojzTdxo4sXkICu6PiTzkjZLCU3v6OelMM3
n9KzLLD7Hr/Q0IQS3MP1DfchIPVzAz2xqwiTYh1OqgyokMg2X0/pav3kslkPzn1hnCVHU1ffvDLF
IsORy45leSGUbnsQ8BRGTbmbXlGI9V3R2cz9mgOEaD0KC+fgnm8NmUMEYpYs/13mnFsbzC9G9Srv
YmlGGEEof12zITk9zGf+Bal2QJ4qlhT5BqnS/jpKfzT6WpK+fl/kvUilhqLObB454qHfSUu/YDWy
N+wtVPr6neHo5Rxe5iv92hmhkZn2Q+oRQTRvVmWdqXHUanps0aF/W7uS01RyNcwYVRHVE80kjpfO
Zy/4rXSgDZ1vVBJALwS1OoELQAckaPpg2LJE2ohCbOo2btOBAcb88bxl1i0riSyYsi+mRVdEC9r0
hMqbAmqnHR4WOHlJUwiJRyx3uBu5OZpGOx6y8R4hZUst0Wzu8ofCxmgP/Uv/BJWaFqaSs8mu3X6H
CafkzZ1/PwlZbxK9PTQwBIiZaDzcLuLEH1a+cnR8ubfKAwFz057FKfaW2kf0znSCFdK/hrpXa0fa
/4Oo+pJDL0G5N7ojNMp+bzUp67Grt3l4Bs9d1QVDoWb2eECAm7kyRiUeG2tmpU/xsE1xLCGA6OUC
2iJqCvCKuMBAkV+wNMQ4MdGU4n5JJz0VVHoalV1mvOXvBk7XgHrqTHRr1AkjmLkKC7ysJ89QwlDP
Z3+dfexAfkutgpWcfjaJc3SvLiPkZrltO9F9ASbW5uLJePz/HB5WY/WRg3ENa3HwKTAxqt3hq3kx
YEJit3c73inpzHpHBZwLFr0x5nmJ1sYy06NdKblMuK7/qHtJYJjjcAazaIm/Np8LhmUJg0a6xq43
PPfV4DgUOusrRyQ69psOLZyDTZw3qOi6NO1yVzLXP6T5ZWhz2FHRT2HMXO6JVPkaNiZw2fByB2rv
owNHyGJUIr2Bc+QsOO6hgNqxptIz06PojBmRzHAOO5Ey5xrve4lTG4V1AmqoycaKXPHTzBEg0wM0
yv4OKrukRQA6cpZcXjeRlf3uHPigB9MP+SR92AmS7Pow4FYCfGSeqFjHOAEfHDlzpTCZjldTzP1p
ynC4SLazPmdi1uRYy2PpTHpUtWxPRB/a9QWGg3EM+TSpfR0PzE3I3LwuN0CXI7oL02+0gHTevNnd
F1qTz9rDY92Na7mbH/IEuWGqiFCeGEdKgGvS9WI7sfFoszLDBh4SyXpQolNgfPJ36L5RXY0QiwOl
zlpcfn/VZCb0Ps8yvJ1O4uQbJwWPRhG/FcL/p99IwTJfuSIdfLUEY78WdCoJeS+h/rd5zbm0Lfm8
GZUwjOwflcGU6V9+brHBZiDS1/Y2fJ6cR6kR3UoGvPl+4NBVC8CBGnLPw1y6ee08PjhxujCD+kBN
PCnbLOpuvvi02p75DGta4txQEbFcmHgPIti/S6qkopXZoCDkJ35SwHiBma552jfAvw21vtbhTyZb
ra/fnOFzUQgdbmBC9qX7/UUOKPUmBUW+3maglhn6bZLb6aYI592969+9EMMbA4P77Ul/74EtBqZO
dmtQzW2x48ZceUPxTabJS78Q+Uk0IEa/FNSfPD8HPAKE+zgnybzb7rauhz0rghTMNmJgxAcQrWLW
7z6VipqiSwo1aS0wIfxS8wA5gKznG8CHRvaH3P2gY7gEWtIa8awU18tFFCzAQEEtB6KhCeQg/fdB
uA+CLbf3p27XAFhTjVtPoDHFhETYVvr8A2/6c7hkb9tDVk1hBlVEngKEGxP31RltRxAmlJiE8HMm
0V/Ogr1/kqXilHPP74OKqJT+IdOaIOssScOKGOp8ik9h/Xy6mpG+2QbJtLddf2+kFq1CFwRKN/l4
OA9W7yC8hfOSRvwXzdlfHXBHaMp+ZJGK8GgIJqK9cln3ITQ5WU84ueW7/wjJtiUS/w2iixzYsqZe
ZqBTEiED8fOfjGEeig8DWCkZi9icdmphpFceskFR9W+Y7e0IbUwUHQ0VSNjchR+fWvn9fg+5Txq/
8gaL3Sz11MvS1PZtKBoH0zWazs2gkzrpFXLbbzlILnSaQhznGJpPItSmAbHmTHhbBE+3hFy7Ov0+
4cT9VvuCJiO5m9xwf6G02OFprtpK2MW5U7tyUrrXHtD4P8Irt2Psae8IVH8ULnS5DhZ2qqAU0vcK
uQfhjk7tQGajlk3G0iKiP0DXRx9I1uCATVuHIZQHW23BGDdVRG6HAhiM6Y4HHNpQTLEZ4pNU7Y8a
zCWLSl20Z/p81+WpvMV3F9q26YQ8+G4ytp6PRPgPmib/gguvZhmAGvaMdjzHwr2Cnu940QGHKRvz
aZ9kLzaIMvBGyHJT+xkUCNa8IKmJIUdTdHMR4HMRG7r2PNGMT8ZKjzD0f7accqa8s6pFYqHjzmjG
rObgx5vjkcgK+BeH87mB0A7nfrsarjwal8uRdTl1mLW2dWXCtKV6/fiQ+cXqThtBuqZIo6h6xXC2
MghDO13u4sEcJtdk5Z67hJpIKiRkEXXdu5fcGQO0g3e9UrbCxwAZ0QigOOE+hCNQjBkp/SLnS94l
UpChTH0l1od/EnoY8QOHQ/0JuMn8Bk34JabJROgBmXLGmMhrC9iU91SwuprhqUlxZ62yEmMYEzNL
CYPmfnIqFVeBzZ6BGtQ1z/F+ZnaSC12bnYB0NrB3K2reCTevTrBOCb9prosvhmFT8ie0xSb7zSJH
tmfie9sItF3gZxXuzL4JWFcWRjLujStmiUlnN7/BcMknhf+q5o4yP4nSPMm8YJ+YPpOqnQQgeqNY
GCTT4HN/kj4I/yoi4CynpjzyI2dDPv1n7xlqQoPPbeLWHc2bvRe4PV6j1/oex8TgC3+UTNDRwyOv
aNwMwI9QdCxtqKCH+Bn7NTs+wDexATOy1t4lwnW7XmZ07HwyjKZJ2MKsc0zL22vp6l1AtUmuyjIH
pOm+A3hduKgl6AxLNOMTSEiQGY6sMc1cnpDRZKVixldd+c43SuqWoFDcd2Y59c0Q1snDLCvtHBwI
JdAWSvkekBkXvVFmpmJlM3JtMNxntmeGFFE1z+gNi1r1RqwP4i72CxoUg9jEnqS7Lw5KtvQ7Cejk
FP5zJrj+2esXetdJB8Qg+YXNRERvtapSOFkQ/yES7nWLxPUtzSwlx/jkHEDi5eMVMcetcdW7m8Yg
DqDycVJYk9KZ+gsMT97eZ+JyAwapRUltRU25zdodtCU9kFZZrsMBnogeSw7EsUF6ricONFuH0Hvk
PLHGOhp0Pxbi0iYEt34p7b1DhjWff5WmyFxKI3AomS3So2ndqcXNaON0bdCbJ7xtiXkvPLdSj2P+
HxVrWFfMFzFF6buW0TGDW4TzwiQcOUV2G1RyUvnlfyMxHQSB/fKz5fWv/cJWBM27bwQfXR/+yRTx
udY1EaaTi3Tc2PpveYKRUBXBPKhXT5HQLx1B2hol9x2DH9TV3mEb0TkjtJ099WoURV1lrSxcYsZe
KsSIyIOaVKrdsjMq42EyJKYmqT+DliKsQNXxE1A1U0vuEvmc6xtjs8JFLXT1Zgg2yiwFAQHGL3hX
RYv0XG8CofWpXaAOCalJLeK4x37I24AxjdvcfYOoqdpqBjPOM7wwtpQkM4OHQPH/hPpvjdiRigvb
/uffm8ebRw3+wa7924D+NP5aMsn5SnB7rSb1tibn01sk3byE/evM+CEJM2PYilGR6JDg76RXpcrz
sEaHqUtU0mUNfTikZlPw+vEuVvjpGFh3T2R7TOzBUIUb5vt+ZxyoZSpfbtLJBMbSY38q9pqYRRID
nBA0obvgPhQ9yPVXomZQusV2Pummw0pVrRTFzu1nwWWmM1T18NQi0yiDM5WTtFxRoCuwVmarG6+R
Uk5DhWOxuTuIS1u6sq0CNCE+epyTc76YQ5faRpHCvxTGL78FBQ25JlKUBqzbuz3pPFwihW2xLJhk
8SmMSMddPB14/AB4F8fhHGVoGrd9wI0uhFm7CAeyH5MSJK1tETF1+F+o1stcfZbhPzEnaFYvmaiI
5dxaPHVhiwtzR1/1zhgNVdr6kzYPJOIJZ+rNZ/+4jqxLcGFu/cg0sNsbmzQLXtewZuvZHDn7AdY0
GMYfmiBK9X8jt7/i268/LjfXyk+3Sq1Gp6AG9l7dGH2RvF/f+YSbbNoMhXoq6kwVokQDibSFN3O+
yM+H4uy4JUVPdGJ8zf326w5AORdS9KcNxxHFgpFEFCedbprBkosnL0GUi8XV5OhXxv8k3EzGCJfl
VxV89huAIwF4m1g9bRcydLGZkkPopIunlqc3QSeaJVCIRp1NEyDj8wnhg1d7CaL+S2+Xz65rLbH6
/XNjjar5hCCwWtBNKLX2fVbngzAZi0EdSaB45qHgsNqO8Zt6CsBL/tdBU3mwYoaMm2aTNAKJXRih
wOTV3vGYbfbln9BWIJ8SEjWy9ihoo4iXBSlZPUddSAYRosZFqI9d/l39yUS0eUR42W5RnEXTvjXh
clDb2F32cAd77bazK988S3wFu4dubWlA2MFgj2JB2cnYubMf3/1iZPW+27F9DU9MFQiDpKePOz0Z
i9U2wxRFv1ulxGiH19FG3VrXT8FZXK1hUaobjKXcLSL282ZL8I86qyXXUGUIBd7iT+8l5iKjstL4
gjUsbdvWqGi0XFYv1VgxoxVfDIZM5JY7qohZNPAzDIRwW0uKl/KBucd7Zcc5TYUeHV4ozL9sKZGo
Fc6dePPBsJF9BrHMkbrCVp4CJKvTS4ZOv9xn1BKLOcBaL/05JeLCMtvro4z3JhmjMkX/Q60yJpeG
EaZ6Dppu8+q2Rab5xrXJ//wWZJLevmjV7vCLqMj4ZNhJNdUGdROxeTPl1JxubkLym+1DwI8FhzfX
UAPJIpFiYbAiTEzeV4XvV2+E2bHhlISygx42gRqUOpRWimpoLzEhmcUaWuB3NL6Tvw4m3SMMwYpy
z5Pn1yWNCBZZteUjmHIq2MwUzCUXQLMfXqUrHKZv5B/tgPlQIfPBUblGGfkZBBNOs77ocniuoIbL
T9iM5nk2foLI0sH3egdj2jqcrLeWZaI8OcO0YoI3kQuH/W+sNA/UKQRSX4UGvElAtEXLISColGpu
MV3D/aBCQC+/9E2essg01DNTlWygN7/ZViJx5wSCIJggOWO7NJ7buUVPKMlfNWwBN4PdSQ+hHogw
/LYwG9p1hDgTD2uLbwDrRw+CDyxjsSM2uEUpbDx0J5ynSQbWs0laCxtQEl+W7ZKWKJT2VlMz0kj1
gtMUzVXnF69w9FBQ2rXJ2kxTwYpy35hDJWee4ndLkQD2arRftVImf7BmougYh5OEv82ygmbaoZyK
hRZINW8+0hEsp/mTHI3pyXDmw4qJ2I0/aCq/1jcy2hr6NQA8uP4FUUUCYCAzK+xi8hitpXsKIFic
t2+H65PR5aUv02OdKTFAonEOZJuf1jt6AUOkElyhYYVC5bwt3S0ki6F+eRKbYtNhzDeSxoioPMLm
QBjJATYGhGBpHtw1cDegqNITanRQ9AR4XefuAc+LJ5TnazKu6HllmoEcP/guP2h3x5kXXLL5YAJ3
TZXai3cajpmoSioFyX5XLkj+xaLuX0OjL/7Y7GBmf1si3izU8aABXQEwBobEporrcOdgKHuv0CP0
pazsyrFycSYH4WUcFvgueb8o3K8yxVAAvvOtxipDLP5Erv4c2BKrnEntZ4dJLqmP09KxjrUWjztL
cZX+EnnOsDzqSl+4Hs4+jFLgep9KQLy73ywqPPe6hKkCWidoKzJiBUrRHcDGG7qQSh45RpKg/t2t
DH6ftawa9M5O7WsaSCsiuZIW8Eu5pWKPMmeKTsQAgX9m4vSmHiHx7h4KQ76u5Ukf/shpXQsOQI9d
YqSyI/NotvECP+3gB0/1xK2vvO1B8akhfDtCdWlTHE7d7N1EI84Bi+UhbbznQ6YxV8fSLCXM3mRg
GndcCwoGG8sPxicaLFGT8hQW4c4fXnzbIxDbQu9mjrM5u6SqoFiZj/yulD4tw2g7Kv0YPedNDESR
qyln3Va+msaFgQ4I26vi5YlSS8Ktn8f7Bv8G1j9BJNb3SW9mukGQKomRnMvglgd4ns18rQfSaLn3
Rjr1TH2YBs3paE52DcT7owEKBmMfkRlqev8B0vQezNtQbKCiSRziGy5k0WEYpQHaISmISRpoFbIE
uKDANAmZilz+M5pSGf+kRSDueVpnOwmUemICyiBOO9psG84VfORNceOSdbHgRZCMZ5rIM/59FKMD
91kqjt/WwZIMxoqZ2JVC0IK8QQE8cY5AYb72C/n6jLvn7WUXd3M6eltz2FAwMwMQyIwBGWsgTLN2
iom0tDnWIhVLJvZfH8HNQB/8uY7MW3MflftVwyak/gzyG90Mq3IqZJXIFw/XnFWSqeoS79LO+Cd/
nOLff0R3PaFirpe4iOWjf35/D4yR4vOg4lVImffqyR8zn0YSsyEJXKXnRr3+wy5WrqVeE9l0AJW3
J9JNLu/DSt4LnzkwPHvS4f9s9UWC4lkhwV48drpW0eYYwlzCcWsuV8i2U5h+YCHlu50yCSb4RFGo
hLxxQwTLOD9KyB6ng6qw0bwPfJ/tOXfdnKt/SgBIkcAvMvk3VHeu/2lJ9bnEOssntnyhPwPF99sN
Y5RWQZFIH1n2G/9vXErJyeCEa3q5v45KgzkzFLfUBNuSSe0s129IjzokCm0fyqLsaUCLe+64t7Rd
u53M/N9Q66qqlimAIH4YC63Rrj8lvSOz0AwA7csqDmkZCREw5Alis450iRf1aW1Jw6475xdPzmOj
7s4XXt3U4h7liTE8YhlXudgmjHUR2tyDvwksmUP3OfkNuzsrhZIxvQWGjQNcJ++gqskWAJ4677JD
5rEncpQvs1vgnGoU9ugZEt5qj8ni9J6HNDR5biAjCXHubK/qgxpm5683OgNLfhm+Nj4M8VDxBjcW
pkG73wqnVh6jeNuaHVRedoVkHfAkspQW1a1a+Sd4hGM/1y5niSFOdvC3s2TbZwfsYieiVwn3xl1M
Jd/LSfSbM1TS6HOctFgE7BQcOMKtIr6+s+abjL+JohSsRhxqS5XMmbUt6wlX3qZnEjYMoqIe7wyQ
azJxkjvBmVcJ/rjl5+seXKInji35dJxKkqk4dpR6uN2bomk9/zEwerUEj8UcvMRQP+y15Nu8Spu8
WnSD0CJX2G2d5FT17nK48wv7LSSTQE0WAoP48t666ef7dTD6DveAPTKCAvFHN4dsKoWct0sBXvlj
shAxqFc5YBNyr6kyiY1tbkwDoD/57b89uxbvMdDQ/ZqNWt4L7GDZ2Rq4Gw6eL4MR0lawmIFekjcL
6ompOyqQBQG1eXPuPwOnvgl7+/akEiW5f33QWVvEtkpAshIZhTV9dtDmxyapoSYOqK/JWYcx/qZQ
OLkQ/gExMghb9F2crBQmjQd+/lGdkukt+6J7y6Ft7331jU3MFYghIKpM8Gl2+NysyDWTEy/41+iN
F3AT7remiTNPaZKs+/mRMc8Vg2/GuMkCa5aay0WqDv4bXvvc+89P5N2rBAWvSjC/uW64OYEcdBpk
B2Xp8sFFDPQHnT7uzJe+T5LcmZ6Zm/pVpvB/y1JS7drQLjlhCxFCZ3x6DDXkorbEj3E+vY/gBGO/
4/cR3sZmWfZtQTNydJZEAzOPlYdFetLOySP+rNkpd/mT5ari4MG2z0qkcQK5WGZgRA2Ua/GJHyPE
mCs12a6PM/KQsH3Y2u+4/LruCsLKRBrO+kYr0NC+EMP6ZIbJ+OudT96FCUP14LjlxDKmztw/vl6T
Uba77Uk5tATvQ167VUzCeEbgvNanYYrbg7rej1Q9ukEg+q7Tpph5WeBC9RVHIUkcgta67011qsGV
aBH0T4m65EYjmpDhVRHP5Ilu30wMi0rODuMy4GYzF727AElzvXv5Z1e7cmCL3QDkVCVZ37WeFLub
Sqywm4rdciWvQ7Dkl+xbr0bGbwVk4yFy17Be9Nci+iJ08e3aW1jegjtRFzUyUceVZMP4rVsxRyRG
qaB39qTOeQ/WjCHR3ACRp7960NAbEOdiOxwxglawSqKpwkJN/bZgorRRCzdV0WEnHzynaBU6CsJl
o7bgMdrVj0SGJ+audOJY9hgfPhFVmAD3H5yNFmiwytzjNB6raxr1Fv5ShDCQ6DFJUA485aRpwZwp
Ek9lAlPNOl8mUnnMahZfi2hQnHrQrlNzx2kgr/qlxE1lLo+INKkPqsliip+1+cvTFO3kuASTTS+9
7p9IBd5mElbLmudzkR76SFppI2Lh6oT1rMbWaQnUyLfLLgjDZtkKV8OpRt45MeoAy/MgaJiSkj/R
KXqBONnyGrhiat26xF3CywlagU9UbIxdVs2QKVXTJhAsnRgzOZkFk1t4vhIBjXGrl9I+FscVoufS
pwgEL99ZRjgR9NKutD0uU+pwBJU5ELTsGZoR8M12QQNyiHPMc9DfTa3FMOBtZpoJ/76JVoRZ7mG6
O17q/ldeh/IJm8DCZ+766ixOnuGIwNsjKEBtYDC4HNZEREOX5z5juKyh8oFbCxv37FxUY3baaiB3
d9tmdaM1xGb+w2gm/4nDejJTfrEgUF+2HFDkud9mh12JrZK6sxgbo/y1oTdimofvqBtTq41MuB6Y
UeiX766ODmid+z2FfuYY7KItPdX1lOXm3FItPakeRO1F68QGuIyT1TRrZjOW1B6MPAFTO0zIIOPQ
yKOTWC6Yt1L2c53RnVIl/ieDbLgGOTvJjkx4OpG5tfxY2AT2duvRB+bQId5hCGCpLjV9iRll23yg
7TBSiI52TRjHvpk+hT/un8f1pOOR19kQX/CmSXlqbWcBV4ui74L8VUfpPPnQQuyHXxNeOYhzsIZA
HFW0siMj+KUctC9AFx/unBCoaLFR1Iu+2FAMZ5E4f9RdR2LnFsrkpKmEmk0yTvxU6QYzhlBrFoER
tnNiNShRf3uq0z0UXsoL6bOeQd9lCL1mOunsv5KeHgx7PxEYtpWHLkCd7gcbKg6aZUiSdHJliCUj
7oEV9INgt+GlQByGQKAJ0UueXk9FcG0iJDKybj7wwtYIH+xmpMwCJxUCtFXAGojhagN37/C1XKeT
2YXDG5Bs0r2xGzDWuu4p6N4/rF6F5or3tDDx7fPuZmmjcb+hKw57qBsfmSNvwyMVivbB50jUumk6
PrJWiszTiqMSY/a3sEOvSzVDkGWqBb7n8xQNm2vmGI9sJ32ahsNNVAvtrAJF7WTgEjosl5J+oliL
v5BnUhYGBgzl4Yde/WefLbVYohQ5fe8djfmFh6Xg0iVWAAa2Guw1jegO6l2bLqh7Qy6miq31yYoO
btTouemZcwKoqOWSLX0Y0Xv2P/aDZYZtkrRgzqzmoe2Vq6mvM1/YQqO785hNfDovQ+60ce9Px4YD
Z8gvDsQVAD1As3/vuyq2dfaglphPx9I2htABMJEaluZ9Fw8SmPJ06xVSi7I3aTuyGTtzKyGNvjUQ
c29yHa9dqzK5lRwmZ2dPFL3qByRGR2ybQFgEygFUF8dPs3sDw+iysEjDZVbdxtmyHgMxC0qRKD3b
RWq8Z99cTmo/PhfhWXsFw5H0fhW753fXnNY/Y1oUI0e3YGD846U1bzqYDzYDOm6+mmYEX3fPU0DN
mhI3amS8PyqaMvadQXzUykp8DBvGc58QjUdV1Gs6q1yWv3Xx198SgArBX5ul0Zsq2QliZkY9xwPq
JuKvFbpZ4pax+c4mETVWlROraTdebwz8dr2pjADmvib8C/ngtJ+v1AKayEcFe1oyblE6Tx0l36Rx
NL7esL81NtAfzbE4oLlRGEw/bVQuqH6KGkH4W4aDJ2iGcWmVzXZtqw9woFEqGp3n41Lu5roXtL1d
iun5+GmcdjTpahnbdGhx0mxmxVQ26VsLFzy4Vx2Dh/mWcld3HacjmntnXGuak4drACZOIyYEjG9u
61bFCv3rVyf2reKvm0ZvPucTrELwaWFNr6FBS8ptKKh3qD8Q++GlAvneP560lUrQ5GM5y8Cx9buQ
6PXuqGPSfyk2sijv4kVgK29BnCUwE2Cb7WznFUuxMAj1ApQ6enxcuDtXPfcWGefcA0dnHP3Hq3Pu
WjiKEQChiuk4nOmdAkgdfbpNPZBiKGVE8wZ17d9XjhA2Ct38TfloYSOE4NbEM+TiAIHgo8YNZrHm
A91gvIvZmOjp0ty+vtXiE3W0Ch33bgFNFajwuhR5sPk7Iv9ovfkVhaXU8g0NDYXoU2SrHuPRbROA
ep/wfYmg2Nmv1/KhAfCunc0Hw+LFRbYtT7deO7LrcsqmMn9/MY9tv4n2Z6WeabvbyS09jKYZeH4W
gjLD+jK1Gt0gPxMSfMWVW+2crRU9IoItQy93nyjgtfUSiXZstPLgibvJQDAYLFJZjDAb55VU3VSI
DCZrx4PP6jagFzO4K3bgCIj2p50s3gAuv7y0xT1RFEu7kFwvYtz5iujy+wJtvq6nlhrNLG3s0ZP6
9jlblPehd1v4pemfr+0MEaCHw2cCI8iAkaj29tnw7QEk/IWp5hMXH0V3881PrUqjhnz6xTS4vqnM
a2bTUb2pE5YrxIzp44ZVpEZAJhtXvhk0Mm3SmnGHmzS2cgF2YUGqQrSstWA7q+Dn6A6SdFXMPwzg
OmpCMuo9/pqkg9uFKmjqngyV1d1xDW0Y0hUNAXGCVHfOH00YpmB5aKXpeRZ+GfZYlmqbnpc2wApJ
TkR5qeimbxSgF42DWwcqQq3JJlQmPSzPXH2KkELvwtblsmGOzQzDaxacQoG0uDqZED8zx226vrPK
4y6Axm6/qmAcCacfFXvprdfNufYdyI/WAr6YKuqY0djzrbX0jmrK6Ya9jYly2PxfJg3u1XhcHqCl
3PV2xz19M9DhgRbgcDUZv5oEOpfaYrUlKD47McjftUOugAn0OCN57mRGM+1nBbCCuY5/ci9eHcez
wmNxFa0Rk2pepqnNsp9wxS7u+55YUGRYJwcd/WBUxtfwXVaX1cpVBgIfHPNnLqvaDPtx0APPtZey
XbruobzO/wWVKgVsGXEpmIaNShc2hB8KBc9svXvKuCG7EetLhosH1NssOnLLveSeh2AgD4cKcS91
Fm2Cnl1Kdh8AM3AUKVAgzcEclo/SKJ65F70QFnu2G0qZpX8+zO8Yi9Q1G3ax+QahflEHZEn82cX6
UAJlcj6jfFr/Rngdw4qXoDfdkURxtMQ0RqRQBdS1gt2AGE4u6p22G7aT74IVYcW9JED/YWgfBvN5
i5QCK3LdCm19pDPgHzFaCSqUMQwHVoblZOZtQBWzKjp4frTVu/oRurU5EOetFrwoo9yfhMN0B0i5
krjxoWWIbb2mZjbD5OsYY1jRPMqr4zBMp4k90RnTE6Toi0Qhdk/vMhUS7mdvlXzHZH4abJ4OegKA
4F0cXfwMVMZwJ2fb27x/2W4SgXqLy34N1Au6h2iLK5w9qBgMLfP3IxP+M1EBjmwt09gqGcDN/1ER
afGYIx3dM2wVGuARa9ECPSCYH+6omeZjpIHpQNE8tIQj99OiqWb/UzAIabGPMH60pi5dlYPUU2Aq
waAaR+NAr1lFbpjWbzTk9ar7Ph5UOW19Abj+9inKW+Kkc7RzcUBj5BCngdNxui/IfCaSfpdhL9pB
ZW+SWl+nvUYisenuVYY5yEDXeTfWmoQSa3ddqSVcRFzXAJSe0JbleSscME8YXrmyXw30sq65wMzV
nqv+oFWCvG+7s1TftYmGPAJaB/n0fvPaQPsw2CrdekG7gfO3jzpvu9K7i7exQS0fMQz6hU5bfLcr
SvoVle09KPzIYKpWkL2wCaJQ3a+0RI9kzKBZElVMJfmmDETUa3z7vjRVuCxpKqge4OLMd2jlcUBn
P+VQb5MPupUV/MqHy5abM00CbDUThS53rzVIPfrKw1HusuRUZVwGDs7wJ3/n6aZcNAXeVzVPw0W+
OLbANJ9i7qqxc693NUQ3Lc5hr5CHpTbsr6RlgZgDCAW4bGMs8xLsiEqg1BOi+N0bjkm0ctOgpkqM
IttlLwzjMNswgtUBaDK2jWWfcpiVM2RO3BTyLxgQmUWv10UAHIVp04NPCH4h4pTb6x/qAvR9VsRh
xMoWEPwJsPChS0giz4lfDalpwmNXgpBn5nv9q7gGpdsahqk8XMXCLUes0zuPx/7JIyFkk/k7zP4Y
h+c3jPxXOUzow5SvtzFOoY9FG39GahE2T/Ko+qIGccgSLHNx49ZsUiSe3gmdz65CcXTawFQyNXgd
ka6yawYr+cp0Zwc+cR4po0+HZJ/ki5ftzouFNgAwQIRetkI7EX82Rb56x/LefQF/7D9QIQkh6X/I
Fgk+CITFJMegDNxUrfGy++i6j1wRzQQk2nbS2GJt/WJkBp/kV87ezCo4Z/8kadO6JXfp3l/YVvr8
QYI13t9jxpMzeR/MWY+q/alWspbcUDtpvBc9n9yrEPqIXtMmP+JpQ/uAQLubar7abzRZHw6ThFMd
TbhITmGMwgLI6YGh+j6lMDgB7kuDueSTQFNDqkpJIBzH0jPqN3EzTZJa2sq/ORRqzK4rm5LdiSOR
VM8xk0F2p1Kplb1NCZ3noT+62s+pz5kx0kORXfWM1ULhc1ed5uQuN6ieXiy6tAMG2tdUWSpGFQzs
fkV9QJ1pkCtSiZ2uBWP3A2NzgU636ndT0tZ4X/A1C5huPC4bY3gabWe7UdPUwLqrThpBqWi9vqKS
8AhLNx7x1g2Ct0GM4WBFI0y8ViJpVMhgmoHsCFCHJMw4XQHq2qki/y7kZZfAm05hlTASZwGEY2Ma
seosUH03lAXB5QZ+CUD0N+wsmNt7q1SlWqdpMKRtH916f7Kdl9FPboh427i483LJMcUHJGOaoaXk
pdgxRaAd0b25daiVshGGiQtSZ0CMI9ea9uSvlNWX/0LBexfVrEbx/r4t+gAHvDmqWNiKelYm4WpK
Wfzmh4+6uDFyZ7JCLz2Ymcs21MCdIM0DGV0J1ALNg3E7fJBgNhlkZfm+HwpR4z8wwtkUdRIpNV4I
oPX7E+uf12Vh5QmRHMj9kkEyc523fdqW4oa0p/0whexRa17+WzKfy6l6TR6dmqiFX978+QSEZHG4
UkwE8DPmBacoSpaOOn7ytZ4zcerkR/ruYvAOd8fpANwUS7ym6WN89t6WltbgYyiAY9cPFU2HWICe
h2AjP89iNm6+GWlbUEAG7tcsiX8i2mlkZ9t13scq9G3vyWoCWHy0soEvM6Z5EymnKf1S0hrbMrx/
oUPCLlVEKrFK+PNFTLlYwmyfLKZRokmK0bcnQBCzm+jykpETnqWtedV0yPh4Up6wE+NZ864CPtno
b3sbZd7wbDdE9Ko85i2peLATnkqAJJx1ZKarJJALxAWnRlMkXWmkCPoZjGRP+Hl2taZENdyIJS6c
VkpFSGq7f6Ar+EBK3Y2IFvihLwlXrar/tQpVOIR7NGT6tgSaR+olV8QgNVoujcUDRH5FB9MNJEl+
4o7HSK6+3dGGwmyM4KM/oG25YP9WEOBTye8eb9jaL+ExWbj9okXFQplphVGLew97S9yPod4OaEi9
d3brKrGjFwBVcE2VEbbWAO73CFJQnIpW7cuZwobf6sZSlINV0y/AoMVSV+E4+Nk6l5fvXIKip6gZ
RmBqOKk63HYb8O7KqNukj2WBJtRMbBqgrxDxuK5V/gyHg9aSJoc8OuyoQPl5oiAwt9gkhfaOrfKP
mH7jf17PtMQlpstT2WM3wB2rAsKZUbsry4W1+jeLqlMR/lrhnJ8Qlq+KAf1sJLqNZvXvJ4KHJseg
q8DdApqPH5CU8hLbllIR2M6OHHAU3uuf/Q1wrYoVppf3vtrg8nEzoX4xN7GVbOpxM8tBt+550OsI
o2fjq3Q11i6Kq2qZWq6AaGN7P7tXVZd9nTr+spQIZeICiHUMdOgbI/yuBX+TW6ZqQbAxYTT3bohv
YKy84dQH6CSZDWgYBzfDlxqFIu7rjz/IpCTq6DDvi/XC8pVleCUkhkAyyvRa7h6UtLm5kqch0zyz
cN1XjmLRq1ORObT28z57URhkG8vhoweZuGv/oogcSfEdiigIhnsKq9sPnebduCUk1W8bO4VVaNjf
fTAvztJlTmLgr395009FqQvUbiZ+a0nOM9yFqi6EDlYaP/9cNRh+DMhgARAV01CUFZ5OyuH4BTDb
ahdtXKuWSx2CQz7iSNrV2PbQH2iANdpzYgDlCKmoXuM68NOireKQejHUfptUO2Ht/HP9ukcZEy4z
lrvedFV5JVE+4u8lHtULNP6iMiY0zuY3SO/f4hKJNls+uDcE7KnmfWAwKYtk9l3UYrGcEJwbD5ED
aId93YTlu+3nzJk6mukQGNU6a5NQl7IkKuiURWk8Rk1c6u3ekDENGg0UpCxCyEYTHwL33sYa4ZfW
MF3jJ8/DTnYlmlCm0qGeMVhQYiOZngd4wI5CHCLPFP9wQ1RTDgpgn57k8YpuGnmcV1LdT7gOzcZ3
3gYelPTi/5FRIoMwVRmMoHmWoeDv9LRqshT2kQ9PJCchA1Axa5kEj5rK6rhdmW4nbTjp1Ffxcaqk
j5VQqTusMFPDL8EQB/2XzCHJgQ8iFeMHa3TEjwhz07QYFIYEy3S5IY1CUj2OJCSbf7w876VOdBhg
WHNcifPHlktA8xOfkVqDpDmjVrXbpvBQTDeud2yqBAkSiSfpxf+CNOQ4vbxwsdo2n3U0flcV5zk4
OmdK+H0I5/D1FzL1EDKCEQknN0La0W6hXwCCvb8DIx8o4Zjcf1nrKAiRRnxWIBW7cm/9UyReRl7K
F/SyIVo37+TUGJUgSjxqAKkoDUvmTMXQZnGHCDeDd/cr6XOmxk1YzJkBt5lVzX4ulr92limqAFfD
NbJbByOhmRfOpgdk7X/wTh2Qa7lXv2IA/AlJxej+fMKY6ay0in1NCyljQr6eku+A7kqtANWPp2b8
l4At7sj0U76SSiGDgei7vrQSFI3Wf5jxyjUyZ4ebmlINm3v+Uf4288T8ZCb3Zpi+FL0U1wEHqfDl
DA1IKTPeRN7TxznHoPbvj4XYk6O1gC4PaWp23N58t+ECQ/6y2BL+Etfd8CvwGDk1lkw7EeeeA09c
RgB0TnA0e1SUCSmO+CQL5ViM/bnigBf6KSz6mZLOuBg2yp7HgGIXKtr045/RfgvVYmMK1KwNBG+l
PfetX4DHgJJysG4+4XDkQTTXNpgrD1jols+G68CcDyya+Y+qaSeWlwQiJu6EeXN81gOIOQK9Fn1p
iRUJwtCgSLf46YFdN8GnS61VoWmo19FJCjFSFT0S89iVlFRttlMjHnQErMQuKVHDdNf0BZUnA46/
v+/U/Zmq/EKIUwEVEOODT+mgeYo+fEITpph67L11RBmhOJQk/H3zic5Rm4S8XQJXY92FrUPuj5pu
JAqs9NwOUHSU7Wy6kK9JGGx1k97u6rGqU2zDwG09Dore3E1NN1OAIYX4bkxSmVSSOl6jHKsfd8Xa
tPi4FfKwABd2F6IQUza9phq1ov7NyUCvldgtYkDWzlB4zypR9FnJo6cuaGnXOhzxZHtvO7fuR+J/
TDXji+vEuk2XrqUscrq90OK+oHgqHefit42651mEmOGrFTAbKbmREPfN76161eEK9aMcVJQmVmm8
JNvtNaW15heew/1u99IrdkxTbJyOlh/JksfBuLS5fBMjNHlneTH+P5HS1pR9ieJY19bi57WwjfPr
3WXVFQzGru0eVdvIL6FQoKkE8eiI7Sp9Ug1uxPFLRLFqzEZqcsLcJjdFmSenjvwCMzXC4WOI8BWv
MghzVW2w5lgGmrGxzNAWB8J2MJXklJjkC8kL7DOym/TFgZ/w7YvXD2BX8YqO/CvLvu6ok7WOV8FY
Ei0IYdm8dQFU7VBjxEC9TBOTJ3iiRZNvhIzAgQV0JpqpQKL1JEfu41w8gpFZgvQA3vM9scEk4p9q
593w7vwEL6hDecM8qf7PV2NEXeSA7o/YY8qzmTBrezLmRQpa76uK/qkPJWTKrkMhuy0qmDKcUZW7
A77hYOu1boAEkGNNQHaW7j3N3V0WszHi0IKVqwhxikK9Lqj7/nQVNjTheQ4fttvGCL+AZfOiEc4L
AH7DxpRxB81GLVW9MwUt3vrAd0jj4qXuVE3VVe9PdToQOk9wAM3QxWOHXwkbE93AiXqiZuSiQnYX
zbLcXmIUOnQLkf6Ff9lJcVRix66xrt3nrwCapiKaWEE/xtOiEKd9zbb8MhimJyObRBVLIS/89RE9
Ptv8NATHVYqRdRD+xfGHZjQ9fS2yAVrQOsX7JvHl11gtu0Kg3mHiO6FtXWN01UD7wZN9lgoYe2HY
uHyzx4Ea1/uyLf3yily4XozQZ5Zidfwo/wX6XuWd0ReYStkBlI9Rud/imlR3LxlaS0nVBDz8lCZS
u0MUWwUTLN7bPNMUxfhPpbRcwFlaIUOkbEk0WPVR8LEiWEOW6SxNH1Iht8vy5tg2qAPV29TocB8A
+MXWsI3PC9dnGYlv4Kkv7JKmWZo5j1Mwe7DDJpmFlLcsSbWOg5LS84+bcD+UyPIscBaUZ4s+EPXB
K4LziFnYeFAyYRbQ5+vKIubTUJbmli4EIbXSkOdZrvchxS+M25WTVuv3QztqA4qoDnO5dXH0m5+B
ui7Fnbkvy6vm66xxvprLUTjERsyx7KClcLLUrktauTtHFF9+7vsAY0eEikAPniRVooNrnXQDg/Cy
K1p4v5gfkLsVpdhvDnxxMOGSInOml38j5wuVY/6RRAkwxYkbcju/9Ax9sJ13KAk6XVpADjeB2zCg
gcRci3dW48ZqjyECqBeDsNLHoQnAjfKpdtZd7xXLjz/GQLPj83YJXnuGp4fKSYJxPRvQo0WJl42p
M9nWL6rebhjQEM8oytUIdl0dbZRquUm+fVFb1gR/C7+LbWO3M7oPiFmwpIis93ir97auGCjIxOU8
NcwwIw92VO184CqDe7NvdKr/csErSBclMawQMW0cHhsVtbT9j4MVPfF7LN1GZJNZi1TM7050i2ru
PcEXq83gx9LQx+S8fMug3SddOy+LUtvED3RuWTpMZUvoJlXm/nK6KqpbUQXD/v0RzfG/CZVATPyM
NsAYTxungDmtyXMcaZdre6rKStZCXWvk40m4hiUAfTX92GCqTpdoJHyBBDNSYOfOV5UW5eFAr1zA
mxrCulV29WpNujo3LnltxF1OlZIWIU7WpaemLKkOr9uyEjuddEzShRIr2RiabfWT2/xFYOmJsatq
QRa+PPt4z/xAIJL3T5J7Xj4krnvfWgopo4mcruzrRln8aKMEWP1r7IRZ2kdF4KC7+C1ocaINEcvW
Lf8WTRQ/VsdGKHC4GFqqm3pVr8Wm2Uq7uWkBZeXt5ovJhbu0fcmsrHXi/bUsNQfbEigLCKrY3d7F
qhdW2YZilBIk1u3thRSZz38SHq3nHi+ZleYi6S/UKMP3Zc81DYSmrm1VIWc4+i4LwLWKXCXjUmTw
qiexFlNyQFVuxFzL2W38H5uN72oadPGTTX32COfhtvddrJeARgDG36ok0ERs9TR1eNZH+KKw0utf
y6lw9MdXMqZVw62UXuWtQyymPe2oXxFuSb5G8matOYPeulNP3fgqMfhKQG03e5HSMBEQJFu1/R2y
K4lNuDUBoj5Kvq2h1P6HRheyaKnEH5n56MUwQfht8zLKSOz5AW0UJ5vf5I5R+qNsjVcQT0LhwMjo
WpwZPxYyv3ERe2ASbmu+glbcmVTNVjlWayaBWT2RqgcSAlqsX0mvRDP5mVkwG/Z7gdWs8baTD9Hk
iE40/gpXOoxWHlTqwmZrOd3GI6rry9VP9k8BGp9XC4ByeTzY5f8602pS+/mWWWrYpB2uqNlk7pEO
T9LnrDATmwaZ5SwvYQlLaGOwg1W8IfBA92sftvSxk998QLwQyYsCSXvqNxyElzocgUkmWKhXuPzq
TRCGOr5NYY4YsbmOUVHuWERkiUSh0jEtZ96NTdX0XMnEkEjcfYAO2KrQikgWi5ZWHv2IBcwcmmMJ
l1B5UuPlzW+zgx3O++gKAd/oUGV+EhvEQqPpTUVE1jMqVgNUkcc5A2HAOpWKMshZ+Hn4oLCzeyUU
s4pdFFLM9DuacQtwbOp12a30jWXiD19GuG/uJn8s1d81jN97037BlaiSn9zVTluta94AknGn4h8l
E8US62AFLLHtqpZq75loYNgwXzr8IDqLunpS9kI381QpGpLYFZQzGI3o5lm75zuU3+w5rY9tn6cO
6U0aUm9RlLGoT6srov0CXCpeSzOSzJf+166MAd6ojRqR+Y66Rh7wjZKGK00GFQf+gyile/ft/0Y+
ildHECQRgJz1Pk9yDWYP4FRXaaSoy67WLlF/E7hPjKVxfuR4wS5thTuEwttJITx0Y5OMUvBJSvax
epMg8oRDKwHqxfEglXoh6zKapP3ddg023upYhphPWGHJmmD7h9hRXdoBNz2St2hKiH3UqXwy7CS8
faAiM7eLHvrCxGA/h9dB95ewYydQ4MF722gbParrDj4ppg/oiKyqfQS3eFJGHvS7MaBv4LmPC7oX
+vXrTqmnWalz6RfLbwLayIm4zTviEXmGTC0Omh2HM/DYtgXceq6Mbah0RAV8MKw5BO3gRRifg6Bf
f94vRpTfIpJHrpFxGdcKN3UEBwYQpmBkhqbb6JXKJnpCkGNWK18KQf6BFVj7VO90wPLAGn2bes6Q
rZwIWqGkoShVVpkQAY5XfYiSMz0EK2WJUb16Y5wd8x/R5ILfwNjz3DMFJqlcTJGPzE1Taiy2G8da
YTNYndF5Bo31q+8qR/5an98qZaxkPfY4zZ8dLWAwttRY1qSW8UzUIYtpUVWs7f6zPuLH4t4gp6Lz
0u9GmZmcQhFR9eVgN3cBJb3K3LELE/eL3wY/3rcWZXWIwttzA8hymouiirroMyZMrLQ+pHrWr2ya
R7bQHoGrUh9dXjMG56yBi2wJovaElEV1g4nliPgwobXYSLXMzn6T7IroFVjPwL9Kh1BIPzOI68/S
kFfoCpki/anrHu7hmgyilgg3odrIIpZE3LONslzmGPuZhQcaGNWAZ1eBTEfpCalaXfUL4tXgWwPc
FWoCuA0sifH1TX8N/ZJ14hsho/fOtUkt0lRgeAJUbB/l286+qIrfaLr9C3kb8MX5kw1+l/JQLcoj
n1MJBQr9remKTBzQDR1sSiKYVqFjO9a9sFm/ZNBSiSQbyIxBDIDYvaP++ccRwwEjJs+Rhl7qyZfq
GN2Q/wa8BKwceA7rDIqZdH3cpHcxyyAo9l6WD6uc7rm4x+BupOX8C4HKsLjF3TdN32yOVVj2AmqR
JjcgwMkliExg2jlURCs1dyDU7dyQmh4hsKEE7CrAWY8qW/bjyqj2x6xQu3eWcNa7BZR/1Bs9Dsej
eFb6ha/9cy82qk240/LBw7ZgePOR82PListHPhTQr+6WDpZu4IEeF11G9Gs/9z/SjV05ji+a5wWM
R7jnIRBP5L85yiUudoHWjWDCssrrgC5V04thCsdflLS+yOg9+ai7E7a4gOiW/vZzE6+FU/9oNts5
4oQjPAP14+C5CfGqc/P3W7MkNuLHKXbQPOjztREzUfxZsz4gfFpXcOhQm/Mjl/0U5Hr66maKgiZ6
GBJL4TG6gg1NLnwAfn5KyZ7Pmr/uvCvOvog4MEa78nv2DEBMj20cZT1tOtZyPG5K9JVgZB3pAkyz
oLL/BTYqtFRNxJwgdu7ZCuvgZioKhY8uapCXw7Q3SHTFEM9zrFGhbt5keuw8ENQWf79QWtzUQ94N
wbtjnI+GyrKzJcT1QIh3rSnh4izWZry1/l5wVn31lO7fiUWJ7jRHb6n8PoFwfQEEFaXu/cuKdnSj
/MBjsPaKIsv8tDSWpj11nDZneICMQoxSGbFk2xPLRVoBcVghWQR6Ss1nXAhopy0WAAh9KcJrsgXy
lll4QSKD7mr8UcTfgjOo1yEz8vJCH0YYDQ0yZCpGF4yb5oiSMH9opEdX76zmOssF3CQfpdlsy1tx
KwdxykXr7oj/Qy/6OfhJdMqQc1IQWfyG7nnaxqQ0efIQRddlwbPss3qrGLjQN2s6cT+b0q0QZ15G
avl4nVFfOx3Vwb/l8qDz+ppqu16/li1QiY3QcBTDqCwKjNqeopfTGEkIaOiQ2yjWu2FIVEVDtiOM
zrow7i/RcM0q4uUbwbnAX3kafItYT7jkUqo8ng4ODecHQMiWhBrzYJhgMQU5h8tSRzhSmm6aIhul
W+cJFTJq8S+znC3CN3ufjlsFtqYSJx4jVnkh8S0phJYoJ+J43TYpcXT4qx/VyMfwm1d7iRTxVNfw
rB5wFHd57H2aquXxDM7oz9fRnEV5sSGTzbnDyaziIMVlZjgstaqMH3mnRmL34Lz+4WVZfA114nIA
9i9dY6aDZnHybcUjG4jGowYSs8l9VFRJ4wQ90pUJryORT/vq7pI4PQcR08yfQXYSUIh32hbpZe8N
J4bY9ZIM/8RQSO+BDEJ/cjlCVlO1GF0irX+JYhPSHL4c/MMgdLAvx2p44X1QXoTJQEjZvPS1gJia
/BzPyFF/Yc6z//FwXVI5cNxRAPwc0NS45EmcqJeJzITr9R5bDMoYa2zGw3qwKr3XJ5SO44G43Gvf
Bd2RuEaJcLPKWLi/67BRQCvGop6B1/Vbm7zY7BUSUp49VRhRzXKekVa2L0EiCGdg4iyHKgaGDCav
WMWQT65AILZsiQ/CtWLpCuWFdYj3f+eAw5bLFI9yKArVNvnGR35MSxDhV5yiveIjeWPPi6CRb7vQ
pOsgpsajJBYzLsuvyNgxzDHUuPvwoReYQqjygeazH32M8fZD9AG6f1a4nYL7rJ0gzscHwjUxGiaE
QmlkOA8GJPj5BtNRkt5UT3uNK2uaIOWOo5hPOg0kkiuJ8UGlY+htsI6Wks9gaQize9PjKBa33yPa
l5bqg84mMx7vGEQLFL+iN5Gi/vVLCWbN6W/1c4gR3ArjNDDHnx7k/4uI5mYzQJ2mZaJuIjHTgMOR
NcXKdXhLkQaruQCycgj0pIl7yHsktidm5wou7pUa0I45H7amaRWpMnLFqbT3DLw+vk3vtlEe9eAS
cS39hnU5FIkS2iJm3JJK9E5nPazQgaZnP6OkitCk9vTPsLZJAlJxPaVkacs8/Bwe/O+4YDP5FVn3
eYS0WU3eMreC0JkNQ+z+A9sJF7fRREjPSlv6y/jSCHwMw7YHui6fzBq8HXBDOALcHFnax94YgQfF
N9tZWLkeZcDX37EVxar2iKU1GGTV0i+rF/D1vf0ccllWqeutQKvEEnUl/UF0tFHj8NFdkmPXNI/A
X5jrZDlbHQn6I6Q3FnuKPgSA/vcIrRHoZjvvVfmWVL+V+IEgj5vgMvkLGx+VFAuox553WttrIN5S
vVhDNmJoyOTumWox0fyXtUtFWlkp6Ad19XZWccAYdwwWe36zo3HqOHDYRKD8mBUb98YtlIUOShlA
C+90UAlW9CHRkR1mF8Fry/e/dRrI4dV4sEFYdzavj3wOVRQ4nV2uu7mSzIj5pAN2GdY61G+vefXI
kiohoOldVRdvNFA25XA2l3bpWrhtnZQJyU8Ts86ZJdnAKqP4uQVysx5QdK8w9RezTde91lbnV49K
K8hNQG9pyWJeetsB4HRtVb88JBeysTwsnU/vuzX//LEb3oygd/SmTlxhMiyjGRZFss7Qkp7bz4UD
JLFgCGFsl4j7ULHIZ1uo/DaP20rROaVAb1vTl/zNXJLKMYbSfP9YYtpHr1s4jFau+RzWZD5MnJjf
853SV9f9lDtm7fSj3tzFc9P+5WndBBvntQjenrd9zg3OZ1SBpfEO36GLQj5l5IhKFPfN2GGvV4YH
ElBzY9uEzL+sT9Nz70aZ8yV/sMwCt7Pw4rQrItGyKKu4HT56EMfB3kEaT6dE5LidLD1Poj7EaCY4
PvNc/bXyQa1RbMsg6mez7Epnr+68YwNFpZFgXnHrOybGdWczvAR+hnLaN8x0gJMvPRQOEaQ4WFZI
6gZsYwDxnCeyya5zE/7zHcyYi4LAdrAQ0MnjpVDAKJiJ/yuWiWI/Vk5LxQ+59tSMS5pIcTwSCQQN
W49EpeeJ1s0hqnXR0pgYhQXVeNbDdUB2LSUf1CwKOSjomhA9yR7sLiMopXS6AonoetxAbmxFNLdf
FVWClIxj+vCXpxO7qoYOmVqE4zuviDVCm1viMe0u8P/mzB6mzr6BvGg1iYCMc3cYyQmjPJGRWh/8
C7JMR9TaNnRkaFfPdE+k4z1mDdmihi2kLxfGsu5x5Uzig2yrk9JEgAfR9ERCS8KZb+AZOLVmf6Ar
z60phksSEw2IAAAAANpb3Czx1HpfAAG1rgLimBbqDmYLscRn+wIAAAAABFla
--===============7631603969311820131==--

