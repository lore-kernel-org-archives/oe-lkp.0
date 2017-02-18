Content-Type: multipart/mixed; boundary="===============2708647447419367750=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/mutex] e274795ea7 WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/internal.h:348 __switch_to
Date: Sat, 18 Feb 2017 15:26:45 +0100
Message-ID: <20170218142645.GH6500@twins.programming.kicks-ass.net>
In-Reply-To: <20170218135307.dw6gt5tjqdprxzkr@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2708647447419367750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2017 at 09:53:07PM +0800, Fengguang Wu wrote:

> >>[   13.377261] Write protecting the kernel text: 15320k
> >>[   13.378910] Write protecting the kernel read-only data: 6316k
> >>[   13.380655] NX-protecting the kernel data: 9256k
> >>[   13.382475] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> >>[   13.384781] ------------[ cut here ]------------
> >>[   13.386327] WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/inter=
nal.h:348 __switch_to+0x1b6/0x260
> >
> >What tree is this? on current next/master that file doesn't have a WARN
> >on that line.
> =

> The dmesg comes from the first bad commit e274795ea7 ("locking/mutex: Fix=
 mutex handoff").
> =

> % git blame -sL 333,350 e274795ea7 arch/x86/include/asm/fpu/internal.h
> fd169b05 333) /*
> fd169b05 334)  * Save processor xstate to xsave area.
> fd169b05 335)  */
> 8c05f05e 336) static inline void copy_xregs_to_kernel(struct xregs_state =
*xstate)
> fd169b05 337) {
> fd169b05 338)   u64 mask =3D -1;
> fd169b05 339)   u32 lmask =3D mask;
> fd169b05 340)   u32 hmask =3D mask >> 32;
> b7106fa0 341)   int err;
> fd169b05 342)
> fd169b05 343)   WARN_ON(!alternatives_patched);
> fd169b05 344)
> b7106fa0 345)   XSTATE_XSAVE(xstate, lmask, hmask, err);
> fd169b05 346)
> 8c05f05e 347)   /* We should never fault when copying to a kernel buffer:=
 */
> 8c05f05e 348)   WARN_ON_FPU(err);


Argh, I'm an idiot..

Please try this one..

---
 kernel/fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 68b1706c75d0..a366f636e8af 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -444,7 +444,7 @@ void __init fork_init(void)
 #ifndef ARCH_MIN_TASKALIGN
 #define ARCH_MIN_TASKALIGN	0
 #endif
-	int align =3D min_t(int, L1_CACHE_BYTES, ARCH_MIN_TASKALIGN);
+	int align =3D max_t(int, L1_CACHE_BYTES, ARCH_MIN_TASKALIGN);
 =

 	/* create a slab on which task_structs can be allocated */
 	task_struct_cachep =3D kmem_cache_create("task_struct",

--===============2708647447419367750==--

