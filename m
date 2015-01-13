Content-Type: multipart/mixed; boundary="===============4486272413251128715=="
MIME-Version: 1.0
From: David Laight <David.Laight@ACULAB.COM>
To: lkp@lists.01.org
Subject: Re: [PATCH net-next] rhashtable: Lower/upper bucket may map to same lock while shrinking
Date: Tue, 13 Jan 2015 09:49:19 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6D1CAC6593@AcuExch.aculab.com>
In-Reply-To: <20150112235821.GB16617@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4486272413251128715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Thomas Graf
> Each per bucket lock covers a configurable number of buckets. While
> shrinking, two buckets in the old table contain entries for a single
> bucket in the new table. We need to lock down both while linking.
> Check if they are protected by different locks to avoid a recursive
> lock.

Thought, could the shrunk table use the same locks as the lower half
of the old table?

I also wonder whether shrinking hash tables is ever actually worth
the effort. Most likely they'll need to grow again very quickly.

>  		spin_lock_bh(old_bucket_lock1);
> -		spin_lock_bh_nested(old_bucket_lock2, RHT_LOCK_NESTED);
> -		spin_lock_bh_nested(new_bucket_lock, RHT_LOCK_NESTED2);
> +
> +		/* Depending on the lock per buckets mapping, the bucket in
> +		 * the lower and upper region may map to the same lock.
> +		 */
> +		if (old_bucket_lock1 !=3D old_bucket_lock2) {
> +			spin_lock_bh_nested(old_bucket_lock2, RHT_LOCK_NESTED);
> +			spin_lock_bh_nested(new_bucket_lock, RHT_LOCK_NESTED2);
> +		} else {
> +			spin_lock_bh_nested(new_bucket_lock, RHT_LOCK_NESTED);
> +		}

Acquiring 3 locks of much the same type looks like a locking hierarchy
violation just waiting to happen.

	David


--===============4486272413251128715==--

