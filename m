Content-Type: multipart/mixed; boundary="===============9040318655423004473=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: 8d2bd61bd8 ("sched/core: Clean up sched_init() a bit"): BUG: unable to handle page fault for address: 00ba0396
Date: Sat, 25 May 2019 13:49:48 +0200
Message-ID: <20190525114948.GA24312@gmail.com>
In-Reply-To: <5ce91b39.Txl3DDmbeNsPYyrE%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9040318655423004473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <lkp@intel.com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> =

> commit 8d2bd61bd89260d5da5eaef7cf264587f19a7e0d
> Author:     Qian Cai <cai@lca.pw>
> AuthorDate: Wed May 22 14:20:06 2019 -0400
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Fri May 24 08:57:29 2019 +0200
> =

>     sched/core: Clean up sched_init() a bit
>     =

>     Compiling a kernel with both FAIR_GROUP_SCHED=3Dn and RT_GROUP_SCHED=
=3Dn
>     will generate a warning using W=3D1:
>     =

>       kernel/sched/core.c: In function 'sched_init':
>       kernel/sched/core.c:5906:32: warning: variable 'ptr' set but not us=
ed
>     =

>     Use this opportunity to tidy up a code a bit by removing unnecssary
>     indentations and lines.
>     =

>     Signed-off-by: Qian Cai <cai@lca.pw>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: Thomas Gleixner <tglx@linutronix.de>
>     Link: http://lkml.kernel.org/r/1558549206-13031-1-git-send-email-cai(=
a)lca.pw
>     [ Also remove some of the unnecessary #endif comments. ]
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>

I've removed this commit for the time being.

Thanks,

	Ingo

--===============9040318655423004473==--

