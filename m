Content-Type: multipart/mixed; boundary="===============0564677726396777640=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Tue, 05 Mar 2019 22:58:01 +0900
Message-ID: <20190305225801.a63ac8712105ab2e673be1bc@kernel.org>
In-Reply-To: <20190305090729.GF32477@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0564677726396777640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Mar 2019 10:07:29 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Tue, Mar 05, 2019 at 11:36:35AM +0900, Masami Hiramatsu wrote:
> > I think the better way to do this is allowing strncpy_from_user()
> O
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
> > =

> > diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uacc=
ess.h
> > index 780f2b42c8ef..ec0f0b74c9ab 100644
> > --- a/arch/x86/include/asm/uaccess.h
> > +++ b/arch/x86/include/asm/uaccess.h
> > @@ -70,7 +70,7 @@ static inline bool __chk_range_not_ok(unsigned long a=
ddr, unsigned long size, un
> >  })
> >  =

> >  #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
> > -# define WARN_ON_IN_IRQ()      WARN_ON_ONCE(!in_task()) =

> > +# define WARN_ON_IN_IRQ()      WARN_ON_ONCE(pagefault_disabled() && !i=
n_task())
> =

> That doesn't make any kind of sense to me; see faulthandler_disabled().
> IOW. interrupt (and any atomic context really) won't take faults anyway.

Hmm, I thought CONFIG_DEBUG_ATOMIC_SLEEP=3Dy tries to detect that some oper=
ations
which can sleep in atomic, like IRQ context, doesn't it?
(note that above should be !pagefault_disabled() anyway) =


So I guessed WARN_ON_IN_IRQ() intended to detect the access_ok() was used
in atomic, because it might follow some copy_from_user() like operation
which can sleep when it hits a pagefault. Is my guess wrong?

If correct, I think if pagefault is disabled, the caller never sleep,
so we don't need to take care of that.

Could you tell me why WARN_ON_ONCE(!in_task()) is needed in access_ok()?

> =

> I dislike that whole KERNEL_DS thing, but obviously that's not something
> that's going away.
> =

> Would something like:
> =

> 	WARN_ON_ONCE(!(in_task || segment_eq(get_fs(), USER_DS)))
> =

> Work? Then we allow KERNEL_DS in task context, but for interrupt and
> others require USER_DS.

But what would this mean? I can't understand why we limit using
access_ok() so strictly and narrow the cases.

Thank you,

-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============0564677726396777640==--

