Content-Type: multipart/mixed; boundary="===============8357180008947380099=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/topology] 6a1447190e: BUG: unable to handle kernel paging request at ffffffffffffffff
Date: Fri, 26 Feb 2016 16:36:38 +0800
Message-ID: <87a8mn7trd.fsf@yhuang-dev.intel.com>
In-Reply-To: <alpine.DEB.2.11.1602260854030.3638@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============8357180008947380099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thomas Gleixner <tglx@linutronix.de> writes:

> On Fri, 26 Feb 2016, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/co=
re
>> commit 6a1447190e7f7540be17414db801ac6a12d77566 ("x86/topology: Create l=
ogical package id")
>> =

>> [    4.686741] smpboot: Total of 160 processors activated (936319.36 Bog=
oMIPS)
>> [    5.326197] BUG: unable to handle kernel paging request at ffffffffff=
ffffff
>> [    5.328153] IP: [<ffffffff81211303>] __kmalloc_track_caller+0x106/0x1=
cb
>
> I have no idea how that is related.
>
>> To reproduce:
>> =

>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>
> I finally gave it a try and to be honest it's completely useless.
>
> root(a)herakles:/home/tglx/work/kernel/lkp/lkp-tests# bin/lkp install job=
.yaml
>
>   Creating testbox configuration file: /home/tglx/work/kernel/lkp/lkp-tes=
ts/hosts/herakles.
>   /home/tglx/work/kernel/lkp/lkp-tests/lkp-exec/install: 87: /home/tglx/w=
ork/kernel/lkp/lkp-tests/lkp-exec/install: Bad substitution
>
> Which is not a surprise as neither hdd_partitions nor ssd_partitions can =
be
> evaluated.
>
> After creating that config file manually I run the job:
>
> # bin/lkp run     job.yaml =

> wait for background monitors: oom-killer watchdog
>
> That returns after roughly 1 second doing nothing w/o any result.

Sorry, the reproduce steps in the original email is not correct.  In
fact, this is a boot error even before the user space run.  The qemu
command line i demsg.xz attached in the original email may help producing.

qemu-system-x86_64 -enable-kvm -kernel /pkg/linux/x86_64-lkp/gcc-4.9/6a1447=
190e7f7540be17414db801ac6a12d77566/vmlinuz-4.5.0-rc4-00211-g6a14471 -append=
 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-client7-1G-3/bisect_l=
ocktorture-300s-debian-x86_64-2015-02-07.cgz-x86_64-lkp-6a1447190e7f7540be1=
7414db801ac6a12d77566-20160225-17029-1yepae-0.yaml ARCH=3Dx86_64 kconfig=3D=
x86_64-lkp branch=3Dlinux-devel/devel-catchup-201602250443 commit=3D6a14471=
90e7f7540be17414db801ac6a12d77566 BOOT_IMAGE=3D/pkg/linux/x86_64-lkp/gcc-4.=
9/6a1447190e7f7540be17414db801ac6a12d77566/vmlinuz-4.5.0-rc4-00211-g6a14471=
 max_uptime=3D1500 RESULT_ROOT=3D/result/locktorture/300s/vm-client7-1G/deb=
ian-x86_64-2015-02-07.cgz/x86_64-lkp/gcc-4.9/6a1447190e7f7540be17414db801ac=
6a12d77566/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=
=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeo=
ut=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic =
load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 v=
ga=3Dnormal rw ip=3D::::vm-client7-1G-3::dhcp'  -initrd /fs/sda3/initrd-vm-=
client7-1G-3 -m 1024 -smp 160 -device e1000,netdev=3Dnet0 -netdev user,id=
=3Dnet0,hostfwd=3Dtcp::23502-:22 -boot order=3Dnc -no-reboot -watchdog i630=
0esb -rtc base=3Dlocaltime -drive file=3D/fs/sda3/disk0-vm-client7-1G-3,med=
ia=3Ddisk,if=3Dvirtio -drive file=3D/fs/sda3/disk1-vm-client7-1G-3,media=3D=
disk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-client7-1G-3 -serial file:/=
dev/shm/kboot/serial-vm-client7-1G-3 -daemonize -display none -monitor null =


Best Regards,
Huang, Ying

> Thanks,
>
> 	tglx
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============8357180008947380099==--

