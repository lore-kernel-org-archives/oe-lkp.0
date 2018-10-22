Content-Type: multipart/mixed; boundary="===============2108496360015587999=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 8cb682da6b ("rcu: Affinity forward-progress test to avoid .."): BUG: unable to handle kernel NULL pointer dereference at 00000000
Date: Mon, 22 Oct 2018 17:10:38 +0800
Message-ID: <9552e760-a2f4-c933-cc98-5d0003056fdc@intel.com>
In-Reply-To: <20181018140156.GA2674@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2108496360015587999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/18/2018 10:01 PM, Paul E. McKenney wrote:
> On Thu, Oct 18, 2018 at 05:31:16PM +0800, kernel test robot wrote:
>> On Tue, Oct 16, 2018 at 05:35:31AM -0700, Paul E. McKenney wrote:
>>> On Tue, Oct 16, 2018 at 08:36:57AM +0800, kernel test robot wrote:
>>>> Greetings,
>>>>
>>>> 0day kernel testing robot got the below dmesg and the first bad commit=
 is
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git =
dev.2018.10.09a
>>>>
>>>> commit 8cb682da6b49f65c3acf4255d045430cec116c52
>>>> Author:     Paul E. McKenney <paulmck@linux.ibm.com>
>>>> AuthorDate: Fri Sep 21 18:08:09 2018 -0700
>>>> Commit:     Paul E. McKenney <paulmck@linux.ibm.com>
>>>> CommitDate: Wed Oct 3 17:36:12 2018 -0700
>>>>
>>>>      rcu: Affinity forward-progress test to avoid housekeeping CPUs
>>>>      =

>>>>      This commit affinities the forward-progress tests to avoid hoggin=
g a
>>>>      housekeeping CPU on the theory that the offloaded callbacks will =
be
>>>>      running on those housekeeping CPUs.
>>>>      =

>>>>      Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
>>>>
>>>> 61fe6c84c4  MAINTAINERS: Update from @linux.vnet.ibm.com to @linux.ibm=
.com
>>>> 8cb682da6b  rcu: Affinity forward-progress test to avoid housekeeping =
CPUs
>>>> +------------------------------------------+------------+------------+
>>>> |                                          | 61fe6c84c4 | 8cb682da6b |
>>>> +------------------------------------------+------------+------------+
>>>> | boot_successes                           | 37         | 0          |
>>>> | boot_failures                            | 0          | 13         |
>>>> | BUG:unable_to_handle_kernel              | 0          | 13         |
>>>> | Oops:#[##]                               | 0          | 13         |
>>>> | EIP:__bitmap_weight                      | 0          | 13         |
>>>> | Kernel_panic-not_syncing:Fatal_exception | 0          | 13         |
>>>> +------------------------------------------+------------+------------+
>>>>
>>>> [    1.414107] rcu-torture: torture_stutter task started
>>>> [    1.415593] Kprobe smoke test: started
>>>> [    1.487589] Kprobe smoke test: passed successfully
>>>> [    1.488532] Key type blacklist registered
>>>> [    1.492230] rcu-torture: rcu_torture_fwd_progress task started
>>>> [    1.493190] BUG: unable to handle kernel NULL pointer dereference a=
t 00000000
>>>> [    1.494373] *pde =3D 00000000
>>>> [    1.494857] Oops: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
>>>> [    1.495277] CPU: 0 PID: 47 Comm: rcu_torture_fwd Tainted: G        =
        T 4.19.0-rc1-00167-g8cb682d #2
