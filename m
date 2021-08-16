Content-Type: multipart/mixed; boundary="===============5104049090172906666=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Mon, 16 Aug 2021 17:41:57 -0400
Message-ID: <YRrbpRsvdDoom9iG@cmpxchg.org>
In-Reply-To: <20210816032855.GB72770@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5104049090172906666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 11:28:55AM +0800, Feng Tang wrote:
> On Thu, Aug 12, 2021 at 11:19:10AM +0800, Feng Tang wrote:
> > On Tue, Aug 10, 2021 at 07:59:53PM -1000, Linus Torvalds wrote:
> [SNIP]
> =

> > And seems there is some cache false sharing when accessing mem_cgroup
> > member: 'struct cgroup_subsys_state', from the offset (0x0 and 0x10 her=
e)
> > and the calling sites, the cache false sharing could happen between:
> > =

> >     cgroup_rstat_updated (read memcg->css.cgroup, offset 0x0)
> > and =

> >     get_mem_cgroup_from_mm
> > 	css_tryget(&memcg->css) (read/write memcg->css.refcnt, offset 0x10)
> > =

> > (This could be wrong as many of the functions are inlined, and the
> > exact calling site isn't shown)

Thanks for digging more into this.

The offset 0x0 access is new in the page instantiation path with the
bisected patch, so that part makes sense. The new sequence is this:

	shmem_add_to_page_cache()
	  mem_cgroup_charge()
	    get_mem_cgroup_from_mm()
	      css_tryget()			# touches memcg->css.refcnt
	  xas_store()
	  __mod_lruvec_page_state()
	    __mod_lruvec_state()
	      __mod_memcg_lruvec_state()
	        __mod_memcg_state()
	          __this_cpu_add()
	          cgroup_rstat_updated()	# touches memcg->css.cgroup

whereas before, __mod_memcg_state() would just do stuff inside memcg.

However, css.refcnt is a percpu-refcount. We should see a read-only
lookup of the base pointer inside this cacheline, with the write
occuring in percpu memory elsewhere. Even if it were in atomic/shared
mode, which it shouldn't be for the root cgroup, the shared atomic_t
is also located in an auxiliary allocation and shouldn't overlap with
the cgroup pointer in any way.

The css itself is embedded inside struct mem_cgroup, which does see
modifications. But the closest of those is 3 cachelines down (struct
page_counter memory), so that doesn't make sense, either.

Does this theory require writes? Because I don't actually see any (hot
ones, anyway) inside struct cgroup_subsys_state for this workload.

> > And to verify this, we did a test by adding padding between
> > memcg->css.cgroup and memcg->css.refcnt to push them into 2
> > different cache lines, and the performance are partly restored:
> > =

> > dc26532aed0ab25c 2d146aa3aa842d7f5065802556b 73371bf27a8a8ea68df2fbf456=
b =

> > ---------------- --------------------------- --------------------------=
- =

> >   65523232 =C2=B1  4%     -40.8%   38817332 =C2=B1  5%     -19.6%   527=
01654 =C2=B1  3%  vm-scalability.throughput
> >
> > We are still checking more, and will update if there is new data. =

> =

> Seems this is the second case to hit 'adjacent cacheline prefetch",
> the first time we saw it is also related with mem_cgroup
> https://lore.kernel.org/lkml/20201125062445.GA51005(a)shbuild999.sh.intel=
.com/
> =

> In previous debug patch, the 'css.cgroup' and 'css.refcnt' is
> separated to 2 cache lines, which are still adjacent (2N and 2N+1)
> cachelines. And with more padding (add 128 bytes padding in between),
> the performance is restored, and even better (test run 3 times):
> =

> dc26532aed0ab25c 2d146aa3aa842d7f5065802556b 2e34d6daf5fbab0fb286dcdb3bc =

> ---------------- --------------------------- --------------------------- =

>   65523232 =C2=B1  4%     -40.8%   38817332 =C2=B1  5%     +23.4%   80862=
243 =C2=B1  3%  vm-scalability.throughput
> =

> The debug patch is:
> --- a/include/linux/cgroup-defs.h
> +++ b/include/linux/cgroup-defs.h
> @@ -142,6 +142,8 @@ struct cgroup_subsys_state {
>  	/* PI: the cgroup subsystem that this css is attached to */
>  	struct cgroup_subsys *ss;
>  =

> +	unsigned long pad[16];
> +
>  	/* reference count - access via css_[try]get() and css_put() */
>  	struct percpu_ref refcnt;

We aren't particularly space-constrained in this structure, so padding
should generally be acceptable here.
--===============5104049090172906666==--

