Content-Type: multipart/mixed; boundary="===============1832720677271367464=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [vdpa_sim_net] 79991caf52: net/ipv4/ipmr.c:#RCU-list_traversed_in_non-reader_section
Date: Thu, 18 Mar 2021 14:31:10 +0800
Message-ID: <20210318063110.GA12442@xsang-OptiPlex-9020>
In-Reply-To: <ebd163a2-c8a8-2cb5-b46f-b0e5346c6685@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1832720677271367464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Joe and Dongli,

On Mon, Feb 08, 2021 at 08:10:21AM -0800, Joe Jin wrote:
> On 2/7/21 12:15 PM, Dongli Zhang wrote:
> > Is it possible that the issue is not due to this change?
> =

> Looks this issue does not related your change, from dmesg output, when is=
sue occurred, virtio was not loaded:
> =

> [=C2=A0 502.508450] ------------[ cut here ]------------
> [=C2=A0 502.511859] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/vkms/vkms_c=
rtc.c:21 vkms_vblank_simulate+0x22a/0x240
> [=C2=A0 502.524018] Modules linked in:
> [=C2=A0 502.539642] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc4-=
00008-g79991caf5202 #1
> =


thanks for explanation and sorry for false positive.
we will investigate further to avoid such kind of false positive in the fut=
ure.


