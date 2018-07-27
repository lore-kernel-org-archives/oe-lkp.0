Content-Type: multipart/mixed; boundary="===============3566230048018132785=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: ad1754318c [ 13.219935] WARNING: kernel stack frame pointer at (____ptrval____) in init:1 has bad value (____ptrval____)
Date: Fri, 27 Jul 2018 12:49:09 -0500
Message-ID: <87o9eszi0a.fsf@xmission.com>
In-Reply-To: <20180727005144.GA20297@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3566230048018132785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> writes:

> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit
> is

Thank you for finding this.  Is there a chance I can get some help
reproducing this?

I have run your script below and it's cousin from the dmesg output
and this is failing to reproduce for me.  The only difference I can see
so far is a slightly different version of gcc from debian.

The dmesg I am seeing does not make sense to me.

What is generating the initial backtrace?

Who is calling usercopy_abort? There appears to be no backtrace from
that at all.

How is the "BUG: unable to handle kernel NULL pointer dereference at
0000000000000000" related to anything?  Where is it's stack trace and
register dump?

Right now the dmesg seems like an AI's attempt to compose a crash dump.
Lots of likley looking pieces but they don't fit.

Eric

--- /home/eric/projects/linux/linux-exit-cleanups-build/.config 2018-07-27 =
11:55:33.624310267 -0500
+++ /home/eric/tmp/config-4.18.0-rc1-00020-gad17543     2018-07-27 11:09:27=
.596323707 -0500
@@ -4,7 +4,7 @@
 #
 =

 #
-# Compiler: gcc (Debian 4.9.2-10+deb8u1) 4.9.2
+# Compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
 #
 CONFIG_64BIT=3Dy
 CONFIG_X86_64=3Dy
@@ -45,7 +45,7 @@
 CONFIG_FIX_EARLYCON_MEM=3Dy
 CONFIG_PGTABLE_LEVELS=3D4
 CONFIG_CC_IS_GCC=3Dy
-CONFIG_GCC_VERSION=3D40902
+CONFIG_GCC_VERSION=3D40904
 CONFIG_CLANG_VERSION=3D0
 CONFIG_IRQ_WORK=3Dy
 CONFIG_BUILDTIME_EXTABLE_SORT=3Dy


> https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.g=
it siginfo-testing
>
> commit ad1754318cc4dab034d959fcc8e2c34dec0e3d82
> Author:     Eric W. Biederman <ebiederm@xmission.com>
> AuthorDate: Mon Jul 23 15:20:37 2018 -0500
> Commit:     Eric W. Biederman <ebiederm@xmission.com>
> CommitDate: Tue Jul 24 16:26:33 2018 -0500
>
>     signal: Don't restart fork when signals come in.
>     =

>     Wen Yang <wen.yang99@zte.com.cn> and majiang <ma.jiang@zte.com.cn>
>     report that a periodic signal received during fork can cause fork to
>     continually restart preventing an application from making progress.
>     =

>     The code was being overly pesimistic.  Fork needs to guarantee that a
>     signal sent to multiple processes is logically delivered before the
>     fork and just to the forking process or logically delivered after the
>     fork to both the forking process and it's newly spawned child.  For
>     signals like periodic timers that are always delivered to a single
>     process fork can safely complete and let them appear to logically
>     delivered after the fork().
>     =

>     While examining this issue I also discovered that fork today will miss
>     signals delivered to multiple processes during the fork and handled by
>     another thread.  Similarly the current code will also miss blocked
>     signals that are delivered to multiple process, as those signals will
>     not appear pending during fork.
>     =

>     Add a list of each thread that is currently forking, and keep on that
>     list a signal set that records all of the signals sent to multiple
>     processes.  When fork completes initialize the new processes
>     shared_pending signal set with it.  The calculate_sigpending function
>     will see those signals and set TIF_SIGPENDING causing the new task to
>     take the slow path to userspace to handle those signals.  Making it
>     appear as if those signals were received immediately after the fork.
>     =

>     It is not possible to send real time signals to multiple processes and
>     exceptions don't go to multiple processes, which means that that are
>     no signals sent to multiple processes that require siginfo.  This
>     means it is safe to not bother collecting siginfo on signals sent
>     during fork.
>     =

>     The sigaction of a child of fork is initially the same as the
>     sigaction of the parent process.  So a signal the parent ignores the
>     child will also initially ignore.  Therefore it is safe to ignore
>     signals sent to multiple processes and ignored by the forking process.
>     =

>     Signals sent to only a single process or only a single thread and del=
ivered
>     during fork are treated as if they are received after the fork, and g=
enerally
>     not dealt with.  They won't cause any problems.
>     =

>     V2: Added removal from the multiprocess list on failure.
>     V3: Use -ERESTARTNOINTR directly
>     =

