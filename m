Content-Type: multipart/mixed; boundary="===============5954733995950656261=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [x86/alternatives] 4fc19708b1: kernel_BUG_at_arch/x86/mm/init.c
Date: Sun, 05 May 2019 07:59:23 +0000
Message-ID: <0D4CC040-5546-4086-907A-EAB7EC36CC71@vmware.com>
In-Reply-To: <20190505062513.GH29809@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5954733995950656261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On May 4, 2019, at 11:25 PM, kernel test robot <lkp@intel.com> wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 4fc19708b165c1c152fa1f12f6600e66184b7786 ("x86/alternatives: Init=
ialize temporary mm for patching")
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ernel.org%2Fcgit%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&amp;data=3D=
02%7C01%7Cnamit%40vmware.com%7C42837854d9554a1bfa4608d6d122639e%7Cb39138ca3=
cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C636926342992631859&amp;sdata=3D41sYsMGJlg=
0w9t2EP4v9GcxopFVgicOmHfcZXIf91As%3D&amp;reserved=3D0 master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: https://nam04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2=
F%2Fcodemonkey.org.uk%2Fprojects%2Ftrinity%2F&amp;data=3D02%7C01%7Cnamit%40=
vmware.com%7C42837854d9554a1bfa4608d6d122639e%7Cb39138ca3cee4b4aa4d6cd83d9d=
d62f0%7C0%7C0%7C636926342992631859&amp;sdata=3D7ol%2Fq6mrou4H1XuwIaR2T3VOC4=
dUdyGY3Y%2BtqMUjBZk%3D&amp;reserved=3D0
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 2G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | 13585fa066 | 4fc19708b1 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 4          | 0          |
> | boot_failures                            | 0          | 4          |
> | kernel_BUG_at_arch/x86/mm/init.c         | 0          | 4          |
> | invalid_opcode:#[##]                     | 0          | 4          |
> | EIP:poking_init                          | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 4          |
> +------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> [    5.118979] kernel BUG at arch/x86/mm/init.c:716!
> [    5.119018] invalid opcode: 0000 [#1] SMP
> [    5.122979] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.1.0-rc7-00022-=
g4fc1970 #1
> [    5.122979] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    5.122979] EIP: poking_init+0x21/0xb8
> [    5.122979] Code: db 8d 65 f4 5b 5e 5f 5d c3 55 89 e5 53 52 8b 1d f8 2=
e 5e db 31 eb 81 f3 e3 02 89 18 e8 43 a2 1d ff a3 0c a1 56 db 85 c0 75 02 <=
0f> 0b d1 c3 c7 05 08 a1 56 db 00 00 00 40 b8 28 1b 48 db e8 82 a9
> [    5.122979] EAX: 00000000 EBX: 239c2c8f ECX: da865bad EDX: 00000007
> [    5.122979] ESI: 000003ca EDI: 00000000 EBP: db5bff78 ESP: db5bff70
> [    5.122979] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210=
246
> [    5.122979] CR0: 80050033 CR2: ffffffff CR3: 1b766000 CR4: 000006b0
> [    5.122979] Call Trace:
> [    5.122979]  start_kernel+0x447/0x47b
> [    5.122979]  i386_start_kernel+0xd6/0xee
> [    5.122979]  startup_32_smp+0x15f/0x170
> [    5.122979] Modules linked in:
> [    5.123041] random: get_random_bytes called from print_oops_end_marker=
+0x4f/0x60 with crng_init=3D0
> [    5.127013] ---[ end trace 790e10dcf838c933 ]---
> =

> =

> To reproduce:
> =

>        # build kernel
> 	cd linux
> 	cp config-5.1.0-rc7-00022-g4fc1970 .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 olddefconfig
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 modules_prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 SHELL=3D/bin/bash
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 bzImage
> =

> =

>        git clone https://nam04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests.git&amp;data=3D02%7C01%7Cnamit%4=
0vmware.com%7C42837854d9554a1bfa4608d6d122639e%7Cb39138ca3cee4b4aa4d6cd83d9=
dd62f0%7C0%7C0%7C636926342992641853&amp;sdata=3DzTmhr%2FTk12aeE5PPUF6enou4b=
4Ubqy7JfmO%2FHodsixI%3D&amp;reserved=3D0
>        cd lkp-tests
>        bin/lkp qemu -k <bzImage> job-script # job-script is attached in t=
his email
> =

> =

> =

> Thanks,
> lkp
> =

> <config-5.1.0-rc7-00022-g4fc1970><job-script.txt><dmesg.xz>

PGD cache should be initialized earlier. I will send a fix shortly.


--===============5954733995950656261==--