> >
> > This change is just to call different API to allocate memory, which is
> > equivalent to kzalloc()+vzalloc().
> >
> > Before the change:
> >
> > try kzalloc(sizeof(*vs), GFP_KERNEL | __GFP_NOWARN | __GFP_RETRY_MAYFAI=
L);
> >
> > ... and then below if the former is failed.
> >
> > vzalloc(sizeof(*vs));
> >
> >
> > After the change:
> >
> > try kmalloc_node(size, FP_KERNEL|GFP_ZERO|__GFP_NOWARN|__GFP_NORETRY, n=
ode);
> >
> > ... and then below if the former is failed
> >
> > __vmalloc_node(size, 1, GFP_KERNEL|GFP_ZERO, node, __builtin_return_add=
ress(0));
> >
> >
> > The below is the first WARNING in uploaded dmesg. I assume it was calle=
d before
> > to open /dev/vhost-scsi.
> >
> > Will this test try to open /dev/vhost-scsi?
> >
> > [    5.095515] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    5.095515] WARNING: suspicious RCU usage
> > [    5.095515] 5.11.0-rc4-00008-g79991caf5202 #1 Not tainted
> > [    5.095534] -----------------------------
> > [    5.096041] security/smack/smack_lsm.c:351 RCU-list traversed in non=
-reader
> > section!!
> > [    5.096982]
> > [    5.096982] other info that might help us debug this:
> > [    5.096982]
> > [    5.097953]
> > [    5.097953] rcu_scheduler_active =3D 1, debug_locks =3D 1
> > [    5.098739] no locks held by kthreadd/2.
> > [    5.099237]
> > [    5.099237] stack backtrace:
> > [    5.099537] CPU: 0 PID: 2 Comm: kthreadd Not tainted
> > 5.11.0-rc4-00008-g79991caf5202 #1
> > [    5.100470] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS
> > 1.12.0-1 04/01/2014
> > [    5.101442] Call Trace:
> > [    5.101807]  dump_stack+0x15f/0x1bf
> > [    5.102298]  smack_cred_prepare+0x400/0x420
> > [    5.102840]  ? security_prepare_creds+0xd4/0x120
> > [    5.103441]  security_prepare_creds+0x84/0x120
> > [    5.103515]  prepare_creds+0x3f1/0x580
> > [    5.103515]  copy_creds+0x65/0x480
> > [    5.103515]  copy_process+0x7b4/0x3600
> > [    5.103515]  ? check_prev_add+0xa40/0xa40
> > [    5.103515]  ? lockdep_enabled+0xd/0x60
> > [    5.103515]  ? lock_is_held_type+0x1a/0x100
> > [    5.103515]  ? __cleanup_sighand+0xc0/0xc0
> > [    5.103515]  ? lockdep_unlock+0x39/0x160
> > [    5.103515]  kernel_clone+0x165/0xd20
> > [    5.103515]  ? copy_init_mm+0x20/0x20
> > [    5.103515]  ? pvclock_clocksource_read+0xd9/0x1a0
> > [    5.103515]  ? sched_clock_local+0x99/0xc0
> > [    5.103515]  ? kthread_insert_work_sanity_check+0xc0/0xc0
> > [    5.103515]  kernel_thread+0xba/0x100
> > [    5.103515]  ? __ia32_sys_clone3+0x40/0x40
> > [    5.103515]  ? kthread_insert_work_sanity_check+0xc0/0xc0
> > [    5.103515]  ? do_raw_spin_unlock+0xa9/0x160
> > [    5.103515]  kthreadd+0x68f/0x7a0
> > [    5.103515]  ? kthread_create_on_cpu+0x160/0x160
> > [    5.103515]  ? lockdep_hardirqs_on+0x77/0x100
> > [    5.103515]  ? _raw_spin_unlock_irq+0x24/0x60
> > [    5.103515]  ? kthread_create_on_cpu+0x160/0x160
> > [    5.103515]  ret_from_fork+0x22/0x30
> >
> > Thank you very much!
> >
> > Dongli Zhang
> >
> >
> > On 2/6/21 7:03 PM, kernel test robot wrote:
> >> Greeting,
> >>
> >> FYI, we noticed the following commit (built with gcc-9):
> >>
> >> commit: 79991caf5202c7989928be534727805f8f68bb8d ("vdpa_sim_net: Add s=
upport for user supported devices")
> >> https://urldefense.com/v3/__https://git.kernel.org/cgit/linux/kernel/g=
it/torvalds/linux.git__;!!GqivPVa7Brio!LfgrgVVtPAjwjqTZX8yANgsix4f3cJmAA_Cc=
MeCVymh5XYcamWdR9dnbIQA-p61PJtI$  Dongli-Zhang/vhost-scsi-alloc-vhost_scsi-=
with-kvzalloc-to-avoid-delay/20210129-191605
> >>
> >>
> >> in testcase: trinity
> >> version: trinity-static-x86_64-x86_64-f93256fb_2019-08-28
> >> with following parameters:
> >>
> >> 	runtime: 300s
> >>
> >> test-description: Trinity is a linux system call fuzz tester.
> >> test-url: https://urldefense.com/v3/__http://codemonkey.org.uk/project=
s/trinity/__;!!GqivPVa7Brio!LfgrgVVtPAjwjqTZX8yANgsix4f3cJmAA_CcMeCVymh5XYc=
amWdR9dnbIQA-6Y4x88c$ =

> >>
> >>
> >> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp =
2 -m 8G
> >>
> >> caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
> >>
> >>
> >> +---------------------------------------------------------------------=
----+------------+------------+
> >> |                                                                     =
    | 39502d042a | 79991caf52 |
> >> +---------------------------------------------------------------------=
----+------------+------------+
> >> | boot_successes                                                      =
    | 0          | 0          |
> >> | boot_failures                                                       =
    | 62         | 57         |
> >> | WARNING:suspicious_RCU_usage                                        =
    | 62         | 57         |
> >> | security/smack/smack_lsm.c:#RCU-list_traversed_in_non-reader_section=
    | 62         | 57         |
> >> | security/smack/smack_access.c:#RCU-list_traversed_in_non-reader_sect=
ion | 62         | 57         |
> >> | BUG:workqueue_lockup-pool                                           =
    | 33         | 40         |
> >> | BUG:kernel_hang_in_boot_stage                                       =
    | 6          | 2          |
> >> | net/mac80211/util.c:#RCU-list_traversed_in_non-reader_section       =
    | 23         | 15         |
> >> | WARNING:SOFTIRQ-safe->SOFTIRQ-unsafe_lock_order_detected            =
    | 18         |            |
> >> | WARNING:inconsistent_lock_state                                     =
    | 5          |            |
> >> | inconsistent{SOFTIRQ-ON-W}->{IN-SOFTIRQ-W}usage                     =
    | 5          |            |
> >> | calltrace:asm_call_irq_on_stack                                     =
    | 2          |            |
> >> | RIP:lock_acquire                                                    =
    | 2          |            |
> >> | RIP:check_kcov_mode                                                 =
    | 1          |            |
> >> | RIP:native_safe_halt                                                =
    | 2          |            |
> >> | INFO:rcu_sched_self-detected_stall_on_CPU                           =
    | 2          |            |
> >> | RIP:clear_page_rep                                                  =
    | 1          |            |
> >> | WARNING:at_drivers/gpu/drm/vkms/vkms_crtc.c:#vkms_vblank_simulate   =
    | 9          | 7          |
> >> | RIP:vkms_vblank_simulate                                            =
    | 9          | 7          |
> >> | RIP:__slab_alloc                                                    =
    | 3          | 3          |
> >> | RIP:__do_softirq                                                    =
    | 2          |            |
> >> | RIP:console_unlock                                                  =
    | 6          | 3          |
> >> | invoked_oom-killer:gfp_mask=3D0x                                    =
      | 1          |            |
> >> | Mem-Info                                                            =
    | 1          |            |
> >> | RIP:vprintk_emit                                                    =
    | 1          |            |
> >> | RIP:__asan_load4                                                    =
    | 1          |            |
> >> | kernel_BUG_at_kernel/sched/core.c                                   =
    | 0          | 1          |
> >> | invalid_opcode:#[##]                                                =
    | 0          | 1          |
> >> | RIP:sched_cpu_dying                                                 =
    | 0          | 1          |
> >> | WARNING:possible_circular_locking_dependency_detected               =
    | 0          | 1          |
> >> | Kernel_panic-not_syncing:Fatal_exception                            =
    | 0          | 1          |
> >> | net/ipv4/ipmr.c:#RCU-list_traversed_in_non-reader_section           =
    | 0          | 8          |
> >> | RIP:arch_local_irq_restore                                          =
    | 0          | 1          |
> >> | RIP:idr_get_free                                                    =
    | 0          | 1          |
> >> | net/ipv6/ip6mr.c:#RCU-list_traversed_in_non-reader_section          =
    | 0          | 2          |
> >> +---------------------------------------------------------------------=
----+------------+------------+
> >>
> >>
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kernel test robot <oliver.sang@intel.com>
> >>
> >>
> >> [  890.196279] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [  890.212608] WARNING: suspicious RCU usage
> >> [  890.228281] 5.11.0-rc4-00008-g79991caf5202 #1 Tainted: G        W
> >> [  890.244087] -----------------------------
> >> [  890.259417] net/ipv4/ipmr.c:138 RCU-list traversed in non-reader se=
ction!!
> >> [  890.275043]
> >> [  890.275043] other info that might help us debug this:
> >> [  890.275043]
> >> [  890.318497]
> >> [  890.318497] rcu_scheduler_active =3D 2, debug_locks =3D 1
> >> [  890.346089] 2 locks held by trinity-c1/2476:
> >> [  890.360897]  #0: ffff888149d6f400 (&f->f_pos_lock){+.+.}-{3:3}, at:=
 __fdget_pos+0xc0/0xe0
> >> [  890.375165]  #1: ffff8881cabfd5c8 (&p->lock){+.+.}-{3:3}, at: seq_r=
ead_iter+0xa0/0x9c0
> >> [  890.389706]
> >> [  890.389706] stack backtrace:
> >> [  890.416375] CPU: 1 PID: 2476 Comm: trinity-c1 Tainted: G        W  =
       5.11.0-rc4-00008-g79991caf5202 #1
> >> [  890.430706] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS 1.12.0-1 04/01/2014
> >> [  890.444971] Call Trace:
> >> [  890.458554]  dump_stack+0x15f/0x1bf
> >> [  890.471996]  ipmr_get_table+0x140/0x160
> >> [  890.485328]  ipmr_vif_seq_start+0x4d/0xe0
> >> [  890.498620]  seq_read_iter+0x1b2/0x9c0
> >> [  890.511469]  ? kvm_sched_clock_read+0x14/0x40
> >> [  890.524008]  ? sched_clock+0x1b/0x40
> >> [  890.536095]  ? iov_iter_init+0x7c/0xa0
> >> [  890.548028]  seq_read+0x2fd/0x3e0
> >> [  890.559948]  ? seq_hlist_next_percpu+0x140/0x140
> >> [  890.572204]  ? should_fail+0x78/0x2a0
> >> [  890.584189]  ? write_comp_data+0x2a/0xa0
> >> [  890.596235]  ? __sanitizer_cov_trace_pc+0x1d/0x60
> >> [  890.608134]  ? seq_hlist_next_percpu+0x140/0x140
> >> [  890.620042]  proc_reg_read+0x14e/0x180
> >> [  890.631585]  do_iter_read+0x397/0x420
> >> [  890.642843]  vfs_readv+0xf5/0x160
> >> [  890.653833]  ? vfs_iter_read+0x80/0x80
> >> [  890.664229]  ? __fdget_pos+0xc0/0xe0
> >> [  890.674236]  ? pvclock_clocksource_read+0xd9/0x1a0
> >> [  890.684259]  ? kvm_sched_clock_read+0x14/0x40
> >> [  890.693852]  ? sched_clock+0x1b/0x40
> >> [  890.702898]  ? sched_clock_cpu+0x18/0x120
> >> [  890.711648]  ? write_comp_data+0x2a/0xa0
> >> [  890.720243]  ? __sanitizer_cov_trace_pc+0x1d/0x60
> >> [  890.729290]  do_readv+0x111/0x260
> >> [  890.738205]  ? vfs_readv+0x160/0x160
> >> [  890.747154]  ? lockdep_hardirqs_on+0x77/0x100
> >> [  890.756100]  ? syscall_enter_from_user_mode+0x8a/0x100
> >> [  890.765126]  do_syscall_64+0x34/0x80
> >> [  890.773795]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >> [  890.782630] RIP: 0033:0x453b29
> >> [  890.791189] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 0=
0 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 0=
5 <48> 3d 01 f0 ff ff 0f 83 3b 84 00 00 c3 66 2e 0f 1f 84 00 00 00 00
> >> [  890.810866] RSP: 002b:00007ffcda44fb18 EFLAGS: 00000246 ORIG_RAX: 0=
000000000000013
> >> [  890.820764] RAX: ffffffffffffffda RBX: 0000000000000013 RCX: 000000=
0000453b29
> >> [  890.830792] RDX: 000000000000009a RSI: 0000000001de1c00 RDI: 000000=
00000000b9
> >> [  890.840626] RBP: 00007ffcda44fbc0 R08: 722c279d69ffc468 R09: 000000=
0000000400
> >> [  890.850366] R10: 0098d82a42c63c22 R11: 0000000000000246 R12: 000000=
0000000002
> >> [  890.860001] R13: 00007f042ae6f058 R14: 00000000010a2830 R15: 00007f=
042ae6f000
> >>
> >>
> >>
> >> To reproduce:
> >>
> >>         # build kernel
> >> 	cd linux
> >> 	cp config-5.11.0-rc4-00008-g79991caf5202 .config
> >> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare mod=
ules_prepare bzImage
> >>
> >>         git clone https://urldefense.com/v3/__https://github.com/intel=
/lkp-tests.git__;!!GqivPVa7Brio!LfgrgVVtPAjwjqTZX8yANgsix4f3cJmAA_CcMeCVymh=
5XYcamWdR9dnbIQA-Qkr9TyI$ =

> >>         cd lkp-tests
> >>         bin/lkp qemu -k <bzImage> job-script # job-script is attached =
in this email
> >>
> >>
> >>
> >> Thanks,
> >> Oliver Sang
> >>
>=20
--===============1832720677271367464==--

