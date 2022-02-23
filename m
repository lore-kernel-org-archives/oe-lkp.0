Content-Type: multipart/mixed; boundary="===============3139878351837748794=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] workqueue: Use private WQ for schedule_on_each_cpu() API
Date: Wed, 23 Feb 2022 12:29:01 -1000
Message-ID: <Yha1LeX4OK3cLCV5@slm.duckdns.org>
In-Reply-To: <9a883d72-ea7d-1936-93e6-5c2a290509d4@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============3139878351837748794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 07:26:30AM +0900, Tetsuo Handa wrote:
> > The patch seems pretty wrong. What's problematic is system workqueue fl=
ushes
> > (which flushes the entire workqueue), not work item flushes.
> =

> Why? My understanding is that
> =

>   flushing a workqueue waits for completion of all work items in that wor=
kqueue
> =

>   flushing a work item waits for for completion of that work item using
>   a workqueue specified as of queue_work()
> =

> and
> =

>   if a work item in some workqueue is blocked by other work in that workq=
ueue
>   (e.g. max_active limit, work items on that workqueue and locks they nee=
d),
>   it has a risk of deadlock
> =

> . Then, how can flushing a work item using system-wide workqueues be free=
 of deadlock risk?
> Isn't it just "unlikely to deadlock" rather than "impossible to deadlock"?

If we're jamming system_wq with a combination of work items which need more
than max_active to make forward progress, we're stuck regardless of flushes.
What's needed at that point is increasing max_active (or something along
that line).

Thanks.

-- =

tejun
--===============3139878351837748794==--

