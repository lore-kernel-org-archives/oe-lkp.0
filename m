Content-Type: multipart/mixed; boundary="===============5531846792543897288=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Tue, 05 Mar 2019 18:01:26 +0900
Message-ID: <20190305180126.0f7201d8ec733fdc887135f1@kernel.org>
In-Reply-To: <20190305172241.2eef39c6ca74d09120bbbcad@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5531846792543897288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Mar 2019 17:22:41 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> On Tue, 5 Mar 2019 11:36:35 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> =

> > On Mon, 4 Mar 2019 10:59:22 -0800
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > =

> > I think the better way to do this is allowing strncpy_from_user()
> > if some conditions are match, like
> > =

> >  - strncpy_from_user() will be able to copy user memory with set_fs(USE=
R_DS)
> >  - strncpy_from_user() can copy kernel memory with set_fs(KERNEL_DS)
> >  - strncpy_from_user() can access unsafe memory in IRQ context if
> >    pagefault is disabled.
> > =

> > This is almost done, except for CONFIG_DEBUG_ATOMIC_SLEEP=3Dy on x86.
> > =

> > So, what about adding a condition to WARN_ON_IN_IRQ() like below
> > instead of introducing user_access_ok() ?

OK, here is the patch. Does it work for us?

=3D=3D=3D=3D
x86/uaccess: Verify access_ok() context strictly

From: Masami Hiramatsu <mhiramat@kernel.org>

WARN_ON_IN_IRQ() assumes that the access_ok() and following
user memory access can sleep. But this assumption is not
always correct; when the pagefault is disabled, following
memory access will just returns -EFAULT and never sleep.

Add pagefault_disabled() check in WARN_ON_ONCE() so that
it can ignore the case we call it with disabling pagefault.
For this purpose, this modified pagefault_disabled() as
an inline function.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 arch/x86/include/asm/uaccess.h |    4 +++-
 include/linux/uaccess.h        |    5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 780f2b4..b98a552 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -70,7 +70,9 @@ static inline bool __chk_range_not_ok(unsigned long addr,=
 unsigned long size, un
 })
 =

 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
-# define WARN_ON_IN_IRQ()	WARN_ON_ONCE(!in_task())
+static inline bool pagefault_disabled(void);
+# define WARN_ON_IN_IRQ()	\
+	WARN_ON_ONCE(!in_task() && !pagefault_disabled())
 #else
 # define WARN_ON_IN_IRQ()
 #endif
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 37b226e..ef3032d 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -203,7 +203,10 @@ static inline void pagefault_enable(void)
 /*
  * Is the pagefault handler disabled? If so, user access methods will not =
sleep.
  */
-#define pagefault_disabled() (current->pagefault_disabled !=3D 0)
+static inline bool pagefault_disabled(void)
+{
+	return current->pagefault_disabled !=3D 0;
+}
 =

 /*
  * The pagefault handler is in general disabled by pagefault_disable() or

--===============5531846792543897288==--

