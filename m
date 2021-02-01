Content-Type: multipart/mixed; boundary="===============0995017787691564057=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/topology] 620a6dc407: BUG:KASAN:slab-out-of-bounds_in_build_sched_domains
Date: Mon, 01 Feb 2021 12:13:53 +0100
Message-ID: <c6f8afcb-398d-84df-b998-142048cdec00@arm.com>
In-Reply-To: <20210201074908.GF12524@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0995017787691564057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/02/2021 08:49, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 620a6dc40754dc218f5b6389b5d335e9a107fd29 ("sched/topology: Make s=
ched_init_numa() use a set for the deduplicating sort")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
>

We also saw an issue with this patch during sched domain build which got
fixed by:

https://lkml.kernel.org/r/6000e39e-7d28-c360-9cd6-8798fd22a9bf(a)arm.com
--===============0995017787691564057==--

