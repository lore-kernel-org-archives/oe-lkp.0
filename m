Content-Type: multipart/mixed; boundary="===============6699906655745500999=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [percpu] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 02 Sep 2014 10:16:57 -0700
Message-ID: <20140902171657.GG5001@linux.vnet.ibm.com>
In-Reply-To: <alpine.DEB.2.11.1409021155410.10607@gentwo.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6699906655745500999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2014 at 11:55:58AM -0500, Christoph Lameter wrote:
> On Tue, 2 Sep 2014, Paul E. McKenney wrote:
> =

> > Added by ac1bea85781e (sched,rcu: Make cond_resched() report RCU quiesc=
ent
> > states), removed by 4a81e8328d379 (rcu: Reduce overhead of cond_resched=
()
> > checks for RCU).  So, as you say, no effect on contemporary kernels.
> =

> Well not sure what to make out of all of this....

Yep, still confused as to how the patch adding the definition could have
caused a failure.  Fengguang, any thoughts?

							Thanx, Paul


--===============6699906655745500999==--

