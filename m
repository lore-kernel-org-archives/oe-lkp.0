Content-Type: multipart/mixed; boundary="===============8068797831402671612=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] BUG: unable to handle kernel NULL pointer dereference at 000000da
Date: Sat, 13 Sep 2014 12:39:00 +0000
Message-ID: <20140913123857.GA20185@localhost>
In-Reply-To: <20140913003837.GO4775@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8068797831402671612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2014 at 05:38:37PM -0700, Paul E. McKenney wrote:
> On Sat, Sep 13, 2014 at 08:20:05AM +0800, Fengguang Wu wrote:
> > On Fri, Sep 12, 2014 at 12:26:59PM -0700, Paul E. McKenney wrote:
> > > On Fri, Sep 12, 2014 at 02:19:57PM -0500, Christoph Lameter wrote:
> > > > On Fri, 12 Sep 2014, Paul E. McKenney wrote:
> > > > =

> > > > > So, I am not seeing this failure in my testing, but my best guess=
 is
> > > > > that the problem is due to the fact that force_quiescent_state() =
is
> > > > > sometimes invoked with preemption enabled, which breaks __this_cp=
u_read()
> > > > > though perhaps with very low probability.  The common-case call (=
from
> > > > > __call_rcu_core()) -does- have preemption disabled, in fact, it h=
as
> > > > > interrupts disabled.
> > > > =

> > > > How could __this_cpu_read() break in a way that would make a differ=
ence to
> > > > the code? There was no disabling/enabling of preemption before the =
patch
> > > > and there is nothing like that after the patch. If there was a race=
 then
> > > > it still exists. The modification certainly cannot create a race.
> > > =

> > > Excellent question.  Yet Fengguang's tests show breakage.
> > > =

> > > Fengguang, any possibility of a false positive here?
> > =

> > Yes, it is possible. I find the first bad commit and its parent
> > commit's kernels are built in 2 different machines which might
> > cause subtle changes. I'll redo the bisect.
> =

> Thank you, Fengguang, and please let me know how it goes!

The new bisect finds the below commit. However, Christoph has fixed
this bug and it no longer shows up in current mainline and linux-next
trees. So please ignore this noise..

commit 188a81409ff7de1c5aae947a96356ddd8ff4aaa3
Author: Christoph Lameter <cl@linux.com>
Date:   Mon Apr 7 15:39:44 2014 -0700

    percpu: add preemption checks to __this_cpu ops

    We define a check function in order to avoid trouble with the include
    files.  Then the higher level __this_cpu macros are modified to invoke
    the preemption check.

    [akpm(a)linux-foundation.org: coding-style fixes]
    Signed-off-by: Christoph Lameter <cl@linux.com>
    Acked-by: Ingo Molnar <mingo@kernel.org>
    Cc: Tejun Heo <tj@kernel.org>
    Tested-by: Grygorii Strashko <grygorii.strashko@ti.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

Thanks,
Fengguang

--===============8068797831402671612==--

