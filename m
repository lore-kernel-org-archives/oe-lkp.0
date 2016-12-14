Content-Type: multipart/mixed; boundary="===============3800291439478745829=="
MIME-Version: 1.0
From: Matt Fleming <matt@codeblueprint.co.uk>
To: lkp@lists.01.org
Subject: Re: [sched/core] 3640269b04: WARNING: CPU: 0 PID: 0 at kernel/sched/sched.h:804 rq_clock_task
Date: Wed, 14 Dec 2016 10:36:13 +0000
Message-ID: <20161214103613.GA3356@codeblueprint.co.uk>
In-Reply-To: <20161214083544.GN3124@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3800291439478745829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Dec, at 09:35:44AM, Peter Zijlstra wrote:
> =

> So as per that entry it appears you got the commit from my tree.
> =

> =

> That tree also contains the below commit, right after the one you
> fingered. And the above stacktrace looks very much like the one here,
> no?

Should we rearrange these commits so that we fixup the missing
update_rq_clock() calls before enabling the SCHED_WARN_ON(), so as not
to break bisection?

--===============3800291439478745829==--

