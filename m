Content-Type: multipart/mixed; boundary="===============5260916727308020312=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkdtm] 9a49a528dc: WARNING: CPU: 0 PID: 404 at kernel/trace/ftrace.c:2005 ftrace_bug
Date: Sat, 06 Aug 2016 11:04:18 -0700
Message-ID: <CAGXu5jLv4PaT7K2E0seLgvedcnodqruYUWR2Haeg27mWq_QA+w@mail.gmail.com>
In-Reply-To: <57a5c474.mwQT3D7yA+LJ+YFS%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5260916727308020312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This should be fixed by mpe's notrace patch for this function which
should be landing in 4.8 shortly.

-Kees

On Sat, Aug 6, 2016 at 4:05 AM, kernel test robot
<fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit 9a49a528dcf3c2022ff89f700d5d0345b9abf288
> Author:     Kees Cook <keescook@chromium.org>
> AuthorDate: Mon Feb 22 14:09:29 2016 -0800
> Commit:     Kees Cook <keescook@chromium.org>
> CommitDate: Fri Jun 10 15:57:50 2016 -0700
>
>     lkdtm: add function for testing .rodata section
>
>     This adds a function that lives in the .rodata section. The section
>     flags are corrected using objcopy since there is no way with gcc to
>     declare section flags in an architecture-agnostic way.
>
>     Signed-off-by: Kees Cook <keescook@chromium.org>
>
> +-------------------------------------------------------+------------+---=
---------+------------+
> |                                                       | 426f3a53d4 | 9a=
49a528dc | 5eb7f58ccb |
> +-------------------------------------------------------+------------+---=
---------+------------+
> | boot_successes                                        | 876        | 25=
5        | 57         |
> | boot_failures                                         | 344        | 55=
         | 33         |
> | BUG:kernel_test_crashed                               | 344        | 53=
         | 31         |
> | WARNING:at_kernel/trace/ftrace.c:#ftrace_bug          | 0          | 2 =
         | 2          |
> | RIP:is_ftrace_trampoline                              | 0          | 2 =
         | 2          |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 2 =
         | 2          |
> | backtrace:perf_ftrace_event_register                  | 0          | 2 =
         | 2          |
> | backtrace:perf_trace_init                             | 0          | 2 =
         | 2          |
> | backtrace:perf_tp_event_init                          | 0          | 2 =
         | 2          |
> | backtrace:perf_try_init_event                         | 0          | 2 =
         | 2          |
> | backtrace:perf_event_alloc                            | 0          | 2 =
         | 2          |
> | backtrace:SyS_perf_event_open                         | 0          | 2 =
         | 2          |
> +-------------------------------------------------------+------------+---=
---------+------------+
>
> [   11.152520] init: plymouth-splash main process (396) terminated with s=
tatus 1
> [   11.164728] init: networking main process (398) terminated with status=
 1
