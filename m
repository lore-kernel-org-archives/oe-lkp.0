Content-Type: multipart/mixed; boundary="===============2427991775780329689=="
MIME-Version: 1.0
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: lkp@lists.01.org
Subject: Re: [kallsyms] 06862f34f6: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Wed, 27 Jan 2016 07:43:56 +0100
Message-ID: <CAKv+Gu8-EV8R4O+ZGEGMDk=UyG+zz0Auy3xuM=51_ww2FfQ2wA@mail.gmail.com>
In-Reply-To: <87twlz4zqb.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2427991775780329689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 27 January 2016 at 01:45, Huang, Ying <ying.huang@intel.com> wrote:
> Ard Biesheuvel <ard.biesheuvel@linaro.org> writes:
>
>> On 22 January 2016 at 03:20, kernel test robot
>> <ying.huang@linux.intel.com> wrote:
>>> FYI, we noticed the below changes on
>>>
>>> https://git.linaro.org/people/ard.biesheuvel/linux-arm kallsyms-text-re=
lative
>>> commit 06862f34f614bb6ff6a9fc9c4b0d849e2ee2018d ("kallsyms: add
>>> support for relative offsets in kallsyms address table")
>>>
>>>
>>> +-----------------------------------------------------------+----------=
--+------------+
>>> |                                                           | 30f05309b=
d | 06862f34f6 |
>>> +-----------------------------------------------------------+----------=
--+------------+
>>> | boot_successes                                            | 0        =
  | 0          |
>>> | boot_failures                                             | 6        =
  | 8          |
>>> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D | 4      =
    |            |
>>> | BUG:kernel_test_oversize                                  | 2        =
  |            |
>>> | BUG:unable_to_handle_kernel                               | 0        =
  | 8          |
>>> +-----------------------------------------------------------+----------=
--+------------+
>>>
>>>
>>>
>>> [    0.568228] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
>>> [    0.568971] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
>>> [    0.569835] CPU: Intel Xeon E312xx (Sandy Bridge) (family: 0x6, mode=
l: 0x2a, stepping: 0x1)
>>> [    0.598441] BUG: unable to handle kernel NULL pointer dereference at=
           (null)
>>> [    0.599646] IP:
>>> [    0.599884] BUG: unable to handle kernel NULL pointer dereference at=
           (null)
>>> [    0.610184] IP:
>>> Elapsed time: 10
>>> qemu-system-x86_64 -enable-kvm -cpu SandyBridge -kernel
>>> /pkg/linux/x86_64-randconfig-s4-01220217/gcc-5/06862f34f614bb6ff6a9fc9c=
4b0d849e2ee2018d/vmlinuz-4.4.0-10063-g06862f34
>>> -append 'root=3D/dev/ram0 user=3Dlkp
>>> job=3D/lkp/scheduled/vm-kbuild-yocto-x86_64-62/bisect_boot-1-yocto-mini=
mal-x86_64.cgz-x86_64-randconfig-s4-01220217-06862f34f614bb6ff6a9fc9c4b0d84=
9e2ee2018d-20160122-39812-uowsx2-0.yaml
>>> ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-s4-01220217
>>> branch=3Dlinux-devel/devel-spot-201601220143
>>> commit=3D06862f34f614bb6ff6a9fc9c4b0d849e2ee2018d
>>> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-s4-01220217/gcc-5/06862f34f61=
4bb6ff6a9fc9c4b0d849e2ee2018d/vmlinuz-4.4.0-10063-g06862f34
>>> max_uptime=3D600
>>> RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-x86_64/yocto-minimal-x86_6=
4.cgz/x86_64-randconfig-s4-01220217/gcc-5/06862f34f614bb6ff6a9fc9c4b0d849e2=
ee2018d/0
>>> LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr deb=
ug
>>> apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100
>>> panic=3D-1 softlockup_panic=3D1 nmi
>>  _watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0
>> console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw
>> ip=3D::::vm-kbuild-yocto-x86_64-62::dhcp drbd.minor_count=3D8' -initrd
>> /fs/sdg1/initrd-vm-kbuild-yocto-x86_64-62 -m 320 -smp 1 -device
>> e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot
>> -watchdog i6300esb -rtc base=3Dlocaltime -drive
>> file=3D/fs/sdg1/disk0-vm-kbuild-yocto-x86_64-62,media=3Ddisk,if=3Dvirtio
>> -pidfile /dev/shm/kboot/pid-vm-kbuild-yocto-x86_64-62 -serial
>> file:/dev/shm/kboot/serial-vm-kbuild-yocto-x86_64-62 -daemonize
>> -display none -monitor null
>>>
>>
>> Hello Ying,
>>
>> Thanks for the report. Is this a clean build?
>
> It's not clean build.
>
>> I cannot reproduce the
>> issue with the attached config. Do you have the vmlinux file available
>> for inspection?
>
> Sorry, we have no vmlinux file available.
>
> BTW, we use gcc-5 to compile kernel.  Do you use gcc-5 or gcc-4?
>

Thank you Ying

The problem has already been found and fixed: it had to do with the
fact that this is a x86_64 non-SMP build.

Thanks,
Ard.

--===============2427991775780329689==--

