Content-Type: multipart/mixed; boundary="===============7400148267237070783=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 592dc8b215 ("lockdep: Prepare for NMI IRQ state tracking"): [ 5.103068] WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:3765 lockdep_hardirqs_off
Date: Tue, 02 Jun 2020 12:21:56 +0200
Message-ID: <20200602102156.GS706495@hirez.programming.kicks-ass.net>
In-Reply-To: <20200602002815.GD12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7400148267237070783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 08:28:16AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Peter-Zijlstra/x86-entry-lockdep=
-Improve-IRQ-state-tracking/20200528-222257

I did ask you to stop scraping my patches from lkml. I'll stick them in
a git tree (they _are_ in a git tree), build those.

That said; yes, this patch is buggered, Rostedt already noted that on
review Friday.
--===============7400148267237070783==--

