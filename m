Content-Type: multipart/mixed; boundary="===============5806046232356948732=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fixup! EXP srcu] 7bf8d644f8: WARNING:at_kernel/rcu/srcutree.c:#process_srcu
Date: Fri, 18 Mar 2022 08:28:46 -0700
Message-ID: <20220318152846.GA4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220318061603.GC12658@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5806046232356948732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 02:16:03PM +0800, Oliver Sang wrote:
> Hi Paul,
> =

> On Thu, Mar 17, 2022 at 11:01:29AM -0700, Paul E. McKenney wrote:
> > On Thu, Mar 17, 2022 at 03:16:08PM +0800, Oliver Sang wrote:
> > > hi, Paul,
> > > =

> > > On Wed, Mar 16, 2022 at 09:53:42AM -0700, Paul E. McKenney wrote:
> > > > > =

> > > > > I had a feeling that the simple fix wasn't going to cut it, so th=
ank you
> > > > > for finding a scenario that proves that to be the case.  Fix in p=
rogress,
> > > > > to be folded into the original with attribution.
> > > > =

> > > > OK, the attribution isn't quite there yet, but the squished-together
> > > > commit is here:
> > > > =

> > > > ea0098f19115 ("srcu: Prevent expedited GPs and blocking readers fro=
m consuming CPU")
> > > > =

> > > > Does this version behave better for you?
> > > =

> > > we tested this commit, found the issue gone.
> > > please be noted the issue on 7bf8d644f8 is random and ~25% rate.
> > > so I queued to run 100 times for this new commit, which is finally cl=
ean
> > > according to tests.
> > > =

> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/kconfig/rootfs/sleep/tbox_group/testcase:
> > >   gcc-9/x86_64-rhel-8.3-func/debian-10.4-x86_64-20200603.cgz/1/vm-snb=
/boot
> > > =

> > > commit:
> > >   feebd043ec6b ("Revert "srcu: Avoid expedited GPs and blocking reade=
rs from consuming CPU"")
> > >   7bf8d644f869 ("fixup! EXP srcu: Check for too many zero-delay srcu_=
reschedule() calls")
> > >   ea0098f19115 ("srcu: Prevent expedited GPs and blocking readers fro=
m consuming CPU")
> > > =

> > > feebd043ec6b9eab 7bf8d644f869260f63eaaedebab ea0098f191152c7fe3db5181=
a2e
> > > ---------------- --------------------------- ------------------------=
---
> > >        fail:runs  %reproduction    fail:runs  %reproduction    fail:r=
uns
> > >            |             |             |             |             |
> > >            :16          25%           4:16           0%            :1=
00   dmesg.RIP:process_srcu
> > >            :16          25%           4:16           0%            :1=
00   dmesg.WARNING:at_kernel/rcu/srcutree.c:#process_srcu
> > =

> > Thank you for testing this!  Tested-by?
> =

> sure!
> =

> Tested-by: kernel test robot <oliver.sang@intel.com>
> =

> (and will add this in early mail about testing if I have enough confidence
> in the future :) Thanks)

Please do!  ;-)

And I have it down for my next rebase.

							Thanx, Paul
--===============5806046232356948732==--

