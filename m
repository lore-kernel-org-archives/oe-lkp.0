Content-Type: multipart/mixed; boundary="===============2347929561882692497=="
MIME-Version: 1.0
From: Eric Dumazet <eric.dumazet@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Tue, 01 Sep 2015 06:40:48 -0700
Message-ID: <1441114848.8932.172.camel@edumazet-glaptop2.roam.corp.google.com>
In-Reply-To: <20150901130057.GA13230@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============2347929561882692497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-09-01 at 21:00 +0800, Herbert Xu wrote:
> On Tue, Sep 01, 2015 at 02:46:48PM +0200, Phil Sutter wrote:
> >
> > This is not an inherent behaviour of the implementation but general
> > agreement. The insertion may fail non-permanently (returning -EBUSY),
> > users are expected to handle this by retrying the operation.
> =

> Absolutely not.  The only reason for an insertion to fail is if we
> can't allocate enough memory.  Unless the user is also looping its
> kmalloc calls it definitely shouldn't be retrying the insert.
> =

> If an expansion fails it means either that the system is suffering
> a catastrophic memory shortage, or the user of rhashtable is doing
> something wrong.


-EBUSY does not sound as a memory allocation error.



--===============2347929561882692497==--

