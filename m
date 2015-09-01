Content-Type: multipart/mixed; boundary="===============0538045260386346316=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Tue, 01 Sep 2015 22:16:39 +0800
Message-ID: <20150901141639.GA13856@gondor.apana.org.au>
In-Reply-To: <20150901141305.GA11564@pox.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============0538045260386346316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2015 at 04:13:05PM +0200, Thomas Graf wrote:
>
> You can easily trigger this outside of the testsuite as well. Open
> 10K Netlink sockets in a loop and the creation of the sockets will
> fail way before memory pressure kicks in.

That means our implementation is buggy.  Do you have a test program?

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============0538045260386346316==--

