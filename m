Content-Type: multipart/mixed; boundary="===============3663572193170501239=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [memcg, kmem] 58056f7750: hackbench.throughput 10.3% improvement
Date: Wed, 24 Nov 2021 18:01:12 +0100
Message-ID: <YZ5v2LZlpzHieq/+@dhcp22.suse.cz>
In-Reply-To: <20211124083435.GB18309@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3663572193170501239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 24-11-21 16:34:35, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a 10.3% improvement of hackbench.throughput due to commit:
> =

> =

> commit: 58056f77502f3567b760c9a8fc8d2e9081515b2d ("memcg, kmem: further d=
eprecate kmem.limit_in_bytes")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

I am really surprised to see an improvement from this patch. I do not
expect your benchmarking would be using kmem limit. The above patch
hasn't really removed the page counter out of the picture so there
shouldn't be any real reason for performance improvement. I strongly
suspect this is just some benchmark artifact or unreliable evaluation.
-- =

Michal Hocko
SUSE Labs
--===============3663572193170501239==--

