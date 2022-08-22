Content-Type: multipart/mixed; boundary="===============7889750141416830183=="
MIME-Version: 1.0
From: Soheil Hassas Yeganeh <soheil@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/3] mm: page_counter: remove unneeded atomic ops for low/min
Date: Sun, 21 Aug 2022 20:20:14 -0400
Message-ID: <CACSApvbSnCN8Fy1E3KyhkBDF=_h4vg==eoJGzM1Njf0ArX+zcg@mail.gmail.com>
In-Reply-To: <20220822001737.4120417-2-shakeelb@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7889750141416830183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 21, 2022 at 8:17 PM Shakeel Butt <shakeelb@google.com> wrote:
>
> For cgroups using low or min protections, the function
> propagate_protected_usage() was doing an atomic xchg() operation
> irrespectively. It only needs to do that operation if the new value of
> protection is different from older one. This patch does that.
>
> To evaluate the impact of this optimization, on a 72 CPUs machine, we
> ran the following workload in a three level of cgroup hierarchy with top
> level having min and low setup appropriately. More specifically
> memory.min equal to size of netperf binary and memory.low double of
> that.
>
>  $ netserver -6
>  # 36 instances of netperf with following params
>  $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K
>
> Results (average throughput of netperf):
> Without (6.0-rc1)       10482.7 Mbps
> With patch              14542.5 Mbps (38.7% improvement)
>
> With the patch, the throughput improved by 38.7%
>
> Signed-off-by: Shakeel Butt <shakeelb@google.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>

Nice speed up!

Acked-by: Soheil Hassas Yeganeh <soheil@google.com>

> ---
>  mm/page_counter.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/mm/page_counter.c b/mm/page_counter.c
> index eb156ff5d603..47711aa28161 100644
> --- a/mm/page_counter.c
> +++ b/mm/page_counter.c
> @@ -17,24 +17,23 @@ static void propagate_protected_usage(struct page_cou=
nter *c,
>                                       unsigned long usage)
>  {
>         unsigned long protected, old_protected;
> -       unsigned long low, min;
>         long delta;
>
>         if (!c->parent)
>                 return;
>
> -       min =3D READ_ONCE(c->min);
> -       if (min || atomic_long_read(&c->min_usage)) {
> -               protected =3D min(usage, min);
> +       protected =3D min(usage, READ_ONCE(c->min));
> +       old_protected =3D atomic_long_read(&c->min_usage);
> +       if (protected !=3D old_protected) {
>                 old_protected =3D atomic_long_xchg(&c->min_usage, protect=
ed);
>                 delta =3D protected - old_protected;
>                 if (delta)
>                         atomic_long_add(delta, &c->parent->children_min_u=
sage);
>         }
>
> -       low =3D READ_ONCE(c->low);
> -       if (low || atomic_long_read(&c->low_usage)) {
> -               protected =3D min(usage, low);
> +       protected =3D min(usage, READ_ONCE(c->low));
> +       old_protected =3D atomic_long_read(&c->low_usage);
> +       if (protected !=3D old_protected) {
>                 old_protected =3D atomic_long_xchg(&c->low_usage, protect=
ed);
>                 delta =3D protected - old_protected;
>                 if (delta)
> --
> 2.37.1.595.g718a3a8f04-goog
>
--===============7889750141416830183==--

