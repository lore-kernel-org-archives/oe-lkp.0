Content-Type: multipart/mixed; boundary="===============5362970649212853002=="
MIME-Version: 1.0
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: lkp@lists.01.org
Subject: Re: [kallsyms] 06862f34f6: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Fri, 22 Jan 2016 07:56:31 +0100
Message-ID: <CAKv+Gu_bsUrq2d3DYKc7Lo1ju62iw8ATt+mpynNnLRws5TSkdw@mail.gmail.com>
In-Reply-To: <877fj2jqxi.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5362970649212853002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 22 January 2016 at 03:20, kernel test robot
<ying.huang@linux.intel.com> wrote:
> FYI, we noticed the below changes on
>
> https://git.linaro.org/people/ard.biesheuvel/linux-arm kallsyms-text-rela=
tive
> commit 06862f34f614bb6ff6a9fc9c4b0d849e2ee2018d ("kallsyms: add support f=
or relative offsets in kallsyms address table")
>
>
> +-----------------------------------------------------------+------------=
+------------+
> |                                                           | 30f05309bd =
| 06862f34f6 |
> +-----------------------------------------------------------+------------=
+------------+
> | boot_successes                                            | 0          =
| 0          |
> | boot_failures                                             | 6          =
| 8          |
> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D | 4        =
  |            |
> | BUG:kernel_test_oversize                                  | 2          =
|            |
> | BUG:unable_to_handle_kernel                               | 0          =
| 8          |
> +-----------------------------------------------------------+------------=
+------------+
>
>
>
> [    0.568228] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.568971] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.569835] CPU: Intel Xeon E312xx (Sandy Bridge) (family: 0x6, model:=
 0x2a, stepping: 0x1)
> [    0.598441] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [    0.599646] IP:
> [    0.599884] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [    0.610184] IP:
> Elapsed time: 10
> qemu-system-x86_64 -enable-kvm -cpu SandyBridge -kernel /pkg/linux/x86_64=
-randconfig-s4-01220217/gcc-5/06862f34f614bb6ff6a9fc9c4b0d849e2ee2018d/vmli=
nuz-4.4.0-10063-g06862f34 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/s=
cheduled/vm-kbuild-yocto-x86_64-62/bisect_boot-1-yocto-minimal-x86_64.cgz-x=
86_64-randconfig-s4-01220217-06862f34f614bb6ff6a9fc9c4b0d849e2ee2018d-20160=
122-39812-uowsx2-0.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-s4-012202=
17 branch=3Dlinux-devel/devel-spot-201601220143 commit=3D06862f34f614bb6ff6=
a9fc9c4b0d849e2ee2018d BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-s4-0122021=
7/gcc-5/06862f34f614bb6ff6a9fc9c4b0d849e2ee2018d/vmlinuz-4.4.0-10063-g06862=
f34 max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-x86_64/yo=
cto-minimal-x86_64.cgz/x86_64-randconfig-s4-01220217/gcc-5/06862f34f614bb6f=
f6a9fc9c4b0d849e2ee2018d/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 syst=
emd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cp=
u_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic =
oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 con=
sole=3Dtty0 vga=3Dnormal rw ip=3D::::vm-kbuild-yocto-x86_64-62::dhcp drbd.m=
inor_count=3D8'  -initrd /fs/sdg1/initrd-vm-kbuild-yocto-x86_64-62 -m 320 -=
smp 1 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -=
no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive file=3D/fs/sdg1/d=
isk0-vm-kbuild-yocto-x86_64-62,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/k=
boot/pid-vm-kbuild-yocto-x86_64-62 -serial file:/dev/shm/kboot/serial-vm-kb=
uild-yocto-x86_64-62 -daemonize -display none -monitor null
>

Hello Ying,

Thanks for the report. Is this a clean build? I cannot reproduce the
issue with the attached config. Do you have the vmlinux file available
for inspection?

Thanks,
Ard.

--===============5362970649212853002==--

