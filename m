Content-Type: multipart/mixed; boundary="===============7600989435464423370=="
MIME-Version: 1.0
From: 苏家训 <sujiaxun@uniontech.com>
To: lkp@lists.01.org
Subject: Re: [mm] 00a096aab8: BUG:KASAN:global-out-of-bounds_in__register_sysctl_table
Date: Thu, 17 Feb 2022 16:57:15 +0800
Message-ID: <<53b4cbc8-2176-2971-fa6c-ac7f9f2543dd@uniontech.com>+707799A75670DF05>
In-Reply-To: <20220217081243.GC21114@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7600989435464423370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



=E5=9C=A8 2022/2/17 16:12, kernel test robot =E5=86=99=E9=81=93:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with clang-15):
> =

> commit: 00a096aab808141e4c240f093ffbe831f5d882b4 ("[PATCH] [v2] mm: move =
oom_kill sysctls to their own file")
> url: https://github.com/0day-ci/linux/commits/sujiaxun/mm-move-oom_kill-s=
ysctls-to-their-own-file/20220215-173356
> base: https://github.com/hnaz/linux-mm master
> patch link: https://lore.kernel.org/lkml/20220215093203.31032-1-sujiaxun(=
a)uniontech.com
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------------------------------------------------+------------+=
------------+
> |                                                          | 12b457ff53 |=
 00a096aab8 |
> +----------------------------------------------------------+------------+=
------------+
> | boot_successes                                           | 10         |=
 0          |
> | boot_failures                                            | 0          |=
 8          |
> | BUG:KASAN:global-out-of-bounds_in__register_sysctl_table | 0          |=
 8          |
> +----------------------------------------------------------+------------+=
------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [    2.595877][    T1] PCI: Using configuration type 1 for base access
> [    2.748020][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    2.749023][    T1] BUG: KASAN: global-out-of-bounds in __register_sys=
ctl_table+0xaf/0xe80
> [    2.749902][    T1] Read of size 8 at addr ffffffff8632d8a0 by task sw=
apper/1
> [    2.750698][    T1]
> [    2.750967][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.17.0-rc4=
-mm1-00317-g00a096aab808 #1 d6c56bb9459e37e0c86ad4e0175fba650db6923b
> [    2.752255][    T1] Call Trace:
> [    2.752612][    T1]  <TASK>
> [    2.752953][    T1]  dump_stack_lvl+0x19/0x40
> [    2.753420][    T1]  print_address_description+0x81/0x400
> [    2.754005][    T1]  __kasan_report+0x16b/0x1c0
> [    2.754498][    T1]  ? __register_sysctl_table+0xaf/0xe80
> [    2.755116][    T1]  ? __register_sysctl_table+0xaf/0xe80
> [    2.755694][    T1]  kasan_report+0x53/0x80
> [    2.756171][    T1]  __asan_report_load8_noabort+0x14/0x40
> [    2.756805][    T1]  __register_sysctl_table+0xaf/0xe80
> [    2.757373][    T1]  ? __kasan_check_read+0x11/0x40
> [    2.757746][    T1]  ? try_to_wake_up+0x591/0x880
> [    2.757746][    T1]  __register_sysctl_init+0x1f/0x40
> [    2.757746][    T1]  ? pagecache_init+0x40/0x40
> [    2.757746][    T1]  oom_init+0x53/0x80
> [    2.757746][    T1]  do_one_initcall+0x19b/0x4c0
> [    2.757746][    T1]  ? pagecache_init+0x40/0x40
> [    2.757746][    T1]  do_initcall_level+0x1b8/0x300
> [    2.757746][    T1]  do_initcalls+0x4b/0x80
> [    2.757746][    T1]  do_basic_setup+0x69/0x80
> [    2.757746][    T1]  kernel_init_freeable+0xe3/0x180
> [    2.757746][    T1]  ? rest_init+0x180/0x180
> [    2.757746][    T1]  kernel_init+0x18/0x1c0
> [    2.757746][    T1]  ? rest_init+0x180/0x180
> [    2.757746][    T1]  ret_from_fork+0x22/0x30
> [    2.757746][    T1]  </TASK>
> [    2.757746][    T1]
> [    2.757746][    T1] The buggy address belongs to the variable:
> [    2.757746][    T1]  vm_oom_kill_table+0xc0/0xe0
> [    2.757746][    T1]
> [    2.757746][    T1] Memory state around the buggy address:
> [    2.757746][    T1]  ffffffff8632d780: 00 00 00 00 00 f9 f9 f9 f9 f9 f=
9 f9 00 00 00 00
> [    2.757746][    T1]  ffffffff8632d800: 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00
> [    2.757746][    T1] >ffffffff8632d880: 00 00 00 00 f9 f9 f9 f9 00 00 0=
0 00 00 00 00 00
> [    2.757746][    T1]                                ^
> [    2.757746][    T1]  ffffffff8632d900: 00 00 00 f9 f9 f9 f9 f9 00 00 0=
0 00 00 00 00 00
> [    2.757746][    T1]  ffffffff8632d980: 00 f9 f9 f9 f9 f9 f9 f9 04 f9 f=
9 f9 00 00 00 00
> [    2.757746][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> =

> =

> =

> To reproduce:
> =

>          # build kernel
> 	cd linux
> 	cp config-5.17.0-rc4-mm1-00317-g00a096aab808 .config
> 	make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Dx86_64 olddefconfig prepare =
modules_prepare bzImage modules
> 	make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<m=
od-install-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> =

> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script=
 is attached in this email
> =

>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
> This issue has been resolved.

Link: https://lkml.kernel.org/r/20220216193202.28838626(a)canb.auug.org.au



--===============7600989435464423370==--

