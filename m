Content-Type: multipart/mixed; boundary="===============0646823402780077774=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [function_graph] 02519fa3c4: BUG:kernel_reboot-without-warning_in_early-boot_stage, last_printk:early_console_in_setup_code
Date: Mon, 29 Apr 2019 17:17:00 -0400
Message-ID: <20190429171700.4d48791c@gandalf.local.home>
In-Reply-To: <20190429075629.GD29809@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0646823402780077774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Apr 2019 15:56:29 +0800
kernel test robot <lkp@intel.com> wrote:

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 02519fa3c43164aa8ee0ebbe1b464a568130a36f ("function_graph: Use a =
ftrace_graph_ret_stub() for return")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =


Thanks. Seems that ftrace_graph_return is expected to point at
ftrace_stub when not in use, and this is critical when DYNAMIC_FTRACE
is not enabled (and for various other architectures).

I'll have to just remove this change for upstream (and rebase my
for-next, which I usually try to avoid doing. But this shouldn't hurt).

-- Steve

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 2G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
-----------------------+------------+------------+
> |                                                                        =
                       | 52fde6e70c | 02519fa3c4 |
> +------------------------------------------------------------------------=
-----------------------+------------+------------+
> | boot_successes                                                         =
                       | 4          | 0          |
> | boot_failures                                                          =
                       | 0          | 4          |
> | BUG:kernel_reboot-without-warning_in_early-boot_stage,last_printk:early=
_console_in_setup_code | 0          | 4          |
> +------------------------------------------------------------------------=
-----------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> early console in setup code
> BUG: kernel reboot-without-warning in early-boot stage, last printk: earl=
y console in setup code
> Linux version 5.1.0-rc3-00023-g02519fa #1
> Command line: ip=3D::::vm-snb-quantal-ia32-804::dhcp root=3D/dev/ram0 use=
r=3Dlkp job=3D/lkp/jobs/scheduled/vm-snb-quantal-ia32-804/trinity-300s-quan=
tal-core-i386-2019-04-26.cgz-02519fa3c43-20190429-62375-116iczn-1.yaml ARCH=
=3Dx86_64 kconfig=3Dx86_64-randconfig-s3-04261012 branch=3Dlinux-devel/deve=
l-hourly-2019042607 commit=3D02519fa3c43164aa8ee0ebbe1b464a568130a36f BOOT_=
IMAGE=3D/pkg/linux/x86_64-randconfig-s3-04261012/gcc-7/02519fa3c43164aa8ee0=
ebbe1b464a568130a36f/vmlinuz-5.1.0-rc3-00023-g02519fa max_uptime=3D1500 RES=
ULT_ROOT=3D/result/trinity/300s/vm-snb-quantal-ia32/quantal-core-i386-2019-=
04-26.cgz/x86_64-randconfig-s3-04261012/gcc-7/02519fa3c43164aa8ee0ebbe1b464=
a568130a36f/3 LKP_SERVER=3Dinn debug apic=3Ddebug sysrq_always_enabled rcup=
date.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=
=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=
=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr ignore=
_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 console=3DttyS0,115200 =
vga=3Dn
 ormal rw rcuperf.shutdown=3D0
> =

> Elapsed time: 30
> =

> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.1.0-rc3-00023-g02519fa .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 modules_prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 SHELL=3D/bin/bash
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 bzImage
> =

> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> lkp
> =



--===============0646823402780077774==--

