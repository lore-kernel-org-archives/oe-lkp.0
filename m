Content-Type: multipart/mixed; boundary="===============4734577584809757666=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Sat, 05 Dec 2015 15:03:54 +0800
Message-ID: <20151205070354.GA23255@gondor.apana.org.au>
In-Reply-To: <20151204.165334.1119277452308794437.davem@davemloft.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4734577584809757666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2015 at 04:53:34PM -0500, David Miller wrote:
> From: Herbert Xu <herbert@gondor.apana.org.au>
> Date: Fri, 4 Dec 2015 22:39:56 +0800
> =

> > When an rhashtable user pounds rhashtable hard with back-to-back
> > insertions we may end up growing the table in GFP_ATOMIC context.
> > Unfortunately when the table reaches a certain size this often
> > fails because we don't have enough physically contiguous pages
> > to hold the new table.
> > =

> > Eric Dumazet suggested (and in fact wrote this patch) using
> > __vmalloc instead which can be used in GFP_ATOMIC context.
> > =

> > Reported-by: Phil Sutter <phil@nwl.cc>
> > Suggested-by: Eric Dumazet <eric.dumazet@gmail.com>
> > Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> =

> Applied, thanks Herbert.

Sorry Dave but you'll have to revert this because I've been able
to trigger the following crash with the patch:

Testing concurrent rhashtable access from 50 threads
------------[ cut here ]------------
kernel BUG at ../mm/vmalloc.c:1337!
invalid opcode: 0000 [#1] PREEMPT SMP =


The reason is that because I was testing insertions with BH disabled,
and __vmalloc doesn't like that, even with GFP_ATOMIC.  As we
obviously want to continue to support rhashtable users inserting
entries with BH disabled, we'll have to look for an alternate
solution.

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4734577584809757666==--

