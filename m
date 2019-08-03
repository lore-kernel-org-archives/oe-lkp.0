Content-Type: multipart/mixed; boundary="===============4717877720201649991=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: slub: Fix slab walking for init_on_free
Date: Sat, 03 Aug 2019 02:19:57 -0700
Message-ID: <alpine.DEB.2.21.1908030219420.112263@chino.kir.corp.google.com>
In-Reply-To: <20190731193240.29477-1-labbott@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4717877720201649991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 31 Jul 2019, Laura Abbott wrote:

> To properly clear the slab on free with slab_want_init_on_free,
> we walk the list of free objects using get_freepointer/set_freepointer.
> The value we get from get_freepointer may not be valid. This
> isn't an issue since an actual value will get written later
> but this means there's a chance of triggering a bug if we use
> this value with set_freepointer:
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
> =

> Fix this by ensuring the value we set with set_freepointer is either NULL
> or another value in the chain.
> =

> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: Laura Abbott <labbott@redhat.com>

Acked-by: David Rientjes <rientjes@google.com>

--===============4717877720201649991==--

