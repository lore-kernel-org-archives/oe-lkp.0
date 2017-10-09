Content-Type: multipart/mixed; boundary="===============0707899508100843920=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Mon, 09 Oct 2017 17:28:47 +0200
Message-ID: <20171009152847.kwo5ifr4lftgm6va@hirez.programming.kicks-ass.net>
In-Reply-To: <20171009141706.5xbqsvgwer4a246s@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0707899508100843920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 10:17:06PM +0800, Fengguang Wu wrote:
> It works! I tried 500 boots and only find 1 occurrence of this error,
> which looks irrelevant to the current issue.

OK, I'll go write a Changelog for the lockdep patch.


> =

> [  187.855027] init: plymouth-splash main process (418) terminated with s=
tatus 1
> [  187.953296] init: networking main process (419) terminated with status=
 1
> [  191.697721] ------------[ cut here ]------------
> [  191.699318] WARNING: CPU: 0 PID: 424 at kernel/locking/lockdep.c:3928 =
check_flags+0x119/0x1b0

Would still like to get around sorting that one though.

--===============0707899508100843920==--

