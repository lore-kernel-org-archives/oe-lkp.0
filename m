Content-Type: multipart/mixed; boundary="===============4506211762842243723=="
MIME-Version: 1.0
From: zhangyiru (A) <zhangyiru3@huawei.com>
To: lkp@lists.01.org
Subject: Re: [mm, hugetlb] 52edddc18d: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 04 Nov 2021 03:51:21 +0000
Message-ID: <5c8f39590d7a418089dca30c248fc46a@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4506211762842243723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The latest version has fixed it.
https://lore.kernel.org/linux-mm/d14533d8-eb49-9ac0-2f46-a1c452e82f0e(a)ora=
cle.com/

--------------------------------
Greeting,

FYI, we noticed the following commit (built with gcc-9):

commit: 52edddc18d9541ad72912b32edd74baacc94d504 ("mm,hugetlb: remove mlock=
 ulimit for SHM_HUGETLB")
url: https://github.com/0day-ci/linux/commits/UPDATE-20211101-211012/zhangy=
iru/mm-hugetlb-remove-mlock-ulimit-for-SHM_HUGETLB/20211009-094538

in testcase: trinity
version: trinity-x86_64-eadc80ef-1_20211030
with following parameters:

	runtime: 300s

test-description: Trinity is a linux system call fuzz tester.
test-url: http://codemonkey.org.uk/projects/trinity/


on test machine: qemu-system-x86_64 -enable-kvm -cpu Icelake-Server -smp 4 =
-m 16G

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):


+---------------------------------------------+------------+------------+
|                                             | 5d6ab0bb40 | 52edddc18d =

| |
+---------------------------------------------+------------+------------+
| boot_failures                               | 0          | 14         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 14         |
| Oops:#[##]                                  | 0          | 14         |
| RIP:hugetlb_file_setup                      | 0          | 14         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 14         |
+---------------------------------------------+------------+------------+


If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


