Content-Type: multipart/mixed; boundary="===============1164130688294813561=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 21:37:46 +0100
Message-ID: <20180628203746.GJ30522@ZenIV.linux.org.uk>
In-Reply-To: <20180628202837.GI30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1164130688294813561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 09:28:37PM +0100, Al Viro wrote:

> Sure.  Unfortunately, adding yourself to the poll table is not the only
> way to block.  And a plenty of instances in e.g. drivers/media (where
> the bulk of ->poll() instances lives) are very free with grabbing mutexes
> as they go.

Speaking of obvious bogosities (a lot more so than a blocking allocation
several calls down into helper):

static __poll_t ca8210_test_int_poll(
        struct file *filp,
        struct poll_table_struct *ptable
)
{
        __poll_t return_flags =3D 0;
        struct ca8210_priv *priv =3D filp->private_data;

        poll_wait(filp, &priv->test.readq, ptable);
        if (!kfifo_is_empty(&priv->test.up_fifo))
                return_flags |=3D (EPOLLIN | EPOLLRDNORM);
        if (wait_event_interruptible(
                priv->test.readq,
                !kfifo_is_empty(&priv->test.up_fifo))) {
                return EPOLLERR;
        }
        return return_flags;
}

In a sense, poll_wait() had been an unfortunate choice of name - it's
really "arrange to be woken up by", not "wait for something now" and
while the outright confusion like above is rare, general "blocking
is OK in that area" is not rare at all...

--===============1164130688294813561==--

