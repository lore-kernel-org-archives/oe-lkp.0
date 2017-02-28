Content-Type: multipart/mixed; boundary="===============7216540011816687950=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [blk_mq_register_hctx] 29dee3c03a WARNING: CPU: 0 PID: 5 at lib/refcount.c:114 refcount_inc
Date: Tue, 28 Feb 2017 08:48:02 +0100
Message-ID: <20170228074802.GC6500@twins.programming.kicks-ass.net>
In-Reply-To: <20170228041117.hbqqyczf5bnypqmc@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7216540011816687950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 12:11:17PM +0800, Fengguang Wu wrote:
> Hello,
> =

> FYI, an old blk_mq bug triggers new warnings on this commit. It's very
> reproducible and you may try the attached reproduce-* script.
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 29dee3c03abce04cd527878ef5f9e5f91b7b83f4
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Fri Feb 10 16:27:52 2017 +0100
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Fri Feb 24 09:02:10 2017 +0100
> =

>      locking/refcounts: Out-of-line everything
>      =

>      Linus asked to please make this real C code.
>      =

>      And since size then isn't an issue what so ever anymore, remove the
>      debug knob and make all WARN()s unconditional.
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I suspect that if you revert, but enable CONFIG_DEBUG_REFCOUNT you'd
have gotten the same splats..


I'll go have a look though, something looks buggered.

--===============7216540011816687950==--

