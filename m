Content-Type: multipart/mixed; boundary="===============7172944002980268787=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: 1131482629 ("posix-timers: Use get_timepsec64() and .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000008
Date: Fri, 30 Jun 2017 09:19:59 +0100
Message-ID: <20170630081958.GS10672@ZenIV.linux.org.uk>
In-Reply-To: <5956046f.S02VEPZxC+uTF7Uu%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7172944002980268787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2017 at 03:57:35PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://internal_merge_and_test_tree devel-catchup-201706292032
> =

> commit 11314826298445e447cc52df284d55f1e1137519
> Author:     Deepa Dinamani <deepa.kernel@gmail.com>
> AuthorDate: Sat Jun 24 11:45:05 2017 -0700
> Commit:     Al Viro <viro@zeniv.linux.org.uk>
> CommitDate: Sun Jun 25 21:58:46 2017 -0400
> =

>     posix-timers: Use get_timepsec64() and put_timespec64()
>     =

>     Usage of these apis and their compat versions makes
>     the syscalls: clock_gettime, clock_settime, clock_getres
>     and their compat implementations simpler.
>     =

>     This is a preparatory patch to isolate data conversions to
>     struct timespec64 at userspace boundaries. This helps contain
>     the changes needed to transition to new y2038 safe types.
>     =

>     Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

... caused by this:
-       if (!kc || !kc->clock_set)
-               return -EINVAL;
-
without anything to replace it.  Similar bug in compat clock_getres().
Incidentally, it's 'timespec', not 'timepsec' ;-)

Fixed and force-pushed.

--===============7172944002980268787==--

