Content-Type: multipart/mixed; boundary="===============1955246333958617355=="
MIME-Version: 1.0
From: Roman Gushchin <roman.gushchin@linux.dev>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/3] memcg: increase MEMCG_CHARGE_BATCH to 64
Date: Mon, 22 Aug 2022 19:22:26 -0700
Message-ID: <YwQ54pvNwy0/5u3C@P9FQF9L96D>
In-Reply-To: <YwPZ1lpJ98pZSLmw@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1955246333958617355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 09:34:59PM +0200, Michal Hocko wrote:
> On Mon 22-08-22 11:37:30, Roman Gushchin wrote:
> [...]
> > I wonder only if we want to make it configurable (Idk a sysctl or maybe
> > a config option) and close the topic.
> =

> I do not think this is a good idea. We have other examples where we have
> outsourced internal tunning to the userspace and it has mostly proven
> impractical and long term more problematic than useful (e.g.
> lowmem_reserve_ratio, percpu_pagelist_high_fraction, swappiness just to
> name some that come to my mind). I have seen more often these to be used
> incorrectly than useful.

A agree, not a strong opinion here. But I wonder if somebody will
complain on Shakeel's change because of the reduced accuracy.
I know some users are using memory cgroups to track the size of various
workloads (including relatively small) and 32->64 pages per cpu change
can be noticeable for them. But we can wait for an actual bug report :)

> =

> In this case, I guess we should consider either moving to per memcg
> charge batching and see whether the pcp overhead x memcg_count is worth
> that or some automagic tuning of the batch size depending on how
> effectively the batch is used. Certainly a lot of room for
> experimenting.

I'm not a big believer into the automagic tuning here because it's a fundam=
ental
trade-off of accuracy vs performance and various users might make a differe=
nt
choice depending on their needs, not on the cpu count or something else.

Per-memcg batching sounds interesting though. For example, we can likely
batch updates on leaf cgroups and have a single atomic update instead of
multiple most of the times. Or do you mean something different?

Thanks!
--===============1955246333958617355==--

