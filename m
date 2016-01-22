Content-Type: multipart/mixed; boundary="===============7551577764681288269=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 75925e1ad7: BUG: unable to handle kernel paging request at 000045b8
Date: Fri, 22 Jan 2016 08:58:12 +0100
Message-ID: <20160122075812.GM6357@twins.programming.kicks-ass.net>
In-Reply-To: <56a1b114.H5JOWAoJgA2/uN2W%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7551577764681288269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2016 at 12:33:24PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 75925e1ad7f5a4e867bd14ff8e7f114ea1596434
> Author:     Andi Kleen <ak@linux.intel.com>
> AuthorDate: Thu Oct 22 15:07:21 2015 -0700
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Mon Nov 23 09:58:25 2015 +0100
> =

>     perf/x86: Optimize stack walk user accesses
>     =

>     Change the perf user stack walking to use the new
>     __copy_from_user_nmi(), and split each access into word sized transfer
>     sizes. This allows to inline the complete access and optimize it all
>     into a single load.

Andi, please have a look at this. Also note that x86_64
__copy_from_user_nocheck() actually supports .size=3D16.

--===============7551577764681288269==--

