Content-Type: multipart/mixed; boundary="===============7438169221290958840=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [workqueue] d5bff968ea: WARNING:at_kernel/workqueue.c:#process_one_work
Date: Thu, 28 Jan 2021 15:52:40 +0800
Message-ID: <a69a62ca-b7b1-bb4c-5c6f-8e186109b920@linux.intel.com>
In-Reply-To: <20210127092128.2299-1-hdanton@sina.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7438169221290958840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/27/2021 5:21 PM, Hillf Danton wrote:
> On Wed, 27 Jan 2021 16:04:25 +0800 Xing Zhengjun wrote:
>> On 1/26/2021 3:39 PM, Hillf Danton wrote:
>>> On 26 Jan 2021 10:45:21 +0800 Xing Zhengjun wrote:
>>>> On 1/25/2021 5:29 PM, Hillf Danton wrote:
>>>>> On 25 Jan 2021 16:31:32 +0800 Xing Zhengjun wrote:
>>>>>> On 1/22/2021 3:59 PM, Hillf Danton wrote:
>>>>>>> On Fri, 22 Jan 2021 09:48:32 +0800 Xing Zhengjun wrote:
>>>>>>>> On 1/21/2021 12:00 PM, Hillf Danton wrote:
>>>>>>>>> On Wed, 20 Jan 2021 21:46:33 +0800 Oliver Sang wrote:
>>>>>>>>>> On Fri, Jan 15, 2021 at 03:24:32PM +0800, Hillf Danton wrote:
>>>>>>>>>>> Thu, 14 Jan 2021 15:45:11 +0800
>>>>>>>>>>>>
>>>>>>>>>>>> FYI, we noticed the following commit (built with gcc-9):
>>>>>>>>>>>>
>>>>>>>>>>>> commit: d5bff968ea9cc005e632d9369c26cbd8148c93d5 ("workqueue: =
break affinity initiatively")
>>>>>>>>>>>> https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu=
.git dev.2021.01.11b
>>>>>>>>>>>>
>>>>>>>>>>> [...]
>>>>>>>>>>>>
>>>>>>>>>>>> [   73.794288] WARNING: CPU: 0 PID: 22 at kernel/workqueue.c:2=
192 process_one_work
>>>>>>>>>>>
>>>>>>>>>>> Thanks for your report.
>>>>>>>>>>>
>>>>>>>>>>> We can also break CPU affinity by checking POOL_DISASSOCIATED a=
t attach
>>>>>>>>>>> time without extra cost paid; that way we have the same behavio=
r as at
>>>>>>>>>>> the unbind time.
>>>>>>>>>>>
>>>>>>>>>>> What is more the change that makes kworker pcpu is cut because =
they are
>>>>>>>>>>> going to not help either hotplug or the mechanism of stop machi=
ne.
>>>>>>>>>>
>>>>>>>>>> hi, by applying below patch, the issue still happened.
>>>>>>>>>
>>>>>>>>> Thanks for your report.
>>>>>>>>>>
>>>>>>>>>> [ 4.574467] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
>>>>>>>>>> [ 4.575651] pci 0000:00:01.0: Activating ISA DMA hang workarounds
>>>>>>>>>> [ 4.576900] pci 0000:00:02.0: Video device with shadowed ROM at =
[mem 0x000c0000-0x000dffff]
>>>>>>>>>> [ 4.578648] PCI: CLS 0 bytes, default 64
>>>>>>>>>> [ 4.579685] Unpacking initramfs...
>>>>>>>>>> [ 8.878031] -----------[ cut here ]-----------
>>>>>>>>>> [ 8.879083] WARNING: CPU: 0 PID: 22 at kernel/workqueue.c:2187 p=
rocess_one_work+0x92/0x9e0
>>>>>>>>>> [ 8.880688] Modules linked in:
>>>>>>>>>> [ 8.881274] CPU: 0 PID: 22 Comm: kworker/1:0 Not tainted 5.11.0-=
rc3-gc213503139bb #2
>>>>>>>>>
>>>>>>>>> The kworker bond to CPU1 runs on CPU0 and triggers the warning, w=
hich
>>>>>>>>> shows that scheduler breaks CPU affinity, after 06249738a41a
>>>>>>>>> ("workqueue: Manually break affinity on hotplug"), though quite l=
ikely
>>>>>>>>> by kworker/1:0 for the initial workers.
>>>>>>>>>
>>>>>>>>>> [ 8.882518] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.12.0-1 04/01/2014
>>>>>>>>>> [ 8.887539] Workqueue: 0x0 (events)
>>>>>>>>>> [ 8.887838] EIP: process_one_work+0x92/0x9e0
>>>>>>>>>> [ 8.887838] Code: 37 64 a1 58 54 4c 43 39 45 24 74 2c 31 c9 ba 0=
1 00 00 00 c7 04 24 01 00 00 00 b8 08 1d f5 42 e8 74 85 13 00 ff 05 b8 30 0=
4 43 <0f> 0b ba 01 00 00 00 eb 22 8d 74 26 00 90 c7 04 24 01 00 00 00 31
>>>>>>>>>> [ 8.887838] EAX: 42f51d08 EBX: 00000000 ECX: 00000000 EDX: 00000=
001
>>>>>>>>>> [ 8.887838] ESI: 43c04720 EDI: 42e45620 EBP: de7f23c0 ESP: 43d7b=
f08
>>>>>>>>>> [ 8.887838] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS:=
 00010002
>>>>>>>>>> [ 8.887838] CR0: 80050033 CR2: 00000000 CR3: 034e3000 CR4: 00040=
6d0
>>>>>>>>>> [ 8.887838] Call Trace:
>>>>>>>>>> [ 8.887838] ? worker_thread+0x98/0x6a0
>>>>>>>>>> [ 8.887838] ? worker_thread+0x2dd/0x6a0
>>>>>>>>>> [ 8.887838] ? kthread+0x1ba/0x1e0
>>>>>>>>>> [ 8.887838] ? create_worker+0x1e0/0x1e0
>>>>>>>>>> [ 8.887838] ? kzalloc+0x20/0x20
>>>>>>>>>> [ 8.887838] ? ret_from_fork+0x1c/0x28
>>>>>>>>>> [ 8.887838] _warn_unseeded_randomness: 63 callbacks suppressed
>>>>>>>>>> [ 8.887838] random: get_random_bytes called from init_oops_id+0x=
2b/0x60 with crng_init=3D0
>>>>>>>>>> [ 8.887838] --[ end trace ac461b4d54c37cfa ]--
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Instead of creating the initial workers only on the active CPUS, =
rebind
>>>>>>>>> them (labeled pcpu) and jump to the right CPU at bootup time.
>>>>>>>>>
>>>>>>>>> --- a/kernel/workqueue.c
>>>>>>>>> +++ b/kernel/workqueue.c
>>>>>>>>> @@ -2385,6 +2385,16 @@ woke_up:
>>>>>>>>>       		return 0;
>>>>>>>>>       	}
>>>>>>>>>       =

