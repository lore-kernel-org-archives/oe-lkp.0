Content-Type: multipart/mixed; boundary="===============6344511552852055392=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] selftests/seccomp/seccomp_bpf: update for PTRACE_GET_SYSCALL_INFO
Date: Mon, 08 Jul 2019 21:24:26 -0700
Message-ID: <201907082124.F358ED0@keescook>
In-Reply-To: <20190708182904.GA12332@altlinux.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6344511552852055392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2019 at 09:29:04PM +0300, Dmitry V. Levin wrote:
> The syscall entry/exit is now exposed via PTRACE_GETEVENTMSG,
> update the test accordingly.

Oh yes, thank you!

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> =

> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> =

> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testin=
g/selftests/seccomp/seccomp_bpf.c
> index dc66fe852768..6ef7f16c4cf5 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -1775,13 +1775,18 @@ void tracer_ptrace(struct __test_metadata *_metad=
ata, pid_t tracee,
>  	unsigned long msg;
>  	static bool entry;
>  =

> -	/* Make sure we got an empty message. */
> +	/*
> +	 * The traditional way to tell PTRACE_SYSCALL entry/exit
> +	 * is by counting.
> +	 */
> +	entry =3D !entry;
> +
> +	/* Make sure we got an appropriate message. */
>  	ret =3D ptrace(PTRACE_GETEVENTMSG, tracee, NULL, &msg);
>  	EXPECT_EQ(0, ret);
> -	EXPECT_EQ(0, msg);
> +	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
> +			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
>  =

> -	/* The only way to tell PTRACE_SYSCALL entry/exit is by counting. */
> -	entry =3D !entry;
>  	if (!entry)
>  		return;
>  =

> -- =

> ldv

-- =

Kees Cook

--===============6344511552852055392==--

