Content-Type: multipart/mixed; boundary="===============5748048407566358129=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Tue, 05 Mar 2019 10:07:29 +0100
Message-ID: <20190305090729.GF32477@hirez.programming.kicks-ass.net>
In-Reply-To: <20190305113635.18f80ea3b1f4fca54b9d21e4@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5748048407566358129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 11:36:35AM +0900, Masami Hiramatsu wrote:
> I think the better way to do this is allowing strncpy_from_user()
O
> if some conditions are match, like
> =

>  - strncpy_from_user() will be able to copy user memory with set_fs(USER_=
DS)
>  - strncpy_from_user() can copy kernel memory with set_fs(KERNEL_DS)
>  - strncpy_from_user() can access unsafe memory in IRQ context if
>    pagefault is disabled.
> =

> This is almost done, except for CONFIG_DEBUG_ATOMIC_SLEEP=3Dy on x86.
> =

> So, what about adding a condition to WARN_ON_IN_IRQ() like below
> instead of introducing user_access_ok() ?
> =

> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uacces=
s.h
> index 780f2b42c8ef..ec0f0b74c9ab 100644
> --- a/arch/x86/include/asm/uaccess.h
> +++ b/arch/x86/include/asm/uaccess.h
> @@ -70,7 +70,7 @@ static inline bool __chk_range_not_ok(unsigned long add=
r, unsigned long size, un
>  })
>  =

>  #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
> -# define WARN_ON_IN_IRQ()      WARN_ON_ONCE(!in_task())
> +# define WARN_ON_IN_IRQ()      WARN_ON_ONCE(pagefault_disabled() && !in_=
task())

That doesn't make any kind of sense to me; see faulthandler_disabled().
IOW. interrupt (and any atomic context really) won't take faults anyway.

I dislike that whole KERNEL_DS thing, but obviously that's not something
that's going away.

Would something like:

	WARN_ON_ONCE(!(in_task || segment_eq(get_fs(), USER_DS)))

Work? Then we allow KERNEL_DS in task context, but for interrupt and
others require USER_DS.

--===============5748048407566358129==--

