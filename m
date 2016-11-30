Content-Type: multipart/mixed; boundary="===============7958102157600643859=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] e7c1db75fe: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Wed, 30 Nov 2016 14:27:14 +0800
Message-ID: <20161130062714.fft6bw2m42pmh3my@wfg-t540p.sh.intel.com>
In-Reply-To: <20161129213950.GD16489@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7958102157600643859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Attached is the new dmesg.

On Wed, Nov 30, 2016 at 05:39:50AM +0800, Ye Xiaolong wrote:
>On 11/29, Paul E. McKenney wrote:
>>On Tue, Nov 29, 2016 at 05:21:19PM +0000, Sudeep Holla wrote:
>>> On Sun, Nov 27, 2016 at 6:16 PM, kernel test robot
>>> <xiaolong.ye@intel.com> wrote:
>>> >
>>> > FYI, we noticed the following commit:
>>> >
>>> > commit e7c1db75fed821a961ce1ca2b602b08e75de0cd8 ("mm: Prevent __alloc=
_pages_nodemask() RCU CPU stall warnings")
>>> > https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git=
 rcu/next
>>> >
>>> > in testcase: boot
>>> >
>>> > on test machine: qemu-system-x86_64 -enable-kvm -cpu Nehalem -smp 2 -=
m 1G
>>> >
>>> > caused below changes:
>>> >
>>> [...]
>>>
>>> > [    8.953192] BUG: sleeping function called from invalid context at =
mm/page_alloc.c:3746
>>> > [    8.956353] in_atomic(): 1, irqs_disabled(): 1, pid: 0, name: swap=
per/0
>>>
>>> I am observing similar BUG/backtrace even on ARM64 platform.
>>
>>Does the (untested) patch below help?
>>
>>							Thanx, Paul
>
>Hi, Paul
>
>I applied your patch on top of 2d66ccc "mm:
>Prevent__alloc_pages_nodemask() RCU CPU stall warnings"(e7c1db7 turns to
>2d66ccc in rcu/next branch now), here is the comparison of 6 times
>testing, seems the BUG persists.
>
>b70fa84d2eeef5f6be25633a2b is the commit id of commit "rcu: Allow
>boot-time useof cond_resched_rcu_qs()"
>
>testcase/path_params/tbox_group/run: boot/1/vm-vp-1G
>
>2d66cccd73436ac9  b70fa84d2eeef5f6be25633a2b
>----------------  --------------------------
>          6:6            0%           6:6     dmesg.BUG:sleeping_function_=
called_from_invalid_context_at_mm/page_alloc.c

The new dmesg looks like this:

