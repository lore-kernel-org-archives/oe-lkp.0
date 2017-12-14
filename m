Content-Type: multipart/mixed; boundary="===============8591706226134872976=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: d1fc031747 ("sched/wait: assert the wait_queue_head lock is .."): EIP: __wake_up_common
Date: Thu, 14 Dec 2017 15:58:00 +1100
Message-ID: <20171214155800.4f5376a5@canb.auug.org.au>
In-Reply-To: <20171213170300.b0bb26900dd00641819b4872@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8591706226134872976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 13 Dec 2017 17:03:00 -0800 Andrew Morton <akpm@linux-foundation.o=
rg> wrote:
>
> I'm probably sitting on an older version.  I've dropped
> =

> epoll: use the waitqueue lock to protect ep->wq
> sched/wait: assert the wait_queue_head lock is held in __wake_up_common

Dropped from linux-next as well.

-- =

Cheers,
Stephen Rothwell

--===============8591706226134872976==--

