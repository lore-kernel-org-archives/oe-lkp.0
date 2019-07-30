Content-Type: multipart/mixed; boundary="===============2945977034516996237=="
MIME-Version: 1.0
From: Laura Abbott <labbott@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 6471384af2: kernel_BUG_at_mm/slub.c
Date: Tue, 30 Jul 2019 18:39:27 -0400
Message-ID: <538637ba-f4e3-0dfa-cb13-3aee51c659bd@redhat.com>
In-Reply-To: <20190729094316.GN22106@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2945977034516996237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/29/19 5:43 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 6471384af2a6530696fc0203bafe4de41a23c9ef ("mm: security: introduc=
e init_on_alloc=3D1 and init_on_free=3D1 boot options")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | ba5c5e4a5d | 6471384af2 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 8          | 0          |
> | boot_failures                            | 2          | 15         |
> | invoked_oom-killer:gfp_mask=3D0x           | 1          |            |
> | Mem-Info                                 | 1          |            |
> | kernel_BUG_at_security/keys/keyring.c    | 1          |            |
> | invalid_opcode:#[##]                     | 1          | 15         |
> | RIP:__key_link_begin                     | 1          |            |
> | Kernel_panic-not_syncing:Fatal_exception | 1          | 15         |
> | kernel_BUG_at_mm/slub.c                  | 0          | 15         |
> | RIP:kfree                                | 0          | 15         |
> +------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [    4.478342] kernel BUG at mm/slub.c:306!
> [    4.482437] invalid opcode: 0000 [#1] PREEMPT PTI
> [    4.485750] CPU: 0 PID: 0 Comm: swapper Not tainted 5.2.0-05754-g64713=
84a #4
> [    4.490635] RIP: 0010:kfree+0x58a/0x5c0
> [    4.493679] Code: 48 83 05 78 37 51 02 01 0f 0b 48 83 05 7e 37 51 02 0=
1 48 83 05 7e 37 51 02 01 48 83 05 7e 37 51 02 01 48 83 05 d6 37 51 02 01 <=
0f> 0b 48 83 05 d4 37 51 02 01 48 83 05 d4 37 51 02 01 48 83 05 d4
> [    4.506827] RSP: 0000:ffffffff82603d90 EFLAGS: 00010002
> [    4.510475] RAX: ffff8c3976c04320 RBX: ffff8c3976c04300 RCX: 000000000=
0000000
> [    4.515420] RDX: ffff8c3976c04300 RSI: 0000000000000000 RDI: ffff8c397=
6c04320
> [    4.520331] RBP: ffffffff82603db8 R08: 0000000000000000 R09: 000000000=
0000000
> [    4.525288] R10: ffff8c3976c04320 R11: ffffffff8289e1e0 R12: ffffd52cc=
8db0100
> [    4.530180] R13: ffff8c3976c01a00 R14: ffffffff810f10d4 R15: ffff8c397=
6c04300
> [    4.535079] FS:  0000000000000000(0000) GS:ffffffff8266b000(0000) knlG=
S:0000000000000000
> [    4.540628] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.544593] CR2: ffff8c397ffff000 CR3: 0000000125020000 CR4: 000000000=
00406b0
> [    4.549558] Call Trace:
> [    4.551266]  apply_wqattrs_prepare+0x154/0x280
> [    4.554357]  apply_workqueue_attrs_locked+0x4e/0xe0
> [    4.557728]  apply_workqueue_attrs+0x36/0x60
> [    4.560654]  alloc_workqueue+0x25a/0x6d0
> [    4.563381]  ? kmem_cache_alloc_trace+0x1e3/0x500
> [    4.566628]  ? __mutex_unlock_slowpath+0x44/0x3f0
> [    4.569875]  workqueue_init_early+0x246/0x348
> [    4.573025]  start_kernel+0x3c7/0x7ec
> [    4.575558]  x86_64_start_reservations+0x40/0x49
> [    4.578738]  x86_64_start_kernel+0xda/0xe4
> [    4.581600]  secondary_startup_64+0xb6/0xc0
> [    4.584473] Modules linked in:
> [    4.586620] ---[ end trace f67eb9af4d8d492b ]---

I think this is catching an edge case with the freelist walking code
in slab_free_freelist_hook. If we're not doing a bulk free,
getting the free pointer from the object is going to be bogus so
there's a chance it could trigger the bug in set_freepointer even
if we don't actually care about it since it's going to get
overwritten when we actually free. It's probably more robust
to make sure we're terminating it with NULL. Lightly tested:

diff --git a/mm/slub.c b/mm/slub.c
index e6c030e47364..8834563cdb4b 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1432,7 +1432,9 @@ static inline bool slab_free_freelist_hook(struct kme=
m_cache *s,
  	void *old_tail =3D *tail ? *tail : *head;
  	int rsize;
  =

-	if (slab_want_init_on_free(s))
+	if (slab_want_init_on_free(s)) {
+		void *p =3D NULL;
+
  		do {
  			object =3D next;
  			next =3D get_freepointer(s, object);
@@ -1445,8 +1447,10 @@ static inline bool slab_free_freelist_hook(struct km=
em_cache *s,
  							   : 0;
  			memset((char *)object + s->inuse, 0,
  			       s->size - s->inuse - rsize);
-			set_freepointer(s, object, next);
+			set_freepointer(s, object, p);
+			p =3D object;
  		} while (object !=3D old_tail);
+	}
  =

  /*
   * Compiler cannot detect this function can be removed if slab_free_hook()


--===============2945977034516996237==--