> [   18.827856] ------------[ cut here ]------------
> [   18.829473] WARNING: CPU: 0 PID: 404 at kernel/trace/ftrace.c:2005 ftr=
ace_bug+0x145/0x400
> [   18.833070] CPU: 0 PID: 404 Comm: trinity-main Not tainted 4.7.0-rc2-0=
0303-g9a49a52 #1
> [   18.835847]  0000000000000009 ffff880009093bf8 ffffffff81720b3c ffff88=
0009093c38
> [   18.838684]  ffffffff810df9d2 000007d58112d8af ffff8800102a7e80 ffffff=
ff81fe1db0
> [   18.841697]  00000000000093e8 0000000000000001 ffffffff831b9330 ffff88=
0009093c48
> [   18.844511] Call Trace:
> [   18.845424]  [<ffffffff81720b3c>] dump_stack+0x19/0x1d
> [   18.847204]  [<ffffffff810df9d2>] __warn+0x112/0x150
> [   18.848936]  [<ffffffff810dfadd>] warn_slowpath_null+0x1d/0x20
> [   18.851178]  [<ffffffff8117a185>] ftrace_bug+0x145/0x400
> [   18.853029]  [<ffffffff81065129>] ftrace_replace_code+0x2c9/0x480
> [   18.855130]  [<ffffffff8117a556>] ftrace_modify_all_code+0x36/0xc0
> [   18.857372]  [<ffffffff810652ef>] arch_ftrace_update_code+0xf/0x20
> [   18.859483]  [<ffffffff8117a6d0>] ftrace_run_update_code+0x50/0x60
> [   18.861813]  [<ffffffff8117a7c3>] ftrace_startup_enable+0x33/0x50
> [   18.863903]  [<ffffffff8117bf6d>] ftrace_startup+0x13d/0x180
> [   18.866205]  [<ffffffff8117c94c>] register_ftrace_function+0x4c/0x60
> [   18.868342]  [<ffffffff81196597>] perf_ftrace_event_register+0x47/0x100
> [   18.870749]  [<ffffffff8119626b>] perf_trace_init+0x25b/0x280
> [   18.872718]  [<ffffffff811ab376>] perf_tp_event_init+0x56/0x90
> [   18.874690]  [<ffffffff811ab5f9>] perf_try_init_event+0xa9/0xd0
> [   18.876806]  [<ffffffff811abd2c>] perf_event_alloc+0x70c/0x1080
> [   18.878818]  [<ffffffff811b7ba8>] SyS_perf_event_open+0x928/0x17b0
> [   18.881148]  [<ffffffff81df25f9>] entry_SYSCALL_64_fastpath+0x1f/0xb8
> [   18.883330] ---[ end trace 1cf1f82a14a663e2 ]---
> [   18.884894] ftrace faulted on writing [<ffffffff81fe1db0>] lkdtm_rodat=
a_do_nothing+0x0/0x10
>
> git bisect start 5eb7f58ccb08a2822f20afb2f4341474e1dece30 523d939ef98fd71=
2632d93a5a2b588e477a7565e --
> git bisect  bad 3b760b613b1536578a4576a73e9ba9ac359d3dfd  # 15:06    151-=
     59  Merge 'linux-review/Wei-Yongjun/IB-core-Fix-possible-memory-leak-i=
n-cma_resolve_iboe_route/20160805-215000' into devel-spot-201608061351
> git bisect  bad 9e0b994e4fcc43853507dbdf87667f0195196858  # 15:10      0-=
      1  Merge 'linux-review/Dave-Carroll/aacraid-Check-size-values-after-d=
ouble-fetch-from-user/20160806-034938' into devel-spot-201608061351
> git bisect  bad 31b71e3e26f5a5c5acb43d2744c37079c9d7d9c2  # 15:14      0-=
      1  Merge 'perf/perf/core' into devel-spot-201608061351
> git bisect  bad 330e37721baa51c0000b5ff1e09c99ba890f26d1  # 15:20      4-=
      4  Merge 'khilman-linux-amlogic/v4.7/integ' into devel-spot-201608061=
351
> git bisect good e434348347596a75a564d814f80ddbb2781101c7  # 15:43    309+=
    136  0day base guard for 'devel-spot-201608061351'
> git bisect  bad 94752aee4d53d037086ad8cb482d8ee29683f0f6  # 15:51     14-=
     11  Merge 'net/master' into devel-spot-201608061351
> git bisect  bad ff9a082fda424257976f08fce942609f358015e0  # 16:01      6-=
      5  Merge tag 'media/v4.8-4' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/mchehab/linux-media
> git bisect  bad 9c1958fc326a0a0a533ec8e86ea6fa30977207de  # 16:08      0-=
      3  Merge tag 'media/v4.8-1' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/mchehab/linux-media
> git bisect  bad c410614c902531d1ce2e46aec8ac91aa4dc89968  # 16:15      6-=
      4  Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tip/tip
> git bisect  bad b7545b79a1698b4cbcb5da94c105523b85ee7c90  # 16:20      2-=
      1  Merge tag 'usb-4.8-rc1' of git://git.kernel.org/pub/scm/linux/kern=
el/git/gregkh/usb
> git bisect good 78f5027132243b7071dc59ea6f717e2c48e12031  # 16:33    306+=
    124  iio: pressure: bmp280: support device tree initialization
