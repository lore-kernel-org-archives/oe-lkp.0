Content-Type: multipart/mixed; boundary="===============7491249938497198562=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [selftests/lkdtm] 7ecfffe9bc: kernel_BUG_at_drivers/misc/lkdtm/bugs.c
Date: Mon, 28 Jun 2021 08:07:02 -0700
Message-ID: <202106280805.5620A53D08@keescook>
In-Reply-To: <20210628145922.GC22448@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7491249938497198562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 10:59:22PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 7ecfffe9bcb6657ae3a86c58f8eae2fe37b54807 ("selftests/lkdtm: Avoid=
 needing explicit sub-shell")
> https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git for-next/lkdtm
> =

> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-f8879e85-1_20210621
> with following parameters:
> =

> 	group: lkdtm
> 	ucode: 0xe2
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt

When running the "lkdtm" subsystem of tests, CI systems should ignore
console Oopses, since those are "working as intended" for lkdtm (which
is explicitly testing for those Oopses).

-Kees

-- =

Kees Cook
--===============7491249938497198562==--

