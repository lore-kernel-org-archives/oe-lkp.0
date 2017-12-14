Content-Type: multipart/mixed; boundary="===============5862428307827796273=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: d1fc031747 ("sched/wait: assert the wait_queue_head lock is .."): EIP: __wake_up_common
Date: Thu, 14 Dec 2017 13:57:31 +0100
Message-ID: <20171214125731.GA10676@lst.de>
In-Reply-To: <20171213170300.b0bb26900dd00641819b4872@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5862428307827796273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2017 at 05:03:00PM -0800, Andrew Morton wrote:
> I'm probably sitting on an older version.  I've dropped
> =

> epoll: use the waitqueue lock to protect ep->wq
> sched/wait: assert the wait_queue_head lock is held in __wake_up_common

Thanks.  I'll send a v3 over the fixed version with the nits pointed
out during review today.

--===============5862428307827796273==--

