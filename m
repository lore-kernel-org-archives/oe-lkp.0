Content-Type: multipart/mixed; boundary="===============1593636878835966241=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] BUG: unable to handle kernel NULL pointer dereference at 000000da
Date: Sat, 13 Sep 2014 00:20:43 +0000
Message-ID: <20140913002005.GA9550@localhost>
In-Reply-To: <20140912192659.GM4775@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1593636878835966241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2014 at 12:26:59PM -0700, Paul E. McKenney wrote:
> On Fri, Sep 12, 2014 at 02:19:57PM -0500, Christoph Lameter wrote:
> > On Fri, 12 Sep 2014, Paul E. McKenney wrote:
> > =

> > > So, I am not seeing this failure in my testing, but my best guess is
> > > that the problem is due to the fact that force_quiescent_state() is
> > > sometimes invoked with preemption enabled, which breaks __this_cpu_re=
ad()
> > > though perhaps with very low probability.  The common-case call (from
> > > __call_rcu_core()) -does- have preemption disabled, in fact, it has
> > > interrupts disabled.
> > =

> > How could __this_cpu_read() break in a way that would make a difference=
 to
> > the code? There was no disabling/enabling of preemption before the patch
> > and there is nothing like that after the patch. If there was a race then
> > it still exists. The modification certainly cannot create a race.
> =

> Excellent question.  Yet Fengguang's tests show breakage.
> =

> Fengguang, any possibility of a false positive here?

Yes, it is possible. I find the first bad commit and its parent
commit's kernels are built in 2 different machines which might
cause subtle changes. I'll redo the bisect.

Thanks,
Fengguang

--===============1593636878835966241==--

