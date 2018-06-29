Content-Type: multipart/mixed; boundary="===============5679050427279501558=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Fri, 29 Jun 2018 15:29:24 +0200
Message-ID: <20180629132924.GB28510@lst.de>
In-Reply-To: <20180628213027.GK30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5679050427279501558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 10:30:27PM +0100, Al Viro wrote:
> > Because I think that what it can do is simply to do the ->poll() calls
> > outside the iocb locks, and then just attach the poll table to the
> > kioctx afterwards.
> =

> I'd do a bit more - embed the first poll_table_entry into poll iocb itsel=
f,
> so that the instances that use only one queue wouldn't need any allocatio=
ns
> at all.

No need for poll_table_entry, we just need a wait_queue_head.
poll_table_entry is an select.c internal (except for two nasty driver) -
neither epoll nor most in-kernel callers use it.

--===============5679050427279501558==--

