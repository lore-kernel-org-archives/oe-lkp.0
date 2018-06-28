Content-Type: multipart/mixed; boundary="===============2609324556714502965=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 23:20:16 +0100
Message-ID: <20180628222016.GL30522@ZenIV.linux.org.uk>
In-Reply-To: <20180628213027.GK30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2609324556714502965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 10:30:27PM +0100, Al Viro wrote:

> I'm not saying that blocking on other things is a bug; some of such *are*=
 bogus,
> but a lot aren't really broken.  What I said is that in a lot of cases we=
 really
> have hard "no blocking other than in callback" (and on subsequent passes =
there's
> no callback at all).  Which is just about perfect for AIO purposes, so *I=
F* we
> go for "new method just for AIO, those who don't have it can take a hike"=
, we might
> as well indicate that "can take a hike" in some way (be it opt-in or opt-=
out) and
> use straight unchanged ->poll(), with alternative callback.

PS: one way of doing that would be to steal a flag from pt->_key and have -=
>poll()
instances do an equivalent of
        if (flags & LOOKUP_RCU)
                return -ECHILD;
we have in a lot of ->d_revalidate() instances for "need to block" case.  O=
nly
here they would've returned EPOLLNVAL.

Most of the ->poll() instances wouldn't care at all - they do not block unl=
ess
the callback does (and in this case it wouldn't have).  Normal poll(2)/sele=
ct(2)
are completely unaffected.  And AIO would just have that bit set in its
poll_table_struct.

The rules for drivers change only in one respect - if your ->poll() is goin=
g to
need to block, check poll_requested_events(pt) & EPOLL_ATOMIC and return EP=
OLLNVAL
in such case.

--===============2609324556714502965==--

