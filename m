Content-Type: multipart/mixed; boundary="===============3508027754701369072=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] ef72661e28: WARNING:at_arch/x86/kernel/static_call.c:#__static_call_validate
Date: Tue, 09 Mar 2021 14:58:39 +0100
Message-ID: <YEd/D0CRDIQ/eb9F@hirez.programming.kicks-ass.net>
In-Reply-To: <20210309133746.GA17567@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3508027754701369072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 09:37:47PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: ef72661e28c64ad610f89acc2832ec67b27ba438 ("sched: Harden PREEMPT_=
DYNAMIC")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Should be fixed by:

https://lkml.kernel.org/r/161459376868.20312.9858096297457613530.tip-bot2(a=
)tip-bot2
--===============3508027754701369072==--

