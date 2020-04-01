Content-Type: multipart/mixed; boundary="===============6191775991396656844=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [tracing] cd8f62b481: BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
Date: Wed, 01 Apr 2020 23:07:00 +0900
Message-ID: <20200401230700.d9ddb42b3459dca98144b55c@kernel.org>
In-Reply-To: <20200326091256.GR11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6191775991396656844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Thu, 26 Mar 2020 17:12:56 +0800
kernel test robot <rong.a.chen@intel.com> wrote:

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: cd8f62b481530fafbeacee0d3283b60bcf42d854 ("[PATCH 02/12 v2] traci=
ng: Save off entry when peeking at next entry")
> url: https://github.com/0day-ci/linux/commits/Steven-Rostedt/ring-buffer-=
tracing-Remove-disabling-of-ring-buffer-while-reading-trace-file/20200320-0=
73240
> =


Hmm, this seems that we can not call kmalloc() in ftrace_dump().
Maybe we can fix it by
- Use GFP_ATOMIC.
 or
- Do not use iter->temp if it is NULL. (it is safe since ftrace_dump() stop=
s tracing)

What would you think?

Thank you,

> =

> in testcase: rcuperf
> with following parameters:
> =

> 	runtime: 300s
> 	perf_type: rcu
> =

> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------------------------------------------------------+-------=
-----+------------+
> |                                                                | 2e2bf1=
7ca0 | cd8f62b481 |
> +----------------------------------------------------------------+-------=
-----+------------+
> | boot_successes                                                 | 13    =
     | 0          |
> | boot_failures                                                  | 0     =
     | 8          |
> | BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h | 0     =
     | 8          |
> +----------------------------------------------------------------+-------=
-----+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [   16.821280] BUG: sleeping function called from invalid context at mm/s=
lab.h:565
> [   16.822211] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 158=
, name: rcu_perf_writer
> [   16.823164] no locks held by rcu_perf_writer/158.
> [   16.823650] CPU: 0 PID: 158 Comm: rcu_perf_writer Not tainted 5.6.0-rc=
6-00081-gcd8f62b481530f #1
> [   16.824856] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [   16.826220] Call Trace:
> [   16.826667]  dump_stack+0x16/0x18
> [   16.827265]  ___might_sleep+0x104/0x118
> [   16.827947]  __might_sleep+0x69/0x70
> [   16.828600]  ? __fs_reclaim_release+0x17/0x19
> [   16.829374]  slab_pre_alloc_hook+0x34/0x6e
> [   16.830107]  __kmalloc+0x48/0xe8
> [   16.830710]  ? rb_reader_unlock+0x2b/0x3c
> [   16.831205]  ? trace_find_next_entry+0x84/0x133
> [   16.831723]  trace_find_next_entry+0x84/0x133
> [   16.832217]  trace_print_lat_context+0x4b/0x437
> [   16.832730]  ? rb_event_length+0x56/0x67
> [   16.833186]  ? ring_buffer_event_length+0x34/0x79
> [   16.833728]  ? __find_next_entry+0xd3/0x1c2
> [   16.834190]  print_trace_line+0x69d/0x767
> [   16.834666]  ftrace_dump+0x285/0x437
> [   16.835055]  rcu_perf_writer+0x25f/0x34e
> [   16.835476]  kthread+0xdf/0xe1
> [   16.835823]  ? rcu_perf_reader+0x9c/0x9c
> [   16.836264]  ? kthread_create_worker_on_cpu+0x1c/0x1c
> [   16.836834]  ret_from_fork+0x2e/0x38
> [   16.837270] rb_produ-160     0.... 6528532us : ring_buffer_producer: S=
tarting ring buffer hammer
> [   16.838318] rb_produ-160     0.... 16529141us : ring_buffer_producer: =
End ring buffer hammer
> [   16.839349] rb_produ-160     0.... 16558157us : ring_buffer_producer: =
Running Consumer at nice: 19
> [   16.840382] rb_produ-160     0.... 16558162us : ring_buffer_producer: =
Running Producer at nice: 19
> [   16.841401] rb_produ-160     0.... 16558163us : ring_buffer_producer: =
WARNING!!! This test is running at lowest priority.
> [   16.854781] rb_produ-160     0.... 16558164us : ring_buffer_producer: =
Time:     10000604 (usecs)
> [   16.857354] rb_produ-160     0.... 16558165us : ring_buffer_producer: =
Overruns: 6117960
> [   16.858322] rb_produ-160     0.... 16558166us : ring_buffer_producer: =
Read:     4356190  (by events)
> [   16.859404] rb_produ-160     0.... 16558167us : ring_buffer_producer: =
Entries:  44650
> [   16.860329] rb_produ-160     0.... 16558167us : ring_buffer_producer: =
Total:    10518800
> [   16.861226] rb_produ-160     0.... 16558168us : ring_buffer_producer: =
Missed:   0
> [   16.862124] rb_produ-160     0.... 16558169us : ring_buffer_producer: =
Hit:      10518800
> [   16.863087] rb_produ-160     0.... 16558170us : ring_buffer_producer: =
Entries per millisec: 1051
> [   16.864123] rb_produ-160     0.... 16558171us : ring_buffer_producer: =
951 ns per entry
> [   16.865074] rb_produ-160     0.... 16558172us : ring_buffer_producer_t=
hread: Sleeping for 10 secs
> [   16.866105] ---------------------------------
> [   16.866725] rcu-perf: Test complete
> [   16.878198] random: fast init done
> =

> Elapsed time: 60
> =

> qemu-img create -f qcow2 disk-vm-snb-i386-9-0 256G
> qemu-img create -f qcow2 disk-vm-snb-i386-9-1 256G
> qemu-img create -f qcow2 disk-vm-snb-i386-9-2 256G
> qemu-img create -f qcow2 disk-vm-snb-i386-9-3 256G
> qemu-img create -f qcow2 disk-vm-snb-i386-9-4 256G
> qemu-img create -f qcow2 disk-vm-snb-i386-9-5 256G
> qemu-img create -f qcow2 disk-vm-snb-i386-9-6 256G
> =

> kvm=3D(
> 	qemu-system-i386
> 	-enable-kvm
> 	-cpu SandyBridge
> 	-kernel $kernel
> 	-initrd initrd-vm-snb-i386-9.cgz
> 	-m 8192
> 	-smp 2
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0,hostfwd=3Dtcp::32032-:22
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-drive file=3Ddisk-vm-snb-i386-9-0,media=3Ddisk,if=3Dvirtio
> 	-drive file=3Ddisk-vm-snb-i386-9-1,media=3Ddisk,if=3Dvirtio
> 	-drive file=3Ddisk-vm-snb-i386-9-2,media=3Ddisk,if=3Dvirtio
> 	-drive file=3Ddisk-vm-snb-i386-9-3,media=3Ddisk,if=3Dvirtio
> 	-drive file=3Ddisk-vm-snb-i386-9-4,media=3Ddisk,if=3Dvirtio
> 	-drive file=3Ddisk-vm-snb-i386-9-5,media=3Ddisk,if=3Dvirtio
> 	-drive file=3Ddisk-vm-snb-i386-9-6,media=3Ddisk,if=3Dvirtio
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	ip=3D::::vm-snb-i386-9::dhcp
> 	root=3D/dev/ram0
> 	user=3Dlkp
> 	job=3D/job-script
> 	ARCH=3Di386
> 	kconfig=3Di386-randconfig-g003-20200324
> 	branch=3Dlinux-devel/devel-hourly-2020032505
> 	commit=3Dcd8f62b481530fafbeacee0d3283b60bcf42d854
> 	BOOT_IMAGE=3D/pkg/linux/i386-randconfig-g003-20200324/gcc-7/cd8f62b48153=
0fafbeacee0d3283b60bcf42d854/vmlinuz-5.6.0-rc6-00081-gcd8f62b481530f
> 	max_uptime=3D1500
> 	RESULT_ROOT=3D/result/rcuperf/rcu-300s/vm-snb-i386/yocto-i386-minimal-20=
190520.cgz/i386-randconfig-g003-20200324/gcc-7/cd8f62b481530fafbeacee0d3283=
b60bcf42d854/3
> 	result_service=3Dtmpfs
> 	selinux=3D0
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	net.ifnames=3D0
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.6.0-rc6-00081-gcd8f62b481530f .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> Rong Chen
> =



-- =

Masami Hiramatsu <mhiramat@kernel.org>
--===============6191775991396656844==--

