Content-Type: multipart/mixed; boundary="===============3598345669410028085=="
MIME-Version: 1.0
From: Yury Norov <ynorov@caviumnetworks.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] linux/bitmap.h: (buildbot-only) check if we have any compile-time zero-size bitmaps
Date: Fri, 17 Aug 2018 02:21:25 +0300
Message-ID: <20180816232125.GA6119@yury-thinkpad>
In-Reply-To: <20180815085539.27485-1-linux@rasmusvillemoes.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3598345669410028085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rasmus,

On Wed, Aug 15, 2018 at 10:55:39AM +0200, Rasmus Villemoes wrote:
> Most of the inline bitmap functions are buggy if passed a compile-time
> constant nbits=3D=3D0.

I think it's bad wording. Functions are OK. The problem is in users.
Also, run-time nbits=3D=3D0 is buggy as well. On the other hand, we have a =
rule
in include/linux/bitmap.h:
  * Note that nbits should be always a compile time evaluable constant.
  * Otherwise many inlines will generate horrible code.
So runtime-defined nbits is bad thing by itself.

> The convention is that the caller only guarantees
> BITS_TO_LONGS(nbits) words can be accessed, which for nbits=3D=3D0 is of
> course 0. However, all the small_const_nbits() cases proceed to
> dereferencing the passed src or dst pointers unconditionally.
> =

> Of course, nobody passes a literal 0 as nbits, but it could come about
> from some odd CONFIG_ combination, or because the compiler is smart
> enough to reduce some expression to 0, or... In any case, this patch is
> just for the build-bots to chew on for various .config and arches to see
> if we have any.
> =

> Since most (if not all, I'll check) of the out-of-line implementations
> handle nbits=3D=3D0 correctly, I'll probably just unconditionally add the
> nbits>0 clause to small_const_nbits() to force the ool versions to be
> used if any compile-time zero-size bitmap should turn up.
> =

> Not-really-signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  include/linux/bitmap.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 1ee46f492267..a5879cb45687 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -196,8 +196,10 @@ extern int bitmap_print_to_pagebuf(bool list, char *=
buf,
>  #define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG=
 - 1)))
>  #define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG=
 - 1)))
> =

> +int const_zero_size_bitmaps_are_buggy(void);

It introduces undefined symbol and uses it in pretty unusual way. I think
it worth to add comment about it.

>  #define small_const_nbits(nbits) \
> -       (__builtin_constant_p(nbits) && (nbits) <=3D BITS_PER_LONG)
> +       (__builtin_constant_p(nbits) && (nbits) <=3D BITS_PER_LONG && \
> +        ((nbits) > 0 || const_zero_size_bitmaps_are_buggy()))

Some functions in bitmap API has signed type for nbits. (This is wrong
by itself. I think I'll write patch for it.) So in fact you check here
that nbits is not negative as well. Would it be better name like
const_nonpositive_size_bitmaps_are_buggy?

Yury

> =

>  static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
>  {
> --
> 2.16.4

--===============3598345669410028085==--

