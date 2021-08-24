Content-Type: multipart/mixed; boundary="===============7241312589745078704=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] c0afb0ffc0: BUG:kernel_NULL_pointer_dereference, address
Date: Tue, 24 Aug 2021 16:47:36 +0200
Message-ID: <YSUGiNL0lkxCitSQ@hirez.programming.kicks-ass.net>
In-Reply-To: <20210824140044.GA27667@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7241312589745078704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 10:00:44PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: c0afb0ffc06e6b4e492a3b711f1fb32074f9949c ("locking/ww_mutex: Gath=
er mutex_waiter initialization")

Fixed by...

commit b857174e68e26f9c4f0796971e11eb63ad5a3eb6
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Thu Aug 19 21:30:30 2021 +0200

    locking/ww_mutex: Initialize waiter.ww_ctx properly
    =

    The consolidation of the debug code for mutex waiter intialization sets
    waiter::ww_ctx to a poison value unconditionally. For regular mutexes t=
his
    is intended to catch the case where waiter_ww_ctx is dereferenced
    accidentally.
    =

    For ww_mutex the poison value has to be overwritten either with a conte=
xt
    pointer or NULL for ww_mutexes without context.
    =

    The rework broke this as it made the store conditional on the context
    pointer instead of the argument which signals whether ww_mutex code sho=
uld
    be compiled in or optiized out. As a result waiter::ww_ctx ends up with=
 the
    poison pointer for contextless ww_mutexes which causes a later derefere=
nce of
    the poison pointer because it is !=3D NULL.
    =

    Use the build argument instead so for ww_mutex the poison value is alwa=
ys
    overwritten.
    =

    Fixes: c0afb0ffc06e6 ("locking/ww_mutex: Gather mutex_waiter initializa=
tion")
    Reported-by: Guenter Roeck <linux@roeck-us.net>
    Suggested-by: Peter Zijlstra <peterz@infradead.org>
    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Link: https://lore.kernel.org/r/20210819193030.zpwrpvvrmy7xxxiy(a)linut=
ronix.de

diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 3a65bf4bacfd..d456579d0952 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -618,7 +618,7 @@ __mutex_lock_common(struct mutex *lock, unsigned int st=
ate, unsigned int subclas
 =

 	debug_mutex_lock_common(lock, &waiter);
 	waiter.task =3D current;
-	if (ww_ctx)
+	if (use_ww_ctx)
 		waiter.ww_ctx =3D ww_ctx;
 =

 	lock_contended(&lock->dep_map, ip);
--===============7241312589745078704==--

