Content-Type: multipart/mixed; boundary="===============6228641292114579477=="
MIME-Version: 1.0
From: Nikolay Borisov <nborisov@suse.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 70d28b0e4f: BUG:kernel_reboot-without-warning_in_early-boot_stage, last_printk:Probing_EDD(edd=off_to_disable)...ok
Date: Mon, 01 Apr 2019 16:28:12 +0300
Message-ID: <f3cef716-a1e3-2e84-0133-9a9c3fad2a74@suse.com>
In-Reply-To: <20190401132427.GC9217@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6228641292114579477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1.04.19 =D0=B3. 16:24 =D1=87., kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 70d28b0e4f8ed2d38571e7b1f9bec7f321a53102 ("btrfs: tree-checker: V=
erify dev item")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

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
--------------------------------+------------+------------+
> |                                                                        =
                                | 36b9d2bc69 | 70d28b0e4f |
> +------------------------------------------------------------------------=
--------------------------------+------------+------------+
> | boot_successes                                                         =
                                | 14         | 0          |
> | boot_failures                                                          =
                                | 2          | 14         |
> | IP-Config:Auto-configuration_of_network_failed                         =
                                | 2          |            |
> | BUG:kernel_reboot-without-warning_in_early-boot_stage,last_printk:Probi=
ng_EDD(edd=3Doff_to_disable)...ok | 0          | 14         |
> +------------------------------------------------------------------------=
--------------------------------+------------+------------+
> =

> =

> =

> early console in setup code
> Probing EDD (edd=3Doff to disable)... ok
> BUG: kernel reboot-without-warning in early-boot stage, last printk: Prob=
ing EDD (edd=3Doff to disable)... ok
> Linux version 5.0.0-rc8-00196-g70d28b0 #1
> Command line: ip=3D::::vm-snb-quantal-x86_64-1415::dhcp root=3D/dev/ram0 =
user=3Dlkp job=3D/lkp/jobs/scheduled/vm-snb-quantal-x86_64-1415/trinity-300=
s-quantal-core-x86_64-2018-11-09.cgz-70d28b0-20190330-29362-1y6g0qb-2.yaml =
ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-s5-03231928 branch=3Dlinux-devel/=
devel-hourly-2019032317 commit=3D70d28b0e4f8ed2d38571e7b1f9bec7f321a53102 B=
OOT_IMAGE=3D/pkg/linux/x86_64-randconfig-s5-03231928/gcc-7/70d28b0e4f8ed2d3=
8571e7b1f9bec7f321a53102/vmlinuz-5.0.0-rc8-00196-g70d28b0 max_uptime=3D1500=
 RESULT_ROOT=3D/result/trinity/300s/vm-snb-quantal-x86_64/quantal-core-x86_=
64-2018-11-09.cgz/x86_64-randconfig-s5-03231928/gcc-7/70d28b0e4f8ed2d38571e=
7b1f9bec7f321a53102/8 LKP_SERVER=3Dinn debug apic=3Ddebug sysrq_always_enab=
led rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Do=
n panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ra=
mdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr i=
gnore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 console=3DttyS0,11=
5200 vga=3Dnormal rw rcuperf.shutdown=3D0
> =


Can this report be made useful by actually including output from serial
console? For example possible bug-ons or whatnot? dmesg.xz just contains
qemu's command line + some metadata about the test and :

"BUG: kernel reboot-without-warning in early-boot stage, last printk:
Probing EDD (edd=3Doff to disable)... ok"

At least a stack trace would have been useful.

<snip>

--===============6228641292114579477==--

