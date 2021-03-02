Content-Type: multipart/mixed; boundary="===============8786193254806862165=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86, build] 6dafca9780: WARNING:at_arch/x86/kernel/ftrace.c:#ftrace_verify_code
Date: Tue, 02 Mar 2021 10:19:47 +0100
Message-ID: <YD4DM6uAETid7j4l@hirez.programming.kicks-ass.net>
In-Reply-To: <20210301201526.65ce7f1c@oasis.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============8786193254806862165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 08:15:26PM -0500, Steven Rostedt wrote:
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 7edbd5ee5ed4..e8afc765e00a 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -36,6 +36,7 @@
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  =

>  static int ftrace_poke_late =3D 0;
> +static const char p6_nop[] =3D { P6_NOP5 };

I don't understand this approach, why not simply rewrite all the nops at
boot and not worry about it when modifying the code later?
--===============8786193254806862165==--

