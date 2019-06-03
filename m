Content-Type: multipart/mixed; boundary="===============8515028021648888666=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Mon, 03 Jun 2019 12:17:31 +0800
Message-ID: <20190603041731.m6rvcaivgeh4iw4g@gondor.apana.org.au>
In-Reply-To: <20190603040114.st646bujtgyu7adn@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============8515028021648888666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 12:01:14PM +0800, Herbert Xu wrote:
> On Sun, Jun 02, 2019 at 08:47:07PM -0700, Paul E. McKenney wrote:
> >
> > 	CPU2:         if (b !=3D 1)
> > 	CPU2:                 b =3D 1;
> =

> Stop right there.  The kernel is full of code that assumes that
> assignment to an int/long is atomic.  If your compiler breaks this
> assumption that we can kiss the kernel good-bye.

The slippery slope apparently started here:

: commit ea435467500612636f8f4fb639ff6e76b2496e4b
: Author: Matthew Wilcox <matthew@wil.cx>
: Date:   Tue Jan 6 14:40:39 2009 -0800
: =

:     atomic_t: unify all arch definitions
:
: diff --git a/arch/x86/include/asm/atomic_32.h b/arch/x86/include/asm/atom=
ic_32.h
: index ad5b9f6ecddf..85b46fba4229 100644
: --- a/arch/x86/include/asm/atomic_32.h
: +++ b/arch/x86/include/asm/atomic_32.h
: ...
: @@ -10,15 +11,6 @@
:   * resource counting etc..
:   */
:
: -/*
: - * Make sure gcc doesn't try to be clever and move things around
: - * on us. We need to use _exactly_ the address the user gave us,
: - * not some alias that contains the same information.
: - */
: -typedef struct {
: -       int counter;
: -} atomic_t;
:
: diff --git a/include/linux/types.h b/include/linux/types.h
: index 121f349cb7ec..3b864f2d9560 100644
: --- a/include/linux/types.h
: +++ b/include/linux/types.h
: @@ -195,6 +195,16 @@ typedef u32 phys_addr_t;
:  =

:  typedef phys_addr_t resource_size_t;
:
: +typedef struct {
: +       volatile int counter;
: +} atomic_t;
: +

Before evolving into the READ_ONCE/WRITE_ONCE that we have now.

Linus, are we now really supporting a compiler where an assignment
(or a read) from an int/long/pointer can be non-atomic without the
volatile marker? Because if that's the case then we have a lot of
code to audit.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============8515028021648888666==--

