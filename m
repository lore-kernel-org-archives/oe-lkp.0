Content-Type: multipart/mixed; boundary="===============4242362483992182141=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/3] memcg: increase MEMCG_CHARGE_BATCH to 64
Date: Mon, 22 Aug 2022 17:22:39 +0200
Message-ID: <YwOfP/6PtS8BxNhz@dhcp22.suse.cz>
In-Reply-To: <CALvZod5YGVSTvsg25P6goqyGEY21eVnahsXcs2BGsp6OXxLwsg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4242362483992182141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 22-08-22 08:09:01, Shakeel Butt wrote:
> On Mon, Aug 22, 2022 at 3:47 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> [...]
> >
> > > To evaluate the impact of this optimization, on a 72 CPUs machine, we
> > > ran the following workload in a three level of cgroup hierarchy with =
top
> > > level having min and low setup appropriately. More specifically
> > > memory.min equal to size of netperf binary and memory.low double of
> > > that.
> >
> > a similar feedback to the test case description as with other patches.
> =

> What more info should I add to the description? Why did I set up min
> and low or something else?

I do see why you wanted to keep the test consistent over those three
patches. I would just drop the reference to the protection configuration
because it likely doesn't make much of an impact, does it? It is the
multi cpu setup and false sharing that makes the real difference. Or am
I wrong in assuming that?

-- =

Michal Hocko
SUSE Labs
--===============4242362483992182141==--

