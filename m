Content-Type: multipart/mixed; boundary="===============5387203318250047131=="
MIME-Version: 1.0
From: Mike Galbraith <umgwanakikbuti@gmail.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 00f5159aeb6: +55.3% will-it-scale.time.involuntary_context_switches
Date: Wed, 21 Jan 2015 09:06:47 +0100
Message-ID: <1421827607.5772.19.camel@marge.simpson.net>
In-Reply-To: <20150121075254.GC9719@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5387203318250047131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-01-20 at 23:52 -0800, Paul E. McKenney wrote: =

> On Wed, Jan 21, 2015 at 03:32:44PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git sta=
ll.2015.01.06a
> > commit 00f5159aeb68f08ce29597be86be87d6db0c1ba1 ("rcu: Run grace-period=
 kthreads at real-time priority")
> =

> Glad this helps!

The way I read it, it's hurting by increasing context switches... but if
you'll need a boot param to turn it on in the future, this is moot :)

-Mike


--===============5387203318250047131==--

