Content-Type: multipart/mixed; boundary="===============6285618870887737367=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] kernel BUG at include/linux/pagemap.h:149!
Date: Thu, 10 Sep 2015 10:16:49 -0700
Message-ID: <20150910171649.GE4029@linux.vnet.ibm.com>
In-Reply-To: <20150910102513.GA1677@fixme-laptop.cn.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6285618870887737367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 06:25:13PM +0800, Boqun Feng wrote:
> Hi Fengguang,
> =

> On Thu, Sep 10, 2015 at 08:57:08AM +0800, Fengguang Wu wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git d=
ev.2015.09.01a
> > =

> > commit d0a795e7964cca98fbefefef5e0c330b24d04f50
> > Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > AuthorDate: Thu Jul 30 16:55:38 2015 -0700
> > Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > CommitDate: Mon Aug 31 14:38:03 2015 -0700
> > =

> >     rcu: Don't disable preemption for Tiny and Tree RCU readers
> >     =

> >     Because preempt_disable() maps to barrier() for non-debug builds,
> >     it forces the compiler to spill and reload registers.  Because Tree
> >     RCU and Tiny RCU now only appear in CONFIG_PREEMPT=3Dn builds, these
> >     barrier() instances generate needless extra code for each instance =
of
> >     rcu_read_lock() and rcu_read_unlock().  This extra code slows down =
Tree
> >     RCU and bloats Tiny RCU.
> >     =

> >     This commit therefore removes the preempt_disable() and preempt_ena=
ble()
> >     from the non-preemptible implementations of __rcu_read_lock() and
> >     __rcu_read_unlock(), respectively.
> >     =

> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > =

> > +------------------------------------------------+------------+--------=
----+------------+
> > |                                                | 2d0f6efd31 | d0a795e=
796 | d0a795e796 |
> > +------------------------------------------------+------------+--------=
----+------------+
> > | boot_successes                                 | 63         | 0      =
    | 0          |
> > | boot_failures                                  | 2          | 42     =
    | 42         |
> > | IP-Config:Auto-configuration_of_network_failed | 2          |        =
    |            |
> > | kernel_BUG_at_include/linux/pagemap.h          | 0          | 42     =
    | 42         |
> > | invalid_opcode                                 | 0          | 42     =
    | 42         |
> > | EIP_is_at_page_cache_get_speculative           | 0          | 42     =
    | 42         |
> > | Kernel_panic-not_syncing:Fatal_exception       | 0          | 42     =
    | 42         |
> > | backtrace:vfs_write                            | 0          | 42     =
    | 42         |
> > | backtrace:SyS_write                            | 0          | 42     =
    | 42         |
> > | backtrace:populate_rootfs                      | 0          | 42     =
    | 42         |
> > | backtrace:kernel_init_freeable                 | 0          | 42     =
    | 42         |
> > +------------------------------------------------+------------+--------=
----+------------+
> > =

> > dmesg for d0a795e796 and 2d0f6efd31 are both attached.
> > =

> > [    0.205937] PCI: CLS 0 bytes, default 32
> > [    0.206554] Unpacking initramfs...
> > [    0.208263] ------------[ cut here ]------------
> > [    0.209011] kernel BUG at include/linux/pagemap.h:149!
> =

> Code here is:
> =

> #ifdef CONFIG_TINY_RCU
> # ifdef CONFIG_PREEMPT_COUNT
> 	VM_BUG_ON(!in_atomic()); <-- BUG triggered here.
> # endif
> ...
> #endif
> =