[    6.505611] Write protecting the kernel read-only data: 14336k
[    6.507798] Freeing unused kernel memory: 544K (ffff880001978000 - ffff8=
80001a00000)
[    6.515634] Freeing unused kernel memory: 240K (ffff880001dc4000 - ffff8=
80001e00000)
[    6.524713] BUG: sleeping function called from invalid context at mm/pag=
e_alloc.c:3746
[    6.527327] in_atomic(): 0, irqs_disabled(): 1, pid: 1, name: init
[    6.528891] CPU: 1 PID: 1 Comm: init Not tainted 4.9.0-rc1-00048-gb70fa8=
4 #1
[    6.530604] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Debian-1.8.2-1 04/01/2014
[    6.533255]  ffffc90000197b48 ffffffff81472609 ffff8800296a0000 00000000=
02201200
[    6.538069]  ffffc90000197b60 ffffffff810a85a3 ffff8800364bc080 ffffc900=
00197bf0
[    6.542821]  ffffffff81190dce ffff8800296a0000 ffff8800296a0000 ffff8800=
296a0000
[    6.548618] Call Trace:
[    6.550675]  [<ffffffff81472609>] dump_stack+0x63/0x8a
[    6.554180]  [<ffffffff810a85a3>] ___might_sleep+0xd3/0x120
[    6.556720]  [<ffffffff81190dce>] __alloc_pages_nodemask+0x23e/0x300
[    6.560427]  [<ffffffff811e53d5>] alloc_pages_current+0x95/0x140
[    6.564063]  [<ffffffff811efe10>] new_slab+0x3c0/0x5a0
[    6.566516]  [<ffffffff811f11b0>] ___slab_alloc+0x3a0/0x4b0
[    6.570114]  [<ffffffff811ce073>] ? anon_vma_clone+0x63/0x1c0
[    6.572672]  [<ffffffff811bf802>] ? alloc_set_pte+0x4f2/0x610
[    6.576273]  [<ffffffff811ce073>] ? anon_vma_clone+0x63/0x1c0
[    6.578824]  [<ffffffff811f12e0>] __slab_alloc+0x20/0x40
[    6.582348]  [<ffffffff811f26ef>] kmem_cache_alloc+0x17f/0x1c0
[    6.585971]  [<ffffffff811ce073>] anon_vma_clone+0x63/0x1c0
[    6.588487]  [<ffffffff811c661c>] ? __split_vma+0x5c/0x1e0
[    6.592159]  [<ffffffff811c6684>] __split_vma+0xc4/0x1e0
[    6.594746]  [<ffffffff811c71d4>] split_vma+0x24/0x30
[    6.598248]  [<ffffffff811ca35c>] mprotect_fixup+0x21c/0x270
[    6.601130]  [<ffffffff811ca5bc>] do_mprotect_pkey+0x20c/0x300
[    6.602739]  [<ffffffff811ca6c3>] SyS_mprotect+0x13/0x20
[    6.604328]  [<ffffffff8196eb77>] entry_SYSCALL_64_fastpath+0x1a/0xa9
SELinux:  Could not open policy file <=3D /etc/selinux/targeted/policy/poli=
cy.30:  No such file or directory
[    6.609407] systemd[1]: RTC configured in localtime, applying delta of 4=
80 minutes to system time.
[    6.637736] random: fast init done
[    6.693275] ip_tables: (C) 2000-2006 Netfilter Core Team
...
[    7.553423] NFS: Registering the id_resolver key type
[    7.555204] Key type id_resolver registered
[    7.557629] Key type id_legacy registered
[    7.570901] scsi 1:0:0:0: Attached scsi generic sg0 type 5
[    7.572947] BUG: sleeping function called from invalid context@mm/pag=
e_alloc.c:3746
[    7.575717] in_atomic(): 1, irqs_disabled(): 0, pid: 251, name: modprobe
[    7.577496] CPU: 1 PID: 251 Comm: modprobe Tainted: G        W       4.9=
.0-rc1-00048-gb70fa84 #1
[    7.585286] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Debian-1.8.2-1 04/01/2014
[    7.593093]  ffffc900005e3b78 ffffffff81472609 ffff88003f33c900 00000000=
02000200
[    7.597043]  ffffc900005e3b90 ffffffff810a85a3 ffff8800364bc080 ffffc900=
005e3c20
[    7.599790]  ffffffff81190dce ffff88003f33c900 ffff88003f33c900 ffff8800=
3f33c900
[    7.608630] Call Trace:
[    7.609787]  [<ffffffff81472609>] dump_stack+0x63/0x8a
[    7.611366]  [<ffffffff810a85a3>] ___might_sleep+0xd3/0x120
[    7.614373]  [<ffffffff81190dce>] __alloc_pages_nodemask+0x23e/0x300
[    7.622141]  [<ffffffff811e53d5>] alloc_pages_current+0x95/0x140
[    7.623754]  [<ffffffff8118be2e>] __get_free_pages+0xe/0x40
[    7.625323]  [<ffffffff811bb693>] __tlb_remove_page_size+0x53/0x90
[    7.627086]  [<ffffffff811be47b>] unmap_page_range+0x6cb/0x910
[    7.628647]  [<ffffffff81198b7c>] ? release_pages+0x2fc/0x390
[    7.630242]  [<ffffffff811be73d>] unmap_single_vma+0x7d/0xe0
[    7.631725]  [<ffffffff811bea51>] unmap_vmas+0x51/0xa0
[    7.633139]  [<ffffffff811c538e>] unmap_region+0xae/0x110
[    7.634564]  [<ffffffff811c7453>] do_munmap+0x273/0x440
[    7.635984]  [<ffffffff811c76e0>] SyS_munmap+0x50/0x70
[    7.637369]  [<ffffffff8196eb77>] entry_SYSCALL_64_fastpath+0x1a/0xa9
[    7.660008] NFS: set_pnfs_layoutdriver: cl_exchange_flags 0x0
...

Thanks,
Fengguang

>>------------------------------------------------------------------------
>>
>>commit ccc0666e2049e5818c236e647cf20c552a7b053b
>>Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>Date:   Tue Nov 29 11:06:05 2016 -0800
>>
>>    rcu: Allow boot-time use of cond_resched_rcu_qs()
>>
>>    The cond_resched_rcu_qs() macro is used to force RCU quiescent states=
 into
>>    long-running in-kernel loops.  However, some of these loops can execu=
te
>>    during early boot when interrupts are disabled, and during which time
>>    it is therefore illegal to enter the scheduler.  This commit therefore
>>    makes cond_resched_rcu_qs() be a no-op during early boot.
>>
>>    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>
>>diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
>>index 525ca34603b7..8b4b1be8095b 100644
>>--- a/include/linux/rcupdate.h
>>+++ b/include/linux/rcupdate.h
>>@@ -423,7 +423,7 @@ extern struct srcu_struct tasks_rcu_exit_srcu;
>>  */
>> #define cond_resched_rcu_qs() \
>> do { \
>>-	if (!cond_resched()) \
>>+	if (rcu_scheduler_active && !cond_resched()) \
>> 		rcu_note_voluntary_context_switch(current); \
>> } while (0)
>>
>>
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============7958102157600643859==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
--===============7958102157600643859==--

