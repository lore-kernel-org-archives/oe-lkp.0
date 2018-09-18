Content-Type: multipart/mixed; boundary="===============0758705721185936012=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [vfree, kvfree] a79ed8bfb2: BUG:sleeping_function_called_from_invalid_context_at_mm/util.c
Date: Tue, 18 Sep 2018 12:43:31 +0300
Message-ID: <7e19e4df-b1a6-29bd-9ae7-0266d50bef1d@virtuozzo.com>
In-Reply-To: <20180918085252.GR7632@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0758705721185936012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/18/2018 11:52 AM, kernel test robot wrote:

> =

> [    3.265372] BUG: sleeping function called from invalid context at mm/u=
til.c:449
> [    3.288552] in_atomic(): 0, irqs_disabled(): 0, pid: 142, name: rhasht=
able_thra
> [    3.301548] INFO: lockdep is turned off.
> [    3.302214] Preemption disabled at:
> [    3.302221] [<c163e86f>] get_random_u32+0x4f/0x100
> [    3.327556] CPU: 0 PID: 142 Comm: rhashtable_thra Tainted: G        W =
      T 4.19.0-rc3-00266-ga79ed8bf #656
> [    3.328540] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    3.328540] Call Trace:
> [    3.328540]  ? dump_stack+0x55/0x7b
> [    3.328540]  ? get_random_u32+0x4f/0x100
> [    3.328540]  ? ___might_sleep+0x11d/0x170
> [    3.328540]  ? kvfree+0x61/0x70
> [    3.328540]  ? bucket_table_free+0x18/0x80
> [    3.328540]  ? bucket_table_alloc+0x79/0x160
> [    3.328540]  ? rhashtable_insert_slow+0x25d/0x2d0
> [    3.328540]  ? insert_retry+0x1df/0x320
> [    3.328540]  ? threadfunc+0xa3/0x3fe
> [    3.328540]  ? kzalloc+0x14/0x14
> [    3.328540]  ? _raw_spin_unlock_irqrestore+0x30/0x50
> [    3.328540]  ? kthread+0xd1/0x100
> [    3.328540]  ? insert_retry+0x320/0x320
> [    3.328540]  ? kthread_delayed_work_timer_fn+0x80/0x80
> [    3.328540]  ? ret_from_fork+0x2e/0x38


Seems like we need to drop might_sleep_if() from kvfree().

	rcu_read_lock()
		rhashtable_insert_rehash()
			new_tbl =3D bucket_table_alloc(ht, size, GFP_ATOMIC | __GFP_NOWARN);
				->kvmalloc();

		bucket_table_free(new_tbl);
			->kvfree()
	rcu_read_unlock()

kvmalloc(..., GFP_ATOMIC) simply always kmalloc:
	if ((flags & GFP_KERNEL) !=3D GFP_KERNEL)
		return kmalloc_node(size, flags, node);

So in the above case, kvfree() always frees kmalloced memory -> and never c=
alls vfree().

Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
---
 mm/util.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 929ed1795bc1..7f1f165f46af 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -446,8 +446,6 @@ EXPORT_SYMBOL(kvmalloc_node);
  */
 void kvfree(const void *addr)
 {
-	might_sleep_if(!in_interrupt());
-
 	if (is_vmalloc_addr(addr))
 		vfree(addr);
 	else
--=20

--===============0758705721185936012==--

