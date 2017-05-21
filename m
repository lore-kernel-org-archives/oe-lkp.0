Content-Type: multipart/mixed; boundary="===============7569479917883507388=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [waitid()] 75f64d68f9: Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=
Date: Sun, 21 May 2017 12:35:28 -0700
Message-ID: <alpine.LFD.2.20.1705211233580.8607@i7.lan>
In-Reply-To: <20170521073405.GX390@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7569479917883507388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On Sun, 21 May 2017, Al Viro wrote:
> =

> fix unsafe_put_user()

So here's my proposed patch on top of yours to fix unsafe_get_user() with =

"long long" arguments, and to clean up the extra-long line you did.

Comments?

                  Linus

---
 arch/x86/include/asm/uaccess.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index d9668c3beb5b..661c497465ce 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -703,14 +703,15 @@ extern struct movsl_mask {
 #define unsafe_put_user(x, ptr, err_label)					\
 do {										\
 	int __pu_err;								\
-	__put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), __pu_err,=
 -EFAULT);		\
+	__typeof__(*(ptr)) __pu_val =3D (__typeof__(*(ptr)))(x);			\
+	__put_user_size(__pu_val, (ptr), sizeof(*(ptr)), __pu_err, -EFAULT);	\
 	if (unlikely(__pu_err)) goto err_label;					\
 } while (0)
 =

 #define unsafe_get_user(x, ptr, err_label)					\
 do {										\
 	int __gu_err;								\
-	unsigned long __gu_val;							\
+	__inttype(*(ptr)) __gu_val;						\
 	__get_user_size(__gu_val, (ptr), sizeof(*(ptr)), __gu_err, -EFAULT);	\
 	(x) =3D (__force __typeof__(*(ptr)))__gu_val;				\
 	if (unlikely(__gu_err)) goto err_label;					\

--===============7569479917883507388==--

