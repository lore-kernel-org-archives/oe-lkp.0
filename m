Content-Type: multipart/mixed; boundary="===============3693780265329918902=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/2] signal: Don't always set SA_IMMUTABLE for forced signals
Date: Thu, 18 Nov 2021 15:54:02 -0800
Message-ID: <202111181553.A4FDEB1@keescook>
In-Reply-To: <877dd5qfw5.fsf_-_@email.froward.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3693780265329918902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 04:04:58PM -0600, Eric W. Biederman wrote:
> =

> Recently to prevent issues with SECCOMP_RET_KILL and similar signals
> being changed before they are delivered SA_IMMUTABLE was added.
> =

> Unfortunately this broke debuggers[1][2] which reasonably expect to be
> able to trap synchronous SIGTRAP and SIGSEGV even when the target
> process is not configured to handle those signals.
> =

> Update force_sig_to_task to support both the case when we can
> allow the debugger to intercept and possibly ignore the
> signal and the case when it is not safe to let userspace
> known about the signal until the process has exited.
> =

> Reported-by: Kyle Huey <me@kylehuey.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Cc: stable(a)vger.kernel.org
> [1] https://lkml.kernel.org/r/CAP045AoMY4xf8aC_4QU_-j7obuEPYgTcnQQP3Yxk=
=3D2X90jtpjw(a)mail.gmail.com
> [2] https://lkml.kernel.org/r/20211117150258.GB5403(a)xsang-OptiPlex-902
> Fixes: 00b06da29cf9 ("signal: Add SA_IMMUTABLE to ensure forced siganls d=
o not get changed")
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> ---
>  kernel/signal.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> =

> diff --git a/kernel/signal.c b/kernel/signal.c
> index 7c4b7ae714d4..02058c983bd6 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1298,6 +1298,12 @@ int do_send_sig_info(int sig, struct kernel_siginf=
o *info, struct task_struct *p
>  	return ret;
>  }
>  =

> +enum sig_handler {
> +	HANDLER_CURRENT, /* If reachable use the current handler */
> +	HANDLER_SIG_DFL, /* Always use SIG_DFL handler semantics */
> +	HANDLER_EXIT,	 /* Only visible as the proces exit code */

Oh, I just noticed this typo "proces" -> "process"

-Kees

-- =

Kees Cook
--===============3693780265329918902==--

