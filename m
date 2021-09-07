Content-Type: multipart/mixed; boundary="===============8112512693174233300=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 10:52:17 -0700
Message-ID: <CAHk-=wgW3dYJyh6S_U5ot_0Q-OU0-vrS=L8Uky4+Y5fZXeLcKw@mail.gmail.com>
In-Reply-To: <CALvZod5Q_K=xLpBWTLgg38X_w23HVSyqW2_Jnz7p=JR+kDD_-w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8112512693174233300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 9:49 AM Shakeel Butt <shakeelb@google.com> wrote:
>
> On Tue, Sep 7, 2021 at 9:40 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > We are worried about them. I'm considering reverting several of them
> > because I think the problems are
> >
> >  (a) big
> >
> >  (b) nontrivial
> >
> > and the patches clearly weren't ready and people weren't aware of this =
issue.
>
> Sounds good to me. Please let me know which patches you are planning
> to revert. I will work on the followup to make those acceptable.

The one that looks clear-cut is the one in this thread:

    0f12156dff28 memcg: enable accounting for file lock caches

which seems to result in regressions on multiple machines and just be
very bad for anything that uses file locking. I'm not entirely sure
how much that would show up in real life, but I can most definitely
imagine it being a problem on a real load.

There's a few other regression reports I've seen, like

    5387c90490f7 mm/memcg: improve refill_obj_stock() performance

but that one had mixed reports (it improved another benchmark), and it
looks like Minchan has a fix for the regression already.

And

    aa48e47e3906 memcg: infrastructure to flush memcg stats
    b65584344415 memcg: enable accounting for pollfd and select bits arrays

were reported as a regression in -mm, but not in mainline yet.

I assume (but didn't check) that aa48e47e3906 is a bigger deal to revert.

So _right_now_ my plan is to revert the two obvious cases:

    0f12156dff28 memcg: enable accounting for file lock caches
    b65584344415 memcg: enable accounting for pollfd and select bits arrays

on the assumption that the memcg accounting code needs some work to
make it less of a performance hog.

Does anybody have other commits they want to highlight (or other
comments) about this?

              Linus
--===============8112512693174233300==--

