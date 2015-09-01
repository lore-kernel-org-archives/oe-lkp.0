Content-Type: multipart/mixed; boundary="===============6732989367809038899=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Tue, 01 Sep 2015 22:03:41 +0800
Message-ID: <20150901140341.GA13757@gondor.apana.org.au>
In-Reply-To: <20150901135618.GD27550@orbit.nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============6732989367809038899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2015 at 03:56:18PM +0200, Phil Sutter wrote:
> =

> Looking at rhashtable_test.c, I see the initial table size is 8 entries.
> 70% of that is 5.6 entries, so background expansion is started after the
> 6th entry has been added, right? Given there are 10 threads running
> which try to insert 50k entries at the same time, I don't think it's
> unlikely that three more entries are inserted before the background
> expansion completes.

Yes but in that case the GFP_ATOMIC allocation should work because
the table is so small anyway.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============6732989367809038899==--

