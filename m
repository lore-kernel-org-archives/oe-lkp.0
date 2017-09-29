Content-Type: multipart/mixed; boundary="===============7768618214087956974=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 9e52fc2b50: will-it-scale.per_thread_ops -16% regression
Date: Fri, 29 Sep 2017 15:13:29 +0200
Message-ID: <20170929131329.tekd6a7yfrkm7lwl@hirez.programming.kicks-ass.net>
In-Reply-To: <87d169zo9o.fsf@vitty.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7768618214087956974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 02:24:03PM +0200, Vitaly Kuznetsov wrote:
> 1) In case the system is under extreme memory pressure and
> __get_free_page() is failing in tlb_remove_table() we'll be doing
> smp_call_function() for _each_ call (avoiding batching). We may want to
> have a pre-allocated pool.

MMU_GATHER_BUNDLE should avoid it being for _every_ call.

Also, note that tlb_gather is preemptible, so pre-alloc is 'difficult'
and you will run out, esp. when memory is right.

> 2) The default MAX_TABLE_BATCH is static (it is equal to the number of
> pointer we can fit into one page - sizeof(struct mmu_table_batch) =3D=3D
> 509), we may want to adjust it for very big systems.

That would then put more stress on the memory allocator because you're
then asking for higher order pages.

--===============7768618214087956974==--

