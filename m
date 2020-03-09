Content-Type: multipart/mixed; boundary="===============6141008731317418713=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [futex] 8019ad13ef: will-it-scale.per_process_ops -97.8% regression
Date: Mon, 09 Mar 2020 10:34:48 +0100
Message-ID: <87y2s97txj.fsf@nanos.tec.linutronix.de>
In-Reply-To: <20200309085123.GE12561@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6141008731317418713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Peter Zijlstra <peterz@infradead.org> writes:
> On Sun, Mar 08, 2020 at 07:07:17PM +0100, Thomas Gleixner wrote:
>>  static struct futex_hash_bucket *hash_futex(union futex_key *key)
>>  {
>> -	u32 hash =3D jhash2((u32*)&key->both.word,
>> -			  (sizeof(key->both.word)+sizeof(key->both.ptr))/4,
>> +	u32 hash =3D jhash2((u32*)&key->both.ptr,
>> +			  (sizeof(key->both.ptr) + sizeof(key->both.word)) / 4,
>>  			  key->both.offset);
>>  	return &futex_queues[hash & (futex_hashsize - 1)];
>>  }
>
> Groan... I've gotta ask, why isn't that written like:
>
> 	u32 hash =3D jhash2((u32 *)key,
> 			  offsetof(typeof(*key), offset) / 4
> 			  key->both.offset);
>
> Or better yet:
>
> 	u32 hash =3D jhash((u32 *)key, sizeof(*key) / 4, 0);

Histerical raisins :)
--===============6141008731317418713==--

