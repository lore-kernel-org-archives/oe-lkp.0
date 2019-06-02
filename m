Content-Type: multipart/mixed; boundary="===============5862254467858922653=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Sun, 02 Jun 2019 13:54:12 -0700
Message-ID: <CAHk-=whLGKOmM++OQi5GX08_dfh8Xfz9Wq7khPo+MVtPYh_8hw@mail.gmail.com>
In-Reply-To: <20190602055607.bk5vgmwjvvt4wejd@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============5862254467858922653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 1, 2019 at 10:56 PM Herbert Xu <herbert@gondor.apana.org.au> =
wrote:
>
> You can't then go and decide to remove the compiler barrier!  To do
> that you'd need to audit every single use of rcu_read_lock in the
> kernel to ensure that they're not depending on the compiler barrier.

What's the possible case where it would matter when there is no preemption?

          Linus

--===============5862254467858922653==--

