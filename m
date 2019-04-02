Content-Type: multipart/mixed; boundary="===============3400505586056656002=="
MIME-Version: 1.0
From: Qu Wenruo <wqu@suse.de>
To: lkp@lists.01.org
Subject: Re: [btrfs] 70d28b0e4f: BUG:kernel_reboot-without-warning_in_early-boot_stage, last_printk:Probing_EDD(edd=off_to_disable)...ok
Date: Tue, 02 Apr 2019 12:55:01 +0800
Message-ID: <dde15cd2-5c17-86b0-68a7-638b3d1a3de9@suse.de>
In-Reply-To: <d1f57263-277a-d696-2fc2-51c62af6844f@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3400505586056656002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2019/4/2 =E4=B8=8A=E5=8D=8811:14, Rong Chen wrote:
> =

> On 4/1/19 11:40 PM, David Sterba wrote:
>> On Mon, Apr 01, 2019 at 11:02:37PM +0800,=C2=A0 Chen, Rong A=C2=A0 wrote:
>>> On 4/1/2019 10:29 PM, Qu Wenruo wrote:
>>>> On 2019/4/1 =E4=B8=8B=E5=8D=8810:02,=C2=A0 Chen, Rong A=C2=A0 wrote:
>>>>> On 4/1/2019 9:28 PM, Nikolay Borisov wrote:
>>>>>> On 1.04.19 =D0=B3. 16:24 =D1=87., kernel test robot wrote:
>>>>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>>>>
>>>>>>> commit: 70d28b0e4f8ed2d38571e7b1f9bec7f321a53102 ("btrfs:
>>>>>>> tree-checker: Verify dev item")
>>>>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
>>>>>>> master
>>>>>>>
>>>>>>> in testcase: trinity
>>>>>>> with following parameters:
>>>>>>>
>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0runtime: 300s
>>>>>>>
>>>>>>> test-description: Trinity is a linux system call fuzz tester.
>>>>>>> test-url: http://codemonkey.org.uk/projects/trinity/
>>>>>>>
>>>>>>>
>>>>>>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge
>>>>>>> -smp
>>>>>>> 2 -m 2G
>>>>>>>
>>>>>>> caused below changes (please refer to attached dmesg/kmsg for entire
>>>>>>> log/backtrace):
>>>>>>>
>>>>>>>
>>>>>>> +------------------------------------------------------------------=
--------------------------------------+------------+------------+
>>>>>>>
>>>>>>>
>>>>>>> |
>>>>>>> | 36b9d2bc69 | 70d28b0e4f |
>>>>>>> +------------------------------------------------------------------=
--------------------------------------+------------+------------+
>>>>>>>
>>>>>>>
>>>>>>> |
>>>>>>> boot_successes
>>>>>>> | 14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>>> |
>>>>>>> boot_failures
>>>>>>> | 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>>> |
>>>>>>> IP-Config:Auto-configuration_of_network_failed
>>>>>>> | 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>>> |
>>>>>>> BUG:kernel_reboot-without-warning_in_early-boot_stage,last_printk:P=
robing_EDD(edd=3Doff_to_disable)...ok
>>>>>>>
>>>>>>> | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>>> +------------------------------------------------------------------=
--------------------------------------+------------+------------+
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> early console in setup code
>>>>>>> Probing EDD (edd=3Doff to disable)... ok
>>>>>>> BUG: kernel reboot-without-warning in early-boot stage, last printk:
>>>>>>> Probing EDD (edd=3Doff to disable)... ok
>>>>>>> Linux version 5.0.0-rc8-00196-g70d28b0 #1
>>>>>>> Command line: ip=3D::::vm-snb-quantal-x86_64-1415::dhcp root=3D/dev=
/ram0
>>>>>>> user=3Dlkp
>>>>>>> job=3D/lkp/jobs/scheduled/vm-snb-quantal-x86_64-1415/trinity-300s-q=
uantal-core-x86_64-2018-11-09.cgz-70d28b0-20190330-29362-1y6g0qb-2.yaml
>>>>>>>
>>>>>>> ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-s5-03231928
>>>>>>> branch=3Dlinux-devel/devel-hourly-2019032317
>>>>>>> commit=3D70d28b0e4f8ed2d38571e7b1f9bec7f321a53102
>>>>>>> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-s5-03231928/gcc-7/70d28b0=
e4f8ed2d38571e7b1f9bec7f321a53102/vmlinuz-5.0.0-rc8-00196-g70d28b0
>>>>>>>
>>>>>>> max_uptime=3D1500
>>>>>>> RESULT_ROOT=3D/result/trinity/300s/vm-snb-quantal-x86_64/quantal-co=
re-x86_64-2018-11-09.cgz/x86_64-randconfig-s5-03231928/gcc-7/70d28b0e4f8ed2=
d38571e7b1f9bec7f321a53102/8
>>>>>>>
>>>>>>> LKP_SERVER=3Dinn debug apic=3Ddebug sysrq_always_enabled
>>>>>>> rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=
=3Don
>>>>>>> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic
>>>>>>> load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8
>>>>>>> systemd.log_level=3Derr ignore_loglevel console=3Dtty0
>>>>>>> earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw
>>>>>>> rcuperf.shutdown=3D0
>>>>>>>
>>>>>> Can this report be made useful by actually including output from
>>>>>> serial
>>>>>> console? For example possible bug-ons or whatnot? dmesg.xz just
>>>>>> contains
>>>>>> qemu's command line + some metadata about the test and :
>>>>>>
>>>>>> "BUG: kernel reboot-without-warning in early-boot stage, last printk:
>>>>>> Probing EDD (edd=3Doff to disable)... ok"
>>>>>>
>>>>>> At least a stack trace would have been useful.
>>>>>>
>>>>>> <snip>
>>>>> Hi,
>>>>>
>>>>> We usually use the tool ("bin/lkp qemu -k <bzImage> job-script") to
>>>>> reproduce it.=C2=A0 It seems no stack trace in the result:
>>>> So there is no regression at that commit right?
>>>>
>>>> Just some false alert?
>>>
>>> Hi,
>>>
>>> I think there's a regression, it stopped in the early-boot stage .
>> Can you please provide any logs that would point at btrfs? If the module
>> is loaded or built-in started, there's a line about that. Besides that
>> it's preceded by messages from other subsystems' initialization.
> =

> =

> Hi,
> =

> CONFIG_BTRFS_FS and CONFIG_BTRFS_FS_REF_VERIFY is enabled in the kconfig.
> I disabled them for the experiment, and the new kernel is bootable. I
> don't have more logs to prove it.
> =

> $ grep BTRFS config-5.0.0-rc8-00196-g70d28b0
> CONFIG_BTRFS_FS=3Dy
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> CONFIG_BTRFS_FS_REF_VERIFY=3Dy

With the same BTRFS config, on v5.1.0-rc2+ (David's misc-next) branch,
which has the so-called "regression" commit, it booted without any problem.

So I really hope we could get some useful kernel message, either to
determine what's wrong with btrfs or what's wrong with the test framework.

Thanks,
Qu

> =

> =

> Best Regards,
> Rong Chen
> =

> =

>> _______________________________________________
>> LKP mailing list
>> LKP(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/lkp

--===============3400505586056656002==--