>>>>>>>>> +	if (!(pool->flags & POOL_DISASSOCIATED) && smp_processor_id() !=
=3D
>>>>>>>>> +								pool->cpu) {
>>>>>>>>> +		/* scheduler breaks CPU affinity for us, rebind it */
>>>>>>>>> +		raw_spin_unlock_irq(&pool->lock);
>>>>>>>>> +		set_cpus_allowed_ptr(worker->task, pool->attrs->cpumask);
>>>>>>>>> +		/* and jump to the right seat */
>>>>>>>>> +		schedule_timeout_interruptible(1);
>>>>>>>>> +		goto woke_up;
>>>>>>>>> +	}
>>>>>>>>> +
>>>>>>>>>       	worker_leave_idle(worker);
>>>>>>>>>       recheck:
>>>>>>>>>       	/* no more worker necessary? */
>>>>>>>>> --
>>>>>>>>>
>>>>>>>> I test the patch, the warning still appears in the kernel log.
>>>>>>>
>>>>>>> Thanks for your report.
>>>>>>>>
>>>>>>>> [  230.356503] smpboot: CPU 1 is now offline
>>>>>>>> [  230.544652] x86: Booting SMP configuration:
>>>>>>>> [  230.545077] smpboot: Booting Node 0 Processor 1 APIC 0x1
>>>>>>>> [  230.545640] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
>>>>>>>> [  230.545675] masked ExtINT on CPU#1
>>>>>>>> [  230.593829] ------------[ cut here ]------------
>>>>>>>> [  230.594257] WARNING: CPU: 0 PID: 257 at kernel/workqueue.c:2192=
 process_one_work+0x92/0x9e0
