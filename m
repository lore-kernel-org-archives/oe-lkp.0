Content-Type: multipart/mixed; boundary="===============2317402912589362322=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/3] mm: page_counter: remove unneeded atomic ops for low/min
Date: Mon, 22 Aug 2022 11:55:33 +0200
Message-ID: <YwNSlZFPMgclrSCz@dhcp22.suse.cz>
In-Reply-To: <20220822001737.4120417-2-shakeelb@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2317402912589362322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 22-08-22 00:17:35, Shakeel Butt wrote:
> For cgroups using low or min protections, the function
> propagate_protected_usage() was doing an atomic xchg() operation
> irrespectively. It only needs to do that operation if the new value of
> protection is different from older one. This patch does that.

This doesn't really explain why.

> To evaluate the impact of this optimization, on a 72 CPUs machine, we
> ran the following workload in a three level of cgroup hierarchy with top
> level having min and low setup appropriately. More specifically
> memory.min equal to size of netperf binary and memory.low double of
> that.

I have hard time to really grasp what is the actual setup and why it
matters and why the patch makes any difference. Please elaborate some
more here.

>  $ netserver -6
>  # 36 instances of netperf with following params
>  $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K
> =

> Results (average throughput of netperf):
> Without (6.0-rc1)	10482.7 Mbps
> With patch		14542.5 Mbps (38.7% improvement)
> =

> With the patch, the throughput improved by 38.7%
> =

> Signed-off-by: Shakeel Butt <shakeelb@google.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> ---
>  mm/page_counter.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> =

> diff --git a/mm/page_counter.c b/mm/page_counter.c
> index eb156ff5d603..47711aa28161 100644
> --- a/mm/page_counter.c
> +++ b/mm/page_counter.c
> @@ -17,24 +17,23 @@ static void propagate_protected_usage(struct page_cou=
nter *c,
>  				      unsigned long usage)
>  {
>  	unsigned long protected, old_protected;
> -	unsigned long low, min;
>  	long delta;
>  =

>  	if (!c->parent)
>  		return;
>  =

> -	min =3D READ_ONCE(c->min);
> -	if (min || atomic_long_read(&c->min_usage)) {
> -		protected =3D min(usage, min);
> +	protected =3D min(usage, READ_ONCE(c->min));
> +	old_protected =3D atomic_long_read(&c->min_usage);
> +	if (protected !=3D old_protected) {

I have to cache that code back into brain. It is really subtle thing and
it is not really obvious why this is still correct. I will think about
that some more but the changelog could help with that a lot.

-- =

Michal Hocko
SUSE Labs
--===============2317402912589362322==--

