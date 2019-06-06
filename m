Content-Type: multipart/mixed; boundary="===============8647816408375301056=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Thu, 06 Jun 2019 10:19:43 -0400
Message-ID: <Pine.LNX.4.44L0.1906061017200.1641-100000@iolanthe.rowland.org>
In-Reply-To: <20190606081657.GA4249@andrea>
List-Id: <oe-lkp.lists.linux.dev>

--===============8647816408375301056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Jun 2019, Andrea Parri wrote:

> This seems a sensible change to me: looking forward to seeing a patch,
> on top of -rcu/dev, for further review and testing!
> =

> We could also add (to LKMM) the barrier() for rcu_read_{lock,unlock}()
> discussed in this thread (maybe once the RCU code and the informal doc
> will have settled in such direction).

Yes.  Also for SRCU.  That point had not escaped me.

Alan


--===============8647816408375301056==--