>>>>>>>> [  230.594990] Modules linked in: rcutorture torture mousedev inpu=
t_leds
>>>>>>>> led_class pcspkr psmouse evbug tiny_power_button button
>>>>>>>> [  230.595961] CPU: 0 PID: 257 Comm: kworker/1:3 Not tainted 5.11.=
0-rc3-gdcba55d9080f #2
>>>>>>>
>>>>>>> Like what was reported, kworker bond to CPU1 runs on CPU0 and trigg=
ers
>>>>>>> warning, due to scheduler breaking CPU affinity for us. What is new=
, the
>>>>>>> affinity was broken at offline time instead of bootup.
>>>>>>>
>>>>>>>> [  230.596621] Hardware name: QEMU Standard PC (i440FX + PIIX, 199=
6), BIOS 1.12.0-1 04/01/2014
>>>>>>>> [  230.597322] Workqueue:  0x0 (rcu_gp)
>>>>>>>> [  230.597636] EIP: process_one_work+0x92/0x9e0
>>>>>>>> [  230.598005] Code: 37 64 a1 58 54 4c 43 39 45 24 74 2c 31 c9 ba =
01 00
>>>>>>>> 00 00 c7 04 24 01 00 00 00 b8 08 1d f5 42 e8 f4 85 13 00 ff 05 cc =
30 04
>>>>>>>> 43 <0f> 0b ba 01 00 00 00 eb 22 8d 74 26 00 90 c7 04 24 01 00 00 0=
0 31
>>>>>>>> [  230.599569] EAX: 42f51d08 EBX: 00000000 ECX: 00000000 EDX: 0000=
0001
>>>>>>>> [  230.600100] ESI: 43d94240 EDI: df4040f4 EBP: de7f23c0 ESP: bf5f=
1f08
>>>>>>>> [  230.600629] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS=
: 00010002
>>>>>>>> [  230.601203] CR0: 80050033 CR2: 01bdecbc CR3: 04e2c000 CR4: 0004=
06d0
>>>>>>>> [  230.601735] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 0000=
0000
>>>>>>>> [  230.602265] DR6: fffe0ff0 DR7: 00000400
>>>>>>>> [  230.602594] Call Trace:
>>>>>>>> [  230.602813]  ? process_one_work+0x20e/0x9e0
>>>>>>>> [  230.603181]  ? worker_thread+0x32d/0x700
>>>>>>>> [  230.603522]  ? kthread+0x1ba/0x1e0
>>>>>>>> [  230.603818]  ? create_worker+0x1e0/0x1e0
>>>>>>>> [  230.604157]  ? kzalloc+0x20/0x20
>>>>>>>> [  230.604524]  ? ret_from_fork+0x1c/0x28
>>>>>>>> [  230.604850] ---[ end trace 06b1e66b5e17fa85 ]---
>>>>>>>> [  230.605504] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
>>>>>>>> [  230.766960] smpboot: CPU 1 is now offline
>>>>>>>> [  230.814803] x86: Booting SMP configuration:
>>>>>>>> [  230.815306] smpboot: Booting Node 0 Processor 1 APIC 0x1
>>>>>>>> [  230.815964] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
>>>>>>>
>>>>>>>
>>>>>>> Unlike the above diff that is at most papering over the problem
>>>>>>> sitting somewhere in the scheduler, add change to creating worker
>>>>>>> by skipping set_cpus_allowed_ptr() because we will wake it up after
>>>>>>> attaching it to worker pool.
>>>>>>>
>>>>>>> If we can ignore rescuer for now, then the allowed ptr is only
>>>>>>> updated at on/offline time; lets see the difference at boot time.
>>>>>>>
>>>>>>>
>>>>>>> --- a/kernel/workqueue.c
>>>>>>> +++ b/kernel/workqueue.c
>>>>>>> @@ -1844,16 +1844,10 @@ static struct worker *alloc_worker(int n
>>>>>>>       * cpu-[un]hotplugs.
>>>>>>>       */
>>>>>>>      static void worker_attach_to_pool(struct worker *worker,
>>>>>>> -				   struct worker_pool *pool)
>>>>>>> +				   struct worker_pool *pool,
>>>>>>> +				   int update_cpus_allowed)
>>>>>>>      {
>>>>>>>      	mutex_lock(&wq_pool_attach_mutex);
>>>>>>> -
>>>>>>> -	/*
>>>>>>> -	 * set_cpus_allowed_ptr() will fail if the cpumask doesn't have a=
ny
>>>>>>> -	 * online CPUs.  It'll be re-applied when any of the CPUs come up.
>>>>>>> -	 */
>>>>>>> -	set_cpus_allowed_ptr(worker->task, pool->attrs->cpumask);
>>>>>>> -
>>>>>>>      	/*
>>>>>>>      	 * The wq_pool_attach_mutex ensures %POOL_DISASSOCIATED remai=
ns
>>>>>>>      	 * stable across this function.  See the comments above the f=
lag
>>>>>>> @@ -1867,6 +1861,9 @@ static void worker_attach_to_pool(struct
>>>>>>>      	list_add_tail(&worker->node, &pool->workers);
>>>>>>>      	worker->pool =3D pool;
>>>>>>>      =

>>>>>>> +	if (update_cpus_allowed)
>>>>>>> +		set_cpus_allowed_ptr(worker->task, pool->attrs->cpumask);
>>>>>>> +
>>>>>>>      	mutex_unlock(&wq_pool_attach_mutex);
>>>>>>>      }
>>>>>>>      =

>>>>>>> @@ -1942,8 +1939,11 @@ static struct worker *create_worker(stru
>>>>>>>      	set_user_nice(worker->task, pool->attrs->nice);
>>>>>>>      	kthread_bind_mask(worker->task, pool->attrs->cpumask);
>>>>>>>      =

>>>>>>> -	/* successful, attach the worker to the pool */
>>>>>>> -	worker_attach_to_pool(worker, pool);
>>>>>>> +	/*
>>>>>>> +	 * attach the worker to the pool without asking scheduler to
>>>>>>> +	 * update CPUs allowed
>>>>>>> +	 */
>>>>>>> +	worker_attach_to_pool(worker, pool, 0);
>>>>>>>      =

>>>>>>>      	/* start the newly created worker */
>>>>>>>      	raw_spin_lock_irq(&pool->lock);
>>>>>>> @@ -2508,7 +2508,7 @@ repeat:
>>>>>>>      =

>>>>>>>      		raw_spin_unlock_irq(&wq_mayday_lock);
>>>>>>>      =

>>>>>>> -		worker_attach_to_pool(rescuer, pool);
>>>>>>> +		worker_attach_to_pool(rescuer, pool, 1);
>>>>>>>      =

>>>>>>>      		raw_spin_lock_irq(&pool->lock);
>>>>>>>      =

>>>>>>> --
>>>>>>>
>>>>>> I test the patch, the warning still appears in the kernel log.
>>>>>
>>>>> Thanks.
>>>>>>
>>>>>> [   55.754187] smpboot: Booting Node 0 Processor 1 APIC 0x1
>>>>>> [   55.785594] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
>>>>>> [   55.785646] masked ExtINT on CPU#1
>>>>>> [   55.920602] ------------[ cut here ]------------
>>>>>> [   55.921355] WARNING: CPU: 0 PID: 160 at kernel/workqueue.c:2192 p=
rocess_one_work+0x92/0x9e0
>>>>>> [   55.922583] Modules linked in: rcutorture torture mousedev evbug
>>>>>> input_leds led_class tiny_power_button psmouse pcspkr button
>>>>>> [   55.924294] CPU: 0 PID: 160 Comm: kworker/1:2 Not tainted 5.11.0-=
rc3-00186-g77bf4e461cfa #2
>>>>>
>>>>> Same issue as before.
>>>>>
>>>>>> [   55.925552] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)=
, BIOS 1.12.0-1 04/01/2014
>>>>>> [   55.926763] Workqueue:  0x0 (rcu_gp)
>>>>>> [   55.927298] EIP: process_one_work+0x92/0x9e0
>>>>>> [   55.927950] Code: 37 64 a1 58 54 4c 43 39 45 24 74 2c 31 c9 ba 01=
 00
