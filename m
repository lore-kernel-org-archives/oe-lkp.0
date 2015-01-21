Content-Type: multipart/mixed; boundary="===============8942036203638496175=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 00f5159aeb6: +55.3% will-it-scale.time.involuntary_context_switches
Date: Wed, 21 Jan 2015 00:54:32 -0800
Message-ID: <20150121085432.GD9719@linux.vnet.ibm.com>
In-Reply-To: <1421827607.5772.19.camel@marge.simpson.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8942036203638496175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2015 at 09:06:47AM +0100, Mike Galbraith wrote:
> On Tue, 2015-01-20 at 23:52 -0800, Paul E. McKenney wrote: =

> > On Wed, Jan 21, 2015 at 03:32:44PM +0800, Huang Ying wrote:
> > > FYI, we noticed the below changes on
> > > =

> > > git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git s=
tall.2015.01.06a
> > > commit 00f5159aeb68f08ce29597be86be87d6db0c1ba1 ("rcu: Run grace-peri=
od kthreads at real-time priority")
> > =

> > Glad this helps!
> =

> The way I read it, it's hurting by increasing context switches... but if
> you'll need a boot param to turn it on in the future, this is moot :)

Heh!  I guess I should read it more carefully.  Anyway, the commit does
help in some heavy-load situations, but something more deft is clearly
required if it is to be enabled more generally.

							Thanx, Paul


--===============8942036203638496175==--

