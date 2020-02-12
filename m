Content-Type: multipart/mixed; boundary="===============3735324088770570432=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86/amd] 471af006a7: will-it-scale.per_process_ops -7.6% regression
Date: Wed, 12 Feb 2020 13:18:30 +0100
Message-ID: <20200212121830.GR14897@hirez.programming.kicks-ass.net>
In-Reply-To: <20200212113514.GT12867@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3735324088770570432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 07:35:14PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -7.6% regression of will-it-scale.per_process_ops due t=
o commit:
> =

> =

> commit: 471af006a747f1c535c8a8c6c0973c320fe01b22 ("perf/x86/amd: Constrai=
n Large Increment per Cycle events")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 128G memory

That commit only changes code relevant to AMD machines; give you have
this result on an Intel machine makes me think the bisect is flawed.
--===============3735324088770570432==--

