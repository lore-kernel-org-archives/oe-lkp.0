Content-Type: multipart/mixed; boundary="===============4858131174269503144=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [percpu] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 02 Sep 2014 09:21:10 -0700
Message-ID: <20140902162110.GB5001@linux.vnet.ibm.com>
In-Reply-To: <alpine.DEB.2.11.1409021052400.10607@gentwo.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4858131174269503144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2014 at 11:00:12AM -0500, Christoph Lameter wrote:
> On Tue, 2 Sep 2014, Paul E. McKenney wrote:
> =

> > Before this commit, raw_cpu_add_return() didn't build.  The commit
> > didn't affect anything else.
> >
> > So I don't understand how anything could work before this commit and
> > be broken after it.  Enlightenment?
> =

> Where is that raw_cpu_add_return statement?
> =

> grep does not match anything like that in kernel/rcu/*
> and this_cpu_add_return is used extensively in the network subsystem for
> statistics.

Heh!  Good point!

Added by ac1bea85781e (sched,rcu: Make cond_resched() report RCU quiescent
states), removed by 4a81e8328d379 (rcu: Reduce overhead of cond_resched()
checks for RCU).  So, as you say, no effect on contemporary kernels.

							Thanx, Paul


--===============4858131174269503144==--

