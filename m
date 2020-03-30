Content-Type: multipart/mixed; boundary="===============2406795950410252347=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] fd4d9c7d0c: stress-ng.switch.ops_per_sec -30.5% regression
Date: Mon, 30 Mar 2020 09:12:54 +0800
Message-ID: <20200330011254.GA14393@feng-iot>
In-Reply-To: <CAHk-=wi2c3UcK4fjUR2nM-7iUOAyQijq9ETfQHaN0WwFh2Bm9A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2406795950410252347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Mar 27, 2020 at 12:57:45AM +0800, Linus Torvalds wrote:
> On Wed, Mar 25, 2020 at 10:57 PM kernel test robot
> <rong.a.chen@intel.com> wrote:
> >
> > FYI, we noticed a -30.5% regression of stress-ng.switch.ops_per_sec due=
 to commit:
> >
> > commit: fd4d9c7d0c71866ec0c2825189ebd2ce35bd95b8 ("mm: slub: add missin=
g TID bump in kmem_cache_alloc_bulk()")
> =

> This looks odd.
> =

> I would not expect the update of c->tid to have that noticeable an
> impact, even on a big machine that might be close to some scaling
> limit.
 =

The test machin is a Cascade Lake platform, 2 sockets, 48C/96T.

> It doesn't add any expensive atomic ops, and while it _could_ make a
> percpu cacheline dirty, I think that cacheline should already be dirty
> anyway under any load where this is noticeable. Plus this should be a
> relatively cold path anyway.
> =

> So mind humoring me, and double-check that regression?
> =

> Of course, it might be another "just magic cache placement" detail
> where code moved enough to make a difference.
> =

> Or maybe it really ends up causing new tid mismatches and we end up
> failing the fast path in slub as a result. But looking at the stats
> that changed in your message doesn't make me go "yeah, that looks like
> a slub difference".

Per our check, the code movement does exist.

>From the system map:

old map:
	ffffffff812a1880 T kmem_cache_alloc_bulk
	ffffffff812a1a80 t kmalloc_large_node
	ffffffff812a1b10 t calculate_sizes
	ffffffff812a1eb0 t store_user_store
	ffffffff812a1f20 t poison_store
	ffffffff812a1f90 t red_zone_store
	ffffffff812a2000 t order_store

new map:
	ffffffff812a1880 T kmem_cache_alloc_bulk
	ffffffff812a1a90 t kmalloc_large_node
	ffffffff812a1b20 T __kmalloc_node	---> relocated
	ffffffff812a1e40 t calculate_sizes
	ffffffff812a21e0 t store_user_store
	ffffffff812a2250 t poison_store
	ffffffff812a22c0 t red_zone_store
	ffffffff812a2330 t order_store

In old map the 'kmem_cache_alloc_bulk' is cache aligned, and occupies
0x200 bytes, and the next function 'kmalloc_large_node' starts at
an alinged address. In new map 'kmem_cache_alloc_bulk' occupies
0x210 bytes, and offset of the alignment of many functions following
it. (please let us know if you need the full system map for the
2 vmlinuxs)

>From the objdump, the direct chagne of "c->tid =3D next_tid(c->tid);" =

is one line added "49 83 40 08 01	addq   $0x1,0x8(%r8)"

We did experiments to make the kernel functions 32 bytes aligned,
----------------------------------------------------------------
diff --git a/Makefile b/Makefile
index 171f2b004c8a..63f28aaf78c9 100644
--- a/Makefile
+++ b/Makefile
 =

 KBUILD_AFLAGS   :=3D -D__ASSEMBLY__ -fno-PIE
-KBUILD_CFLAGS   :=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigra=
phs \
+KBUILD_CFLAGS   :=3D -Wall -Wundef -falign-functions=3D32 -Werror=3Dstrict=
-prototypes -Wno-trigraphs \
----------------------------------------------------------------
 =

the regression is reduced to about 3%:

2060457 =C2=B1  4%      -3.2%    1993685 =C2=B1  2%  stress-ng.switch.ops_p=
er_sec

which is pretty small for a micro-benchmark

Thanks,
Feng
--===============2406795950410252347==--

