Content-Type: multipart/mixed; boundary="===============0021088343547379964=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Mon, 09 Oct 2017 17:44:46 +0200
Message-ID: <20171009154446.i5s5rhlwuae3jxrs@hirez.programming.kicks-ass.net>
In-Reply-To: <20171009154130.2vc2mhsxxa6htuhp@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0021088343547379964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 11:41:30PM +0800, Fengguang Wu wrote:
> > > [  187.855027] init: plymouth-splash main process (418) terminated wi=
th status 1
> > > [  187.953296] init: networking main process (419) terminated with st=
atus 1
> > > [  191.697721] ------------[ cut here ]------------
> > > [  191.699318] WARNING: CPU: 0 PID: 424 at kernel/locking/lockdep.c:3=
928 check_flags+0x119/0x1b0
> > =

> > Would still like to get around sorting that one though.
> =

> Sure. It looks not easy to bisect, anyway I just queued the job.

Oh no worries; I'd just like to be able to reproduce locally, then I'll
prod it with a sharp stick.

If you could get me that userspace image somehow, that'd be grand.

--===============0021088343547379964==--

