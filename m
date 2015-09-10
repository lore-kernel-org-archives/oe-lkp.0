Content-Type: multipart/mixed; boundary="===============8512326903363371428=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [locktorture] 5f6a140f30: kernel BUG at drivers/base/driver.c:153!
Date: Thu, 10 Sep 2015 10:18:02 -0700
Message-ID: <20150910171802.GF4029@linux.vnet.ibm.com>
In-Reply-To: <20150910135942.GA21983@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8512326903363371428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 03:59:42PM +0200, Oleg Nesterov wrote:
> On 09/09, Paul E. McKenney wrote:
> >
> > This is obsolete, but its replacement is the same patch.
> =

> fbe3b97183f84155d81e506b1aa7d2ce986f7a36 in linux-rcu.git#experimental
> I guess?
> =

> > Oleg, Davidlohr, am I missing something on how percpu_rwsem or
> > locktorture work?
> =

> No, I think the patch is fine. Thanks for doing this! I was going to
> send something like this change too. And in fact I am still thinking
> about another test which plays with rcu_sync only, but probably we
> need some cleanups first (and we need them anyway). I'll try to do
> this a bit later.

I would welcome an rcu_sync-specific torture patch!

> > +void torture_percpu_rwsem_init(void)
> > +{
> > +	BUG_ON(percpu_init_rwsem(&pcpu_rwsem));
> > +}
> > +
> =

> Aha, we don't really need this... I mean we can use the static initialiser
> which can also be used by uprobes and cgroups. I'll try to send the patch
> tomorrow.

Very good, please do!

							Thanx, Paul


--===============8512326903363371428==--

