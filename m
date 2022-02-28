Content-Type: multipart/mixed; boundary="===============5609788426037677712=="
MIME-Version: 1.0
From: Paneer Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: lkp@lists.01.org
Subject: Re: [drm/selftests] 39ec47bbfd: kernel_BUG_at_drivers/gpu/drm/drm_buddy.c
Date: Mon, 28 Feb 2022 14:53:09 +0000
Message-ID: <
 <MN2PR12MB4342E12C4A7E5AED45B59AE2E4019@MN2PR12MB4342.namprd12.prod.outlook.com>>
In-Reply-To: <1879517d-f98f-6e96-7157-dccb0c872df0@amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5609788426037677712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Christian,
I will check

Thanks,
Arun
-----Original Message-----
From: Koenig, Christian <Christian.Koenig@amd.com> =

Sent: Monday, February 28, 2022 4:29 PM
To: kernel test robot <oliver.sang@intel.com>; Paneer Selvam, Arunpravin =
<Arunpravin.PaneerSelvam@amd.com>
Cc: 0day robot <lkp@intel.com>; Matthew Auld <matthew.auld@intel.com>; =
LKML <linux-kernel@vger.kernel.org>; lkp(a)lists.01.org; dri-devel(a)list=
s.freedesktop.org; intel-gfx(a)lists.freedesktop.org; amd-gfx(a)lists.freed=
esktop.org; tzimmermann(a)suse.de; Deucher, Alexander <Alexander.Deucher@=
amd.com>
Subject: Re: [drm/selftests] 39ec47bbfd: kernel_BUG_at_drivers/gpu/drm/drm_=
buddy.c

Arun can you take a look at that one here?

It looks like a real problem to me and not just a potential false negative =
like the other issue.

Thanks,
Christian.

