Content-Type: multipart/mixed; boundary="===============2431829035888020532=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [d_alloc_parallel] WARNING: bad unlock balance detected!
Date: Tue, 07 Nov 2017 02:33:28 +0000
Message-ID: <20171107023328.GU21978@ZenIV.linux.org.uk>
In-Reply-To: <20171107020113.52ws4cqhonhk2zvw@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2431829035888020532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 10:01:13AM +0800, Fengguang Wu wrote:
> Hi,
> =

> Here is a warning in v4.14-rc8 -- it's not necessarily a new bug.

Why is it a bug at all?

> [  428.512005] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Con=
trol: RX
> LKP: HOSTNAME vm-lkp-wsx03-openwrt-i386-8, MAC , kernel 4.14.0-rc8 158, s=
erial console /dev/ttyS0
> [  429.798345] Kernel tests: Boot OK!
> [  430.761760] [  430.766166] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  430.775297] WARNING: bad unlock balance detected!
> [  430.784342] 4.14.0-rc8 #158 Not tainted
> [  430.792153] -------------------------------------
> [  430.801319] pidof/1024 is trying to release lock (rcu_preempt_state) a=
t:
> [  430.813514] [<c10e4348>] rcu_read_unlock_special+0x5f8/0x620
> [  430.824041] but there are no more locks to release!

Er... yes?  What of that?  Since when is rcu_read_lock() not allowed to
be used under an rwsem?

> [  430.833342] [  430.833342] other info that might help us debug this:
> [  430.845985] 2 locks held by pidof/1024:
> [  430.853826]  #0:  (&sb->s_type->i_mutex_key){....}, at: [<c1266efa>] l=
ookup_slow+0x8a/0x310
> [  430.869344]  #1:  (rcu_read_lock){....}, at: [<c128094e>] d_alloc_para=
llel+0x7e/0xd10

No shit - we are doing RCU cache chain walk while holding ->i_rwsem.  As in
	down_read(&rwsem);
	...
	rcu_read_lock();
	...
	rcu_read_unlock();

Why is that a problem?  If we are suddenly not allowed to have an RCU reader
section while holding any kind of a blocking lock, a *lot* of places in the
kernel are screwed.

Please, explain.

--===============2431829035888020532==--

