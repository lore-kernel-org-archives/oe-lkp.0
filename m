Content-Type: multipart/mixed; boundary="===============3498334137840242225=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: 08ed4efad6: stress-ng.sigsegv.ops_per_sec -41.9% regression
Date: Thu, 08 Apr 2021 09:22:40 -0700
Message-ID: <CAHk-=wigPx+MMQMQ-7EA0pq5_5+kMCNV4qFsOss-WwdCSQmb-w@mail.gmail.com>
In-Reply-To: <20210408083026.GE1696@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3498334137840242225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 8, 2021 at 1:32 AM kernel test robot <oliver.sang@intel.com> =
wrote:
>
> FYI, we noticed a -41.9% regression of stress-ng.sigsegv.ops_per_sec due =
to commit
> 08ed4efad684 ("[PATCH v10 6/9] Reimplement RLIMIT_SIGPENDING on top of uc=
ounts")

Ouch.

I *think* this test may be testing "send so many signals that it
triggers the signal queue overflow case".

And I *think* that the performance degradation may be due to lots of
unnecessary allocations, because ity looks like that commit changes
__sigqueue_alloc() to do

        struct sigqueue *q =3D kmem_cache_alloc(sigqueue_cachep, flags);

*before* checking the signal limit, and then if the signal limit was
exceeded, it will just be free'd instead.

The old code would check the signal count against RLIMIT_SIGPENDING
*first*, and if there were m ore pending signals then it wouldn't do
anything at all (including not incrementing that expensive atomic
count).

Also, the old code was very careful to only do the "get_user()" for
the *first* signal it added to the queue, and do the "put_user()" for
when removing the last signal. Exactly because those atomics are very
expensive.

The new code just does a lot of these atomics unconditionally.

I dunno. The profile data in there is a bit hard to read, but there's
a lot more cachee misses, and a *lot* of node crossers:

>    5961544          +190.4%   17314361        perf-stat.i.cache-misses
>   22107466          +119.2%   48457656        perf-stat.i.cache-references
>     163292 =C4=85  3%   +4582.0%    7645410        perf-stat.i.node-load-=
misses
>     227388 =C4=85  2%   +3708.8%    8660824        perf-stat.i.node-loads

and (probably as a result) average instruction costs have gone up enormousl=
y:

>       3.47           +66.8%       5.79        perf-stat.overall.cpi
>      22849           -65.6%       7866        perf-stat.overall.cycles-be=
tween-cache-misses

and it does seem to be at least partly about "put_ucounts()":

>       0.00            +4.5        4.46        perf-profile.calltrace.cycl=
es-pp.put_ucounts.__sigqueue_free.get_signal.arch_do_signal_or_restart.exit=
_to_user_mode_prepare

and a lot of "get_ucounts()".

But it may also be that the new "get sigpending" is just *so* much
more expensive than it used to be.

               Linus
--===============3498334137840242225==--

