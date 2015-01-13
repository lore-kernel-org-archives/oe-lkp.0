Content-Type: multipart/mixed; boundary="===============0159590424617646933=="
MIME-Version: 1.0
From: David Laight <David.Laight@ACULAB.COM>
To: lkp@lists.01.org
Subject: Re: [PATCH net-next] rhashtable: Lower/upper bucket may map to same lock while shrinking
Date: Tue, 13 Jan 2015 15:00:54 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6D1CAC6946@AcuExch.aculab.com>
In-Reply-To: <20150113112507.GH20387@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0159590424617646933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Thomas Graf
...
> > Thought, could the shrunk table use the same locks as the lower half
> > of the old table?
> =

> No. A new bucket table and thus a new set of locks is allocated when the
> table is shrunk or grown. We only have check for overlapping locks
> when holding multiple locks for the same table at the same time.

I was guessing that when locks are shared buckets k and 2^n+k use the
same lock.
Under those conditions if the 'grow' decided not to allocate extra
locks then it could save work by using exactly the same locks as the
old table.
Similarly 'shrink' could do the reverse.

It was only a thought.

	David


--===============0159590424617646933==--

