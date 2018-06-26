Content-Type: multipart/mixed; boundary="===============6281872916057846948=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 173fb50cb6 [ 15.588995] WARNING: suspicious RCU usage
Date: Tue, 26 Jun 2018 15:10:20 -0700
Message-ID: <20180626221020.GO3593@linux.vnet.ibm.com>
In-Reply-To: <20180626215306.GA259070@joelaf.mtv.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6281872916057846948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2018 at 02:53:06PM -0700, Joel Fernandes wrote:
> On Tue, Jun 26, 2018 at 03:53:49PM +0800, kernel test robot wrote:
> > =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> > =

> > commit 173fb50cb6e99b86f5c67a0220a8b1a75f5c1f67
> > Author:     Joel Fernandes (Google) <joel@joelfernandes.org>
> > AuthorDate: Sun Jun 10 16:45:44 2018 -0700
> > Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > CommitDate: Wed Jun 20 07:44:37 2018 -0700
> > =

> >     rcutorture: Make boost test more robust
> >     Currently, with RCU_BOOST disabled, I get no failures when forcing
> >     rcutorture to test RCU boost priority inversion. The reason seems t=
o be
> >     that we don't check for failures if the callback never ran at all f=
or
> >     the duration of the boost-test loop.
> >     Further, the 'rtb' and 'rtbf' counters seem to be used inconsistent=
ly.
> >     'rtb' is incremented at the start of each test and 'rtbf' is increm=
ented
> >     per-cpu on each failure of call_rcu. So its possible 'rtbf' > 'rtb'.
> >     To test the boost with rcutorture, I did following on a 4-CPU x86 m=
achine:
> >     modprobe rcutorture  test_boost=3D2
> >     sleep 20
> >     rmmod rcutorture
> >     With patch:
> >     rtbf: 8 rtb: 12
> >     Without patch:
> >     rtbf: 0 rtb: 2
> >     In summary this patch:
> >      - Increments failed and total test counters once per boost-test.
> >      - Checks for failure cases correctly.
> >     Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> =

> This -next tree seems to be missing this patch:
> =

> 7e9736664ada rcu: Assign higher prio to RCU threads if rcutorture is buil=
t-in
> =

> Paul's rcu/next tree already has this patch. I think this reported issue =
will
> go away once Paul's rcu/next tree is pulled.

Which is updated again, so hopefully this should be taken care of.  ;-)

							Thanx, Paul


--===============6281872916057846948==--

