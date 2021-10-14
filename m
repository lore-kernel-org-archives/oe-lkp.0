Content-Type: multipart/mixed; boundary="===============3637129394308472537=="
MIME-Version: 1.0
From: Mike Rapoport <rppt@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lib/stackdepot] 1cd8ce52c5: BUG:unable_to_handle_page_fault_for_address
Date: Thu, 14 Oct 2021 13:16:50 +0300
Message-ID: <YWgDkjqtJO4e3DM6@kernel.org>
In-Reply-To: <4d99add1-5cf7-c608-a131-18959b85e5dc@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3637129394308472537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 11:33:03AM +0200, Vlastimil Babka wrote:
> On 10/14/21 10:54, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 1cd8ce52c520c26c513899fb5aee42b8e5f60d0d ("[PATCH v2] lib/stack=
depot: allow optional init and stack_table allocation by kvmalloc()")
> > url: https://github.com/0day-ci/linux/commits/Vlastimil-Babka/lib-stack=
depot-allow-optional-init-and-stack_table-allocation-by-kvmalloc/20211012-1=
70816
> > base: git://anongit.freedesktop.org/drm-intel for-linux-next
> > =

> > in testcase: rcutorture
> > version: =

> > with following parameters:
> > =

> > 	runtime: 300s
> > 	test: cpuhotplug
> > 	torture_type: srcud
> > =

> > test-description: rcutorture is rcutorture kernel module load/unload te=
st.
> > test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> > =

> > =

> > on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > +---------------------------------------------+------------+-----------=
-+
> > |                                             | a94a6d76c9 | 1cd8ce52c5=
 |
> > +---------------------------------------------+------------+-----------=
-+
> > | boot_successes                              | 30         | 0         =
 |
> > | boot_failures                               | 0          | 7         =
 |
> > | BUG:kernel_NULL_pointer_dereference,address | 0          | 2         =
 |
> > | Oops:#[##]                                  | 0          | 7         =
 |
> > | EIP:stack_depot_save                        | 0          | 7         =
 |
> > | Kernel_panic-not_syncing:Fatal_exception    | 0          | 7         =
 |
> > | BUG:unable_to_handle_page_fault_for_address | 0          | 5         =
 |
> > +---------------------------------------------+------------+-----------=
-+
> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > =

> > [  319.147926][  T259] BUG: unable to handle page fault for address: 0e=
c74110
> > [  319.149309][  T259] #PF: supervisor read access in kernel mode
> > [  319.150362][  T259] #PF: error_code(0x0000) - not-present page
> > [  319.151372][  T259] *pde =3D 00000000
> > [  319.151964][  T259] Oops: 0000 [#1] SMP
> > [  319.152617][  T259] CPU: 0 PID: 259 Comm: systemd-rc-loca Not tainte=
d 5.15.0-rc1-00270-g1cd8ce52c520 #1
> > [  319.154514][  T259] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS 1.12.0-1 04/01/2014
> > [  319.156200][  T259] EIP: stack_depot_save+0x12a/0x4d0
> =

> =

> Cc Mike Rapoport, looks like:
> - memblock_alloc() should have failed (I think, because page allocator
>   already took over?), but didn't. So apparently we got some area that wa=
sn't
>   fully mapped.
> - using slab_is_available() is not accurate enough to detect when to use
> memblock or page allocator (kvmalloc in case of my patch). I have used it
> because memblock_alloc_internal() checks the same condition to issue a wa=
rning.
> =

> Relevant part of dmesg.xz that was attached:
> [    1.589075][    T0] Dentry cache hash table entries: 524288 (order: 9,=
 2097152 bytes, linear)
> [    1.592396][    T0] Inode-cache hash table entries: 262144 (order: 8, =
1048576 bytes, linear)
> [    2.916844][    T0] allocated 31496920 bytes of page_ext
> =

> - this means we were allocating from page allocator by alloc_pages_exact_=
nid() already
> =

> [    2.918197][    T0] mem auto-init: stack:off, heap alloc:off, heap fre=
e:on
> [    2.919683][    T0] mem auto-init: clearing system memory may take som=
e time...
> [    2.921239][    T0] Initializing HighMem for node 0 (000b67fe:000bffe0)
> [   23.023619][    T0] Initializing Movable for node 0 (00000000:00000000)
> [  245.194520][    T0] Checking if this processor honours the WP bit even=
 in supervisor mode...Ok.
> [  245.196847][    T0] Memory: 2914460K/3145208K available (20645K kernel=
 code, 5953K rwdata, 12624K rodata, 760K init, 8112K bss, 230748K reserved,=
 0K cma-reserved, 155528K highmem)
> [  245.200521][    T0] Stack Depot allocating hash table with memblock_al=
loc
> =

> - initializing stack depot as part of initializing page_owner, uses membl=
ock_alloc()
>   because slab_is_available() is still false
> =

> [  245.212005][    T0] Node 0, zone   Normal: page owner found early allo=
cated 0 pages
> [  245.213867][    T0] Node 0, zone  HighMem: page owner found early allo=
cated 0 pages
> [  245.216126][    T0] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, C=
PUs=3D2, Nodes=3D1
> =

> - printed by slub's kmem_cache_init() after create_kmalloc_caches() setti=
ng slab_state
>   to UP, making slab_is_available() true, but too late
> =

> In my local testing of the patch, when stackdepot was initialized through
> page owner init, it was using kvmalloc() so slab_is_available() was true.
> Looks like the exact order of slab vs page_owner alloc is non-determinist=
ic,
> could be arch-dependent or just random ordering of init calls. A wrong or=
der
> will exploit the apparent fact that slab_is_available() is not a good
> indicator of using memblock vs page allocator, and we would need a better=
 one.
> Thoughts?

The order of slab vs page_owner is deterministic, but it is different for
FLATMEM and SPARSEMEM. And page_ext_init_flatmem_late() that initializes
page_ext for FLATMEM is called exactly between buddy and slab setup:

static void __init mm_init(void)
{
	...

	mem_init();
	mem_init_print_info();
	/* page_owner must be initialized after buddy is ready */
	page_ext_init_flatmem_late();
	kmem_cache_init();

	...
}

I've stared for a while at page_ext init and it seems that the
page_ext_init_flatmem_late() can be simply dropped because there is anyway
a call to invoke_init_callbacks() in page_ext_init() that is called much
later in the boot process.

-- =

Sincerely yours,
Mike.
--===============3637129394308472537==--