> This indicates that CONFIG_TINY_RCU and CONFIG_PREEMPT_COUNT are both y.
> Normally, IIUC, this is not possible or meaningless, because TINY_RCU is
> for !PREEMPT kernel. However, according to commmit e8f7c70f4 ("sched:
> Make sleeping inside spinlock detection working in !CONFIG_PREEMPT"),
> maintaining preempt counts in !PREEMPT kernel makes sense for finding
> preempt-related bugs.

Good analysis, thank you!

> So a possible fix would be still counting preempt_count in
> rcu_read_lock and rcu_read_unlock if PREEMPT_COUNT is y for debug
> purpose:
> =

> diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> index 07f9b95..887bf5f 100644
> --- a/include/linux/rcupdate.h
> +++ b/include/linux/rcupdate.h
> @@ -297,10 +297,16 @@ void synchronize_rcu(void);
> =

>  static inline void __rcu_read_lock(void)
>  {
> +#ifdef CONFIG_PREEMPT_COUNT
> +       preempt_disable();
> +#endif

We can save a line as follows:

	if (IS_ENABLED(CONFIG_PREEMPT_COUNT))
		preempt_disable();

This approach also has the advantage of letting the compiler look at
more of the code, so that compiler errors in strange combinations of
configurations are less likely to be missed.

>  }
> =

>  static inline void __rcu_read_unlock(void)
>  {
> +#ifdef CONFIG_PREEMPT_COUNT
> +       preempt_enable();
> +#endif
>  }
> =

> I did a simple booting test with the some configuration on a guest on
> x86, didn't see this error again.
> =

> (Also add Frederic Weisbecker to CCed)

Would you like to send me a replacement patch?

							Thanx, Paul

> Regards,
> Boqun
> =

> > [    0.209033] invalid opcode: 0000 [#1] DEBUG_PAGEALLOC =

> > [    0.209033] CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.0-rc1-00078-=
gd0a795e #1
> > [    0.209033] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.7.5-20140531_083030-gandalf 04/01/2014
> > [    0.209033] task: 8b1aa040 ti: 8b1ac000 task.ti: 8b1ac000
> > [    0.209033] EIP: 0060:[<7dccf506>] EFLAGS: 00010202 CPU: 0
> > [    0.209033] EIP is at page_cache_get_speculative+0x6c/0x149
> > [    0.209033] EAX: 00000001 EBX: 8ac00101 ECX: 00000000 EDX: 00000001
> > [    0.209033] ESI: 8bb946e0 EDI: 00000001 EBP: 8b1adc7c ESP: 8b1adc70
> > [    0.209033]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> > [    0.209033] CR0: 8005003b CR2: ffffffff CR3: 069fb000 CR4: 00000690
> > [    0.209033] Stack:
> > [    0.209033]  8ac0012c 8bb946e0 00000000 8b1adc9c 7dcd1219 8ad5ac7c 0=
0000007 00000002
> > [    0.209033]  000200d2 00000000 00000000 8b1adcc0 7dcd136c 00000007 0=
0000000 8ad5ac78
> > [    0.209033]  0000000f 000200d2 00000000 00000000 8b1adcd4 7dcd3609 0=
00200d2 000009e8
> > [    0.209033] Call Trace:
> > [    0.209033]  [<7dcd1219>] find_get_entry+0xce/0x133
> > [    0.209033]  [<7dcd136c>] pagecache_get_page+0x1d/0x39d
> > [    0.209033]  [<7dcd3609>] grab_cache_page_write_begin+0x3a/0x68
> > [    0.209033]  [<7dd58353>] simple_write_begin+0x2d/0xbf
> > [    0.209033]  [<7dcd3703>] generic_perform_write+0xcc/0x26f
> > [    0.209033]  [<7dd4c3e5>] ? file_update_time+0x12b/0x135
> > [    0.209033]  [<7dcd3a79>] __generic_file_write_iter+0x1d3/0x233
> > [    0.209033]  [<7dcd3b2f>] generic_file_write_iter+0x56/0x128
> > [    0.209033]  [<7dd2d866>] __vfs_write+0x99/0x106
> > [    0.209033]  [<7dd2da75>] vfs_write+0xf7/0x136
> > [    0.209033]  [<7dd2dbbc>] SyS_write+0x61/0xa7
> > [    0.209033]  [<7e967bdd>] xwrite+0x23/0xa1
> > [    0.209033]  [<7e967d10>] do_copy+0xb5/0xf9
> > [    0.209033]  [<7e96781a>] write_buffer+0x1d/0x2c
> > [    0.209033]  [<7e9679c1>] flush_buffer+0x3c/0xb0
> > [    0.209033]  [<7e98e1dc>] gunzip+0x3a0/0x4b0
> > [    0.209033]  [<7e98de34>] ? bunzip2+0x60c/0x60c
> > [    0.209033]  [<7e98de3c>] ? nofill+0x8/0x8
> > [    0.209033]  [<7e96838a>] unpack_to_rootfs+0x1b0/0x2ee
> > [    0.209033]  [<7e967985>] ? error+0x2c/0x2c
> > [    0.209033]  [<7e967959>] ? do_start+0x1b/0x1b
> > [    0.209033]  [<7e968546>] populate_rootfs+0x7e/0x199
> > [    0.209033]  [<7e966f01>] do_one_initcall+0x130/0x216
> > [    0.209033]  [<7e966506>] ? repair_env_string+0x29/0x96
> > [    0.209033]  [<7e9684c8>] ? unpack_to_rootfs+0x2ee/0x2ee
> > [    0.209033]  [<7dc59bec>] ? parse_args+0x343/0x40a
> > [    0.209033]  [<7e9670be>] ? kernel_init_freeable+0xd7/0x1b4
> > [    0.209033]  [<7e9670de>] kernel_init_freeable+0xf7/0x1b4
> > [    0.209033]  [<7e2736cf>] kernel_init+0x9/0x139
> > [    0.209033]  [<7e281f00>] ret_from_kernel_thread+0x20/0x30
> > [    0.209033]  [<7e2736c6>] ? rest_init+0x11e/0x11e
> > [    0.209033] Code: ff ff ff 7f b8 dc 98 77 7e 0f 94 c3 31 c9 0f b6 fb=
 89 fa e8 c7 50 fe ff 8b 04 bd dc 8a 7d 7e 40 84 db 89 04 bd dc 8a 7d 7e 74=
 02 <0f> 0b 8b 1e 31 c9 b8 a0 98 77 7e c1 eb 0f 83 e3 01 89 da e8 9c
> > [    0.209033] EIP: [<7dccf506>] page_cache_get_speculative+0x6c/0x149 =
SS:ESP 0068:8b1adc70
> > [    0.240927] ---[ end trace b15ce49b08a81922 ]---
> > [    0.241403] Kernel panic - not syncing: Fatal exception
> > =

> > git bisect start d0a795e7964cca98fbefefef5e0c330b24d04f50 d770e558e2196=
1ad6cfdf0ff7df0eb5d7d4f0754 --
> > git bisect good 8ff4fbfd69a6c7b9598f8c1f2df34f89bac02c1a  # 06:49     2=
2+      0  Merge branches 'fixes.2015.07.22a' and 'initexp.2015.08.04a' int=
o HEAD
> > git bisect good 8611bc8cfdb809852e15c8c8786fe0fbd72e7da7  # 06:54     2=
2+      0  rcu_sync: Introduce rcu_sync_dtor()
> > git bisect good d74251b8bae07a4957c9f3ccecbdb7f84d790f38  # 07:03     2=
2+      0  locking/percpu-rwsem: Clean up the lockdep annotations in percpu=
_down_read()
> > git bisect good 51899e3fb9b8de48dff0ab1a9cc5250c6d4020ac  # 07:09     2=
2+      0  rcu: Use rcu_callback_t in call_rcu*() and friends
> > git bisect good e8ee682bcce44c81d8363009b08f115e964dbd0b  # 07:14     2=
1+      2  rcu: Use call_rcu_func_to to replace explicit type equivalents
> > git bisect good 2d0f6efd311165fe06cecb29475e89e550b92d8c  # 07:22     2=
2+      0  rcu: Use rsp->expedited_wq instead of sync_rcu_preempt_exp_wq
> > # first bad commit: [d0a795e7964cca98fbefefef5e0c330b24d04f50] rcu: Don=
't disable preemption for Tiny and Tree RCU readers
> > git bisect good 2d0f6efd311165fe06cecb29475e89e550b92d8c  # 07:26     6=
3+      2  rcu: Use rsp->expedited_wq instead of sync_rcu_preempt_exp_wq
> > # extra tests on HEAD of linux-devel/devel-spot-201509091835
> > git bisect  bad 325c0efb5f89af4e5e3d0575ea1b042375dedf6b  # 07:31      =
0-      2  0day head guard for 'devel-spot-201509091835'
> > # extra tests on tree/branch rcu/dev.2015.09.01a
> > git bisect  bad caa7dd68d68438b256ee830f4aa6b2ddd04b4575  # 07:36      =
0-     11  locktorture: Fix module unwind when bad torture_type specified
> > # extra tests with first bad commit reverted
> > git bisect good 9ff21ff24e5557ad2c1bd72b63f969609e0d28f8  # 07:42     6=
6+      2  Revert "rcu: Don't disable preemption for Tiny and Tree RCU read=
ers"
> > # extra tests on tree/branch linus/master
> > git bisect good b8889c4fc6ba03e289cec6a4d692f6f080a55e53  # 07:50     6=
6+      0  Merge tag 'tty-4.3-rc1' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/gregkh/tty
> > # extra tests on tree/branch linux-next/master
> > git bisect good 72c9d8043fdc87832802de0b7a7129d6fc4c4c70  # 07:58     6=
3+      0  Add linux-next specific files for 20150909
> > =

> > =

> =



--===============6285618870887737367==--