>>>>>> 00 00 c7 04 24 01 00 00 00 b8 08 1d f5 42 e8 94 85 13 00 ff 05 b8 30=
 04
>>>>>> 43 <0f> 0b ba 01 00 00 00 eb 22 8d 74 26 00 90 c7 04 24 01 00 00 00 =
31
>>>>>> [   55.930726] EAX: 42f51d08 EBX: 00000000 ECX: 00000000 EDX: 000000=
01
>>>>>> [   55.931642] ESI: 43d90540 EDI: df48c0f4 EBP: de7f23c0 ESP: bfb47f=
08
>>>>>> [   55.932590] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: =
00010002
>>>>>> [   55.933609] CR0: 80050033 CR2: 024e994c CR3: 7fd80000 CR4: 000406=
d0
>>>>>> [   55.934555] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000000=
00
>>>>>> [   55.935457] DR6: fffe0ff0 DR7: 00000400
>>>>>> [   55.936041] Call Trace:
>>>>>> [   55.936534]  ? process_one_work+0x20e/0x9e0
>>>>>> [   55.937305]  ? worker_thread+0x2dd/0x6a0
>>>>>> [   55.938018]  ? kthread+0x1ba/0x1e0
>>>>>> [   55.938598]  ? create_worker+0x1e0/0x1e0
>>>>>> [   55.939315]  ? kzalloc+0x20/0x20
>>>>>> [   55.940000]  ? ret_from_fork+0x1c/0x28
>>>>>> [   55.940627] ---[ end trace d155e9e6402de179 ]---
>>>>>> [   55.941641] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
>>>>>> [   56.155271] smpboot: CPU 1 is now offline
>>>>>> [   56.193613] x86: Booting SMP configuration:
>>>>>> [   56.194400] smpboot: Booting Node 0 Processor 1 APIC 0x1
>>>>>
>>>>> The changes in the diff below are
>>>>>
>>>>> 1/ at rescue time, change CPU affinity only if POOL_DISASSOCIATED
>>>>> is not set, and print warning the same way as offline time.
>>>>>
>>>>> 2/ at offine time, dont update allowed CPUs after setting
>>>>> POOL_DISASSOCIATED because we no longer have interest in affinity.
>>>>>
>>>>> 3/ at online time, mark pcpu before binding affinity.
>>>>>
>>>>> Though one change a diff is appreciated, by the WARNs, we can tell
>>>>> which is what if any warning goes into dmesg.
>>>>>
>>>>> --- a/kernel/workqueue.c
>>>>> +++ b/kernel/workqueue.c
>>>>> @@ -1844,25 +1844,23 @@ static struct worker *alloc_worker(int n
>>>>>      * cpu-[un]hotplugs.
>>>>>      */
>>>>>     static void worker_attach_to_pool(struct worker *worker,
>>>>> -				   struct worker_pool *pool)
>>>>> +				   struct worker_pool *pool, int set)
>>>>>     {
>>>>>     	mutex_lock(&wq_pool_attach_mutex);
>>>>>     =

>>>>>     	/*
>>>>> -	 * set_cpus_allowed_ptr() will fail if the cpumask doesn't have any
>>>>> -	 * online CPUs.  It'll be re-applied when any of the CPUs come up.
>>>>> -	 */
>>>>> -	set_cpus_allowed_ptr(worker->task, pool->attrs->cpumask);
>>>>> -
>>>>> -	/*
>>>>>     	 * The wq_pool_attach_mutex ensures %POOL_DISASSOCIATED remains
>>>>>     	 * stable across this function.  See the comments above the flag
>>>>>     	 * definition for details.
>>>>>     	 */
>>>>>     	if (pool->flags & POOL_DISASSOCIATED)
>>>>>     		worker->flags |=3D WORKER_UNBOUND;
>>>>> -	else
>>>>> +	else {
>>>>>     		kthread_set_per_cpu(worker->task, true);
>>>>> +		if (set)
>>>>> +			WARN_ON_ONCE(set_cpus_allowed_ptr(worker->task,
>>>>> +						pool->attrs->cpumask) < 0);
>>>>> +	}
>>>>>     =

>>>>>     	list_add_tail(&worker->node, &pool->workers);
>>>>>     	worker->pool =3D pool;
>>>>> @@ -1943,7 +1941,7 @@ static struct worker *create_worker(stru
>>>>>     	kthread_bind_mask(worker->task, pool->attrs->cpumask);
>>>>>     =

>>>>>     	/* successful, attach the worker to the pool */
>>>>> -	worker_attach_to_pool(worker, pool);
>>>>> +	worker_attach_to_pool(worker, pool, 0);
>>>>>     =

>>>>>     	/* start the newly created worker */
>>>>>     	raw_spin_lock_irq(&pool->lock);
>>>>> @@ -2508,7 +2506,7 @@ repeat:
>>>>>     =

>>>>>     		raw_spin_unlock_irq(&wq_mayday_lock);
>>>>>     =

>>>>> -		worker_attach_to_pool(rescuer, pool);
>>>>> +		worker_attach_to_pool(rescuer, pool, 1);
>>>>>     =

>>>>>     		raw_spin_lock_irq(&pool->lock);
>>>>>     =

>>>>> @@ -4923,7 +4921,6 @@ static void unbind_workers(int cpu)
>>>>>     =

>>>>>     		for_each_pool_worker(worker, pool) {
>>>>>     			kthread_set_per_cpu(worker->task, false);
>>>>> -			WARN_ON_ONCE(set_cpus_allowed_ptr(worker->task, cpu_possible_mask=
) < 0);
>>>>>     		}
>>>>>     =

>>>>>     		mutex_unlock(&wq_pool_attach_mutex);
>>>>> @@ -4977,9 +4974,9 @@ static void rebind_workers(struct worker
>>>>>     	 * from CPU_ONLINE, the following shouldn't fail.
>>>>>     	 */
>>>>>     	for_each_pool_worker(worker, pool) {
>>>>> +		kthread_set_per_cpu(worker->task, true);
>>>>>     		WARN_ON_ONCE(set_cpus_allowed_ptr(worker->task,
>>>>>     						  pool->attrs->cpumask) < 0);
>>>>> -		kthread_set_per_cpu(worker->task, true);
>>>>>     	}
>>>>>     =

>>>>>     	raw_spin_lock_irq(&pool->lock);
>>>>> --
>>>>>
>>>> I test the patch, the warning still appears in the kernel log, but the
>>>
>>> Thanks.
>>>
>>>> warning is different from before.
>>>>
>>>> [    0.054803] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
>>>> [    0.054803] masked ExtINT on CPU#1
>>>> [    0.054803] smpboot: CPU 1 Converting physical 0 to logical die 1
>>>> [    1.890338] ------------[ cut here ]------------
>>>> [    1.890338] WARNING: CPU: 1 PID: 18 at kernel/kthread.c:508 kthread=
_set_per_cpu+0x156/0x180
>>>> [    1.890338] Modules linked in:
>>>> [    1.890338] CPU: 1 PID: 18 Comm: cpuhp/1 Not tainted 5.11.0-rc3-001=
86-ged03082352b2 #2
>>>
>>> This warning is better than the one in process_one_work() which is too
>>> late, though, it has something to say.
>>>
>>>> [    1.890338] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS 1.12.0-1 04/01/2014
>>>> [    1.890338] EIP: kthread_set_per_cpu+0x156/0x180
>>>> [    1.890338] Code: 00 00 00 00 ff 05 68 4e 04 43 83 c4 08 5b 5e 5f c3
>>>> 8d 76 00 ff 05 34 50 04 43 0f 0b e9 f9 fe ff ff 8d 76 00 ff 05 2c 4e 04
>>>> 43 <0f> 0b eb 9d 8d b6 00 00 00 00 ff 05 40 4e 04 43 0f 0b e9 45 ff ff
>>>> [    1.890338] EAX: 42f52ce0 EBX: 00000001 ECX: 00000000 EDX: 00000001
>>>> [    1.890338] ESI: 43d76300 EDI: 43c0de00 EBP: de7f2564 ESP: 43d6beb8
>>>> [    1.900350] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00=
010202
>>>> [    1.901303] CR0: 80050033 CR2: 00000000 CR3: 034e3000 CR4: 000406d0
>>>> [    1.902280] Call Trace:
>>>> [    1.902682]  ? workqueue_online_cpu+0x12b/0x640
>>>> [    1.903415]  ? workqueue_prepare_cpu+0xa0/0xa0
>>>
>>> By the prepare function we know it is a warning at boot time.
>>>
>>>> [    1.904155]  ? cpuhp_invoke_callback+0x1ed/0x1340
>>>> [    1.904941]  ? cpuhp_thread_fun+0x28f/0x460
>>>> [    1.905630]  ? cpuhp_thread_fun+0x49/0x460
>>>> [    1.906298]  ? smpboot_thread_fn+0x446/0x620
>>>> [    1.910275]  ? kthread+0x1ba/0x1e0
>>>> [    1.910857]  ? __smpboot_create_thread+0x260/0x260
>>>> [    1.911659]  ? kzalloc+0x20/0x20
>>>> [    1.912368]  ? ret_from_fork+0x1c/0x28
>>>> [    1.913016] ---[ end trace 6f6c005278241eba ]---
>>>> [    1.913971] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
>>>> [    1.920012] smp: Brought up 1 node, 2 CPUs
>>>> [    1.920299] smpboot: Max logical packages: 2
>>>> [    1.921019] smpboot: Total of 2 processors activated (10774.03 Bogo=
MIPS)
>>>
>>> After staring at it again, the change added in rebind_workers() is
>>> incorrect for a CPU getting back online after bootup, because the
>>> CPU affinity has been broken at offline time.
>>>
>>> But the warning in the latest report occurs at boot time, after going
>>> through steps like,
>>>
>>> 	kthread_create_on_node();
>>>
>>> 	kthread_bind_mask(worker->task, pool->attrs->cpumask);
>>>
>>> 	/* successful, attach the worker to the pool */
>>> 	worker_attach_to_pool(worker, pool, 0);
>>>
>>> 	/* start the newly created worker */
>>> 	wake_up_process(worker->task);
>>>
>>>
>>> without triggering the warning at kernel/kthread.c:507.
>>>
>>> Before finding an answer (wake_up_new_task()) to the question,
>>> who changed the allowed ptr?  revert the change at online time,
>>> and as a compensation, clear POOL_DISASSOCIATED as early as we can.
>>>
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
>>> @@ -5954,6 +5951,7 @@ void __init workqueue_init_early(void)
>>>    		i =3D 0;
>>>    		for_each_cpu_worker_pool(pool, cpu) {
>>>    			BUG_ON(init_worker_pool(pool));
>>> +			pool->flags &=3D ~POOL_DISASSOCIATED;
>>>    			pool->cpu =3D cpu;
>>>    			cpumask_copy(pool->attrs->cpumask, cpumask_of(cpu));
>>>    			pool->attrs->nice =3D std_nice[i++];
>>> --
>>>
>> I test the patch, the warning still appears in the kernel log.
> =

> Thanks.
>>
>> [    0.043584] masked ExtINT on CPU#1
>> [    0.043584] smpboot: CPU 1 Converting physical 0 to logical die 1
>> [    1.681867] ------------[ cut here ]------------
>> [    1.681867] WARNING: CPU: 1 PID: 18 at kernel/workqueue.c:5015 workqu=
eue_online_cpu+0x336/0x640
> =

> This is a new one at boot time.
> =

>> [    1.681867] Modules linked in:
>> [    1.681867] CPU: 1 PID: 18 Comm: cpuhp/1 Not tainted 5.11.0-rc3-00186=
-g178826956ca7 #2
>> [    1.681867] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.12.0-1 04/01/2014
>> [    1.681867] EIP: workqueue_online_cpu+0x336/0x640
>> [    1.681867] Code: 01 00 00 00 eb 89 8d b6 00 00 00 00 8b 5c 24 0c 89
>> d8 e8 3d 39 19 01 e9 1c fd ff ff 8d b4 26 00 00 00 00 90 ff 05 dc 20 04
>> 43 <0f> 0b e9 07 ff ff ff 8d 76 00 ff 05 2c 21 04 43 0f 0b e9 12 fe ff
>> [    1.681867] EAX: 42f51168 EBX: 0000000c ECX: 00000000 EDX: 00000001
>> [    1.681867] ESI: 00000000 EDI: 43c04720 EBP: de7f2564 ESP: 43d6bed0
>> [    1.681867] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 0001=
0002
>> [    1.681867] CR0: 80050033 CR2: 00000000 CR3: 034e3000 CR4: 000406d0
>> [    1.681867] Call Trace:
>> [    1.681867]  ? workqueue_prepare_cpu+0xa0/0xa0
>> [    1.681867]  ? cpuhp_invoke_callback+0x1ed/0x1340
>> [    1.681867]  ? cpuhp_thread_fun+0x28f/0x460
>> [    1.681867]  ? cpuhp_thread_fun+0x49/0x460
>> [    1.681867]  ? smpboot_thread_fn+0x446/0x620
>> [    1.681867]  ? kthread+0x1ba/0x1e0
>> [    1.681867]  ? __smpboot_create_thread+0x260/0x260
>> [    1.681867]  ? kzalloc+0x20/0x20
>> [    1.681867]  ? ret_from_fork+0x1c/0x28
>> [    1.681867] ---[ end trace 3e853d8ad82e44ac ]---
>> [    1.691939] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
>> [    1.705909] smp: Brought up 1 node, 2 CPUs
>> [    1.706605] smpboot: Max logical packages: 2
>>
>> [   85.402803] smpboot: Booting Node 0 Processor 1 APIC 0x1
>> [   85.442465] kvm-clock: cpu 1, msr 34f6021, secondary cpu clock
>> [   85.442602] masked ExtINT on CPU#1
>> [   85.541391] ------------[ cut here ]------------
>> [   85.542250] WARNING: CPU: 1 PID: 18 at kernel/kthread.c:508 kthread_s=
et_per_cpu+0x156/0x180
> =

> This is a known one.
> =

>> [   85.543664] Modules linked in: rcutorture torture mousedev evbug
>> input_leds led_class psmouse pcspkr tiny_power_button button
>> [   85.545530] CPU: 1 PID: 18 Comm: cpuhp/1 Tainted: G        W
>> 5.11.0-rc3-00186-g178826956ca7 #2
>> [   85.547006] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>> BIOS 1.12.0-1 04/01/2014
>> [   85.548454] EIP: kthread_set_per_cpu+0x156/0x180
>> [   85.549231] Code: 00 00 00 00 ff 05 68 4e 04 43 83 c4 08 5b 5e 5f c3
>> 8d 76 00 ff 05 34 50 04 43 0f 0b e9 f9 fe ff ff 8d 76 00 ff 05 2c 4e 04
>> 43 <0f> 0b eb 9d 8d b6 00 00 00 00 ff 05 40 4e 04 43 0f 0b e9 45 ff ff
>> [   85.552236] EAX: 42f52ce0 EBX: 00000001 ECX: 00000000 EDX: 00000001
>> [   85.556663] ESI: bfb70000 EDI: 45e61000 EBP: de7f2564 ESP: 43d6beb8
>> [   85.559168] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 0001=
0202
>> [   85.561991] CR0: 80050033 CR2: 00000000 CR3: 034e3000 CR4: 000406d0
>> [   85.563040] Call Trace:
>> [   85.563463]  ? workqueue_online_cpu+0x17f/0x640
>> [   85.564222]  ? rapl_cpu_online+0xb7/0x1a0
>> [   85.564904]  ? workqueue_prepare_cpu+0xa0/0xa0
>> [   85.565643]  ? cpuhp_invoke_callback+0x1ed/0x1340
>> [   85.566424]  ? cpuhp_thread_fun+0x28f/0x460
>> [   85.567140]  ? cpuhp_thread_fun+0x49/0x460
>> [   85.567844]  ? smpboot_thread_fn+0x446/0x620
>> [   85.568569]  ? kthread+0x1ba/0x1e0
>> [   85.569162]  ? __smpboot_create_thread+0x260/0x260
>> [   85.569961]  ? kzalloc+0x20/0x20
>> [   85.570918]  ? ret_from_fork+0x1c/0x28
>> [   85.575418] ---[ end trace 3e853d8ad82e44ae ]---
>> [   85.577919] kvm-guest: stealtime: cpu 1, msr 9e7e6ec0
>> [   85.580973] ------------[ cut here ]------------
>> [   85.581747] WARNING: CPU: 0 PID: 87 at kernel/workqueue.c:2190 proces=
s_one_work+0x92/0x9e0
>> [   85.583058] Modules linked in: rcutorture torture mousedev evbug
>> input_leds led_class psmouse pcspkr tiny_power_button button
>> [   85.584850] CPU: 0 PID: 87 Comm: kworker/1:2 Tainted: G        W 5.11=
.0-rc3-00186-g178826956ca7 #2
> =

> This is a big regression.
> =

>> [   85.586456] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>> BIOS 1.12.0-1 04/01/2014
>> [   85.587753] Workqueue:  0x0 (rcu_gp)
>> [   85.588347] EIP: process_one_work+0x92/0x9e0
>> [   85.589018] Code: 37 64 a1 58 54 4c 43 39 45 24 74 2c 31 c9 ba 01 00
>> 00 00 c7 04 24 01 00 00 00 b8 d8 1c f5 42 e8 14 85 13 00 ff 05 a4 30 04
>> 43 <0f> 0b ba 01 00 00 00 eb 22 8d 74 26 00 90 c7 04 24 01 00 00 00 31
>> [   85.595358] EAX: 42f51cd8 EBX: df4080f8 ECX: 00000000 EDX: 00000001
>> [   85.596319] ESI: 43d94840 EDI: df4080f4 EBP: de7f23c0 ESP: 45505f08
>> [   85.597291] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 0001=
0002
>> [   85.598410] CR0: 80050033 CR2: 372c2004 CR3: 7fa9f000 CR4: 000406d0
>> [   85.599401] Call Trace:
>> [   85.599804]  ? process_one_work+0x20e/0x9e0
>> [   85.600474]  ? worker_thread+0x40d/0x6a0
>> [   85.601096]  ? kthread+0x1ba/0x1e0
>> [   85.601635]  ? create_worker+0x1e0/0x1e0
>> [   85.602246]  ? kzalloc+0x20/0x20
>> [   85.602907]  ? ret_from_fork+0x1c/0x28
>> [   85.603512] ---[ end trace 3e853d8ad82e44af ]---
>> [   85.699976] smpboot: CPU 1 is now offline
>> [   85.771891] x86: Booting SMP configuration:
>> [   85.772532] smpboot: Booting Node 0 Processor 1 APIC 0x1
> =

> 1/ to fix the regression, roll back to the version without warning in
> process_one_work().
> =

> 2/ to see if that version is utterly anything of a blind cat heading
> on a blind rat, quiesce the 508 warning for kworkers now.
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
> @@ -4977,9 +4974,9 @@ static void rebind_workers(struct worker
>   	 * from CPU_ONLINE, the following shouldn't fail.
>   	 */
>   	for_each_pool_worker(worker, pool) {
> +		kthread_set_per_cpu(worker->task, true);
>   		WARN_ON_ONCE(set_cpus_allowed_ptr(worker->task,
>   						  pool->attrs->cpumask) < 0);
> -		kthread_set_per_cpu(worker->task, true);
>   	}
>   =

>   	raw_spin_lock_irq(&pool->lock);
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -505,7 +505,7 @@ void kthread_set_per_cpu(struct task_str
>   =

>   	if (set) {
>   		WARN_ON_ONCE(!(k->flags & PF_NO_SETAFFINITY));
> -		WARN_ON_ONCE(k->nr_cpus_allowed !=3D 1);
> +		WARN_ON_ONCE(k->nr_cpus_allowed !=3D 1 && !(k->flags & PF_WQ_WORKER));
>   		set_bit(KTHREAD_IS_PER_CPU, &kthread->flags);
>   	} else {
>   		clear_bit(KTHREAD_IS_PER_CPU, &kthread->flags);
> --
> =


I test the patch 4 times, no warning appears in the kernel log.

-- =

Zhengjun Xing

--===============7438169221290958840==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
--===============7438169221290958840==--

