Content-Type: multipart/mixed; boundary="===============0416369853101998381=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/3] memcg: increase MEMCG_CHARGE_BATCH to 64
Date: Mon, 22 Aug 2022 08:09:01 -0700
Message-ID: <CALvZod5YGVSTvsg25P6goqyGEY21eVnahsXcs2BGsp6OXxLwsg@mail.gmail.com>
In-Reply-To: <YwNe3HBxzF+fWb2n@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0416369853101998381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 3:47 AM Michal Hocko <mhocko@suse.com> wrote:
>
[...]
>
> > To evaluate the impact of this optimization, on a 72 CPUs machine, we
> > ran the following workload in a three level of cgroup hierarchy with top
> > level having min and low setup appropriately. More specifically
> > memory.min equal to size of netperf binary and memory.low double of
> > that.
>
> a similar feedback to the test case description as with other patches.

What more info should I add to the description? Why did I set up min
and low or something else?

> >
> >  $ netserver -6
> >  # 36 instances of netperf with following params
> >  $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K
> >
> > Results (average throughput of netperf):
> > Without (6.0-rc1)       10482.7 Mbps
> > With patch              17064.7 Mbps (62.7% improvement)
> >
> > With the patch, the throughput improved by 62.7%.
> >
> > Signed-off-by: Shakeel Butt <shakeelb@google.com>
> > Reported-by: kernel test robot <oliver.sang@intel.com>
>
> Anyway
> Acked-by: Michal Hocko <mhocko@suse.com>

Thanks
--===============0416369853101998381==--

