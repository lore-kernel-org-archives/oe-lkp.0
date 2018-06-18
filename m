Content-Type: multipart/mixed; boundary="===============8904474522904851264=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [rcutorture] 46e26223e3: WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print
Date: Mon, 18 Jun 2018 09:56:46 -0700
Message-ID: <20180618165646.GA3593@linux.vnet.ibm.com>
In-Reply-To: <20180613072948.GA142000@joelaf.mtv.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8904474522904851264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2018 at 12:29:48AM -0700, Joel Fernandes wrote:
> (I'm actually not working this week, but still thought of replying :))
> =

> On Wed, Jun 13, 2018 at 02:57:11PM +0800, kernel test robot wrote:
> > =

> > FYI, we noticed the following commit (built with gcc-4.9):
> > =

> > commit: 46e26223e39c64763e321f229e324be15179c505 ("rcutorture: Make boo=
st test more robust")
> > url: https://github.com/0day-ci/linux/commits/Joel-Fernandes/rcutorture=
-Disable-RT-throttling-for-boost-tests/20180611-074731
> > base: https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.gi=
t rcu/next
> > =

> > in testcase: trinity
> > with following parameters:
> > =

> > 	runtime: 300s
> > =

> > test-description: Trinity is a linux system call fuzz tester.
> > test-url: http://codemonkey.org.uk/projects/trinity/
> =

> I'll try to reproduce this, but it could be because after this patch, the
> boost test is actually working.

Quite possibly.  ;-)

> The reason for the rcutorture test failure could be that the default
> kthread_prio for the system's RCU threads is set to 1 (unless overridden =
by
> rcutree.kthread_prio) which is also equal to the priority of the rcutortu=
re's
> boost threads. Due to this the rcutorture test could starve the RCU threa=
ds
> as well and defeat the boosting mechanism. I was able to solve a similar
> issue by just passing rcutree.kthread_prio of 50 on the kernel command li=
ne.
> =

> Paul, would it be ok if we changed the default kthread_prio to something =
> 1
> so that rcutorture can test properly without needing to pass any extra
> rcutree.* parameters?
> =

> so something like this in kernel/rcu/tree.c ?
> =

> static int kthread_prio =3D IS_ENABLED(CONFIG_RCU_BOOST) ? 2 : 0;

Would it be possible to also condition this on rcutorture being built
in?  Or are they doing modprobes for rcutorture?

							Thanx, Paul


--===============8904474522904851264==--

