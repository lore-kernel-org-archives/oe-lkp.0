Content-Type: multipart/mixed; boundary="===============8002009909879609132=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 9e52fc2b50: will-it-scale.per_thread_ops -16% regression
Date: Fri, 29 Sep 2017 16:02:27 +0200
Message-ID: <874lrlzjpo.fsf@vitty.brq.redhat.com>
In-Reply-To: <20170929131609.i5t46af7nkjwekbk@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8002009909879609132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Peter Zijlstra <peterz@infradead.org> writes:

> On Fri, Sep 29, 2017 at 03:13:29PM +0200, Peter Zijlstra wrote:
>> On Fri, Sep 29, 2017 at 02:24:03PM +0200, Vitaly Kuznetsov wrote:
>> > 1) In case the system is under extreme memory pressure and
>> > __get_free_page() is failing in tlb_remove_table() we'll be doing
>> > smp_call_function() for _each_ call (avoiding batching). We may want to
>> > have a pre-allocated pool.
>> =

>> MMU_GATHER_BUNDLE should avoid it being for _every_ call.
>
> My bad, that's only for pages, not tables :/
>
>> Also, note that tlb_gather is preemptible, so pre-alloc is 'difficult'
>> and you will run out, esp. when memory is right.
>> =


(purely teoretical thought) what I meant to say is in tlb_remove_table()
we may try to get new batch from some pre-allocated (on boot) pool and
revert to __get_free_page() when it's empty. This may make sense
combined with the next idea, allocating more than 1 page.

>> > 2) The default MAX_TABLE_BATCH is static (it is equal to the number of
>> > pointer we can fit into one page - sizeof(struct mmu_table_batch) =3D=
=3D
>> > 509), we may want to adjust it for very big systems.
>> =

>> That would then put more stress on the memory allocator because you're
>> then asking for higher order pages.

Of course, but the question is: what's cheaper -- try to alloc e.g. 8
pages or do 8 smp_call_function() calls?

But adding such complexity to the code would require a good
justification, of course.

-- =

  Vitaly

--===============8002009909879609132==--

