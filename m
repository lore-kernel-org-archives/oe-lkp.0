Content-Type: multipart/mixed; boundary="===============6456067604383751968=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [writeback] 8bc4ad9498: INFO: suspicious RCU usage. ]
Date: Fri, 02 Sep 2016 14:00:51 -0400
Message-ID: <20160902180051.GB18760@htj.duckdns.org>
In-Reply-To: <20160902170056.GN16261@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6456067604383751968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello, Paul.

On Fri, Sep 02, 2016 at 10:00:56AM -0700, Paul E. McKenney wrote:
> Note that lockdep believes that the rcu_read_lock() has also been
> dropped, otherwise it would have listed it.

There isn't any actual code between rcu_read_lock() and the following
rcu deref.  That's the first thing which happens.  It looked
mysterious to me so I was wondering whether you knew any brekages on
rcu lockdep side.  Unfortunately, that doesn't seem to be the case.

> At this point, I have to suggest "git bisect"...

I'll try to reproduce it and see wth is going on.

Thanks!

-- =

tejun

--===============6456067604383751968==--

