Content-Type: multipart/mixed; boundary="===============4337982426342352782=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Mon, 16 Mar 2020 10:26:59 -0700
Message-ID: <CAHk-=whnqDS0NJtAaArVeYQz3hcU=4Ja3auB1Jvs42eADfUgMQ@mail.gmail.com>
In-Reply-To: <ce48ed9e48eda3c0f27d2f417314bd00cb1a68db.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4337982426342352782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 4:07 AM Jeff Layton <jlayton@kernel.org> wrote:
>
>
> +       /*
> +        * If fl_blocker is NULL, it won't be set again as this thread "o=
wns"
> +        * the lock and is the only one that might try to claim the lock.
> +        * Because fl_blocker is explicitly set last during a delete, it's
> +        * safe to locklessly test to see if it's NULL. If it is, then we=
 know
> +        * that no new locks can be inserted into its fl_blocked_requests=
 list,
> +        * and we can therefore avoid doing anything further as long as t=
hat
> +        * list is empty.
> +        */
> +       if (!smp_load_acquire(&waiter->fl_blocker) &&
> +           list_empty(&waiter->fl_blocked_requests))
> +               return status;

Ack. This looks sane to me now.

yangerkun - how did you find the original problem?

Would you mind using whatever stress test that caused commit
6d390e4b5d48 ("locks: fix a potential use-after-free problem when
wakeup a waiter") with this patch? And if you did it analytically,
you're a champ and should look at this patch too!

Thanks,

              Linus
--===============4337982426342352782==--