>     Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D200447
>     Reported-by: Wen Yang <wen.yang99@zte.com.cn> and
>     Reported-by: majiang <ma.jiang@zte.com.cn>
>     Fixes: 4a2c7a7837da ("[PATCH] make fork() atomic wrt pgrp/session sig=
nals")
>     Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
>
> 159fb05651  fork: Have new threads join on-going signal group stops
> ad1754318c  signal: Don't restart fork when signals come in.
> +------------------------------------------+------------+------------+
> |                                          | 159fb05651 | ad1754318c |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 30         | 0          |
> | boot_failures                            | 0          | 11         |
> | WARNING:kernel_stack                     | 0          | 11         |
> | BUG:unable_to_handle_kernel              | 0          | 11         |
> | kernel_BUG_at_mm/usercopy.c              | 0          | 11         |
> | invalid_opcode:#[##]                     | 0          | 11         |
> | RIP:usercopy_abort                       | 0          | 11         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 11         |
> +------------------------------------------+------------+------------+
>
> [   13.170124] Write protecting the kernel read-only data: 22528k
> [   13.172876] Freeing unused kernel memory: 2032K
> [   13.176928] Freeing unused kernel memory: 716K
> [   13.177632] rodata_test: all tests were successful
> [   13.217986] random: init: uninitialized urandom read (12 bytes read)
> [   13.219935] WARNING: kernel stack frame pointer at (____ptrval____) in=
 init:1 has bad value (____ptrval____)
> [   13.219936] unwind stack type:1 next_sp:          (null) mask:0x2 grap=
h_idx:0
> [   13.219938] (____ptrval____): ffff88000013bc30 (0xffff88000013bc30)
> [   13.219942] (____ptrval____): ffffffff8103fd83 (__save_stack_trace+0x7=
3/0xd0)
> [   13.219943] (____ptrval____): 0000000000000001 (0x1)
> [   13.219944] (____ptrval____): ffff880000138000 (0xffff880000138000)
>
>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 33c0f52f52bcbc6e8f8203270986501e298983cf d72e90f33aa4709=
ebecc5005562f52335e106a60 --
> git bisect  bad d2d69ddfd0d10a1b583c549aa43be624a1984ca8  # 18:11  B     =
 0    11   26   0  Merge 'linux-review/Shilpasri-G-Bhat/hwmon-powernv-Add-a=
ttributes-to-enable-disable-sensors/20180719-065825' into devel-hourly-2018=
072605
> git bisect  bad 0f2bf5093315c0d2228c3d908b2ea36e44bfd4fa  # 18:11  B     =
 0    13   28   0  Merge 'linux-review/Randy-Dunlap/sparc-fix-header-proble=
m-in-sparc32-build/20180722-114333' into devel-hourly-2018072605
> git bisect good 20d6d016b3f5cc37c445bc2436cb5111d814cdc2  # 18:12  G     =
10     0    1   8  Merge 'trace/ftrace/urgent' into devel-hourly-2018072605
> git bisect good b8beac6d72e630145e2032b188a89045ce65a3fd  # 18:15  G     =
10     0    1   4  Merge 'linux-review/Appana-Durga-Kedareswara-rao/fpga-fp=
ga-mgr-Add-readback-support/20180726-035106' into devel-hourly-2018072605
> git bisect good 121ba61a5ecde96e6d176dc9ed908ba74616d8e2  # 18:17  G     =
10     0    2   5  Merge 'tty/tty-testing' into devel-hourly-2018072605
> git bisect good ec89a0364ed2fbaacf4cc79b669b18d016b57fb8  # 18:19  G     =
10     0    0   2  Merge 'linux-review/Yunlong-Song/f2fs-clear-victim_secma=
p-when-section-has-full-valid-blocks/20180726-032114' into devel-hourly-201=
8072605
> git bisect  bad 1779a94700134c63eed22710bb8e7edd14b752c0  # 18:19  B     =
 0    11   26   0  Merge 'hch-block/kill-bio-clone' into devel-hourly-20180=
72605
> git bisect  bad 61a303a39a9b19c661ec2e07d5022ed4e6e8edee  # 18:19  B     =
 0    13   28   0  Merge 'linux-review/Yue-Wang/alsa-usb-audio-Topping-DX7s=
-quirk-for-DSD-interface/20180724-012757' into devel-hourly-2018072605
> git bisect  bad fe9a44e093a1466b4ea4ae536911d7e0550ef9e5  # 18:19  B     =
 0    15   29   0  Merge 'userns/siginfo-testing' into devel-hourly-2018072=
605
> git bisect good 0102498083d58d8b17759642c602b525215e1a54  # 18:20  G     =
11     0    0   0  signal: Pass pid type into group_send_sig_info
> git bisect good 0729614992c946f6e8ccb9ef260aea1f06993df0  # 18:20  G     =
11     0    0   0  signal: Push pid type down into complete_signal.
> git bisect good 73ce6fe330cf55ee1b7de4bcdc6e0706f1ee436c  # 18:20  G     =
11     0    0   0  signal: Add calculate_sigpending()
> git bisect  bad ad1754318cc4dab034d959fcc8e2c34dec0e3d82  # 18:20  B     =
 0    11   25   0  signal: Don't restart fork when signals come in.
> git bisect good 159fb056514ad8b1459128e8140ef6ce2af30478  # 18:20  G     =
22     0    0   0  fork: Have new threads join on-going signal group stops
> # first bad commit: [ad1754318cc4dab034d959fcc8e2c34dec0e3d82] signal: Do=
n't restart fork when signals come in.
> git bisect good 159fb056514ad8b1459128e8140ef6ce2af30478  # 18:25  G     =
30     0    0   0  fork: Have new threads join on-going signal group stops
> # extra tests with debug options
> git bisect  bad ad1754318cc4dab034d959fcc8e2c34dec0e3d82  # 19:41  B     =
 0     1   18   2  signal: Don't restart fork when signals come in.
> # extra tests on HEAD of linux-devel/devel-hourly-2018072605
> git bisect  bad 33c0f52f52bcbc6e8f8203270986501e298983cf  # 19:46  B     =
 0   353  371   0  0day head guard for 'devel-hourly-2018072605'
> # extra tests on tree/branch userns/siginfo-testing
> git bisect  bad ad1754318cc4dab034d959fcc8e2c34dec0e3d82  # 19:48  B     =
 0    11   25   0  signal: Don't restart fork when signals come in.
> # extra tests with first bad commit reverted
> git bisect good f6d9006c6389f5141f78c0f7ee0d31f9a0dcb2ad  # 20:11  G     =
11     0    0   0  Revert "signal: Don't restart fork when signals come in."
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============3566230048018132785==--