Am 27.02.22 um 16:18 schrieb kernel test robot:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 39ec47bbfd5dd3cea0b711ee9f1acdca37399c86 ("[PATCH v2 2/7] =

> drm/selftests: add drm buddy alloc limit testcase")
> url: =

> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2F0day-ci%2Flinux%2Fcommits%2FArunpravin%2Fdrm-selftests-Move-i
> 915-buddy-selftests-into-drm%2F20220223-015043&amp;data=3D04%7C01%7Cchri
> stian.koenig%40amd.com%7C3101ff318a994e6eaf5f08d9fa0481ea%7C3dd8961fe4
> 884e608e11a82d994e183d%7C0%7C0%7C637815719552700496%7CUnknown%7CTWFpbG
> Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> 3D%7C3000&amp;sdata=3DsKvsDtHufRMfSO14HdmHxvNsJiPyDZVDXCFUpWTDwFI%3D&amp
> ;reserved=3D0 patch link: =

> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore
> .kernel.org%2Fdri-devel%2F20220222174845.2175-2-Arunpravin.PaneerSelva
> m%40amd.com&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C3101ff318a
> 994e6eaf5f08d9fa0481ea%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63
> 7815719552700496%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
> 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DaWG4x27aMLcOySO
> UkHbLQ1NL9L8t8AF4dgXux65IIP8%3D&amp;reserved=3D0
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu Icelake-Server =

> -smp 4 -m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +---------------------------------------------------+------------+-------=
-----+
> |                                                   | be9e8c6c00 | =

> | 39ec47bbfd |
> +---------------------------------------------------+------------+-------=
-----+
> | boot_successes                                    | 14         | 0     =
     |
> | boot_failures                                     | 0          | 16    =
     |
> | UBSAN:shift-out-of-bounds_in_include/linux/log2.h | 0          | 16    =
     |
> | kernel_BUG_at_drivers/gpu/drm/drm_buddy.c         | 0          | 16    =
     |
> | invalid_opcode:#[##]                              | 0          | 16    =
     |
> | EIP:drm_buddy_init                                | 0          | 16    =
     |
> | Kernel_panic-not_syncing:Fatal_exception          | 0          | 16    =
     |
> +---------------------------------------------------+------------+-------=
-----+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [   68.124177][    T1] UBSAN: shift-out-of-bounds in include/linux/log2.h=
:67:13
> [   68.125333][    T1] shift exponent 4294967295 is too large for 32-bit =
type 'long unsigned int'
> [   68.126563][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.17.0-rc2=
-00311-g39ec47bbfd5d #2
> [   68.127758][    T1] Call Trace:
> [ 68.128187][ T1] dump_stack_lvl (lib/dump_stack.c:108) [ 68.128793][ =

> T1] dump_stack (lib/dump_stack.c:114) [ 68.129331][ T1] ubsan_epilogue =

> (lib/ubsan.c:152) [ 68.129958][ T1] =

> __ubsan_handle_shift_out_of_bounds.cold =

> (arch/x86/include/asm/smap.h:85) [ 68.130791][ T1] ? =

> drm_block_alloc+0x28/0x80 [ 68.131582][ T1] ? rcu_read_lock_sched_held =

> (kernel/rcu/update.c:125) [ 68.132215][ T1] ? kmem_cache_alloc =

> (include/trace/events/kmem.h:54 mm/slab.c:3501) [ 68.132878][ T1] ? =

> mark_free+0x2e/0x80 [ 68.133524][ T1] drm_buddy_init.cold =

> (include/linux/log2.h:67 drivers/gpu/drm/drm_buddy.c:131) [ =

> 68.134145][ T1] ? test_drm_cmdline_init =

> (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
> [ 68.134770][ T1] igt_buddy_alloc_limit =

> (drivers/gpu/drm/selftests/test-drm_buddy.c:30)
> [ 68.135472][ T1] ? vprintk_default (kernel/printk/printk.c:2257) [ =

> 68.136057][ T1] ? test_drm_cmdline_init =

> (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
> [ 68.136812][ T1] test_drm_buddy_init =

> (drivers/gpu/drm/selftests/drm_selftest.c:77 =

> drivers/gpu/drm/selftests/test-drm_buddy.c:95)
> [ 68.137475][ T1] do_one_initcall (init/main.c:1300) [ 68.138111][ T1] =

> ? parse_args (kernel/params.c:609 kernel/params.c:146 =

> kernel/params.c:188) [ 68.138717][ T1] do_basic_setup =

> (init/main.c:1372 init/main.c:1389 init/main.c:1408) [ 68.139366][ T1] =

> kernel_init_freeable (init/main.c:1617) [ 68.140040][ T1] ? rest_init =

> (init/main.c:1494) [ 68.140634][ T1] kernel_init (init/main.c:1504) [ =

> 68.141155][ T1] ret_from_fork (arch/x86/entry/entry_32.S:772)
> [   68.141607][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   68.146730][    T1] ------------[ cut here ]------------
> [   68.147460][    T1] kernel BUG at drivers/gpu/drm/drm_buddy.c:140!
> [   68.148280][    T1] invalid opcode: 0000 [#1]
> [   68.148895][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.17.0-rc2=
-00311-g39ec47bbfd5d #2
> [ 68.149896][ T1] EIP: drm_buddy_init (drivers/gpu/drm/drm_buddy.c:140 =

> (discriminator 1)) [ 68.149896][ T1] Code: 76 00 b8 ea ff ff ff 8d 65 =

> f4 5b 5e 5f 5d c3 8d 76 00 0f bd 45 d8 75 05 b8 ff ff ff ff 83 c0 21 =

> e9 5e ff ff ff 8d 74 26 00 90 <0f> 0b 8d b6 00 00 00 00 0f 0b 8d b6 00 00=
 00 00 8b 5d 0c 0f bd 45 All code =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	76 00                	jbe    0x2
>     2:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
>     7:	8d 65 f4             	lea    -0xc(%rbp),%esp
>     a:	5b                   	pop    %rbx
>     b:	5e                   	pop    %rsi
>     c:	5f                   	pop    %rdi
>     d:	5d                   	pop    %rbp
>     e:	c3                   	retq
>     f:	8d 76 00             	lea    0x0(%rsi),%esi
>    12:	0f bd 45 d8          	bsr    -0x28(%rbp),%eax
>    16:	75 05                	jne    0x1d
>    18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
>    1d:	83 c0 21             	add    $0x21,%eax
>    20:	e9 5e ff ff ff       	jmpq   0xffffffffffffff83
>    25:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
>    29:	90                   	nop
>    2a:*	0f 0b                	ud2    		<-- trapping instruction
>    2c:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    32:	0f 0b                	ud2
>    34:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    3a:	8b 5d 0c             	mov    0xc(%rbp),%ebx
>    3d:	0f                   	.byte 0xf
>    3e:	bd                   	.byte 0xbd
>    3f:	45                   	rex.RB
>
> Code starting with the faulting instruction =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	0f 0b                	ud2
>     2:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>     8:	0f 0b                	ud2
>     a:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    10:	8b 5d 0c             	mov    0xc(%rbp),%ebx
>    13:	0f                   	.byte 0xf
>    14:	bd                   	.byte 0xbd
>    15:	45                   	rex.RB
> [   68.149896][    T1] EAX: 8578e658 EBX: 8578e618 ECX: 8578e658 EDX: 837=
17c98
> [   68.149896][    T1] ESI: 83675ee0 EDI: 00000034 EBP: 83675ec0 ESP: 836=
75e94
> [   68.149896][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00010297
> [   68.149896][    T1] CR0: 80050033 CR2: 77f35844 CR3: 02a10000 CR4: 001=
50ed0
> [   68.149896][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   68.149896][    T1] DR6: fffe0ff0 DR7: 00000400
> [   68.149896][    T1] Call Trace:
> [ 68.149896][ T1] ? test_drm_cmdline_init =

> (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
> [ 68.149896][ T1] igt_buddy_alloc_limit =

> (drivers/gpu/drm/selftests/test-drm_buddy.c:30)
> [ 68.149896][ T1] ? vprintk_default (kernel/printk/printk.c:2257) [ =

> 68.149896][ T1] ? test_drm_cmdline_init =

> (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
> [ 68.149896][ T1] test_drm_buddy_init =

> (drivers/gpu/drm/selftests/drm_selftest.c:77 =

> drivers/gpu/drm/selftests/test-drm_buddy.c:95)
> [ 68.149896][ T1] do_one_initcall (init/main.c:1300) [ 68.149896][ T1] =

> ? parse_args (kernel/params.c:609 kernel/params.c:146 =

> kernel/params.c:188) [ 68.149896][ T1] do_basic_setup =

> (init/main.c:1372 init/main.c:1389 init/main.c:1408) [ 68.149896][ T1] =

> kernel_init_freeable (init/main.c:1617) [ 68.149896][ T1] ? rest_init =

> (init/main.c:1494) [ 68.149896][ T1] kernel_init (init/main.c:1504) [ =

> 68.149896][ T1] ret_from_fork (arch/x86/entry/entry_32.S:772)
> [   68.149896][    T1] Modules linked in:
> [   68.167316][    T1] ---[ end trace 0000000000000000 ]---
> [ 68.168062][ T1] EIP: drm_buddy_init (drivers/gpu/drm/drm_buddy.c:140 =

> (discriminator 1)) [ 68.168739][ T1] Code: 76 00 b8 ea ff ff ff 8d 65 =

> f4 5b 5e 5f 5d c3 8d 76 00 0f bd 45 d8 75 05 b8 ff ff ff ff 83 c0 21 =

> e9 5e ff ff ff 8d 74 26 00 90 <0f> 0b 8d b6 00 00 00 00 0f 0b 8d b6 00 00=
 00 00 8b 5d 0c 0f bd 45 All code =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	76 00                	jbe    0x2
>     2:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
>     7:	8d 65 f4             	lea    -0xc(%rbp),%esp
>     a:	5b                   	pop    %rbx
>     b:	5e                   	pop    %rsi
>     c:	5f                   	pop    %rdi
>     d:	5d                   	pop    %rbp
>     e:	c3                   	retq
>     f:	8d 76 00             	lea    0x0(%rsi),%esi
>    12:	0f bd 45 d8          	bsr    -0x28(%rbp),%eax
>    16:	75 05                	jne    0x1d
>    18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
>    1d:	83 c0 21             	add    $0x21,%eax
>    20:	e9 5e ff ff ff       	jmpq   0xffffffffffffff83
>    25:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
>    29:	90                   	nop
>    2a:*	0f 0b                	ud2    		<-- trapping instruction
>    2c:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    32:	0f 0b                	ud2
>    34:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    3a:	8b 5d 0c             	mov    0xc(%rbp),%ebx
>    3d:	0f                   	.byte 0xf
>    3e:	bd                   	.byte 0xbd
>    3f:	45                   	rex.RB
>
> Code starting with the faulting instruction =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	0f 0b                	ud2
>     2:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>     8:	0f 0b                	ud2
>     a:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    10:	8b 5d 0c             	mov    0xc(%rbp),%ebx
>    13:	0f                   	.byte 0xf
>    14:	bd                   	.byte 0xbd
>    15:	45                   	rex.RB
>
>
> To reproduce:
>
>          # build kernel
> 	cd linux
> 	cp config-5.17.0-rc2-00311-g39ec47bbfd5d .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage modules
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-insta=
ll-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>          git clone https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests.git&amp;data=3D04%7C01%7Cchris=
tian.koenig%40amd.com%7C3101ff318a994e6eaf5f08d9fa0481ea%7C3dd8961fe4884e60=
8e11a82d994e183d%7C0%7C0%7C637815719552700496%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sd=
ata=3DNjykC%2F60KxU7%2FmTnzNMNzJReXV06mjFzQPvDM1Pyj%2F4%3D&amp;reserved=3D0
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # =

> job-script is attached in this email
>
>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.01.org%2Fhyperkitty%2Flist%2Flkp%40lists.01.org&amp;data=3D04%7C01%7Cchris=
tian.koenig%40amd.com%7C3101ff318a994e6eaf5f08d9fa0481ea%7C3dd8961fe4884e60=
8e11a82d994e183d%7C0%7C0%7C637815719552700496%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sd=
ata=3Dv8BQLwbrizBXoDoHb77IgXjPnvrF%2BomFQpmhNYXa8i0%3D&amp;reserved=3D0    =
   Intel Corporation
>
> Thanks,
> Oliver Sang
>

--===============5609788426037677712==--

