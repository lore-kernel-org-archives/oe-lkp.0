Content-Type: multipart/mixed; boundary="===============1456669085055795369=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [futex] 8019ad13ef: will-it-scale.per_process_ops -97.8% regression
Date: Sun, 08 Mar 2020 19:07:17 +0100
Message-ID: <87h7yy90ve.fsf@nanos.tec.linutronix.de>
In-Reply-To: <CAHk-=whrpL8pbKLg3_s3+bxv6kbPnzbSP8dQkZ+Rv=jAT3aoKw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1456669085055795369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> writes:

> [ Just a re-send without html crud that makes all the lists unhappy.
> I'm still on the road, the flight I was supposed to be on yesterday
> got cancelled.. ]
>
> I do note that the futex hashing seems to be broken by that commit. Or
> at least it's questionable.  It keeps hashing on "both.word",  and
> doesn't use the u64 field at all for hashing.
>
> Maybe I'm mis-reading it - I didn't apply the patch, I just looked at
> the patch and my source base separately.
>
> But the 98% regression sure says something went wrong ;)

Right you are. The pointer needs to be the starting point as it moved
ahead of word, which means it starts at word and hashes word and
offset and an extra u32 beyond the end of the key.

Thanks,

        tglx
----
diff --git a/kernel/futex.c b/kernel/futex.c
index e14f7cd45dbd..9f3251349f65 100644
--- a/kernel/futex.c
+++ b/kernel/futex.c
@@ -385,8 +385,8 @@ static inline int hb_waiters_pending(struct futex_hash_=
bucket *hb)
  */
 static struct futex_hash_bucket *hash_futex(union futex_key *key)
 {
-	u32 hash =3D jhash2((u32*)&key->both.word,
-			  (sizeof(key->both.word)+sizeof(key->both.ptr))/4,
+	u32 hash =3D jhash2((u32*)&key->both.ptr,
+			  (sizeof(key->both.ptr) + sizeof(key->both.word)) / 4,
 			  key->both.offset);
 	return &futex_queues[hash & (futex_hashsize - 1)];
 }
--===============1456669085055795369==--