>>>> [    1.495277] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS 1.10.2-1 04/01/2014
>>>> [    1.495277] EIP: __bitmap_weight+0x44/0x61
>>>> [    1.495277] Code: 90 01 c3 83 c1 01 39 f1 75 ef f6 c2 1f 0f 95 c0 0=
f b6 c8 83 04 8d 7c 57 13 48 01 84 c0 74 15 f7 da 89 d1 b8 ff ff ff ff d3 e=
8 <23> 04 b7 f3 0f b8 c0 90 01 c3 89 d8 5b 5e 5f 5d c3 85 d2 0f 95 c0
>>>> [    1.495277] EAX: 00000001 EBX: 00000000 ECX: ffffffff EDX: ffffffff
>>>> [    1.495277] ESI: 00000000 EDI: 00000000 EBP: 4df25ef0 ESP: 4df25ee4
>>>> [    1.495277] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00=
210a03
>>>> [    1.495277] CR0: 80050033 CR2: 00000000 CR3: 0853e000 CR4: 000406d0
>>>> [    1.495277] Call Trace:
>>>> [    1.495277]  ? rcu_busted_torture_deferred_free+0xf/0xf
>>> If you are using the "busted" torture type, you should expect failures.
>>> But I must confess that I would not have expected this one.
>>>
>>>> [    1.495277]  ? rcu_bind_current_to_nocb+0x1d/0xaa
>>>> [    1.495277]  ? rcu_busted_torture_deferred_free+0xf/0xf
>>>> [    1.495277]  ? rcu_torture_fwd_prog+0x3a/0x7d5
>>> Ouch.  It looks like I should disable forward-progress testing when
>>> someone is using the "busted" torture type.
>>>
>>> First, how about the patch below?
>> the patch still has the same error.
> Just to make sure that I understand your setup, you are using
> rcutorture.torture_type=3Dbusted in this test, right?
It's a boot test and we didn't add rcutorture.torture_type=3Dbusted.

Kernel command line: root=3D/dev/ram0 hung_task_panic=3D1 debug apic=3Ddebu=
g =

sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 =

printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic =

oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 =

systemd.log_level=3Derr ignore_loglevel console=3Dtty0 =

earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw =

link=3D/cephfs/kbuild/run-queue/kvm/i386-randconfig-b0-10141817/linux-devel=
:fixup-8cb682da6b49f65c3acf4255d045430cec116c52:1e8e4d7740d4c9bc2c88a2e5beb=
27b5ef5215f43/.vmlinuz-1e8e4d7740d4c9bc2c88a2e5beb27b5ef5215f43-20181019144=
822-106:openwrt-lkp-hsw01-103 =

branch=3Dlinux-devel/fixup-8cb682da6b49f65c3acf4255d045430cec116c52 =

BOOT_IMAGE=3D/pkg/linux/i386-randconfig-b0-10141817/gcc-4.9/1e8e4d7740d4c9b=
c2c88a2e5beb27b5ef5215f43/vmlinuz-4.19.0-rc1-00168-g1e8e4d7 =

drbd.minor_count=3D8 rcuperf.shutdown=3D0

>
>>> Second, I really do need destructive tests whose whole purpose is to
>>> demonstrate that rcutorture can force failures to happen.  So how should
>>> I communicate to you guys which Kconfig options and boot parameters
>>> are expected to result in failures?  An RCU_DESTRUCTIVE_TEST Kconfig or
>>> some such?
>> an kconfig is fine, or we could ignore the errors if they are changeless,
>> we will only check the result(SUCCESS/FAIL) if the test is destructive.
> Ah, and I got distracted by the "busted" and what that would mean to the
> forward-progress test.  The actual bug happens earlier and much more
> simply in kernels that have large var_cpumask_t structures and that have
> RCU callback offloading.
>
> So how does the patch below (with or without the preceding one) work
> for you?
>
> 							Thanx, Paul
The patch works.

Best Regards,
Rong Chen

>
> -------------------------------------------------------------------------
>
> diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
> index 117aeb582fdc..1d74bf8b47f3 100644
> --- a/kernel/rcu/tree_plugin.h
> +++ b/kernel/rcu/tree_plugin.h
> @@ -2595,7 +2595,7 @@ static bool init_nocb_callback_list(struct rcu_data=
 *rdp)
>    */
>   void rcu_bind_current_to_nocb(void)
>   {
> -	if (cpumask_weight(rcu_nocb_mask))
> +	if (cpumask_available(rcu_nocb_mask) && cpumask_weight(rcu_nocb_mask))
>   		WARN_ON(sched_setaffinity(current->pid, rcu_nocb_mask));
>   }
>   EXPORT_SYMBOL_GPL(rcu_bind_current_to_nocb);
>


--===============2108496360015587999==--

