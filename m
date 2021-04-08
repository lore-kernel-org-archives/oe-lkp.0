Content-Type: multipart/mixed; boundary="===============7331898122518673369=="
MIME-Version: 1.0
From: Alexey Gladkov <gladkov.alexey@gmail.com>
To: lkp@lists.01.org
Subject: Re: 08ed4efad6: stress-ng.sigsegv.ops_per_sec -41.9% regression
Date: Thu, 08 Apr 2021 18:44:26 +0200
Message-ID: <20210408164426.o5cfvv3ixowsto62@example.org>
In-Reply-To: <CAHk-=wigPx+MMQMQ-7EA0pq5_5+kMCNV4qFsOss-WwdCSQmb-w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7331898122518673369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 09:22:40AM -0700, Linus Torvalds wrote:
> On Thu, Apr 8, 2021 at 1:32 AM kernel test robot <oliver.sang@intel.com=
> wrote:
> >
> > FYI, we noticed a -41.9% regression of stress-ng.sigsegv.ops_per_sec du=
e to commit
> > 08ed4efad684 ("[PATCH v10 6/9] Reimplement RLIMIT_SIGPENDING on top of =
ucounts")
> =

> Ouch.
> =

> I *think* this test may be testing "send so many signals that it
> triggers the signal queue overflow case".
> =

> And I *think* that the performance degradation may be due to lots of
> unnecessary allocations, because ity looks like that commit changes
> __sigqueue_alloc() to do
> =

>         struct sigqueue *q =3D kmem_cache_alloc(sigqueue_cachep, flags);
> =

> *before* checking the signal limit, and then if the signal limit was
> exceeded, it will just be free'd instead.
> =

> The old code would check the signal count against RLIMIT_SIGPENDING
> *first*, and if there were m ore pending signals then it wouldn't do
> anything at all (including not incrementing that expensive atomic
> count).
> =

> Also, the old code was very careful to only do the "get_user()" for
> the *first* signal it added to the queue, and do the "put_user()" for
> when removing the last signal. Exactly because those atomics are very
> expensive.
> =

> The new code just does a lot of these atomics unconditionally.

Yes and right now I'm trying to rewrite this patch.

> I dunno. The profile data in there is a bit hard to read, but there's
> a lot more cachee misses, and a *lot* of node crossers:
> =

> >    5961544          +190.4%   17314361        perf-stat.i.cache-misses
> >   22107466          +119.2%   48457656        perf-stat.i.cache-referen=
ces
> >     163292 =C4=85  3%   +4582.0%    7645410        perf-stat.i.node-loa=
d-misses
> >     227388 =C4=85  2%   +3708.8%    8660824        perf-stat.i.node-loa=
ds
> =

> and (probably as a result) average instruction costs have gone up enormou=
sly:
> =

> >       3.47           +66.8%       5.79        perf-stat.overall.cpi
> >      22849           -65.6%       7866        perf-stat.overall.cycles-=
between-cache-misses
> =

> and it does seem to be at least partly about "put_ucounts()":
> =

> >       0.00            +4.5        4.46        perf-profile.calltrace.cy=
cles-pp.put_ucounts.__sigqueue_free.get_signal.arch_do_signal_or_restart.ex=
it_to_user_mode_prepare
> =

> and a lot of "get_ucounts()".
> =

> But it may also be that the new "get sigpending" is just *so* much
> more expensive than it used to be.

Thanks for decrypting this! I spent some time to understand this report
and still wasn't sure I understood it.

-- =

Rgrds, legion

--===============7331898122518673369==--

