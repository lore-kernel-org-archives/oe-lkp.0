Content-Type: multipart/mixed; boundary="===============8444782016921508514=="
MIME-Version: 1.0
From: Thomas Garnier <thgarnie@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Tue, 21 Mar 2017 11:16:35 -0700
Message-ID: <CAJcbSZGE9P3p6GV=7QHeDUesJZuR4mE=9tkMK+6SRbOoc-2kAg@mail.gmail.com>
In-Reply-To: <20170321045713.GE23490@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8444782016921508514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This error happens even with Andy TLS fix on 32-bit (GDT is on fixmap
but not readonly). I am looking into it.

KVM internal error. Suberror: 3
extra data[0]: 80000b0e
extra data[1]: 31
EAX=3D00000001 EBX=3D9f9121f3 ECX=3D4330b100 EDX=3Dfffff000
ESI=3D547e0000 EDI=3Dffa74000 EBP=3D42273ef8 ESP=3D42273ef8
EIP=3D4105a0a2 EFL=3D00210002 [-------] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HLT=
=3D0
ES =3D007b 00000000 ffffffff 00c0f300 DPL=3D3 DS   [-WA]
CS =3D0060 00000000 ffffffff 00c09b00 DPL=3D0 CS32 [-RA]
SS =3D0068 00000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
DS =3D007b 00000000 ffffffff 00c0f300 DPL=3D3 DS   [-WA]
FS =3D00d8 1232d000 ffffffff 00809300 DPL=3D0 DS16 [-WA]
GS =3D00e0 5492d4c0 00000018 00409100 DPL=3D0 DS   [--A]
LDT=3D0000 00000000 ffffffff 00c00000
TR =3D0080 5492b340 0000206b 00008b00 DPL=3D0 TSS32-busy
GDT=3D     ffa94000 000000ff
IDT=3D     fffba000 000007ff
CR0=3D80050033 CR2=3Dff874000 CR3=3D02610000 CR4=3D00000690
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000
DR3=3D0000000000000000
DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
EFER=3D0000000000000000
Code=3Df0 d7 00 b8 01 00 00 00 8b 15 ec 48 29 42 8a 8a 00 50 87 ff <88>
8a 00 50 87 ff 31 c0 5d c3 55 89 e5 57 56 53 e8 8d f0 d7 00 89 c6 a1
00 ff dd 42 05 00

On Mon, Mar 20, 2017 at 9:57 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> commit: 69218e47994da614e7af600bf06887750ab6657a ("x86: Remap GDT tables =
in the fixmap section")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: trinity
> with following parameters:
>
>         runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +--------------------------------------------------------------+---------=
---+------------+
> |                                                              | f06bdd40=
01 | 69218e4799 |
> +--------------------------------------------------------------+---------=
---+------------+
> | boot_successes                                               | 3       =
   | 0          |
> | boot_failures                                                | 5       =
   | 8          |
> | BUG:kernel_reboot-without-warning_in_boot_stage              | 4       =
   |            |
> | WARNING:at_arch/x86/include/asm/fpu/internal.h:#fpu__restore | 1       =
   |            |
> | BUG:kernel_hang_in_boot_stage                                | 0       =
   | 8          |
> +--------------------------------------------------------------+---------=
---+------------+
>
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] allocated 331644 bytes of page_ext
> [    0.000000] Initializing HighMem for node 0 (00000000:00000000)
> [    0.000000] Memory: 267332K/327160K available (14061K kernel code, 110=
4K rwdata, 4696K rodata, 2460K init, 13208K bss, 59828K reserved, 0K cma-re=
served, 0K highmem)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xffa74000 - 0xfffff000   (5676 kB)
> [    0.000000]     pkmap   : 0xff400000 - 0xff800000   (4096 kB)
> [    0.000000]     vmalloc : 0x547e0000 - 0xff3fe000   (2732 MB)
> [    0.000000]     lowmem  : 0x40000000 - 0x53fe0000   ( 319 MB)
> [    0.000000]       .init : 0x4236a000 - 0x425d1000   (2460 kB)
> [    0.000000]       .data : 0x41dbb72c - 0x42368300   (5810 kB)
> [    0.000000]       .text : 0x41000000 - 0x41dbb72c   (14061 kB)
>
>
> Elapsed time: 480
> BUG: kernel hang in boot stage
>
> initrds=3D(
>         /osimage/yocto/yocto-tiny-i386-2016-04-22.cgz
>         /lkp/scheduled/vm-lkp-hsw01-yocto-i386-25/trinity-300s-yocto-tiny=
-i386-2016-04-22.cgz-69218e47994da614e7af600bf06887750ab6657a-20170319-1178=
21-bls48g-0.cgz
>         /lkp/lkp/lkp-i386.cgz
>
>
> To reproduce:
>
>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
>
>
>
> Thanks,
> Xiaolong



-- =

Thomas

--===============8444782016921508514==--

