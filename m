Content-Type: multipart/mixed; boundary="===============1561918447249570427=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Mon, 27 Jun 2022 07:52:55 -0700
Message-ID: <CALvZod7i_=7bNZR-LAXBPXJFxj-1KBuYs+rmG0iABAE1T90BPg@mail.gmail.com>
In-Reply-To: <20220627123415.GA32052@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1561918447249570427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 5:34 AM Feng Tang <feng.tang@intel.com> wrote:
>
> On Mon, Jun 27, 2022 at 10:46:21AM +0200, Eric Dumazet wrote:
> > On Mon, Jun 27, 2022 at 4:38 AM Feng Tang <feng.tang@intel.com> wrote:
> [snip]
> > > > >
> > > > > Thanks Feng. Can you check the value of memory.kmem.tcp.max_usage=
_in_bytes
> > > > > in /sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service after=
 making
> > > > > sure that the netperf test has already run?
> > > >
> > > > memory.kmem.tcp.max_usage_in_bytes:0
> > >
> > > Sorry, I made a mistake that in the original report from Oliver, it
> > > was 'cgroup v2' with a 'debian-11.1' rootfs.
> > >
> > > When you asked about cgroup info, I tried the job on another tbox, and
> > > the original 'job.yaml' didn't work, so I kept the 'netperf' test
> > > parameters and started a new job which somehow run with a 'debian-10.=
4'
> > > rootfs and acutally run with cgroup v1.
> > >
> > > And as you mentioned cgroup version does make a big difference, that
> > > with v1, the regression is reduced to 1% ~ 5% on different generations
> > > of test platforms. Eric mentioned they also got regression report,
> > > but much smaller one, maybe it's due to the cgroup version?
> >
> > This was using the current net-next tree.
> > Used recipe was something like:
> >
> > Make sure cgroup2 is mounted or mount it by mount -t cgroup2 none $MOUN=
T_POINT.
> > Enable memory controller by echo +memory > $MOUNT_POINT/cgroup.subtree_=
control.
> > Create a cgroup by mkdir $MOUNT_POINT/job.
> > Jump into that cgroup by echo $$ > $MOUNT_POINT/job/cgroup.procs.
> >
> > <Launch tests>
> >
> > The regression was smaller than 1%, so considered noise compared to
> > the benefits of the bug fix.
>
> Yes, 1% is just around noise level for a microbenchmark.
>
> I went check the original test data of Oliver's report, the tests was
> run 6 rounds and the performance data is pretty stable (0Day's report
> will show any std deviation bigger than 2%)
>
> The test platform is a 4 sockets 72C/144T machine, and I run the
> same job (nr_tasks =3D 25% * nr_cpus) on one CascadeLake AP (4 nodes)
> and one Icelake 2 sockets platform, and saw 75% and 53% regresson on
> them.
>
> In the first email, there is a file named 'reproduce', it shows the
> basic test process:
>
> "
>   use 'performane' cpufre  governor for all CPUs
>
>   netserver -4 -D
>   modprobe sctp
>   netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
>   netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
>   netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
>   (repeat 36 times in total)
>   ...
>
> "
>
> Which starts 36 (25% of nr_cpus) netperf clients. And the clients number
> also matters, I tried to increase the client number from 36 to 72(50%),
> and the regression is changed from 69.4% to 73.7%
>

Am I understanding correctly that this 69.4% (or 73.7%) regression is
with cgroup v2?

Eric did the experiments on v2 but on real hardware where the
performance impact was negligible.

BTW do you see similar regression for tcp as well or just sctp?
--===============1561918447249570427==--

