Content-Type: multipart/mixed; boundary="===============3720999767490181101=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [selftests/lkdtm] 84d8cf25b0: kernel_BUG_at_drivers/misc/lkdtm/bugs.c
Date: Wed, 23 Jun 2021 07:30:26 -0700
Message-ID: <202106230728.4844CE5@keescook>
In-Reply-To: <20210623143549.GA25993@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3720999767490181101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 10:35:50PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 84d8cf25b0f80da0ac229214864654a7662ec7e4 ("[PATCH v2] selftests/l=
kdtm: Use /bin/sh not $SHELL")
> url: https://github.com/0day-ci/linux/commits/Kees-Cook/selftests-lkdtm-U=
se-bin-sh-not-SHELL/20210619-105959
> base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.=
git next
> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-f8879e85-1_20210618
> with following parameters:
> =

> 	group: lkdtm
> 	ucode: 0xe2

Heh. Yes, this is working as intended. :) Most of the lkdtm tests will
trigger Oopses, and this is by design: it is checking that the kernel
catches bad conditions and freaks out appropriately.

-Kees

-- =

Kees Cook
--===============3720999767490181101==--

