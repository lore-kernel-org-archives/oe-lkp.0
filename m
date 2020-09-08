Content-Type: multipart/mixed; boundary="===============5167097378887651099=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [ptrace] 201766a20e: kernel_selftests.seccomp.make_fail
Date: Tue, 08 Sep 2020 16:31:12 -0700
Message-ID: <202009081629.4A31845@keescook>
In-Reply-To: <20190805094719.GA1693@altlinux.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5167097378887651099==
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

*thread necromancy*

I think this is fixed in the selftest tree itself now (though
differently), in that it depends on having build the headers first.

Anyway, please let me know if this is still a problem, and I'll take
another look (and hopefully I also won't lose the thread for a year...)

Thanks!

-- =

Kees Cook
--===============5167097378887651099==--