> git bisect  bad 721413aff218118548b84b18cb5b49660e6e2940  # 16:39     17-=
      7  Merge tag 'tty-4.8-rc1' of git://git.kernel.org/pub/scm/linux/kern=
el/git/gregkh/tty
> git bisect  bad 25a0dc4be86fc0d8c7e81bb5f8be8427022bf15f  # 16:46      0-=
      1  Merge tag 'staging-4.8-rc1' of git://git.kernel.org/pub/scm/linux/=
kernel/git/gregkh/staging
> git bisect  bad 6d2e91a662256fd88ec0505567a59d21094ed415  # 16:56     60-=
     22  lkdtm: silence warnings about function declarations
> git bisect  bad 2a7fbcec95add146f76ac4d187719b3db884f290  # 17:02      0-=
      1  Merge tag 'lkdtm-next' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/kees/linux into char-misc-testing
> git bisect  bad 63c0c076e590ed83050c80ada2e82adeac9de126  # 17:38     55-=
     26  nvmem: imx-ocotp: add COMPILE_TEST for proper test coverage
> git bisect  bad dc1392727e32a5e467c13365e56e292e50ee084c  # 17:47     42-=
     31  Merge tag 'lkdtm-next' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/kees/linux into char-misc-testing
> git bisect  bad 9a49a528dcf3c2022ff89f700d5d0345b9abf288  # 17:52      0-=
      1  lkdtm: add function for testing .rodata section
> git bisect good 426f3a53d4a1ffbe228f268e5c4af148686b7346  # 18:06    305+=
     65  lkdtm: clean up after rename
> # first bad commit: [9a49a528dcf3c2022ff89f700d5d0345b9abf288] lkdtm: add=
 function for testing .rodata section
> git bisect good 426f3a53d4a1ffbe228f268e5c4af148686b7346  # 18:28    913+=
    344  lkdtm: clean up after rename
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 9a49a528dcf3c2022ff89f700d5d0345b9abf288  # 18:43     42-=
     10  lkdtm: add function for testing .rodata section
> # extra tests on HEAD of linux-devel/devel-spot-201608061351
> git bisect  bad 5eb7f58ccb08a2822f20afb2f4341474e1dece30  # 18:43      0-=
     33  0day head guard for 'devel-spot-201608061351'
> # extra tests on tree/branch linus/master
> git bisect  bad a157b3aaa44829998d5a079174df989e5d8c20ff  # 18:55    142-=
     47  Merge tag 'pwm/for-4.8-rc1' of git://git.kernel.org/pub/scm/linux/=
kernel/git/thierry.reding/linux-pwm
> # extra tests on tree/branch linus/master
> git bisect  bad a157b3aaa44829998d5a079174df989e5d8c20ff  # 18:55      0-=
     54  Merge tag 'pwm/for-4.8-rc1' of git://git.kernel.org/pub/scm/linux/=
kernel/git/thierry.reding/linux-pwm
> # extra tests on tree/branch linux-next/master
> git bisect  bad 73497be0342a39f81d5d291a8e3b7238bd6b3381  # 19:02     29-=
     10  Add linux-next specific files for 20160805
>
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
>
> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -cpu kvm64
>         -kernel $kernel
>         -initrd $initrd
>         -m 300
>         -smp 2
>         -device e1000,netdev=3Dnet0
>         -netdev user,id=3Dnet0
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -watchdog-action debug
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         root=3D/dev/ram0
>         hung_task_panic=3D1
>         debug
>         apic=3Ddebug
>         sysrq_always_enabled
>         rcupdate.rcu_cpu_stall_timeout=3D100
>         panic=3D-1
>         softlockup_panic=3D1
>         nmi_watchdog=3Dpanic
>         oops=3Dpanic
>         load_ramdisk=3D2
>         prompt_ramdisk=3D0
>         systemd.log_level=3Derr
>         ignore_loglevel
>         earlyprintk=3DttyS0,115200
>         console=3DttyS0,115200
>         console=3Dtty0
>         vga=3Dnormal
>         rw
>         drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



-- =

Kees Cook
Nexus Security

--===============5260916727308020312==--