[   34.994042][  T489] BUG: kernel NULL pointer dereference, address: 00000=
00000000000
[   34.995701][  T489] #PF: supervisor write access in kernel mode
[   34.997024][  T489] #PF: error_code(0x0002) - not-present page
[   34.998633][  T489] PGD 0 P4D 0
[   34.999390][  T489] Oops: 0002 [#1] SMP PTI
[   35.000296][  T489] CPU: 3 PID: 489 Comm: trinity Not tainted 5.15.0-rc4=
-00272-g52edddc18d95 #1
[   35.005614][  T489] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.12.0-1 04/01/2014
[ 35.010568][ T489] RIP: 0010:hugetlb_file_setup (fs/hugetlbfs/inode.c:1467=
) [ 35.013084][ T489] Code: 44 89 ef e8 c0 78 c2 ff 85 c0 0f 85 79 ff ff ff=
 65 4c 8b 2c 25 00 6d 01 00 49 8b 85 50 0b 00 00 48 89 ef 48 8b b0 88 00 00=
 00 <48> 89 34 25 00 00 00 00 e8 91 72 e1 ff 85 c0 0f 84 4a ff ff ff 80 All=
 code =3D=3D=3D=3D=3D=3D=3D=3D
   0:	44 89 ef             	mov    %r13d,%edi
   3:	e8 c0 78 c2 ff       	callq  0xffffffffffc278c8
   8:	85 c0                	test   %eax,%eax
   a:	0f 85 79 ff ff ff    	jne    0xffffffffffffff89
  10:	65 4c 8b 2c 25 00 6d 	mov    %gs:0x16d00,%r13
  17:	01 00 =

  19:	49 8b 85 50 0b 00 00 	mov    0xb50(%r13),%rax
  20:	48 89 ef             	mov    %rbp,%rdi
  23:	48 8b b0 88 00 00 00 	mov    0x88(%rax),%rsi
  2a:*	48 89 34 25 00 00 00 	mov    %rsi,0x0		<-- trapping instruction
  31:	00 =

  32:	e8 91 72 e1 ff       	callq  0xffffffffffe172c8
  37:	85 c0                	test   %eax,%eax
  39:	0f 84 4a ff ff ff    	je     0xffffffffffffff89
  3f:	80                   	.byte 0x80

Code starting with the faulting instruction =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	48 89 34 25 00 00 00 	mov    %rsi,0x0
   7:	00 =

   8:	e8 91 72 e1 ff       	callq  0xffffffffffe1729e
   d:	85 c0                	test   %eax,%eax
   f:	0f 84 4a ff ff ff    	je     0xffffffffffffff5f
  15:	80                   	.byte 0x80
[   35.019745][  T489] RSP: 0018:ffffa3814090be08 EFLAGS: 00010246
[   35.022324][  T489] RAX: ffff8fa32afcfc00 RBX: 0000000000000000 RCX: 000=
0000000000000
[   35.025307][  T489] RDX: 0000000000000000 RSI: ffff8fa08e346a80 RDI: 000=
0000000200000
[   35.028263][  T489] RBP: 0000000000200000 R08: 0000000000000000 R09: fff=
fffffbd050840
[   35.031280][  T489] R10: 0000000000000000 R11: ffffa3814090be5f R12: fff=
fa3814090be53
[   35.034266][  T489] R13: ffff8fa08e2f4f80 R14: ffffffffffffffed R15: fff=
f8fa32c71fa60
[   35.037260][  T489] FS:  00007fbbcfe28740(0000) GS:ffff8fa32fd80000(0000=
) knlGS:0000000000000000
[   35.040474][  T489] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.043137][  T489] CR2: 0000000000000000 CR3: 000000012b2b2003 CR4: 000=
0000000170ee0
[   35.046127][  T489] Call Trace:
[ 35.048169][ T489] newseg (ipc/shm.c:649) [ 35.050413][ T489] ipcget (ipc/=
util.c:346 ipc/util.c:677) [ 35.052608][ T489] __x64_sys_shmget (ipc/shm.c:=
738) [ 35.054812][ T489] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86=
/entry/common.c:80) [ 35.057080][ T489] entry_SYSCALL_64_after_hwframe (arc=
h/x86/entry/entry_64.S:113) =

[   35.059767][  T489] RIP: 0033:0x7fbbcff473aa
[ 35.062030][ T489] Code: 48 8b 15 e9 fa 0b 00 f7 d8 64 89 02 b8 ff ff ff f=
f c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 45 31 d2 b8 1d 00 00 00 0f 0=
5 <48> 3d 00 f0 ff ff 77 06 c3 0f 1f 44 00 00 48 8b 15 b1 fa 0b 00 f7 All c=
ode =3D=3D=3D=3D=3D=3D=3D=3D
   0:	48 8b 15 e9 fa 0b 00 	mov    0xbfae9(%rip),%rdx        # 0xbfaf0
   7:	f7 d8                	neg    %eax
   9:	64 89 02             	mov    %eax,%fs:(%rdx)
   c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  11:	c3                   	retq   =

  12:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  19:	00 00 00 =

  1c:	0f 1f 40 00          	nopl   0x0(%rax)
  20:	45 31 d2             	xor    %r10d,%r10d
  23:	b8 1d 00 00 00       	mov    $0x1d,%eax
  28:	0f 05                	syscall =

  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping =
instruction
  30:	77 06                	ja     0x38
  32:	c3                   	retq   =

  33:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  38:	48 8b 15 b1 fa 0b 00 	mov    0xbfab1(%rip),%rdx        # 0xbfaf0
  3f:	f7                   	.byte 0xf7

Code starting with the faulting instruction =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 06                	ja     0xe
   8:	c3                   	retq   =

   9:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   e:	48 8b 15 b1 fa 0b 00 	mov    0xbfab1(%rip),%rdx        # 0xbfac6
  15:	f7                   	.byte 0xf7
