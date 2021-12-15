Content-Type: multipart/mixed; boundary="===============7966307604680826868=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Wed, 15 Dec 2021 13:54:33 +0100
Message-ID: <Ybnlic4KUznysQvl@kroah.com>
In-Reply-To: <CAHk-=whoMGTAAyah0jH+rHyAXCLnxAHu8KffrR8PrAXGhTxRdA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7966307604680826868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 11:44:31AM -0800, Linus Torvalds wrote:
> On Mon, Dec 13, 2021 at 10:37 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > So I'll just apply the patch. Thanks for the report and the testing
> =

> Done, it's commit e386dfc56f83 ("fget: clarify and improve
> __fget_files() implementation") in my tree now.
> =

> I didn't mark it as "Fixes:" or for stable, because I can't imagine
> that it matters in real life.
> =

> But then it  struck me that Greg has mentioned that he ends up getting
> a lot of performance regression reports for people testing stable and
> they can be distracting.
> =

> So I'm adding a stable cc here just so people are aware of this as a
> "yeah, will-it-scale.poll2 performance regression has been reported,
> has a fix available if somebody cares".

Thanks, I'll keep an eye on this.

greg k-h
--===============7966307604680826868==--

