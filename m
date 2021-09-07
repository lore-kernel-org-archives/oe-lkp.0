Content-Type: multipart/mixed; boundary="===============5095957063826747205=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 11:19:26 -0700
Message-ID: <CALvZod5bjVzvgMQ0QoLSVY+JYZmPHaK-0PX6a6kJ_78UAEdX+Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgW3dYJyh6S_U5ot_0Q-OU0-vrS=L8Uky4+Y5fZXeLcKw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5095957063826747205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 10:54 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 7, 2021 at 9:49 AM Shakeel Butt <shakeelb@google.com> wrote:
> >
> > On Tue, Sep 7, 2021 at 9:40 AM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > We are worried about them. I'm considering reverting several of them
> > > because I think the problems are
> > >
> > >  (a) big
> > >
> > >  (b) nontrivial
> > >
> > > and the patches clearly weren't ready and people weren't aware of thi=
s issue.
> >
> > Sounds good to me. Please let me know which patches you are planning
> > to revert. I will work on the followup to make those acceptable.
>
> The one that looks clear-cut is the one in this thread:
>
>     0f12156dff28 memcg: enable accounting for file lock caches
>
> which seems to result in regressions on multiple machines and just be
> very bad for anything that uses file locking. I'm not entirely sure
> how much that would show up in real life, but I can most definitely
> imagine it being a problem on a real load.
>
> There's a few other regression reports I've seen, like
>
>     5387c90490f7 mm/memcg: improve refill_obj_stock() performance
>
> but that one had mixed reports (it improved another benchmark), and it
> looks like Minchan has a fix for the regression already.
>
> And
>
>     aa48e47e3906 memcg: infrastructure to flush memcg stats
>     b65584344415 memcg: enable accounting for pollfd and select bits arra=
ys
>
> were reported as a regression in -mm, but not in mainline yet.
>
> I assume (but didn't check) that aa48e47e3906 is a bigger deal to revert.
>

I am suspecting aa48e47e3906 might be similar to [1]. I am testing that the=
ory.

[1] https://lore.kernel.org/all/20210811031734.GA5193(a)xsang-OptiPlex-9020=
/T/#u
--===============5095957063826747205==--

