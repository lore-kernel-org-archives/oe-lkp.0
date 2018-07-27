Content-Type: multipart/mixed; boundary="===============1952144348644811143=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcutorture] 3b745c8969: WARNING:at_mm/slab_common.c:#kmalloc_slab
Date: Thu, 26 Jul 2018 20:14:26 -0700
Message-ID: <20180727031426.GU24813@linux.vnet.ibm.com>
In-Reply-To: <20180726233436.GA211260@joelaf.mtv.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1952144348644811143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2018 at 04:34:36PM -0700, Joel Fernandes wrote:
> On Thu, Jul 26, 2018 at 04:53:25AM -0700, Paul E. McKenney wrote:
> > On Thu, Jul 26, 2018 at 04:50:15PM +0800, kernel test robot wrote:
> > > =

> > > FYI, we noticed the following commit (built with gcc-5):
> > > =

> > > commit: 3b745c8969c752601cb68c82a06735363563ab42 ("rcutorture: Make b=
oost test more robust")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > > =

> > > in testcase: boot
> > > =

> > > on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > =

> > Is this fixed by 4babd855fd61 ("rcutorture: Add support to detect
> > if boost kthread prio is too low")?  That could address the
> > rcu_torture_stats_print() failures, depending on exactly what they were.
> > (Yes, I should have reversed these two commits, but they are in -tip
> > now, so that ship has sailed.)
> > =

> > Joel, any other thoughts?
> =

> I ran the next tree myself and was not able to reproduce the issue with t=
he
> same configuration. Although I don't have rcupdate.rcu_cpu_stall_timeout=
=3D100
> passed in like they do (which I can also try if you think its of signific=
ance
> here).
> =

> It seems from their logs that most Locking API self tests are failing. the
> Lock API test suite is run before rcutorture where rcutorture hasn't even
> started.
> =

> Also as per their rcutorture output, it appears the 'rtf' value is also
> non-zero (rcu_torture_free test). Which makes sense if the earlier memory
> allocation warnings are somehow related.

It could potentially be an OOM issue.  Something to keep an eye out for,
then.

							Thanx, Paul


--===============1952144348644811143==--

