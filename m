Content-Type: multipart/mixed; boundary="===============6148794484208155962=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/3] memcg: increase MEMCG_CHARGE_BATCH to 64
Date: Mon, 22 Aug 2022 21:34:59 +0200
Message-ID: <YwPZ1lpJ98pZSLmw@dhcp22.suse.cz>
In-Reply-To: <YwPM6o1+pZ2kRyy3@P9FQF9L96D>
List-Id: <oe-lkp.lists.linux.dev>

--===============6148794484208155962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 22-08-22 11:37:30, Roman Gushchin wrote:
[...]
> I wonder only if we want to make it configurable (Idk a sysctl or maybe
> a config option) and close the topic.

I do not think this is a good idea. We have other examples where we have
outsourced internal tunning to the userspace and it has mostly proven
impractical and long term more problematic than useful (e.g.
lowmem_reserve_ratio, percpu_pagelist_high_fraction, swappiness just to
name some that come to my mind). I have seen more often these to be used
incorrectly than useful.

In this case, I guess we should consider either moving to per memcg
charge batching and see whether the pcp overhead x memcg_count is worth
that or some automagic tuning of the batch size depending on how
effectively the batch is used. Certainly a lot of room for
experimenting.

-- =

Michal Hocko
SUSE Labs
--===============6148794484208155962==--

