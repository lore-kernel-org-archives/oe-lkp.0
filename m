Content-Type: multipart/mixed; boundary="===============5787592628049919805=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: rhashtable: Prevent spurious EBUSY errors on insertion
Date: Fri, 04 Dec 2015 14:38:44 -0500
Message-ID: <20151204.143844.1840501199234860407.davem@davemloft.net>
In-Reply-To: <20151203124129.GA5505@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============5787592628049919805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 3 Dec 2015 20:41:29 +0800

> Thomas and Phil observed that under stress rhashtable insertion
> sometimes failed with EBUSY, even though this error should only
> ever been seen when we're under attack and our hash chain length
> has grown to an unacceptable level, even after a rehash.
> =

> It turns out that the logic for detecting whether there is an
> existing rehash is faulty.  In particular, when two threads both
> try to grow the same table at the same time, one of them may see
> the newly grown table and thus erroneously conclude that it had
> been rehashed.  This is what leads to the EBUSY error.
> =

> This patch fixes this by remembering the current last table we
> used during insertion so that rhashtable_insert_rehash can detect
> when another thread has also done a resize/rehash.  When this is
> detected we will give up our resize/rehash and simply retry the
> insertion with the new table.
> =

> Reported-by: Thomas Graf <tgraf@suug.ch>
> Reported-by: Phil Sutter <phil@nwl.cc>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Looks good, applied, thanks Herbert.

--===============5787592628049919805==--

