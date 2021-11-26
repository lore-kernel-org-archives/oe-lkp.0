Content-Type: multipart/mixed; boundary="===============8941740757506124571=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [memcg, kmem] 58056f7750: hackbench.throughput 10.3% improvement
Date: Fri, 26 Nov 2021 09:12:56 +0100
Message-ID: <YaCXCJc4TD5YpDXX@dhcp22.suse.cz>
In-Reply-To: <20211126031748.GA11450@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8941740757506124571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 26-11-21 11:17:48, Oliver Sang wrote:
> Hi Michal Hocko,
> =

> On Wed, Nov 24, 2021 at 06:01:12PM +0100, Michal Hocko wrote:
> > On Wed 24-11-21 16:34:35, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a 10.3% improvement of hackbench.throughput due to co=
mmit:
> > > =

> > > =

> > > commit: 58056f77502f3567b760c9a8fc8d2e9081515b2d ("memcg, kmem: furth=
er deprecate kmem.limit_in_bytes")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > I am really surprised to see an improvement from this patch. I do not
> > expect your benchmarking would be using kmem limit. The above patch
> > hasn't really removed the page counter out of the picture so there
> > shouldn't be any real reason for performance improvement. I strongly
> > suspect this is just some benchmark artifact or unreliable evaluation.
> =

> Fengwei Yin helped further analyze this improvement.
> =

> The patch changed the behavior of function obj_cgroup_charge_pages. It's =
shown
> in the perf-callstack as following line:
> =

>    5.63 =C2=B1 11%      -5.6        0.00        perf-profile.calltrace.cy=
cles-pp.page_counter_try_charge.obj_cgroup_charge_pages.obj_cgroup_charge.k=
mem_cache_alloc_node.__alloc_skb
> =

> So Fengwei prepared a patch which reverting the changes in
> obj_cgroup_charge_pages in 58056f7750 (as attached mod.patch)
> =

> by this patch, the performance is similar to 16f6bf266c, the improvement
> disappear.

I am still quite surprised and do not understand it. The only practical
difference the said commit has done is
s(a)page_counter_try_charge@page_counter_charge@

Withtout a limit in place the try_charge always succeeds. There
should be only a single if (new > c->max) branch executed and always
false.
The code is also slightly larger but all that sounds like to little to
make such a larger change. Maybe this is some microarchitecture specific
result. Or can you reproduce on other HW as well.

-- =

Michal Hocko
SUSE Labs
--===============8941740757506124571==--

