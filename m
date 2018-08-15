Content-Type: multipart/mixed; boundary="===============0473514052384184338=="
MIME-Version: 1.0
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: lkp@lists.01.org
Subject: [PATCH] linux/bitmap.h: (buildbot-only) check if we have any compile-time zero-size bitmaps
Date: Wed, 15 Aug 2018 10:55:39 +0200
Message-ID: <20180815085539.27485-1-linux@rasmusvillemoes.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0473514052384184338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Most of the inline bitmap functions are buggy if passed a compile-time
constant nbits=3D=3D0. The convention is that the caller only guarantees
BITS_TO_LONGS(nbits) words can be accessed, which for nbits=3D=3D0 is of
course 0. However, all the small_const_nbits() cases proceed to
dereferencing the passed src or dst pointers unconditionally.

Of course, nobody passes a literal 0 as nbits, but it could come about
from some odd CONFIG_ combination, or because the compiler is smart
enough to reduce some expression to 0, or... In any case, this patch is
just for the build-bots to chew on for various .config and arches to see
if we have any.

Since most (if not all, I'll check) of the out-of-line implementations
handle nbits=3D=3D0 correctly, I'll probably just unconditionally add the
nbits>0 clause to small_const_nbits() to force the ool versions to be
used if any compile-time zero-size bitmap should turn up.

Not-really-signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/linux/bitmap.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 1ee46f492267..a5879cb45687 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -196,8 +196,10 @@ extern int bitmap_print_to_pagebuf(bool list, char *bu=
f,
 #define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG -=
 1)))
 #define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG -=
 1)))
 =

+int const_zero_size_bitmaps_are_buggy(void);
 #define small_const_nbits(nbits) \
-	(__builtin_constant_p(nbits) && (nbits) <=3D BITS_PER_LONG)
+	(__builtin_constant_p(nbits) && (nbits) <=3D BITS_PER_LONG && \
+	 ((nbits) > 0 || const_zero_size_bitmaps_are_buggy()))
 =

 static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
 {
-- =

2.16.4


--===============0473514052384184338==--

