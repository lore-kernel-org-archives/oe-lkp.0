Content-Type: multipart/mixed; boundary="===============6564516889378406620=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Mon, 27 Jun 2022 10:38:12 +0800
Message-ID: <20220627023812.GA29314@shbuild999.sh.intel.com>
In-Reply-To: <20220625023642.GA40868@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6564516889378406620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 25, 2022 at 10:36:42AM +0800, Feng Tang wrote:
> On Fri, Jun 24, 2022 at 02:43:58PM +0000, Shakeel Butt wrote:
> > On Fri, Jun 24, 2022 at 03:06:56PM +0800, Feng Tang wrote:
> > > On Thu, Jun 23, 2022 at 11:34:15PM -0700, Shakeel Butt wrote:
> > [...]
> > > > =

> > > > Feng, can you please explain the memcg setup on these test machines
> > > > and if the tests are run in root or non-root memcg?
> > > =

> > > I don't know the exact setup, Philip/Oliver from 0Day can correct me.
> > > =

> > > I logged into a test box which runs netperf test, and it seems to be
> > > cgoup v1 and non-root memcg. The netperf tasks all sit in dir:
> > > '/sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service'
> > > =

> > =

> > Thanks Feng. Can you check the value of memory.kmem.tcp.max_usage_in_by=
tes
> > in /sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service after making
> > sure that the netperf test has already run?
> =

> memory.kmem.tcp.max_usage_in_bytes:0
 =

Sorry, I made a mistake that in the original report from Oliver, it
was 'cgroup v2' with a 'debian-11.1' rootfs. =


When you asked about cgroup info, I tried the job on another tbox, and
the original 'job.yaml' didn't work, so I kept the 'netperf' test
parameters and started a new job which somehow run with a 'debian-10.4'
rootfs and acutally run with cgroup v1. =


And as you mentioned cgroup version does make a big difference, that
with v1, the regression is reduced to 1% ~ 5% on different generations
of test platforms. Eric mentioned they also got regression report,
but much smaller one, maybe it's due to the cgroup version?

Thanks,
Feng

> And here is more memcg stats (let me know if you want to check more)
> =

> > If this is non-zero then network memory accounting is enabled and the
> > slowdown is expected.
> =

> >From the perf-profile data in original report, both
> __sk_mem_raise_allocated() and __sk_mem_reduce_allocated() are called
> much more often, which call memcg charge/uncharge functions.
> =

> IIUC, the call chain is:
> =

> __sk_mem_raise_allocated
>     sk_memory_allocated_add
>     mem_cgroup_charge_skmem
>         charge memcg->tcpmem (for cgroup v2)
> 	try_charge memcg (for v1)
> =

> Also from Eric's one earlier commit log:
> =

> "
> net: implement per-cpu reserves for memory_allocated
> ...
> This means we are going to call sk_memory_allocated_add()
> and sk_memory_allocated_sub() more often.
> ...
> "
> =

> So this slowdown is related to the more calling of charge/uncharge? =

> =

> Thanks,
> Feng
> =

> > > And the rootfs is a debian based rootfs
> > > =

> > > Thanks,
> > > Feng
> > > =

> > > =

> > > > thanks,
> > > > Shakeel
--===============6564516889378406620==--

