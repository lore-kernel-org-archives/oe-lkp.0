Content-Type: multipart/mixed; boundary="===============2435932787307819960=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 11 Oct 2017 11:36:36 +0900
Message-ID: <20171011023635.GI3323@X58A-UD3R>
In-Reply-To: <CA+55aFxqRb_rK8Fa_b8zL+jg3p43w81zkt5iWpFFfByY6Rx6vg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2435932787307819960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 09:56:26AM -0700, Linus Torvalds wrote:
> On Tue, Oct 10, 2017 at 9:22 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I really would like to see the sites that do cross-thread lock/unlock
> > pairs themselves be annotated.
> >
> > So when you lock in one thread, and then unlock in another, I'd
> > actually prefer to see something like
> >
> >  - T1:
> >         lock_mutex_cross();
> >
> >  - T2:
> >         unlock_mutex_cross();
> >
> > to make it very explicit that *these* particular lock/unlock
> > operations are the fancy ones.
> =

> Actually, let's make it even *more* obvious, and even easier for
> lockdep (and for humans) to see what's going on.
> =

> So I think the best model would be something like this:
> =

>  - T1:
>         mutex_lock(&lock)
>         ...
>         mutex_transfer(&lock)
> =

>  - T2:
>         mutex_receive(&lock);
>         ...
>         mutex_unlock(&lock);

In addition, if we really need to use mutex locks in this way, I also
think it should work with the explicit primitives as you said.


--===============2435932787307819960==--

