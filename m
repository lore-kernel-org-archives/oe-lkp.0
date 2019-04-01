Content-Type: multipart/mixed; boundary="===============3451744057648815520=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 70d28b0e4f: BUG:kernel_reboot-without-warning_in_early-boot_stage, last_printk:Probing_EDD(edd=off_to_disable)...ok
Date: Mon, 01 Apr 2019 23:02:37 +0800
Message-ID: <23823210-1951-0492-1755-6263ccf388fa@intel.com>
In-Reply-To: <5b82b026-bdd7-f781-e661-f1afdc9cb97b@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3451744057648815520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 4/1/2019 10:29 PM, Qu Wenruo wrote:
>
> On 2019/4/1 =E4=B8=8B=E5=8D=8810:02,  Chen, Rong A  wrote:
>> On 4/1/2019 9:28 PM, Nikolay Borisov wrote:
>>> On 1.04.19 =D0=B3. 16:24 =D1=87., kernel test robot wrote:
>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>
>>>> commit: 70d28b0e4f8ed2d38571e7b1f9bec7f321a53102 ("btrfs:
>>>> tree-checker: Verify dev item")
>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>>
>>>> in testcase: trinity
>>>> with following parameters:
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0runtime: 300s
>>>>
>>>> test-description: Trinity is a linux system call fuzz tester.
>>>> test-url: http://codemonkey.org.uk/projects/trinity/
>>>>
>>>>
>>>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp
>>>> 2 -m 2G
>>>>
>>>> caused below changes (please refer to attached dmesg/kmsg for entire
>>>> log/backtrace):
>>>>
>>>>
>>>> +---------------------------------------------------------------------=
-----------------------------------+------------+------------+
>>>>
>>>> |
>>>> | 36b9d2bc69 | 70d28b0e4f |
>>>> +---------------------------------------------------------------------=
-----------------------------------+------------+------------+
>>>>
>>>> |
>>>> boot_successes
>>>> | 14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> |
>>>> boot_failures
>>>> | 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> |
>>>> IP-Config:Auto-configuration_of_network_failed
>>>> | 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> |
>>>> BUG:kernel_reboot-without-warning_in_early-boot_stage,last_printk:Prob=
ing_EDD(edd=3Doff_to_disable)...ok
>>>> | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> +---------------------------------------------------------------------=
-----------------------------------+------------+------------+
>>>>
>>>>
>>>>
>>>>
>>>> early console in setup code
>>>> Probing EDD (edd=3Doff to disable)... ok
>>>> BUG: kernel reboot-without-warning in early-boot stage, last printk:
>>>> Probing EDD (edd=3Doff to disable)... ok
>>>> Linux version 5.0.0-rc8-00196-g70d28b0 #1
>>>> Command line: ip=3D::::vm-snb-quantal-x86_64-1415::dhcp root=3D/dev/ra=
m0
>>>> user=3Dlkp
>>>> job=3D/lkp/jobs/scheduled/vm-snb-quantal-x86_64-1415/trinity-300s-quan=
tal-core-x86_64-2018-11-09.cgz-70d28b0-20190330-29362-1y6g0qb-2.yaml
>>>> ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-s5-03231928
>>>> branch=3Dlinux-devel/devel-hourly-2019032317
>>>> commit=3D70d28b0e4f8ed2d38571e7b1f9bec7f321a53102
>>>> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-s5-03231928/gcc-7/70d28b0e4f=
8ed2d38571e7b1f9bec7f321a53102/vmlinuz-5.0.0-rc8-00196-g70d28b0
>>>> max_uptime=3D1500
>>>> RESULT_ROOT=3D/result/trinity/300s/vm-snb-quantal-x86_64/quantal-core-=
x86_64-2018-11-09.cgz/x86_64-randconfig-s5-03231928/gcc-7/70d28b0e4f8ed2d38=
571e7b1f9bec7f321a53102/8
>>>> LKP_SERVER=3Dinn debug apic=3Ddebug sysrq_always_enabled
>>>> rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3D=
on
>>>> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic
>>>> load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8
>>>> systemd.log_level=3Derr ignore_loglevel console=3Dtty0
>>>> earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw
>>>> rcuperf.shutdown=3D0
>>>>
>>> Can this report be made useful by actually including output from serial
>>> console? For example possible bug-ons or whatnot? dmesg.xz just contains
>>> qemu's command line + some metadata about the test and :
>>>
>>> "BUG: kernel reboot-without-warning in early-boot stage, last printk:
>>> Probing EDD (edd=3Doff to disable)... ok"
>>>
>>> At least a stack trace would have been useful.
>>>
>>> <snip>
>>
>> Hi,
>>
>> We usually use the tool ("bin/lkp qemu -k <bzImage> job-script") to
>> reproduce it.=C2=A0 It seems no stack trace in the result:
> So there is no regression at that commit right?
>
> Just some false alert?


Hi,

I think there's a regression, it stopped in the early-boot stage .

Best Regards,
Rong Chen


> Thanks,
> Qu
>
>> $ lkp qemu -k vmlinuz-5.0.0-rc8-00196-g70d28b0 job-script
>> ...
>> Formatting '/tmp/vdisk-nfs/disk-vm-snb-quantal-x86_64-1415-0', fmt=3Dqco=
w2
>> size=3D274877906944 cluster_size=3D65536 lazy_refcounts=3Doff refcount_b=
its=3D16
>> Formatting '/tmp/vdisk-nfs/disk-vm-snb-quantal-x86_64-1415-1', fmt=3Dqco=
w2
>> size=3D274877906944 cluster_size=3D65536 lazy_refcounts=3Doff refcount_b=
its=3D16
>> exec command: qemu-system-x86_64 -enable-kvm -fsdev
>> local,id=3Dtest_dev,path=3D/home/nfs/.lkp//result/trinity/300s/vm-snb-qu=
antal-x86_64/quantal-core-x86_64-2018-11-09.cgz/x86_64-randconfig-s5-032319=
28/gcc-7/70d28b0e4f8ed2d38571e7b1f9bec7f321a53102/2,security_model=3Dnone
>> -device virtio-9p-pci,fsdev=3Dtest_dev,mount_tag=3D9p/virtfs_mount -kern=
el
>> vmlinuz-5.0.0-rc8-00196-g70d28b0 -append root=3D/dev/ram0 user=3Dlkp
>> job=3D/lkp/jobs/scheduled/vm-snb-quantal-x86_64-1415/trinity-300s-quanta=
l-core-x86_64-2018-11-09.cgz-70d28b0-20190330-29362-1y6g0qb-2.yaml
>> ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-s5-03231928
>> branch=3Dlinux-devel/devel-hourly-2019032317
>> commit=3D70d28b0e4f8ed2d38571e7b1f9bec7f321a53102
>> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-s5-03231928/gcc-7/70d28b0e4f8e=
d2d38571e7b1f9bec7f321a53102/vmlinuz-5.0.0-rc8-00196-g70d28b0
>> max_uptime=3D1500
>> RESULT_ROOT=3D/result/trinity/300s/vm-snb-quantal-x86_64/quantal-core-x8=
6_64-2018-11-09.cgz/x86_64-randconfig-s5-03231928/gcc-7/70d28b0e4f8ed2d3857=
1e7b1f9bec7f321a53102/8
>> LKP_LOCAL_RUN=3D1 debug apic=3Ddebug sysrq_always_enabled
>> rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don
>> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_r=
amdisk=3D2
>> prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr
>> ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200
>> console=3DttyS0,115200 vga=3Dnormal rw ip=3Ddhcp
>> result_service=3D9p/virtfs_mount -initrd /home/nfs/.lkp/cache/final_init=
rd
>> -smp 2 -m 2048M -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime
>> -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -display none -monitor
>> null -serial stdio -drive
>> file=3D/tmp/vdisk-nfs/disk-vm-snb-quantal-x86_64-1415-0,media=3Ddisk,if=
=3Dvirtio
>> -drive
>> file=3D/tmp/vdisk-nfs/disk-vm-snb-quantal-x86_64-1415-1,media=3Ddisk,if=
=3Dvirtio
>> early console in setup code
>> Probing EDD (edd=3Doff to disable)... ok
>>
>> Best Regards,
>> Rong Chen
>>
>>

--===============3451744057648815520==--

