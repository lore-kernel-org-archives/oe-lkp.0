Content-Type: multipart/mixed; boundary="===============5648130460933826387=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/core] 8a8c69c327: WARNING: CPU: 0 PID: 8 at kernel/locking/lockdep.c:3548 lock_release
Date: Fri, 17 Mar 2017 15:13:35 +0100
Message-ID: <20170317141335.x3dewcjkxgx7yn6w@hirez.programming.kicks-ass.net>
In-Reply-To: <20170317140909.yfwvqdouwfad26i3@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5648130460933826387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 03:09:09PM +0100, Peter Zijlstra wrote:
> On Fri, Mar 17, 2017 at 09:24:11PM +0800, Wanpeng Li wrote:
> > I have another version of patch which utilizes raw_spin_lock_irqsave()
> > instead of rq_lock_irqsave() in __balance_callback() as before, which
> > one do you like, Peterz?
> =

> Hurm.. the raw_spin_lock_irqsave() one I suspect. No point in pinning
> and then unpinning.

Took your other version and edited that to make it do this.

--===============5648130460933826387==--

