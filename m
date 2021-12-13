Content-Type: multipart/mixed; boundary="===============8437371060227882876=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Mon, 13 Dec 2021 11:44:31 -0800
Message-ID: <CAHk-=whoMGTAAyah0jH+rHyAXCLnxAHu8KffrR8PrAXGhTxRdA@mail.gmail.com>
In-Reply-To: <CAHk-=wjsTk2jym66RYkK9kuq8zOXTd2bWPiOq43-iCF6Qy-xQQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8437371060227882876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 10:37 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So I'll just apply the patch. Thanks for the report and the testing

Done, it's commit e386dfc56f83 ("fget: clarify and improve
__fget_files() implementation") in my tree now.

I didn't mark it as "Fixes:" or for stable, because I can't imagine
that it matters in real life.

But then it  struck me that Greg has mentioned that he ends up getting
a lot of performance regression reports for people testing stable and
they can be distracting.

So I'm adding a stable cc here just so people are aware of this as a
"yeah, will-it-scale.poll2 performance regression has been reported,
has a fix available if somebody cares".

              Linus
--===============8437371060227882876==--

