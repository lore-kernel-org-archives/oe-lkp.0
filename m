Content-Type: multipart/mixed; boundary="===============3342054054972907480=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 19 Aug 2016 11:00:17 +0200
Message-ID: <20160819090017.GF32619@dhcp22.suse.cz>
In-Reply-To: <CA+55aFzqmNRWyczFHDCgjv2w6ZyD_AUJL1O1ZRmDs+DHT2=2cQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3342054054972907480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 18-08-16 15:25:40, Linus Torvalds wrote:
[...]
> So just for testing purposes, you could try changing that
> =

>         return alloc_pages(gfp, 0);
> =

> in __page_cache_alloc() into something like
> =

>         return alloc_pages_node(cpu_to_node(raw_smp_processor_id())), gfp=
, 0);

That would break mempolicies AFAICS. Anyway, I might be missing
something (the mempolicy kod has a strange sense for aesthetic) but the
normal case without any explicit mempolicy should use default_policy
which is MPOL_PREFERRED and MPOL_F_LOCAL which means numa_node_id() so
the local node. So the above two should do the same thing unless I have
missing something.
-- =

Michal Hocko
SUSE Labs

--===============3342054054972907480==--

