Content-Type: multipart/mixed; boundary="===============3738859882520722762=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 32678f1513: aim7.jobs-per-min -5.6% regression
Date: Mon, 09 May 2022 10:03:26 +1000
Message-ID: <20220509000326.GN1098723@dread.disaster.area>
In-Reply-To: <20220507110941.GA10880@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3738859882520722762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 07, 2022 at 07:09:46PM +0800, Carel Si wrote:
> Hi Dave,
> =

> On Sat, May 07, 2022 at 07:29:24AM +1000, Dave Chinner wrote:
> > On Fri, May 06, 2022 at 05:22:50PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a -5.6% regression of aim7.jobs-per-min due to commit:
> > > =

> > > =

> > > commit: 32678f151338b9a321e9e27139a63c81f353acb7 ("[PATCH 1/4] xfs: d=
etect self referencing btree sibling pointers")
> > > url: https://github.com/intel-lab-lkp/linux/commits/Dave-Chinner/xfs-=
fix-random-format-verification-issues/20220502-162206
> > > base: https://git.kernel.org/cgit/fs/xfs/xfs-linux.git for-next
> > > patch link: https://lore.kernel.org/linux-xfs/20220502082018.1076561-=
2-david(a)fromorbit.com
> > =

> > Well, that answers the concern I had about the impact of =

> > changing the way endian conversions were done in that patch.
> > =

> > > a44a027a8b2a20fe 32678f151338b9a321e9e27139a =

> > > ---------------- --------------------------- =

> > >          %stddev     %change         %stddev
> > >              \          |                \  =

> > >     464232            -5.6%     438315        aim7.jobs-per-min
> > ....
> > >       0.13 =C2=B1  5%      +0.2        0.33 =C2=B1  6%  perf-profile.=
children.cycles-pp.__xfs_btree_check_sblock
> > ....
> > >       0.11 =C2=B1  4%      +0.2        0.30 =C2=B1  5%  perf-profile.=
self.cycles-pp.__xfs_btree_check_sblock
> > =

> > Because there is it, right at the bottom of the profile.
> > =

> > Can you try the patch below and see if that fixes the issue?
> =

> We tested below patch, it didn't fix the issue, still has -6.4% regressio=
n [1] =

> comparing to a44a027a8b ("Merge tag 'large-extent-counters-v9' of =

> https://github.com/chandanr/linux into xfs-5.19-for-next"). =


Really? It made the regression *worse*?

Oh, wait, *that* wasn't in the last set of profiles:

....
>      35.30 =C2=B1  4%      +1.3       36.59 =C2=B1  3%      +1.9       37=
.24 =C2=B1  3%  perf-profile.children.cycles-pp.osq_lock
>      36.88 =C2=B1  4%      +1.3       38.19 =C2=B1  2%      +1.9       38=
.83 =C2=B1  3%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
>      37.40 =C2=B1  4%      +1.4       38.77 =C2=B1  2%      +2.0       39=
.35 =C2=B1  3%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
....
>       1.89 =C2=B1  3%      +0.1        1.96 =C2=B1  4%      +0.0        1=
.90 =C2=B1  2%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
>       0.11 =C2=B1  4%      +0.2        0.30 =C2=B1  5%      +0.2        0=
.29        perf-profile.self.cycles-pp.__xfs_btree_check_sblock
>      35.08 =C2=B1  4%      +1.3       36.33 =C2=B1  2%      +1.9       37=
.01 =C2=B1  3%  perf-profile.self.cycles-pp.osq_lock

This test is hammering an rwsem which is them spinning on exclusive
write locks somewhere. That's where all the increase in system time
has come from, and that's what's causing the difference in
perofrmance. I bet this test is hammering single file write IO from
all 96 CPUs at once, and that's where all the problems start.

IOWs, this likley has nothing to with the btree validation change,
and everything to do with the system being driven into a lock and
cacheline contention corner. When there is lock contention like this
on a large CPU count system, we can't infer anything at all from any
other measurement because the cacheline contention skews
everything...

I'm not going to look at this any further, and I think I'm going to
ignore AIM7 write test regressions in future until the test is
reconfigured to avoid this sort of "100 cpus all trying to do
buffered writes to the same file" contention issue.

Cheers,

Dave.

-- =

Dave Chinner
david(a)fromorbit.com
--===============3738859882520722762==--

