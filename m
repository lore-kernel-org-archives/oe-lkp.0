Content-Type: multipart/mixed; boundary="===============4397109480180499711=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Wed, 05 Feb 2020 13:58:04 +0100
Message-ID: <20200205125804.GM14879@hirez.programming.kicks-ass.net>
In-Reply-To: <20200205123216.GO12867@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4397109480180499711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 08:32:16PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -5.5% regression of will-it-scale.per_process_ops due t=
o commit:
> =

> =

> commit: 81ec3f3c4c4d78f2d3b6689c9816bfbdf7417dbb ("perf/x86: Add check_pe=
riod PMU callback")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =


I'm fairly sure this bisect/result is bogus.
--===============4397109480180499711==--

