Content-Type: multipart/mixed; boundary="===============6298083159589245710=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm, slub] c91e241f56: WARNING:at_mm/slub.c:#kmem_cache_open
Date: Sat, 27 Jun 2020 21:23:31 -0700
Message-ID: <alpine.DEB.2.22.394.2006272121380.591864@chino.kir.corp.google.com>
In-Reply-To: <20200627075158.GA5535@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6298083159589245710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jun 2020, kernel test robot wrote:

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: c91e241f569e7f9b0e2946841ef884b22a09f624 ("mm, slub: introduce km=
em_cache_debug_flags()-fix")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: kernel-selftests
> with following parameters:
> =

> 	group: kselftests-x86
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------+------------+------------+
> |                                       | d5cee50015 | c91e241f56 |
> +---------------------------------------+------------+------------+
> | boot_successes                        | 13         | 0          |
> | boot_failures                         | 0          | 17         |
> | WARNING:at_mm/slub.c:#kmem_cache_open | 0          | 17         |
> | EIP:kmem_cache_open                   | 0          | 17         |
> | WARNING:at_mm/slub.c:#new_slab        | 0          | 17         |
> | EIP:new_slab                          | 0          | 17         |
> | WARNING:at_mm/slub.c:#___slab_alloc   | 0          | 17         |
> | EIP:___slab_alloc                     | 0          | 17         |
> | WARNING:at_mm/slub.c:#__slab_free     | 0          | 17         |
> | EIP:__slab_free                       | 0          | 17         |
> | WARNING:at_mm/slub.c:#deactivate_slab | 0          | 4          |
> | EIP:deactivate_slab                   | 0          | 4          |
> +---------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> [    1.934611] WARNING: CPU: 0 PID: 0 at mm/slub.c:132 kmem_cache_open+0x=
1cc/0x346
> [    1.934612] Modules linked in:
> [    1.934614] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc1-00274-gc=
91e241f569e7 #1
> [    1.934615] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [    1.934615] EIP: kmem_cache_open+0x1cc/0x346
> [    1.934617] Code: 83 ca ff b9 02 00 00 00 0f bd c7 0f 44 c2 99 f7 f9 b=
a 0a 00 00 00 83 f8 0a 0f 47 c2 ba 05 00 00 00 83 f8 05 0f 42 c2 89 43 08 <=
0f> 0b 81 ff ff 0f 00 00 76 09 c7 43 18 02 00 00 00 eb 29 81 ff ff
> [    1.934618] EAX: 00000005 EBX: 8d26c820 ECX: 00000002 EDX: 00000005
> [    1.934619] ESI: 00000040 EDI: 00000040 EBP: 8d181eec ESP: 8d181ed0
> [    1.934620] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210=
093
> [    1.934621] CR0: 80050033 CR2: ffbff000 CR3: 0d2bc000 CR4: 000406b0
> [    1.934622] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    1.934622] DR6: fffe0ff0 DR7: 00000400
> [    1.934623] Call Trace:
> [    1.934624]  __kmem_cache_create+0x1f/0x100
> [    1.934624]  ? vprintk_emit+0x1c4/0x1ce
> [    1.934625]  ? vprintk_default+0x12/0x14
> [    1.934626]  create_boot_cache+0x59/0x79
> [    1.934626]  kmem_cache_init+0x48/0x11d
> [    1.934627]  start_kernel+0x217/0x424
> [    1.934628]  ? early_idt_handler_common+0x44/0x44
> [    1.934628]  i386_start_kernel+0x43/0x45
> [    1.934629]  startup_32_smp+0x164/0x168
> [    1.934630] ---[ end trace 19a0735aef7d3dec ]---
> =


I think this is fixed by =

mm-slab-slub-improve-error-reporting-and-overhead-of-cache_from_obj-fix.pat=
ch =

in -mm, the config here does not have CONFIG_SLUB_DEBUG enabled so the =

VM_WARN_ON_ONCE() would always be triggered without this fix.
--===============6298083159589245710==--

