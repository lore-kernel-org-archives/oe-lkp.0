Content-Type: multipart/mixed; boundary="===============5073244801894552318=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Mon, 01 Aug 2022 16:23:23 +0200
Message-ID: <0e545088-d140-4c84-bbb2-a3be669740b2@suse.cz>
In-Reply-To: <Yudw5ge/lJ26Hksk@feng-skl>
List-Id: <oe-lkp.lists.linux.dev>

--===============5073244801894552318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/1/22 08:21, Feng Tang wrote:
> On Sun, Jul 31, 2022 at 04:16:53PM +0800, Tang, Feng wrote:
>> Hi Oliver,
>> =

>> On Sun, Jul 31, 2022 at 02:53:17PM +0800, Sang, Oliver wrote:
>> > =

>> > =

>> > Greeting,
>> > =

>> > FYI, we noticed the following commit (built with gcc-11):
>> > =

>> > commit: 3616799128612e04ed919579e2c7b0dccf6bcb00 ("[PATCH v3 3/3] mm/s=
lub: extend redzone check to cover extra allocated kmalloc space than reque=
sted")
>> > url: https://github.com/intel-lab-lkp/linux/commits/Feng-Tang/mm-slub-=
some-debug-enhancements/20220727-151318
>> > base: git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git for-n=
ext
>> > patch link: https://lore.kernel.org/linux-mm/20220727071042.8796-4-fen=
g.tang(a)intel.com
>> > =

>> > in testcase: boot
>> > =

>> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp =
2 -m 16G
>> > =

>> > caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
>> > =

>> > =

>> > If you fix the issue, kindly add following tag
>> > Reported-by: kernel test robot <oliver.sang@intel.com>
>> > =

>> > =

>> > [   50.637839][  T154] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > [   50.639937][  T154] BUG kmalloc-16 (Not tainted): kmalloc Redzone o=
verwritten
>> > [   50.641291][  T154] -----------------------------------------------=
------------------------------
>> > [   50.641291][  T154]
>> > [   50.643617][  T154] 0xffff88810018464c-0xffff88810018464f @offset=
=3D1612. First byte 0x7 instead of 0xcc
>> > [   50.645311][  T154] Allocated in __sdt_alloc+0x258/0x457 age=3D1428=
7 cpu=3D0 pid=3D1
>> > [   50.646584][  T154]  ___slab_alloc+0x52b/0x5b6
>> > [   50.647411][  T154]  __slab_alloc+0x1a/0x22
>> > [   50.648374][  T154]  __kmalloc_node+0x10c/0x1e1
>> > [   50.649237][  T154]  __sdt_alloc+0x258/0x457
>> > [   50.650060][  T154]  build_sched_domains+0xae/0x10e8
>> > [   50.650981][  T154]  sched_init_smp+0x30/0xa5
>> > [   50.651805][  T154]  kernel_init_freeable+0x1c6/0x23b
>> > [   50.652767][  T154]  kernel_init+0x14/0x127
>> > [   50.653594][  T154]  ret_from_fork+0x1f/0x30
>> > [   50.654414][  T154] Slab 0xffffea0004006100 objects=3D28 used=3D28 =
fp=3D0x0000000000000000 flags=3D0x1fffc0000000201(locked|slab|node=3D0|zone=
=3D1|lastcpupid=3D0x3fff)
>> > [   50.656866][  T154] Object 0xffff888100184640 @offset=3D1600 fp=3D0=
xffff888100184520
>> > [   50.656866][  T154]
>> > [   50.658410][  T154] Redzone  ffff888100184630: cc cc cc cc cc cc cc=
 cc cc cc cc cc cc cc cc cc  ................
>> > [   50.660047][  T154] Object   ffff888100184640: 00 32 80 00 81 88 ff=
 ff 01 00 00 00 07 00 80 8a  .2..............
>> > [   50.661837][  T154] Redzone  ffff888100184650: cc cc cc cc cc cc cc=
 cc                          ........
>> > [   50.663454][  T154] Padding  ffff8881001846b4: 5a 5a 5a 5a 5a 5a 5a=
 5a 5a 5a 5a 5a              ZZZZZZZZZZZZ
>> > [   50.665225][  T154] CPU: 0 PID: 154 Comm: systemd-udevd Not tainted=
 5.19.0-rc5-00010-g361679912861 #1
>> > [   50.666861][  T154] Hardware name: QEMU Standard PC (i440FX + PIIX,=
 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
>> > [   50.668694][  T154] Call Trace:
>> > [   50.669331][  T154]  <TASK>
>> > [   50.669832][  T154]  dump_stack_lvl+0x57/0x7d
>> > [   50.670601][  T154]  check_bytes_and_report+0xca/0xfe
>> > [   50.671436][  T154]  check_object+0xdc/0x24d
>> > [   50.672163][  T154]  free_debug_processing+0x98/0x210
>> > [   50.673904][  T154]  __slab_free+0x46/0x198
>> > [   50.675746][  T154]  qlist_free_all+0xae/0xde
>> > [   50.676552][  T154]  kasan_quarantine_reduce+0x10d/0x145
>> > [   50.677507][  T154]  __kasan_slab_alloc+0x1c/0x5a
>> > [   50.678327][  T154]  slab_post_alloc_hook+0x5a/0xa2
>> > [   50.680069][  T154]  kmem_cache_alloc+0x102/0x135
>> > [   50.680938][  T154]  getname_flags+0x4b/0x314
>> > [   50.681781][  T154]  do_sys_openat2+0x7a/0x15c
>> > [   50.706848][  T154] Disabling lock debugging due to kernel taint
>> > [   50.707913][  T154] FIX kmalloc-16: Restoring kmalloc Redzone 0xfff=
f88810018464c-0xffff88810018464f=3D0xcc
>> =

>> Thanks for the report!
>> =

>> From the log it happened when kasan is enabled, and my first guess is
>> the data processing from kmalloc redzone handling had some conflict
>> with kasan's in allocation path (though I tested some kernel config
>> with KASAN enabled)
>> =

>> Will study more about kasan and reproduce/debug this. thanks
> =

> Cc kansan  mail list.
> =

> This is really related with KASAN debug, that in free path, some
> kmalloc redzone ([orig_size+1, object_size]) area is written by
> kasan to save free meta info.
> =

> The callstack is:
> =

>   kfree
>     slab_free
>       slab_free_freelist_hook
>           slab_free_hook
>             __kasan_slab_free
>               ____kasan_slab_free
>                 kasan_set_free_info
>                   kasan_set_track    =

> =

> And this issue only happens with "kmalloc-16" slab. Kasan has 2
> tracks: alloc_track and free_track, for x86_64 test platform, most
> of the slabs will reserve space for alloc_track, and reuse the
> 'object' area for free_track.  The kasan free_track is 16 bytes
> large, that it will occupy the whole 'kmalloc-16's object area,
> so when kmalloc-redzone is enabled by this patch, the 'overwritten'
> error is triggered.
> =

> But it won't hurt other kmalloc slabs, as kasan's free meta won't
> conflict with kmalloc-redzone which stay in the latter part of
> kmalloc area.
> =

> So the solution I can think of is:
> * skip the kmalloc-redzone for kmalloc-16 only, or
> * skip kmalloc-redzone if kasan is enabled, or
> * let kasan reserve the free meta (16 bytes) outside of object
>   just like for alloc meta

Maybe we could add some hack that if both kasan and SLAB_STORE_USER is
enabled, we bump the stored orig_size from <16 to 16? Similar to what
__ksize() does.

> I don't have way to test kasan's SW/HW tag configuration, which
> is only enabled on arm64 now. And I don't know if there will
> also be some conflict.
> =

> Thanks,
> Feng
>=20

--===============5073244801894552318==--

