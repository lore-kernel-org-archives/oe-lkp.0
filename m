Content-Type: multipart/mixed; boundary="===============2750743009894390191=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched, debug] 3b87f136f8: stress-ng.procfs.ops_per_sec -31.7% regression
Date: Thu, 22 Apr 2021 18:24:13 +0200
Message-ID: <YIGjLQq6w2wERotq@hirez.programming.kicks-ass.net>
In-Reply-To: <20210422144258.GD6394@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2750743009894390191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 10:42:58PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -31.7% regression of stress-ng.procfs.ops_per_sec due t=
o commit:

> commit: 3b87f136f8fccddf7da016ab7d04bb3cf9b180f0 ("sched,debug: Convert s=
ysctl sched_domains to debugfs")

> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 192G memory

>      16865 =C2=B1  4%     -31.7%      11516 =C2=B1  6%  stress-ng.procfs.=
ops

The patch in question removes a ton of procfs files, so this is just
about expected. If this also lowers the procfs ops/s measure, this could
be because all these procfs files were trivial.

Some procfs files are expensive to read and collect lots of data, these
files were trivial and fast, by removing them, the average time to read
a procfs file might very well have increased.

Over-all: -EDONTCARE.
--===============2750743009894390191==--

