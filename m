Content-Type: multipart/mixed; boundary="===============9146929889683626916=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [percpu] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Sat, 13 Sep 2014 20:41:38 +0800
Message-ID: <20140913124138.GB20185@localhost>
In-Reply-To: <20140904160428.GE5001@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9146929889683626916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2014 at 09:04:28AM -0700, Paul E. McKenney wrote:
> On Thu, Sep 04, 2014 at 08:38:45PM +0800, Fengguang Wu wrote:
> > On Tue, Sep 02, 2014 at 10:16:57AM -0700, Paul E. McKenney wrote:
> > > On Tue, Sep 02, 2014 at 11:55:58AM -0500, Christoph Lameter wrote:
> > > > On Tue, 2 Sep 2014, Paul E. McKenney wrote:
> > > > =

> > > > > Added by ac1bea85781e (sched,rcu: Make cond_resched() report RCU =
quiescent
> > > > > states), removed by 4a81e8328d379 (rcu: Reduce overhead of cond_r=
esched()
> > > > > checks for RCU).  So, as you say, no effect on contemporary kerne=
ls.
> > > > =

> > > > Well not sure what to make out of all of this....
> > > =

> > > Yep, still confused as to how the patch adding the definition could h=
ave
> > > caused a failure.  Fengguang, any thoughts?
> > =

> > Yeah this is confusing.. I checked carefully and find that commit
> > 0e98023 and afea227 are built on 2 quite different servers -- which
> > might generate slightly different code. I'll fix this issue and make
> > the build server selection more consistent.
> =

> Looking forward to seeing what shows up!

The new bisect catches commit 945fa9c631b04febe295a3a2a00c7e4a3cfb97db
("torture: Dump ftrace buffer when the RCU grace period stalls"). I
just reported it in another email.

Thanks,
Fengguang

--===============9146929889683626916==--

