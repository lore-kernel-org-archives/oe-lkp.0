Content-Type: multipart/mixed; boundary="===============5015988100803785523=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [futex] 8019ad13ef: will-it-scale.per_process_ops -97.8% regression
Date: Mon, 09 Mar 2020 09:51:23 +0100
Message-ID: <20200309085123.GE12561@hirez.programming.kicks-ass.net>
In-Reply-To: <87h7yy90ve.fsf@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5015988100803785523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2020 at 07:07:17PM +0100, Thomas Gleixner wrote:

> Right you are. The pointer needs to be the starting point as it moved
> ahead of word, which means it starts at word and hashes word and
> offset and an extra u32 beyond the end of the key.
> =

> Thanks,
> =

>         tglx
> ----
> diff --git a/kernel/futex.c b/kernel/futex.c
> index e14f7cd45dbd..9f3251349f65 100644
> --- a/kernel/futex.c
> +++ b/kernel/futex.c
> @@ -385,8 +385,8 @@ static inline int hb_waiters_pending(struct futex_has=
h_bucket *hb)
>   */
>  static struct futex_hash_bucket *hash_futex(union futex_key *key)
>  {
> -	u32 hash =3D jhash2((u32*)&key->both.word,
> -			  (sizeof(key->both.word)+sizeof(key->both.ptr))/4,
> +	u32 hash =3D jhash2((u32*)&key->both.ptr,
> +			  (sizeof(key->both.ptr) + sizeof(key->both.word)) / 4,
>  			  key->both.offset);
>  	return &futex_queues[hash & (futex_hashsize - 1)];
>  }

Groan... I've gotta ask, why isn't that written like:

	u32 hash =3D jhash2((u32 *)key,
			  offsetof(typeof(*key), offset) / 4
			  key->both.offset);

Or better yet:

	u32 hash =3D jhash((u32 *)key, sizeof(*key) / 4, 0);


--===============5015988100803785523==--

