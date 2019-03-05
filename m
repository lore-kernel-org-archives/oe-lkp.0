Content-Type: multipart/mixed; boundary="===============5894206562228910683=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Tue, 05 Mar 2019 17:22:41 +0900
Message-ID: <20190305172241.2eef39c6ca74d09120bbbcad@kernel.org>
In-Reply-To: <20190305113635.18f80ea3b1f4fca54b9d21e4@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5894206562228910683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Mar 2019 11:36:35 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> On Mon, 4 Mar 2019 10:59:22 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> =

> I think the better way to do this is allowing strncpy_from_user()
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

Oops, I meant !pagefault_disabled() && !in_task().

>  #else
>  # define WARN_ON_IN_IRQ()
>  #endif
> =

> Of course we have to move pagefault_disabled() macro in somewhere better =
place.

And I think we don't need it. anyway the macro is referenced via linux/uacc=
ess.h.

Thank you,

-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============5894206562228910683==--