[   35.069068][  T489] RSP: 002b:00007ffefaf95d28 EFLAGS: 00000246 ORIG_RAX=
: 000000000000001d
[   35.072124][  T489] RAX: ffffffffffffffda RBX: 0000000054000fb0 RCX: 000=
07fbbcff473aa
[   35.075081][  T489] RDX: 0000000054000fb0 RSI: 0000000000001000 RDI: 000=
0000000000000
[   35.078026][  T489] RBP: 00007ffefaf95d34 R08: 00007fbbd000722c R09: 000=
07fbbd0007240
[   35.081029][  T489] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
0000000000000
[   35.084324][  T489] R13: 00007ffefaf95d48 R14: 0000000000008000 R15: 000=
05562b0ca1340
[   35.087371][  T489] Modules linked in: ipmi_devintf ipmi_msghandler sr_m=
od cdrom sg ppdev intel_rapl_msr bochs ata_generic drm_vram_helper drm_ttm_=
helper intel_rapl_common ttm drm_kms_helper crct10dif_pclmul parport_pc crc=
32_pclmul syscopyarea crc32c_intel sysfillrect parport sysimgblt ghash_clmu=
lni_intel fb_sys_fops joydev drm serio_raw ata_piix i2c_piix4 libata ip_tab=
les
[   35.098592][  T489] CR2: 0000000000000000
[   35.101006][  T489] ---[ end trace 0573caf1f1c4de1d ]---
[ 35.114090][ T489] RIP: 0010:hugetlb_file_setup (fs/hugetlbfs/inode.c:1467=
) [ 35.156471][ T489] Code: 44 89 ef e8 c0 78 c2 ff 85 c0 0f 85 79 ff ff ff=
 65 4c 8b 2c 25 00 6d 01 00 49 8b 85 50 0b 00 00 48 89 ef 48 8b b0 88 00 00=
 00 <48> 89 34 25 00 00 00 00 e8 91 72 e1 ff 85 c0 0f 84 4a ff ff ff 80 All=
 code =3D=3D=3D=3D=3D=3D=3D=3D
   0:	44 89 ef             	mov    %r13d,%edi
   3:	e8 c0 78 c2 ff       	callq  0xffffffffffc278c8
   8:	85 c0                	test   %eax,%eax
   a:	0f 85 79 ff ff ff    	jne    0xffffffffffffff89
  10:	65 4c 8b 2c 25 00 6d 	mov    %gs:0x16d00,%r13
  17:	01 00 =

  19:	49 8b 85 50 0b 00 00 	mov    0xb50(%r13),%rax
  20:	48 89 ef             	mov    %rbp,%rdi
  23:	48 8b b0 88 00 00 00 	mov    0x88(%rax),%rsi
  2a:*	48 89 34 25 00 00 00 	mov    %rsi,0x0		<-- trapping instruction
  31:	00 =

  32:	e8 91 72 e1 ff       	callq  0xffffffffffe172c8
  37:	85 c0                	test   %eax,%eax
  39:	0f 84 4a ff ff ff    	je     0xffffffffffffff89
  3f:	80                   	.byte 0x80

Code starting with the faulting instruction =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	48 89 34 25 00 00 00 	mov    %rsi,0x0
   7:	00 =

   8:	e8 91 72 e1 ff       	callq  0xffffffffffe1729e
   d:	85 c0                	test   %eax,%eax
   f:	0f 84 4a ff ff ff    	je     0xffffffffffffff5f
  15:	80                   	.byte 0x80


To reproduce:

        # build kernel
	cd linux
	cp config-5.15.0-rc4-00272-g52edddc18d95 .config
	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare modules_=
prepare bzImage

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> job-script # job-script is attached in th=
is email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



---
0DAY/LKP+ Test Infrastructure                   Open Source Technology Cent=
er
https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpora=
tion

Thanks,
Oliver Sang

--===============4506211762842243723==--

