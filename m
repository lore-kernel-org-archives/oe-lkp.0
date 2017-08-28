Content-Type: multipart/mixed; boundary="===============2852645532646754372=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: cf5a796e82 ("lockdep/selftests: Add mixed read-write ABBA tests"): BUG: 1 unexpected failures (out of 262) - debugging disabled! |
Date: Mon, 28 Aug 2017 10:36:15 +0200
Message-ID: <20170828083615.yjhz4kifonewsys6@hirez.programming.kicks-ass.net>
In-Reply-To: <59a08760.lM+PcmUKXnDyyAXp%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2852645532646754372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2017 at 04:24:00AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/=
core
> =

> commit cf5a796e827ae9a6520e71610d08a7e1a97cd50e
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Wed Aug 23 13:13:11 2017 +0200
> Commit:     Peter Zijlstra <peterz@infradead.org>
> CommitDate: Thu Aug 24 19:27:53 2017 +0200
> =

>     lockdep/selftests: Add mixed read-write ABBA tests
>     =

>     Currently lockdep has limited support for recursive readers, add a few
>     mixed read-write ABBA selftests to show the extend of these
>     limitations.
>     =

>     [    0.000000] ------------------------------------------------------=
----------------------
>     [    0.000000]                                  | spin |wlock |rlock =
|mutex | wsem | rsem |
>     [    0.000000]   ----------------------------------------------------=
----------------------
>     =

>     [    0.000000]   mixed read-lock/lock-write ABBA:             |FAILED=
|             |  ok  |
>     [    0.000000]    mixed read-lock/lock-read ABBA:             |  ok  =
|             |  ok  |
>     [    0.000000]  mixed write-lock/lock-write ABBA:             |  ok  =
|             |  ok  |
>     =

>     This clearly illustrates the case where lockdep fails to find a
>     deadlock.

If you read the Changelog you'll note that this is an _expected_
failure.


--===============2852645532646754372==--

