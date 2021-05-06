Content-Type: multipart/mixed; boundary="===============4193664852974400193=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Thu, 06 May 2021 00:54:59 +0000
Message-ID: <40632FBD-8874-4B6C-A945-F2EBC96CF12B@fb.com>
In-Reply-To: <YItcfQfZlNZTmQKR@carbon.dhcp.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4193664852974400193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ping

> On Apr 29, 2021, at 18:25, Roman Gushchin <guro@fb.com> wrote:
> =

> =EF=BB=BFOn Tue, Apr 27, 2021 at 03:34:48PM +0800, kernel test robot wrot=
e:
>> =

>> =

>> Greeting,
>> =

>> FYI, we noticed a -2.3% regression of aim9.sync_disk_rw.ops_per_sec due =
to commit:
> =

> Wow, that's very surprising, given that there are no pcpu allocations on =
any hot
> paths there.
> =

> I tried hard to reproduce it, and I think I see something, however the da=
ta is
> very noisy. I'm not sure I can confidently attribute the regression to
> ace7e70901 ("percpu: use reclaim threshold instead of running for every p=
age")
> rather than
> f183324133 ("percpu: implement partial chunk depopulation").
> =

> Anyway, in my setup the following patch seems to fix the regression.
> Is it possible to test it?
> =

> Thank you!
> =

> Roman
> =

> --
> =

> From 6ee182110126cf93cf43389923bcf49ba12cb9a0 Mon Sep 17 00:00:00 2001
> From: Roman Gushchin <guro@fb.com>
> Date: Thu, 29 Apr 2021 18:01:40 -0700
> Subject: [PATCH] percpu: optimize locking in pcpu_balance_workfn()
> =

> pcpu_balance_workfn() unconditionally calls pcpu_balance_free(),
> pcpu_reclaim_populated(), pcpu_balance_populated() and
> pcpu_balance_free() again.
> =

> Each call to pcpu_balance_free() and pcpu_reclaim_populated() will
> cause at least one acquisition of the pcpu_lock. So even if the
> balancing was scheduled because of a failed atomic allocation,
> pcpu_lock will be acquired at least 4 times. This obviously
> increases the contention on the pcpu_lock.
> =

> To optimize the scheme let's grab the pcpu_lock on the upper level
> (in pcpu_balance_workfn()) and keep it generally locked for the whole
> duration of the scheduled work, but release conditionally to perform
> any slow operations like chunk (de)population and creation of new chunks.
> =

> Signed-off-by: Roman Gushchin <guro@fb.com>
> ---
> mm/percpu.c | 41 +++++++++++++++++++++++++++++------------
> 1 file changed, 29 insertions(+), 12 deletions(-)
> =

> diff --git a/mm/percpu.c b/mm/percpu.c
> index 245d89f6f0a9..f6bc8157cb3e 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -2005,6 +2005,9 @@ void __percpu *__alloc_reserved_percpu(size_t size,=
 size_t align)
>  * If empty_only is %false, reclaim all fully free chunks regardless of t=
he
>  * number of populated pages.  Otherwise, only reclaim chunks that have no
>  * populated pages.
> + *
> + * CONTEXT:
> + * pcpu_lock (can be dropped temporarily)
>  */
> static void pcpu_balance_free(enum pcpu_chunk_type type, bool empty_only)
> {
> @@ -2013,12 +2016,12 @@ static void pcpu_balance_free(enum pcpu_chunk_typ=
e type, bool empty_only)
>    struct list_head *free_head =3D &pcpu_slot[pcpu_free_slot];
>    struct pcpu_chunk *chunk, *next;
> =

> +    lockdep_assert_held(&pcpu_lock);
> +
>    /*
>     * There's no reason to keep around multiple unused chunks and VM
>     * areas can be scarce.  Destroy all free chunks except for one.
>     */
> -    spin_lock_irq(&pcpu_lock);
> -
>    list_for_each_entry_safe(chunk, next, free_head, list) {
>        WARN_ON(chunk->immutable);
> =

> @@ -2030,8 +2033,10 @@ static void pcpu_balance_free(enum pcpu_chunk_type=
 type, bool empty_only)
>            list_move(&chunk->list, &to_free);
>    }
> =

> -    spin_unlock_irq(&pcpu_lock);
> +    if (list_empty(&to_free))
> +        return;
> =

> +    spin_unlock_irq(&pcpu_lock);
>    list_for_each_entry_safe(chunk, next, &to_free, list) {
>        unsigned int rs, re;
> =

> @@ -2045,6 +2050,7 @@ static void pcpu_balance_free(enum pcpu_chunk_type =
type, bool empty_only)
>        pcpu_destroy_chunk(chunk);
>        cond_resched();
>    }
> +    spin_lock_irq(&pcpu_lock);
> }
> =

> /**
> @@ -2056,6 +2062,9 @@ static void pcpu_balance_free(enum pcpu_chunk_type =
type, bool empty_only)
>  * OOM killer to be triggered.  We should avoid doing so until an actual
>  * allocation causes the failure as it is possible that requests can be
>  * serviced from already backed regions.
> + *
> + * CONTEXT:
> + * pcpu_lock (can be dropped temporarily)
>  */
> static void pcpu_balance_populated(enum pcpu_chunk_type type)
> {
> @@ -2065,6 +2074,8 @@ static void pcpu_balance_populated(enum pcpu_chunk_=
type type)
>    struct pcpu_chunk *chunk;
>    int slot, nr_to_pop, ret;
> =

> +    lockdep_assert_held(&pcpu_lock);
> +
>    /*
>     * Ensure there are certain number of free populated pages for
>     * atomic allocs.  Fill up from the most packed so that atomic
> @@ -2092,13 +2103,11 @@ static void pcpu_balance_populated(enum pcpu_chun=
k_type type)
>        if (!nr_to_pop)
>            break;
> =

> -        spin_lock_irq(&pcpu_lock);
>        list_for_each_entry(chunk, &pcpu_slot[slot], list) {
>            nr_unpop =3D chunk->nr_pages - chunk->nr_populated;
>            if (nr_unpop)
>                break;
>        }
> -        spin_unlock_irq(&pcpu_lock);
> =

>        if (!nr_unpop)
>            continue;
> @@ -2108,12 +2117,13 @@ static void pcpu_balance_populated(enum pcpu_chun=
k_type type)
>                         chunk->nr_pages) {
>            int nr =3D min_t(int, re - rs, nr_to_pop);
> =

> +            spin_unlock_irq(&pcpu_lock);
>            ret =3D pcpu_populate_chunk(chunk, rs, rs + nr, gfp);
> +            cond_resched();
> +            spin_lock_irq(&pcpu_lock);
>            if (!ret) {
>                nr_to_pop -=3D nr;
> -                spin_lock_irq(&pcpu_lock);
>                pcpu_chunk_populated(chunk, rs, rs + nr);
> -                spin_unlock_irq(&pcpu_lock);
>            } else {
>                nr_to_pop =3D 0;
>            }
> @@ -2125,11 +2135,12 @@ static void pcpu_balance_populated(enum pcpu_chun=
k_type type)
> =

>    if (nr_to_pop) {
>        /* ran out of chunks to populate, create a new one and retry */
> +        spin_unlock_irq(&pcpu_lock);
>        chunk =3D pcpu_create_chunk(type, gfp);
> +        cond_resched();
> +        spin_lock_irq(&pcpu_lock);
>        if (chunk) {
> -            spin_lock_irq(&pcpu_lock);
>            pcpu_chunk_relocate(chunk, -1);
> -            spin_unlock_irq(&pcpu_lock);
>            goto retry_pop;
>        }
>    }
> @@ -2146,6 +2157,10 @@ static void pcpu_balance_populated(enum pcpu_chunk=
_type type)
>  * populated pages threshold, reintegrate the chunk if it has empty free =
pages.
>  * Each chunk is scanned in the reverse order to keep populated pages clo=
se to
>  * the beginning of the chunk.
> + *
> + * CONTEXT:
> + * pcpu_lock (can be dropped temporarily)
> + *
>  */
> static void pcpu_reclaim_populated(enum pcpu_chunk_type type)
> {
> @@ -2155,7 +2170,7 @@ static void pcpu_reclaim_populated(enum pcpu_chunk_=
type type)
>    LIST_HEAD(to_depopulate);
>    int i, end;
> =

> -    spin_lock_irq(&pcpu_lock);
> +    lockdep_assert_held(&pcpu_lock);
> =

>    list_splice_init(&pcpu_slot[pcpu_to_depopulate_slot], &to_depopulate);
> =

> @@ -2231,8 +2246,6 @@ static void pcpu_reclaim_populated(enum pcpu_chunk_=
type type)
>                      &pcpu_slot[pcpu_to_depopulate_slot]);
>        pcpu_schedule_balance_work();
>    }
> -
> -    spin_unlock_irq(&pcpu_lock);
> }
> =

> /**
> @@ -2256,10 +2269,14 @@ static void pcpu_balance_workfn(struct work_struc=
t *work)
>     */
>    for (type =3D 0; type < PCPU_NR_CHUNK_TYPES; type++) {
>        mutex_lock(&pcpu_alloc_mutex);
> +        spin_lock_irq(&pcpu_lock);
> +
>        pcpu_balance_free(type, false);
>        pcpu_reclaim_populated(type);
>        pcpu_balance_populated(type);
>        pcpu_balance_free(type, true);
> +
> +        spin_unlock_irq(&pcpu_lock);
>        mutex_unlock(&pcpu_alloc_mutex);
>    }
> }
> -- =

> 2.30.2

--===============4193664852974400193==--

