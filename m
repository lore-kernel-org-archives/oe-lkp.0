Content-Type: multipart/mixed; boundary="===============7273045979711615418=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [string] 5f6f0801f5: BUG: KASan: out of bounds access in strlcpy+0xc8/0x250 at addr ffff88011a666ee0
Date: Mon, 12 Oct 2015 09:33:55 +0200
Message-ID: <20151012073355.GA16543@gmail.com>
In-Reply-To: <87612cinlg.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7273045979711615418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <ying.huang@linux.intel.com> wrote:

> FYI, we noticed the below changes on
> =

> git://internal_mailing_list_patch_tree Ingo-Molnar/string-Improve-the-gen=
eric-strlcpy-implementation
> commit 5f6f0801f5fdfce4984c6a14f99dbfbb417acb66 ("string: Improve the gen=
eric strlcpy() implementation")

Hm, there's no such commit ID anywhere I can see - did you rebase my tree p=
erhaps?

I am guessing that you rebased the attached WIP commit I have in -tip (not =

permanently committed), which bases strlcpy() off strscpy() and through whi=
ch =

strscpy() gains a couple of hundred usage sites:

+size_t strlcpy(char *dst, const char *src, size_t dst_size)
+{
+	int ret =3D strscpy(dst, src, dst_size);
+
+	/* Handle the insane and broken strlcpy() overflow return value: */
+	if (ret < 0)
+		return dst_size + strlen(src+dst_size);
+
+	return ret;
+}
+EXPORT_SYMBOL(strlcpy);

Now depending on what tree you tested it on, this KASAN report might either=
 be a =

known and meanwhile strscpy() bug - or might perhaps be something new!

The old, known fix is:

  990486c8af04 strscpy: zero any trailing garbage bytes in the destination

> [   22.205482] systemd[1]: RTC configured in localtime, applying delta of=
 480 minutes to system time.
> [   22.214569] random: systemd urandom read with 11 bits of entropy avail=
able
> [   22.241378] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   22.242067] BUG: KASan: out of bounds access in strlcpy+0xc8/0x250 at =
addr ffff88011a666ee0
> [   22.242067] Read of size 8 by task systemd/1
> [   22.242067] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [   22.242067] BUG kmalloc-64 (Not tainted): kasan: bad access detected
> [   22.242067] ----------------------------------------------------------=
-------------------
> [   22.242067] =

> [   22.242067] Disabling lock debugging due to kernel taint
> [   22.242067] INFO: Slab 0xffffea0004699980 objects=3D64 used=3D64 fp=3D=
0x          (null) flags=3D0x200000000000080
> [   22.242067] INFO: Object 0xffff88011a666ec0 @offset=3D3776 fp=3D0x7379=
732f62696c2f
> [   22.242067] =

> [   22.242067] Bytes b4 ffff88011a666eb0: 00 00 00 00 00 00 00 00 a7 4b c=
2 ef 07 00 00 00  .........K......
> [   22.242067] Object ffff88011a666ec0: 2f 6c 69 62 2f 73 79 73 74 65 6d =
64 2f 73 79 73  /lib/systemd/sys

Is there any stack trace of this bad access?

The lack of stack trace and the unknown commit ID make it really hard to an=
alyze =

this bug.

Thanks,

	Ingo

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
>From 53ef1538dfe8d9ed57676c567efd0d551d0a3255 Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@kernel.org>
Date: Mon, 5 Oct 2015 10:56:50 +0200
Subject: [PATCH] string: Improve the generic strlcpy() implementation

The current strlcpy() implementation has two implementational
weaknesses:

1)

There's a (largely theoretical) race:

size_t strlcpy(char *dest, const char *src, size_t size)
{
        size_t ret =3D strlen(src);

        if (size) {
                size_t len =3D (ret >=3D size) ? size - 1 : ret;
                memcpy(dest, src, len);
                dest[len] =3D '\0';
        }
        return ret;
}

