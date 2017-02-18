Content-Type: multipart/mixed; boundary="===============7430428575449625931=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/core] cb42c9a3eb WARNING: CPU: 0 PID: 9 at kernel/sched/sched.h:804 assert_clock_updated
Date: Sat, 18 Feb 2017 11:34:03 +0100
Message-ID: <20170218103403.GG6500@twins.programming.kicks-ass.net>
In-Reply-To: <20170218053255.tre4s4qbudvpfuq3@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7430428575449625931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2017 at 01:32:55PM +0800, Fengguang Wu wrote:
> [   21.031922] WARNING: CPU: 0 PID: 9 at kernel/sched/sched.h:804 assert_=
clock_updated+0x31/0x33
> [   21.041531] rq->clock_update_flags < RQCF_ACT_SKIP
> [   21.041538] CPU: 0 PID: 9 Comm: migration/0 Not tainted 4.10.0-rc3-002=
56-gcb42c9a #1
> [   21.043339] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   21.052837] Call Trace:

> [   21.063805]  pick_next_task+0x5f/0x7e
> [   21.076406]  sched_cpu_dying+0xaa/0x1c1

Argh, I actually fixed that one but seem to have misplaced the patch.

Let me make sure not to misplace it again.

--===============7430428575449625931==--

