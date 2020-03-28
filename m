Content-Type: multipart/mixed; boundary="===============5123988688376754638=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/entry] 8c5045f89b: will-it-scale.per_process_ops -12.9% regression
Date: Sat, 28 Mar 2020 15:19:28 -0700
Message-ID: <202003281505.0F481D3@keescook>
In-Reply-To: <20200327074002.GV11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5123988688376754638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 03:40:02PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -12.9% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: 8c5045f89b181a4412b698cafc9dc257192a3a65 ("x86/entry: Enable rand=
om_kstack_offset support")
> https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git kspp/stack/of=
fset/agnostic/v1
> =

> in testcase: will-it-scale
> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz wit=
h 80G memory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: process
> 	test: lseek1
> 	cpufreq_governor: performance
> 	ucode: 0x11
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale

Whoa. I'll take a closer look. I fail to understand how this could be
happening. In this CONFIG the changes are a NOP. And that would be
true for both process and thread. O_o

-- =

Kees Cook
--===============5123988688376754638==--

