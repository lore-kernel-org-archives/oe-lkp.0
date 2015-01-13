Content-Type: multipart/mixed; boundary="===============6072271476359602746=="
MIME-Version: 1.0
From: 'Thomas Graf' <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH net-next] rhashtable: Lower/upper bucket may map to same lock while shrinking
Date: Tue, 13 Jan 2015 11:25:07 +0000
Message-ID: <20150113112507.GH20387@casper.infradead.org>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6D1CAC6593@AcuExch.aculab.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6072271476359602746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/13/15 at 09:49am, David Laight wrote:
> From: Thomas Graf
> > Each per bucket lock covers a configurable number of buckets. While
> > shrinking, two buckets in the old table contain entries for a single
> > bucket in the new table. We need to lock down both while linking.
> > Check if they are protected by different locks to avoid a recursive
> > lock.
> =

> Thought, could the shrunk table use the same locks as the lower half
> of the old table?

No. A new bucket table and thus a new set of locks is allocated when the
table is shrunk or grown. We only have check for overlapping locks
when holding multiple locks for the same table at the same time.

> I also wonder whether shrinking hash tables is ever actually worth
> the effort. Most likely they'll need to grow again very quickly.

Specifying a .shrink_decision function is optional so every rhashtable
user can decide whether it wants shrinking or not. Need for it was
expressed in the past threads.

Also, the case of multiple buckets mapping to the same lock is also
present in the expanding logic so removing the shrinking logic would
not remove the need for these types of checks.

> >  		spin_lock_bh(old_bucket_lock1);
> > -		spin_lock_bh_nested(old_bucket_lock2, RHT_LOCK_NESTED);
> > -		spin_lock_bh_nested(new_bucket_lock, RHT_LOCK_NESTED2);
> > +
> > +		/* Depending on the lock per buckets mapping, the bucket in
> > +		 * the lower and upper region may map to the same lock.
> > +		 */
> > +		if (old_bucket_lock1 !=3D old_bucket_lock2) {
> > +			spin_lock_bh_nested(old_bucket_lock2, RHT_LOCK_NESTED);
> > +			spin_lock_bh_nested(new_bucket_lock, RHT_LOCK_NESTED2);
> > +		} else {
> > +			spin_lock_bh_nested(new_bucket_lock, RHT_LOCK_NESTED);
> > +		}
> =

> Acquiring 3 locks of much the same type looks like a locking hierarchy
> violation just waiting to happen.

I'm not claiming it's extremely pretty, lockless lookup with deferred
resizing doesn't come for free ;-) If you have a suggestion on how to
implement this differently I'm all ears. That said, it's well isolated
and the user of rhashtable does not have to deal with it. All code paths
which take multiple locks are mutually exclusive to each other (ht->mutex).

--===============6072271476359602746==--

