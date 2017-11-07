Content-Type: multipart/mixed; boundary="===============7135784115574424238=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [d_alloc_parallel] WARNING: bad unlock balance detected!
Date: Tue, 07 Nov 2017 09:51:07 +0100
Message-ID: <20171107085107.GH3326@worktop>
In-Reply-To: <20171107040329.yftf6ceduet4zaph@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7135784115574424238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 12:03:29PM +0800, Fengguang Wu wrote:

> >>[  428.512005] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow C=
ontrol: RX
> >>LKP: HOSTNAME vm-lkp-wsx03-openwrt-i386-8, MAC , kernel 4.14.0-rc8 158,=
 serial console /dev/ttyS0
> >>[  429.798345] Kernel tests: Boot OK!
> >>[  430.761760] [  430.766166] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>[  430.775297] WARNING: bad unlock balance detected!
> >>[  430.784342] 4.14.0-rc8 #158 Not tainted
> >>[  430.792153] -------------------------------------
> >>[  430.801319] pidof/1024 is trying to release lock (rcu_preempt_state)=
 at:
> >>[  430.813514] [<c10e4348>] rcu_read_unlock_special+0x5f8/0x620
> >>[  430.824041] but there are no more locks to release!
> >
> >Er... yes?  What of that?  Since when is rcu_read_lock() not allowed to
> >be used under an rwsem?

That's not what it says, it is.. The warning is about trying to release
a lock that's not held. And its right, RCU was doing that. It would
acquire a lock without lockdep knowing about it and then telling lockdep
about freeing it.

This is fixed by commit:

  02a7c234e540 ("rcu: Suppress lockdep false-positive ->boost_mtx complaint=
s")

The problem is that RCU boosting was mixing futex and !futex rt_mutex
ops.

--===============7135784115574424238==--

