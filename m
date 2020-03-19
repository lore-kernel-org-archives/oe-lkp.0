Content-Type: multipart/mixed; boundary="===============8080595663842168847=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Thu, 19 Mar 2020 13:51:59 -0400
Message-ID: <5d7b448858d5a5c01e97aceb45dcadff24d6fc28.camel@kernel.org>
In-Reply-To: <CAHk-=whnqDS0NJtAaArVeYQz3hcU=4Ja3auB1Jvs42eADfUgMQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8080595663842168847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-03-16 at 10:26 -0700, Linus Torvalds wrote:
> On Mon, Mar 16, 2020 at 4:07 AM Jeff Layton <jlayton@kernel.org> wrote:
> > =

> > +       /*
> > +        * If fl_blocker is NULL, it won't be set again as this thread =
"owns"
> > +        * the lock and is the only one that might try to claim the loc=
k.
> > +        * Because fl_blocker is explicitly set last during a delete, i=
t's
> > +        * safe to locklessly test to see if it's NULL. If it is, then =
we know
> > +        * that no new locks can be inserted into its fl_blocked_reques=
ts list,
> > +        * and we can therefore avoid doing anything further as long as=
 that
> > +        * list is empty.
> > +        */
> > +       if (!smp_load_acquire(&waiter->fl_blocker) &&
> > +           list_empty(&waiter->fl_blocked_requests))
> > +               return status;
> =

> Ack. This looks sane to me now.
> =

> yangerkun - how did you find the original problem?
> =

> Would you mind using whatever stress test that caused commit
> 6d390e4b5d48 ("locks: fix a potential use-after-free problem when
> wakeup a waiter") with this patch? And if you did it analytically,
> you're a champ and should look at this patch too!
> =


Thanks for all the help with this.

Yangerkun gave me his Reviewed-by and I sent you the most recent version
of the patch yesterday (cc'ing the relevant mailing lists). I left you
as author as the original patch was yours.

Let me know if you'd prefer I send a pull request instead.

Cheers,
-- =

Jeff Layton <jlayton@kernel.org>

--===============8080595663842168847==--

