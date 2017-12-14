Content-Type: multipart/mixed; boundary="===============1288971397468826247=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d1fc031747 ("sched/wait: assert the wait_queue_head lock is .."): EIP: __wake_up_common
Date: Wed, 13 Dec 2017 17:03:00 -0800
Message-ID: <20171213170300.b0bb26900dd00641819b4872@linux-foundation.org>
In-Reply-To: <5a31cac7.i9WLKx5al8+rBn73%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1288971397468826247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Dec 2017 08:50:15 +0800 kernel test robot <fengguang.wu@intel.=
com> wrote:

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit d1fc0317472217762fa7741260ca464077b4c877
> Author:     Christoph Hellwig <hch@lst.de>
> AuthorDate: Wed Dec 13 11:52:12 2017 +1100
> Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> CommitDate: Wed Dec 13 16:04:58 2017 +1100
> =

>     sched/wait: assert the wait_queue_head lock is held in __wake_up_comm=
on
>     =

>     Better ensure we actually hold the lock using lockdep than just comme=
nting
>     on it.  Due to the various exported _locked interfaces it is far too =
easy
>     to get the locking wrong.

I'm probably sitting on an older version.  I've dropped

epoll: use the waitqueue lock to protect ep->wq
sched/wait: assert the wait_queue_head lock is held in __wake_up_common

--===============1288971397468826247==--

