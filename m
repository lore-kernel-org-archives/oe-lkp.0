Content-Type: multipart/mixed; boundary="===============3872204681071725778=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [ptrace] 201766a20e: kernel_selftests.seccomp.make_fail
Date: Sun, 25 Aug 2019 16:23:39 -0700
Message-ID: <201908251622.0EE8CE0E@keescook>
In-Reply-To: <20190805094719.GA1693@altlinux.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3872204681071725778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 12:47:19PM +0300, Dmitry V. Levin wrote:
> On Mon, Jul 29, 2019 at 05:35:30PM +0800, kernel test robot wrote:
> > FYI, we noticed the following commit (built with gcc-7):
> > =

> > commit: 201766a20e30f982ccfe36bebfad9602c3ff574a ("ptrace: add PTRACE_G=
ET_SYSCALL_INFO request")
> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux=
.git master
> > =

> > in testcase: kernel_selftests
> > with following parameters:
> > =

> > 	group: kselftests-02
> > =

> > test-description: The kernel contains a set of "self tests" under the t=
ools/testing/selftests/ directory. These are intended to be small unit test=
s to exercise individual code paths in the kernel.
> > test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> The URL above also says: "Tests are intended to be run after building,
> installing and booting a kernel".
> =

> Please build selftests with installed kernel headers corresponding to the
> installed kernel.
> =

> Alternatively, tools/testing/selftests/lib.mk could be extended
> to include uapi headers from the kernel tree into CPPFLAGS, e.g.
> =

> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib=
.mk
> index 1c8a1963d03f..b5f4f0fb8eeb 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -10,6 +10,9 @@ ifeq (0,$(MAKELEVEL))
>  endif
>  selfdir =3D $(realpath $(dir $(filter %/lib.mk,$(MAKEFILE_LIST))))
>  =

> +uapi_dir =3D $(realpath $(selfdir)/../../../include/uapi)
> +CPPFLAGS +=3D -I$(uapi_dir)
> +
>  # The following are built by lib.mk common compile rules.
>  # TEST_CUSTOM_PROGS should be used by tests that require
>  # custom build rule and prevent common build rule use.

I like this solution, as it's a common problem and it solves it in one
place for all of the selftests.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- =

Kees Cook

--===============3872204681071725778==--

