Content-Type: multipart/mixed; boundary="===============0597217304493017237=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 0 PID: 95 at kernel/sched/core.c:7312 __might_sleep()
Date: Fri, 31 Oct 2014 14:57:20 +0100
Message-ID: <20141031135720.GL10501@worktop.programming.kicks-ass.net>
In-Reply-To: <20141031131531.GA28258@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0597217304493017237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2014 at 09:15:31PM +0800, Fengguang Wu wrote:
> Nope. However I find some more bugs that happen around thermal_apic_exit. =

> One DEBUG_LOCKS_WARN_ON, one "task blocked for more than 120 seconds",
> and some RCU stalls. I just queued bisects for them. Hopefully we can
> get some results tomorrow.

Yeah, something is very sick there indeed... Hope it settles down and
goes away :-)

--===============0597217304493017237==--

