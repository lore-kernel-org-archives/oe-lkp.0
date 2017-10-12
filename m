Content-Type: multipart/mixed; boundary="===============6068076127834780979=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Thu, 12 Oct 2017 17:21:55 +0800
Message-ID: <20171012092155.eujxes7f5k2fcjhp@wfg-t540p.sh.intel.com>
In-Reply-To: <20171012084725.zclmk65qvym5xek7@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6068076127834780979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 10:47:25AM +0200, Peter Zijlstra wrote:
>On Tue, Oct 03, 2017 at 10:06:34PM +0800, Fengguang Wu wrote:
>
>> #!/bin/bash
>>
>> kernel=3D$1
>> initrd=3Dopenwrt-trinity-i386.cgz
>>
>> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/=
master/initrd/$initrd
>>
>> kvm=3D(
>> 	qemu-system-x86_64
>> 	-enable-kvm
>> 	-cpu Haswell,+smep
>> 	-kernel $kernel
>> 	-initrd $initrd
>> 	-m 256
>> 	-smp 1
>> 	-device e1000,netdev=3Dnet0
>> 	-netdev user,id=3Dnet0
>> 	-boot order=3Dnc
>> 	-no-reboot
>> 	-watchdog i6300esb
>> 	-watchdog-action debug
>> 	-rtc base=3Dlocaltime
>> 	-serial stdio
>> 	-display none
>> 	-monitor null
>> )
>>
>> append=3D(
>> 	root=3D/dev/ram0
>> 	hung_task_panic=3D1
>> 	debug
>> 	apic=3Ddebug
>> 	sysrq_always_enabled
>> 	rcupdate.rcu_cpu_stall_timeout=3D100
>> 	net.ifnames=3D0
>> 	printk.devkmsg=3Don
>> 	panic=3D-1
>> 	softlockup_panic=3D1
>> 	nmi_watchdog=3Dpanic
>> 	oops=3Dpanic
>> 	load_ramdisk=3D2
>> 	prompt_ramdisk=3D0
>> 	drbd.minor_count=3D8
>> 	systemd.log_level=3Derr
>> 	ignore_loglevel
>> 	console=3Dtty0
>> 	earlyprintk=3DttyS0,115200
>> 	console=3DttyS0,115200
>> 	vga=3Dnormal
>> 	rw
>> 	drbd.minor_count=3D8
>> )
>>
>> "${kvm[@]}" -append "${append[*]}"
>
>
>So I was wanting to go chase that one splat you triggered, but the above
>(after s/Haswell,+smep/host/) boots right up until it wants an init:
>
>[    0.000000] Kernel command line: root=3D/dev/ram0 hung_task_panic=3D1 d=
ebug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100=
 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_wa=
tchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_=
count=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprint=
k=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw drbd.minor_count=3D8
>
>[   35.721719] Kernel panic - not syncing: No working init found.  Try pas=
sing init=3D option to kernel. See Linux Documentation/admin-guide/init.rst=
 for guidance.

Well I got the same result. The script and initrd image matches well
with my local version. I'll dig what goes wrong.

>And it did download that initrd thingy...
>
>$ shasum openwrt-trinity-i386.cgz
>0a405d02a162defd82a5ffd556fd24e0ee2f994a  openwrt-trinity-i386.cgz
>
>
>Anything else I need?
>

--===============6068076127834780979==--

