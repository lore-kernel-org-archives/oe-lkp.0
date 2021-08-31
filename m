Content-Type: multipart/mixed; boundary="===============7790475807006527469=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Tue, 31 Aug 2021 14:30:36 +0800
Message-ID: <20210831063036.GA46357@shbuild999.sh.intel.com>
In-Reply-To: <YSzwWIeapkzNElwV@blackbook>
List-Id: <oe-lkp.lists.linux.dev>

--===============7790475807006527469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Mon, Aug 30, 2021 at 04:51:04PM +0200, Michal Koutn?? wrote:
> Hello Feng.
> =

> On Wed, Aug 18, 2021 at 10:30:04AM +0800, Feng Tang <feng.tang@intel.co=
m> wrote:
> > As Shakeel also mentioned, this 0day's vm-scalability doesn't involve
> > any explicit mem_cgroup configurations.
> =

> If it all happens inside root memcg, there should be no accesses to the
> 0x10 offset since the root memcg is excluded from refcounting. (Unless
> the modified cacheline is a =CE=BCarch artifact. Actually, for the lack of
> other ideas, I was thinking about similar cause even for non-root memcgs
> since the percpu refcounting is implemented via a segment register.)

Thought I haven't checked the exact memcg that the perf-c2c hot spots
pointed to, I don't think it's the root memcg. From debug, in the test
run, the OS has created about 50 memcgs before vm-scalability test run,
mostly by systemd-servces, and during the test there is no more new
memcg created.

> Is this still relevant? (You refer to it as 0day's vm-scalability
> issue.)
> =

> By some rough estimates there could be ~10 cgroup_subsys_sets per 10 MiB
> of workload, so the 128B padding gives 1e-4 relative overhead (but
> presumably less in most cases). I also think it acceptable (size-wise).
> =

> Out of curiosity, have you measured impact of reshuffling the refcnt
> member into the middle of the cgroup_subsys_state (keeping it distant
> both from .cgroup and .parent)?

Yes, I tried many re-arrangement of the members of cgroup_subsys_state,
and even close members of memcg, but there were no obvious changes.
What can recover the regresion is adding 128 bytes padding in the css,
no matter at the start, end or in the middle.


Some finding is, this could be related with HW cache prefetcher.

>From this article =

https://software.intel.com/content/www/us/en/develop/articles/disclosure-of=
-hw-prefetcher-control-on-some-intel-processors.html

There are four bits controlling different types of prefetcher, on the
testbox (CascadeLake AP platform), they are all enabled by default. =

When we disable the "L2 hardware prefetcher" (bit 0), the permance
for commit 2d146aa3aa8 is almost the same as its parent commit.

So it seems to be affected about HW cache prefechter's policy, the
test's access pattern changes the HW prefetcher policy, which in
turn affect the performance.

Also the test shows the regression is platform dependent, that regression
could be seen on Cascade Lake AP (36%) and SP (20%), but not on a
Icelake SP 2S platform.

Thanks,
Feng
--===============7790475807006527469==--

