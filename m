Content-Type: multipart/mixed; boundary="===============7832151220472224809=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched] bf6579502f: WARNING: CPU: 0 PID: 124 at kernel/sched/sched.h:746 rq_clock_task
Date: Wed, 25 May 2016 15:08:57 +0200
Message-ID: <CAKfTPtAxYV2j8vqq3bBZUCkVhZCqZ-FiTh_oWY=SfXfusr5dRw@mail.gmail.com>
In-Reply-To: <20160525130506.GA11332@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7832151220472224809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

Thanks. I'm going to reproduce it with instructions in the email

Regards,
Vincent

On 25 May 2016 at 15:05, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Vincent,
>
> FYI, here is another bisect result.
>
> https://git.linaro.org/people/vincent.guittot/kernel.git sched/pelt
>
> commit bf6579502f1a1f5e9db84d66b9ab96d89ab5fc4d
> Author:     Vincent Guittot <vincent.guittot@linaro.org>
> AuthorDate: Tue May 24 15:03:19 2016 +0200
> Commit:     Vincent Guittot <vincent.guittot@linaro.org>
> CommitDate: Wed May 25 11:40:09 2016 +0200
>
>     sched: fix first task of a task group is attached twice
>
>     The cfs_rq->avg.last_update_time is intialize to 0 with the main effe=
ct
>     that the 1st sched_entity that will be attached, will keep its
>     last_update_time set to 0 and will attached once again during the
>     enqueue.
>     Initialize cfs_rq->avg.last_update_time to current rq's clock
>
>     Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>
> +------------------------------------------------+------------+----------=
--+------------+
> |                                                | ef0491ea17 | bf6579502=
f | b4735c643c |
> +------------------------------------------------+------------+----------=
--+------------+
> | boot_successes                                 | 62         | 0        =
  | 0          |
> | boot_failures                                  | 0          | 22       =
  | 13         |
> | WARNING:at_kernel/sched/sched.h:#rq_clock_task | 0          | 22       =
  | 13         |
> | backtrace:rq_clock_task                        | 0          | 22       =
  | 13         |
> | backtrace:init_tg_cfs_entry                    | 0          | 22       =
  | 13         |
> +------------------------------------------------+------------+----------=
--+------------+
>
> [    2.326794] usbcore: registered new interface driver udlfb
> [    2.329554] v86d (123) used greatest stack depth: 13776 bytes left
> [    2.330606] ------------[ cut here ]------------
> [    2.331312] WARNING: CPU: 0 PID: 124 at kernel/sched/sched.h:746 rq_cl=
ock_task+0x2f/0x39
> [    2.332713] Modules linked in:
> [    2.333302] CPU: 0 PID: 124 Comm: v86d Not tainted 4.6.0-rc7-00127-gbf=
65795 #237
> [    2.334409] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    2.335692]  0000000000000000 ffff88002b72fe00 ffffffff8176c352 000000=
0000000000
> [    2.337065]  0000000000000000 ffff88002b72fe40 ffffffff810e0b6f 000002=
ea2b72fda8
> [    2.338428]  ffff88002fbd7ec0 ffff88002b7ab500 0000000000000000 ffff88=
002b7ab500
> [    2.339810] Call Trace:
> [    2.340252]  [<ffffffff8176c352>] dump_stack+0x82/0xb8
> [    2.340996]  [<ffffffff810e0b6f>] __warn+0xc2/0xdd
> [    2.341696]  [<ffffffff810e0c46>] warn_slowpath_null+0x1d/0x1f
> [    2.342512]  [<ffffffff8110b804>] rq_clock_task+0x2f/0x39
> [    2.343275]  [<ffffffff811116bb>] init_tg_cfs_entry+0xaa/0xd3
> [    2.344104]  [<ffffffff811117ea>] alloc_fair_sched_group+0x106/0x137
> [    2.344980]  [<ffffffff81109eb8>] sched_create_group+0x33/0x61
> [    2.345801]  [<ffffffff811175d3>] sched_autogroup_create_attach+0x3b/0=
xfe
> [    2.346712]  [<ffffffff810f26b9>] sys_setsid+0xe7/0xf3
> [    2.347457]  [<ffffffff82eab67c>] entry_SYSCALL_64_fastpath+0x1f/0xbd
> [    2.348364]  [<ffffffff8111c1eb>] ? trace_hardirqs_off_caller+0x3f/0xab
> [    2.349294] ---[ end trace 97a5f7b919cfa32f ]---
> [    2.350467] uvesafb: SeaBIOS Developers, SeaBIOS VBE Adapter, Rev. 1, =
OEM: SeaBIOS VBE(C) 2011, VBE v3.0
>
> git bisect start b4735c643ca9cafd64ee250969d90c1e66038573 ef0491ea17f8019=
821c7e9c8e801184ecf17f85a --
> git bisect  bad bf6579502f1a1f5e9db84d66b9ab96d89ab5fc4d  # 20:12      0-=
     20  sched: fix first task of a task group is attached twice
> # first bad commit: [bf6579502f1a1f5e9db84d66b9ab96d89ab5fc4d] sched: fix=
 first task of a task group is attached twice
> git bisect good ef0491ea17f8019821c7e9c8e801184ecf17f85a  # 20:15     62+=
      0  ARM: Hide finish_arch_post_lock_switch() from modules
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad bf6579502f1a1f5e9db84d66b9ab96d89ab5fc4d  # 20:22      0-=
     49  sched: fix first task of a task group is attached twice
> # extra tests on HEAD of vincent.guittot/sched/pelt
> git bisect  bad b4735c643ca9cafd64ee250969d90c1e66038573  # 20:22      0-=
     13  sched: reflect sched_entity movement into task_group's utilization
> # extra tests on tree/branch vincent.guittot/sched/pelt
> git bisect  bad b4735c643ca9cafd64ee250969d90c1e66038573  # 20:22      0-=
     13  sched: reflect sched_entity movement into task_group's utilization
> # extra tests with first bad commit reverted
> git bisect good 180808ce9465b19908cb5b0932f32d15cd42969c  # 20:33     65+=
      3  Revert "sched: fix first task of a task group is attached twice"
> # extra tests on tree/branch linus/master
> git bisect good 28165ec7a99be98123aa89540bf2cfc24df19498  # 20:35     61+=
      0  Merge tag 'armsoc-fixes' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/arm/arm-soc
> # extra tests on tree/branch linux-next/master
> git bisect good 66c198deda3725c57939c6cdaf2c9f5375cd79ad  # 20:38     65+=
      1  Add linux-next specific files for 20160524
>
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dyocto-minimal-x86_64.cgz
>
> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -cpu Haswell,+smep,+smap
>         -kernel $kernel
>         -initrd $initrd
>         -m 768
>         -smp 1
>         -device e1000,netdev=3Dnet0
>         -netdev user,id=3Dnet0
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         hung_task_panic=3D1
>         earlyprintk=3DttyS0,115200
>         systemd.log_level=3Derr
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
>         console=3DttyS0,115200
>         console=3Dtty0
>         vga=3Dnormal
>         root=3D/dev/ram0
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

--===============7832151220472224809==--

