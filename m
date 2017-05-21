Content-Type: multipart/mixed; boundary="===============0430645774098233638=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [waitid()] 75f64d68f9: Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=
Date: Sun, 21 May 2017 08:34:06 +0100
Message-ID: <20170521073405.GX390@ZenIV.linux.org.uk>
In-Reply-To: <20170519060820.GW568@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0430645774098233638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2017 at 02:08:20PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 75f64d68f9816a1c244b8685f056389b24d97e98 ("waitid(): switch copyo=
ut of siginfo to unsafe_put_user()")
> url: https://github.com/0day-ci/linux/commits/Al-Viro/move-compat-wait4-a=
nd-waitid-next-to-native-variants/20170516-084127
> =

> =

> in testcase: boot

Cute...  That's unsafe_put_user() bug, actually.  There's no unsafe_put_use=
r()
callers in mainline and it's fairly early in the cycle.  Linus, do you have
any problems with that one?  If not, I'll send a pull request with it + osf=
_wait4()
fix...

fix unsafe_put_user()

__put_user_size() relies upon its first argument having the same type as wh=
at
the second one points to; the only other user makes sure of that and
unsafe_put_user() should do the same.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 68766b276d9e..d9668c3beb5b 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -703,7 +703,7 @@ extern struct movsl_mask {
 #define unsafe_put_user(x, ptr, err_label)					\
 do {										\
 	int __pu_err;								\
-	__put_user_size((x), (ptr), sizeof(*(ptr)), __pu_err, -EFAULT);		\
+	__put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), __pu_err,=
 -EFAULT);		\
 	if (unlikely(__pu_err)) goto err_label;					\
 } while (0)

--===============0430645774098233638==--

