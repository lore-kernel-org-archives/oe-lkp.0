Content-Type: multipart/mixed; boundary="===============1582085508349411628=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [percpu] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Thu, 04 Sep 2014 20:38:45 +0800
Message-ID: <20140904123845.GA19925@localhost>
In-Reply-To: <20140902171657.GG5001@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1582085508349411628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2014 at 10:16:57AM -0700, Paul E. McKenney wrote:
> On Tue, Sep 02, 2014 at 11:55:58AM -0500, Christoph Lameter wrote:
> > On Tue, 2 Sep 2014, Paul E. McKenney wrote:
> > =

> > > Added by ac1bea85781e (sched,rcu: Make cond_resched() report RCU quie=
scent
> > > states), removed by 4a81e8328d379 (rcu: Reduce overhead of cond_resch=
ed()
> > > checks for RCU).  So, as you say, no effect on contemporary kernels.
> > =

> > Well not sure what to make out of all of this....
> =

> Yep, still confused as to how the patch adding the definition could have
> caused a failure.  Fengguang, any thoughts?

Yeah this is confusing.. I checked carefully and find that commit
0e98023 and afea227 are built on 2 quite different servers -- which
might generate slightly different code. I'll fix this issue and make
the build server selection more consistent.

Thanks,
Fengguang

--===============1582085508349411628==--

