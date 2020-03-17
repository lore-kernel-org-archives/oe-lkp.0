Content-Type: multipart/mixed; boundary="===============0678397941160162841=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Tue, 17 Mar 2020 12:07:15 -0400
Message-ID: <61d6b91e9387969f5dfaba192aee366cc9b310f0.camel@kernel.org>
In-Reply-To: <6df79609-90eb-2f59-7e86-3532ac309a7a@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0678397941160162841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-17 at 22:05 +0800, yangerkun wrote:
> =

> On 2020/3/17 9:41, yangerkun wrote:
> > =

> > On 2020/3/17 1:26, Linus Torvalds wrote:
> > > On Mon, Mar 16, 2020 at 4:07 AM Jeff Layton <jlayton@kernel.org> wr=
ote:
> > > > =

> > > > +       /*
> > > > +        * If fl_blocker is NULL, it won't be set again as this =

> > > > thread "owns"
> > > > +        * the lock and is the only one that might try to claim the =

> > > > lock.
> > > > +        * Because fl_blocker is explicitly set last during a delet=
e, =

> > > > it's
> > > > +        * safe to locklessly test to see if it's NULL. If it is, =

> > > > then we know
> > > > +        * that no new locks can be inserted into its =

> > > > fl_blocked_requests list,
> > > > +        * and we can therefore avoid doing anything further as lon=
g =

> > > > as that
> > > > +        * list is empty.
> > > > +        */
> > > > +       if (!smp_load_acquire(&waiter->fl_blocker) &&
> > > > +           list_empty(&waiter->fl_blocked_requests))
> > > > +               return status;
> > > =

> > > Ack. This looks sane to me now.
> > > =

> > > yangerkun - how did you find the original problem?\
> > =

> > While try to fix CVE-2019-19769, add some log in __locks_wake_up_blocks =

> > help me to rebuild the problem soon. This help me to discern the proble=
m =

> > soon.
> > =

> > > Would you mind using whatever stress test that caused commit
> > > 6d390e4b5d48 ("locks: fix a potential use-after-free problem when
> > > wakeup a waiter") with this patch? And if you did it analytically,
> > > you're a champ and should look at this patch too!
> > =

> > I will try to understand this patch, and if it's looks good to me, will =

> > do the performance test!
> =

> This patch looks good to me, with this patch, the bug '6d390e4b5d48 =

> ("locks: fix a potential use-after-free problem when wakeup a waiter")' =

> describes won't happen again. Actually, I find that syzkaller has report =

> this bug before[1], and the log of it can help us to reproduce it with =

> some latency in __locks_wake_up_blocks!
> =

> Also, some ltp testcases describes in [2] pass too with the patch!
> =

> For performance test, I have try to understand will-it-scale/lkp, but it =

> seem a little complex to me, and may need some more time. So, Rong Chen, =

> can you help to do this? Or the results may come a little later...
> =

> Thanks,
> ----
> [1] https://syzkaller.appspot.com/bug?extid=3D922689db06e57b69c240
> [2] https://lkml.org/lkml/2020/3/11/578

Thanks yangerkun. Let me know if you want to add your Reviewed-by tag.

Cheers,
-- =

Jeff Layton <jlayton@kernel.org>

--===============0678397941160162841==--

