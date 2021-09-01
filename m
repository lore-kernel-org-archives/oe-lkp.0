Content-Type: multipart/mixed; boundary="===============0914283278947847930=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Wed, 01 Sep 2021 12:50:32 +0800
Message-ID: <20210901045032.GA21937@shbuild999.sh.intel.com>
In-Reply-To: <20210831092304.GA17119@blackbody.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0914283278947847930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 11:23:04AM +0200, Michal Koutn?? wrote:
> On Tue, Aug 31, 2021 at 02:30:36PM +0800, Feng Tang <feng.tang@intel.co=
m> wrote:
> > Yes, I tried many re-arrangement of the members of cgroup_subsys_state,
> > and even close members of memcg, but there were no obvious changes.
> > What can recover the regresion is adding 128 bytes padding in the css,
> > no matter at the start, end or in the middle.
> =

> Do you mean the padding added outside the .cgroup--.refcnt members area
> also restores the benchmark results? (Or you refer to paddings that move
> .cgroup and .refcnt across a cacheline border ?) I'm asking to be sure
> we have correct understanding of what members are contended (what's the
> frequent writer).

Yes, the tests I did is no matter where the 128B padding is added, the
performance can be restored and even improved.

struct cgroup_subsys_state {
				   <----------------- padding
	struct cgroup *cgroup;
	struct cgroup_subsys *ss;
				   <----------------- padding
	struct percpu_ref refcnt;
	struct list_head sibling;
	struct list_head children;
	struct list_head rstat_css_node;
	int id;
	unsigned int flags;
	u64 serial_nr;
	atomic_t online_cnt;
	struct work_struct destroy_work;
	struct rcu_work destroy_rwork;
	struct cgroup_subsys_state *parent;
				   <----------------- padding
};

Other tries I did are moving the untouched members around,
to separate the serveral hottest members, but no much effect.

>From the data from perf-tool, 3 members are frequently accessed
(read actually): 'cgroup', 'refcnt', 'flags'

I also used 'perf mem' command tryint to catch read/write to
the css, and haven't found any _write_ operation, nor can the
code reading.

That led me to go check the "HW cache prefetcher", as in my
laste email. And all these test results make me think it's
data access pattern caused HW prefetcher related performance
change.

Thanks,
Feng


> Thanks,
> Michal
--===============0914283278947847930==--

