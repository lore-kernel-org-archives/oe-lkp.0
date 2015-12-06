Content-Type: multipart/mixed; boundary="===============4957640560616788406=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Sat, 05 Dec 2015 22:48:29 -0500
Message-ID: <20151205.224829.171477269244585844.davem@davemloft.net>
In-Reply-To: <20151205070354.GA23255@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============4957640560616788406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sat, 5 Dec 2015 15:03:54 +0800

> Sorry Dave but you'll have to revert this because I've been able
> to trigger the following crash with the patch:
> =

> Testing concurrent rhashtable access from 50 threads
> ------------[ cut here ]------------
> kernel BUG at ../mm/vmalloc.c:1337!
> invalid opcode: 0000 [#1] PREEMPT SMP =

> =

> The reason is that because I was testing insertions with BH disabled,
> and __vmalloc doesn't like that, even with GFP_ATOMIC.  As we
> obviously want to continue to support rhashtable users inserting
> entries with BH disabled, we'll have to look for an alternate
> solution.

Ok, reverted, thanks for the heads up.

--===============4957640560616788406==--

