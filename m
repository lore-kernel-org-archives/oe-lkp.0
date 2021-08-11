Content-Type: multipart/mixed; boundary="===============6410838296796321491=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Tue, 10 Aug 2021 19:59:53 -1000
Message-ID: <CAHk-=wiSHHSuSQsCCLOxQA+cbcvjmEeMsTCMWPT1sFVngd9-ig@mail.gmail.com>
In-Reply-To: <20210811031734.GA5193@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6410838296796321491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 4:59 PM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
> FYI, we noticed a -36.4% regression of vm-scalability.throughput due to c=
ommit:
> 2d146aa3aa84 ("mm: memcontrol: switch to rstat")

Hmm. I guess some cost is to be expected, but that's a big regression.

I'm not sure what the code ends up doing, and how relevant this test
is, but Johannes - could you please take a look?

I can't make heads nor tails of the profile. The profile kind of points at =
this:

>       2.77 =C4=85 12%     +27.4       30.19 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       2.86 =C4=85 12%     +27.4       30.29 =C4=85  8%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       2.77 =C4=85 12%     +27.4       30.21 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.lock_page_lruvec_irqsave
>       4.26 =C4=85 10%     +28.1       32.32 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.lru_cache_add
>       4.15 =C4=85 10%     +28.2       32.33 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__pagevec_lru_add

and that seems to be from the chain __do_fault -> shmem_fault ->
shmem_getpage_gfp -> lru_cache_add -> __pagevec_lru_add ->
lock_page_lruvec_irqsave -> _raw_spin_lock_irqsave ->
native_queued_spin_lock_slowpath.

That shmem_fault codepath being hot may make sense for sokme VM
scalability test. But it seems to make little sense when I look at the
commit that it bisected to.

We had another report of this commit causing a much more reasonable
small slowdown (-2.8%) back in May.

I'm not sure what's up with this new report. Johannes, does this make
sense to you?

Is it perhaps another "unlucky cache line placement" thing? Or has the
statistics changes just changed the behavior of the test?

Anybody?

              Linus
--===============6410838296796321491==--

