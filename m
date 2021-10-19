Content-Type: multipart/mixed; boundary="===============2018882447905443568=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [mm] 6128b3af2a: UBSAN:shift-out-of-bounds_in(null)
Date: Tue, 19 Oct 2021 10:49:53 -0500
Message-ID: <87wnm9ovz2.fsf@disp2133>
In-Reply-To: <20211019031407.GB7910@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2018882447905443568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed the following commit (built with clang-14):
>
> commit: 6128b3af2a5e42386aa7faf37609b57f39fb7d00 ("mm: ignore MAP_DENYWRI=
TE in ksys_mmap_pgoff()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

I believe this failure is misattributed.  Perhaps your reproducer
only intermittently reproduces the problem?

The change in question only contains

	flags &=3D ~MAP_DENYWRITE

After all of the other users of MAP_DENYWRITE had been removed from the
kernel.  So I don't see how it could possibly be responsible for the
reported shift out of bounds problem.

Eric




> in testcase: trinity
> version: trinity-i386-4d2343bd-1_20200320
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +---------------------------------------------+------------+------------+
> |                                             | 8d0920bde5 | 6128b3af2a |
> +---------------------------------------------+------------+------------+
> | UBSAN:shift-out-of-bounds_in(null)          | 0          | 9          |
> +---------------------------------------------+------------+------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
>
> [  126.758570][ T3293] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  126.758949][ T3293] UBSAN: shift-out-of-bounds in (null):0:0
> [  126.759174][ T3293] BUG: kernel NULL pointer dereference, address: 000=
00000
> [  126.759447][ T3293] #PF: supervisor read access in kernel mode
> [  126.759676][ T3293] #PF: error_code(0x0000) - not-present page
> [  126.759905][ T3293] *pde =3D 00000000
> [  126.760047][ T3293] Oops: 0000 [#1] SMP
> [  126.760205][ T3293] CPU: 1 PID: 3293 Comm: trinity-c4 Not tainted 5.14=
.0-00006-g6128b3af2a5e #1
> [  126.760541][ T3293] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [  126.760890][ T3293] EIP: __ubsan_handle_shift_out_of_bounds+0x88/0x350
> [  126.761147][ T3293] Code: 00 83 c4 04 7f 23 47 04 7f 23 47 04 ff 37 68=
 ef ff 37 68 ef e3 77 d0 d7 e3 77 d0 d7 00 8b 45 f0 00 8b 45 f0 c4 14 66 83=
 c4 14 <66> 83 66
> 83 3f 00 66 83 3f 00 00 00 66 83 00 00 66 83 b9 01 00 00
> [  126.761889][ T3293] EAX: 00000000 EBX: f345b500 ECX: 00000027 EDX: eba=
9ce40
> [  126.762159][ T3293] ESI: 00000046 EDI: 00000000 EBP: f3575f40 ESP: f35=
75ecc
> [  126.762428][ T3293] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAG=
S: 00010286
> [  126.762718][ T3293] CR0: 80050033 CR2: 00000000 CR3: 33464000 CR4: 000=
406d0
> [  126.762989][ T3293] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [  126.763259][ T3293] DR6: fffe0ff0 DR7: 00000400
> [  126.763436][ T3293] Call Trace:
> [  126.763562][ T3293]  ? rcu_lock_acquire+0x30/0x30
> [  126.763749][ T3293]  ? rcu_read_lock_sched_held+0x31/0x70
> [  126.763960][ T3293]  ksys_mmap_pgoff+0x1fc/0x290
> [  126.764146][ T3293]  __ia32_sys_mmap_pgoff+0x1c/0x30
> [  126.764343][ T3293]  do_int80_syscall_32+0x39/0x80
> [  126.764532][ T3293]  entry_INT80_32+0x10d/0x10d
> [  126.764709][ T3293] EIP: 0xb7fbda02
> [  126.764848][ T3293] Code: 95 01 00 05 25 36 02 00 83 ec 14 8d 80 e8 99=
 ff ff 50 6a 02 e8 1f ff 00 00 c7 04 24 7f 00 00 00 e8 7e 87 01 00 66 90 90=
 cd 80 <c3> 8d b6
> 00 00 00 00 8d bc 27 00 00 00 00 8b 1c 24 c3 8d b6 00 00
> [  126.765591][ T3293] EAX: ffffffda EBX: 00000000 ECX: 00001000 EDX: 55d=
d7eb6
> [  126.765859][ T3293] ESI: f0bd6374 EDI: ffffffff EBP: 00000000 ESP: bf9=
964d8
> [  126.766129][ T3293] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAG=
S: 00000296
> [  126.766419][ T3293] Modules linked in: aesni_intel crypto_simd qemu_fw=
_cfg autofs4
> [  126.766715][ T3293] CR2: 0000000000000000
> [  126.766894][ T3293] ---[ end trace e6000e119f0dc7f3 ]---
> [  126.767105][ T3293] EIP: __ubsan_handle_shift_out_of_bounds+0x88/0x350
> [  126.767361][ T3293] Code: 00 83 c4 04 7f 23 47 04 7f 23 47 04 ff 37 68=
 ef ff 37 68 ef e3 77 d0 d7 e3 77 d0 d7 00 8b 45 f0 00 8b 45 f0 c4 14 66 83=
 c4 14 <66> 83 66 83 3f 00 66 83 3f 00 00 00 66 83 00 00 66 83 b9 01 00 00
> [  126.768112][ T3293] EAX: 00000000 EBX: f345b500 ECX: 00000027 EDX: eba=
9ce40
> [  126.768384][ T3293] ESI: 00000046 EDI: 00000000 EBP: f3575f40 ESP: f35=
75ecc
> [  126.768657][ T3293] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAG=
S: 00010286
> [  126.768947][ T3293] CR0: 80050033 CR2: 00000000 CR3: 33464000 CR4: 000=
406d0
> [  126.769223][ T3293] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [  126.769496][ T3293] DR6: fffe0ff0 DR7: 00000400
> [  126.769680][ T3293] Kernel panic - not syncing: Fatal exception
> [  126.769946][ T3293] Kernel Offset: disabled
>
>
>
> To reproduce:
>
>         # build kernel
> 	cd linux
> 	cp config-5.14.0-00006-g6128b3af2a5e .config
> 	make HOSTCC=3Dclang-14 CC=3Dclang-14 ARCH=3Di386 olddefconfig prepare mo=
dules_prepare bzImage
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang
--===============2018882447905443568==--

