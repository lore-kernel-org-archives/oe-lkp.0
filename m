Content-Type: multipart/mixed; boundary="===============9212435876975340835=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 0 PID: 95 at kernel/sched/core.c:7312 __might_sleep()
Date: Mon, 27 Oct 2014 15:07:26 +0100
Message-ID: <20141027140726.GJ3337@twins.programming.kicks-ass.net>
In-Reply-To: <20141027134948.GA8977@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9212435876975340835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2014 at 09:49:48PM +0800, Fengguang Wu wrote:
> On Mon, Oct 27, 2014 at 02:36:27PM +0100, Peter Zijlstra wrote:
> > On Mon, Oct 27, 2014 at 09:06:21PM +0800, Fengguang Wu wrote:
> > > Hi Peter,
> > > =

> > > FYI, this bug seems still there on v3.18-rc2.
> > =

> > Oh, right, I commented out that patch and the audit one because I was
> > waiting for some feedback. Lemme go prod people.
> =

> audit? I do hit an kauditd_thread warning recently:

Yep that one, see:
http://lkml.kernel.org/r/20141027134103.GA10476(a)twins.programming.kicks-a=
ss.net

--===============9212435876975340835==--

