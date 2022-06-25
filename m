Content-Type: multipart/mixed; boundary="===============1623318974673760971=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Sat, 25 Jun 2022 10:36:42 +0800
Message-ID: <20220625023642.GA40868@shbuild999.sh.intel.com>
In-Reply-To: <20220624144358.lqt2ffjdry6p5u4d@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1623318974673760971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2022 at 02:43:58PM +0000, Shakeel Butt wrote:
> On Fri, Jun 24, 2022 at 03:06:56PM +0800, Feng Tang wrote:
> > On Thu, Jun 23, 2022 at 11:34:15PM -0700, Shakeel Butt wrote:
> [...]
> > > =

> > > Feng, can you please explain the memcg setup on these test machines
> > > and if the tests are run in root or non-root memcg?
> > =

> > I don't know the exact setup, Philip/Oliver from 0Day can correct me.
> > =

> > I logged into a test box which runs netperf test, and it seems to be
> > cgoup v1 and non-root memcg. The netperf tasks all sit in dir:
> > '/sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service'
> > =

> =

> Thanks Feng. Can you check the value of memory.kmem.tcp.max_usage_in_bytes
> in /sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service after making
> sure that the netperf test has already run?

memory.kmem.tcp.max_usage_in_bytes:0

And here is more memcg stats (let me know if you want to check more)

/sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service# grep . memory.*
memory.failcnt:0
memory.kmem.failcnt:0
memory.kmem.limit_in_bytes:9223372036854771712
memory.kmem.max_usage_in_bytes:47861760
memory.kmem.tcp.failcnt:0
memory.kmem.tcp.limit_in_bytes:9223372036854771712
memory.kmem.tcp.max_usage_in_bytes:0
memory.kmem.tcp.usage_in_bytes:0
memory.kmem.usage_in_bytes:40730624
memory.limit_in_bytes:9223372036854771712
memory.max_usage_in_bytes:642424832
memory.memsw.failcnt:0
memory.memsw.limit_in_bytes:9223372036854771712
memory.memsw.max_usage_in_bytes:642424832
memory.memsw.usage_in_bytes:639549440
memory.move_charge_at_immigrate:0
memory.numa_stat:total=3D144073 N0=3D124819 N1=3D19254
memory.numa_stat:file=3D0 N0=3D0 N1=3D0
memory.numa_stat:anon=3D77721 N0=3D58502 N1=3D19219
memory.numa_stat:unevictable=3D66352 N0=3D66317 N1=3D35
memory.numa_stat:hierarchical_total=3D144073 N0=3D124819 N1=3D19254
memory.numa_stat:hierarchical_file=3D0 N0=3D0 N1=3D0
memory.numa_stat:hierarchical_anon=3D77721 N0=3D58502 N1=3D19219
memory.numa_stat:hierarchical_unevictable=3D66352 N0=3D66317 N1=3D35
memory.oom_control:oom_kill_disable 0
memory.oom_control:under_oom 0
memory.oom_control:oom_kill 0
grep: memory.pressure_level: Invalid argument
memory.soft_limit_in_bytes:9223372036854771712
memory.stat:cache 282562560
memory.stat:rss 307884032
memory.stat:rss_huge 239075328
memory.stat:shmem 10784768
memory.stat:mapped_file 3444736
memory.stat:dirty 0
memory.stat:writeback 0
memory.stat:swap 0
memory.stat:pgpgin 1018918
memory.stat:pgpgout 932902
memory.stat:pgfault 2130513
memory.stat:pgmajfault 0
memory.stat:inactive_anon 310272000
memory.stat:active_anon 8073216
memory.stat:inactive_file 0
memory.stat:active_file 0
memory.stat:unevictable 271777792
memory.stat:hierarchical_memory_limit 9223372036854771712
memory.stat:hierarchical_memsw_limit 9223372036854771712
memory.stat:total_cache 282562560
memory.stat:total_rss 307884032
memory.stat:total_rss_huge 239075328
memory.stat:total_shmem 10784768
memory.stat:total_mapped_file 3444736
memory.stat:total_dirty 0
memory.stat:total_writeback 0
memory.stat:total_swap 0
memory.stat:total_pgpgin 1018918
memory.stat:total_pgpgout 932902
memory.stat:total_pgfault 2130513
memory.stat:total_pgmajfault 0
memory.stat:total_inactive_anon 310272000
memory.stat:total_active_anon 8073216
memory.stat:total_inactive_file 0
memory.stat:total_active_file 0
memory.stat:total_unevictable 271777792
memory.swappiness:60
memory.usage_in_bytes:639549440
memory.use_hierarchy:1

> If this is non-zero then network memory accounting is enabled and the
> slowdown is expected.

>From the perf-profile data in original report, both
__sk_mem_raise_allocated() and __sk_mem_reduce_allocated() are called
much more often, which call memcg charge/uncharge functions.

IIUC, the call chain is:

__sk_mem_raise_allocated
    sk_memory_allocated_add
    mem_cgroup_charge_skmem
        charge memcg->tcpmem (for cgroup v2)
	try_charge memcg (for v1)

Also from Eric's one earlier commit log:

"
net: implement per-cpu reserves for memory_allocated
...
This means we are going to call sk_memory_allocated_add()
and sk_memory_allocated_sub() more often.
...
"

So this slowdown is related to the more calling of charge/uncharge? =


Thanks,
Feng

> > And the rootfs is a debian based rootfs
> > =

> > Thanks,
> > Feng
> > =

> > =

> > > thanks,
> > > Shakeel
--===============1623318974673760971==--

