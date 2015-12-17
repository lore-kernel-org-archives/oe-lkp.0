Content-Type: multipart/mixed; boundary="===============4154010785570302477=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rhashtable: Prevent spurious EBUSY errors on insertion
Date: Thu, 17 Dec 2015 16:48:09 +0800
Message-ID: <20151217084809.GC9239@gondor.apana.org.au>
In-Reply-To: <CADvbK_cA5qaooTOE4Z2bGYs+ys17ZajSMgKDVWgctSZWJ0vjpw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4154010785570302477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2015 at 04:46:00PM +0800, Xin Long wrote:
>
> sorry for late test, but unfortunately, my case with rhashtalbe still
> return EBUSY.
> I added some debug code in rhashtable_insert_rehash(), and found:
> *future_tbl is null*
> =

> fail:
>         /* Do not fail the insert if someone else did a rehash. */
>         if (likely(rcu_dereference_raw(tbl->future_tbl))) {
>                 printk("future_tbl is there\n");
>                 return 0;
>         } else {
>                 printk("future_tbl is null\n");
>         }
> =

> any idea why ?

That's presumably because you got a genuine double rehash.

Until you post your code we can't really help you.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4154010785570302477==--