If another CPU or an interrupt changes the source string after the strlen()=
, but
before the copy is complete, and shortens the source string, then we copy o=
ver the
NUL byte of the source buffer - including fragments of earlier source string
tails. The target buffer will still be properly NUL terminated - but it wil=
l be a
shorter string than the returned 'ret' source buffer length. (despite there=
 not
being truncation.)

The s390 arch implementation has the same race AFAICS.

This may cause bugs if the return code is subsequently used to assume that =
it is
equal to the destination string's length. (While in reality it's shorter.)

The race is not automatically lethal, because it's guaranteed that the retu=
rned
length is indeed zero-delimited (due to the overlong copy we did) - so if t=
he
string is memcpy()-ed, then it will still result in a weirdly padded but va=
lid
string.

But if any subsequent use of the return code relies on the return code bein=
g equal
to a subsequent call of strlen(dest), then that use might lead to bugs. I.e=
. our
implementation of strlcpy() is indeed racy and unrobust.

But we can fix this race: by basing strlcpy() on the newly introduced strsc=
py()
API we iterate over the string in a single go and determine the length and
copy the string at once. Like strscpy(), but with strlcpy() return semantic=
s.

This also makes strlcpy() faster.

2)

Another problem is that strlcpy() will also happily do bad stuff if we pass
it a negative size. Instead of that we will from now on print a (one time)
warning (by virtue of strscpy()'s overflow checking) and return.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel(a)vger.kernel.org
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 lib/string.c | 51 +++++++++++++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index 96970f8a04eb..15f41de4a1b3 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -124,32 +124,6 @@ char *strncpy(char *dest, const char *src, size_t coun=
t)
 EXPORT_SYMBOL(strncpy);
 #endif
 =

-#ifndef __HAVE_ARCH_STRLCPY
-/**
- * strlcpy - Copy a C-string into a sized buffer
- * @dest: Where to copy the string to
- * @src: Where to copy the string from
- * @size: size of destination buffer
- *
- * Compatible with *BSD: the result is always a valid
- * NUL-terminated string that fits in the buffer (unless,
- * of course, the buffer size is zero). It does not pad
- * out the result like strncpy() does.
- */
-size_t strlcpy(char *dest, const char *src, size_t size)
-{
-	size_t ret =3D strlen(src);
-
-	if (size) {
-		size_t len =3D (ret >=3D size) ? size - 1 : ret;
-		memcpy(dest, src, len);
-		dest[len] =3D '\0';
-	}
-	return ret;
-}
-EXPORT_SYMBOL(strlcpy);
-#endif
-
 #ifndef __HAVE_ARCH_STRSCPY
 /**
  * strscpy - Copy a C-string into a sized buffer
@@ -235,6 +209,31 @@ ssize_t strscpy(char *dest, const char *src, size_t co=
unt)
 EXPORT_SYMBOL(strscpy);
 #endif
 =

+#ifndef __HAVE_ARCH_STRLCPY
+/**
+ * strlcpy - Copy a C-string into a sized buffer
+ * @dst: Where to copy the string to
+ * @src: Where to copy the string from
+ * @dst_size: size of destination buffer
+ *
+ * Compatible with *BSD: the result is always a valid
+ * NUL-terminated string that fits in the buffer (unless,
+ * of course, the buffer size is zero). It does not pad
+ * out the result like strncpy() does.
+ */
+size_t strlcpy(char *dst, const char *src, size_t dst_size)
+{
+	int ret =3D strscpy(dst, src, dst_size);
+
+	/* Handle the insane and broken strlcpy() overflow return value: */
+	if (ret < 0)
+		return dst_size + strlen(src+dst_size);
+
+	return ret;
+}
+EXPORT_SYMBOL(strlcpy);
+#endif
+
 #ifndef __HAVE_ARCH_STRCAT
 /**
  * strcat - Append one %NUL-terminated string to another

--===============7273045979711615418==--

