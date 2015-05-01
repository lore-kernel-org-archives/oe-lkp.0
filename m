Content-Type: multipart/mixed; boundary="===============3162489848785360295=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] WARNING: CPU: 0 PID: 0 at kernel/time/hrtimer.c:802 hrtimer_forward()
Date: Fri, 01 May 2015 12:10:07 +0200
Message-ID: <20150501101007.GB5029@twins.programming.kicks-ass.net>
In-Reply-To: <20150501044713.GA4365@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3162489848785360295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 12:47:13PM +0800, Fengguang Wu wrote:
> commit 77a4d1a1b9a122ca1fa3507bd30aec1520d7a8a4
>     sched: Cleanup bandwidth timers

> [   64.000438] WARNING: CPU: 0 PID: 0 at kernel/time/hrtimer.c:802 hrtime=
r_forward+0x71/0x189()

Argh, yes of course. The problem is that the timer can be re-started
before the handler acquires the lock, and therefore the hrtimer_forwards
in the handler will trigger that WARN.

Lemme try and go convince this heap of snot that's occupying my brain
cavity to produce coherent thought and come up with a nice fix for that.

--===============3162489848785360295==--

