Content-Type: multipart/mixed; boundary="===============5124831650229455090=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Mon, 27 Jun 2022 23:12:58 +0800
Message-ID: <20220627151258.GB20878@shbuild999.sh.intel.com>
In-Reply-To: <CALvZod7i_=7bNZR-LAXBPXJFxj-1KBuYs+rmG0iABAE1T90BPg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5124831650229455090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 07:52:55AM -0700, Shakeel Butt wrote:
> On Mon, Jun 27, 2022 at 5:34 AM Feng Tang <feng.tang@intel.com> wrote:
> > Yes, 1% is just around noise level for a microbenchmark.
> >
> > I went check the original test data of Oliver's report, the tests was
> > run 6 rounds and the performance data is pretty stable (0Day's report
> > will show any std deviation bigger than 2%)
> >
> > The test platform is a 4 sockets 72C/144T machine, and I run the
> > same job (nr_tasks =3D 25% * nr_cpus) on one CascadeLake AP (4 nodes)
> > and one Icelake 2 sockets platform, and saw 75% and 53% regresson on
> > them.
> >
> > In the first email, there is a file named 'reproduce', it shows the
> > basic test process:
> >
> > "
> >   use 'performane' cpufre  governor for all CPUs
> >
> >   netserver -4 -D
> >   modprobe sctp
> >   netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
> >   netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
> >   netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
> >   (repeat 36 times in total)
> >   ...
> >
> > "
> >
> > Which starts 36 (25% of nr_cpus) netperf clients. And the clients number
> > also matters, I tried to increase the client number from 36 to 72(50%),
> > and the regression is changed from 69.4% to 73.7%
> >
> =

> Am I understanding correctly that this 69.4% (or 73.7%) regression is
> with cgroup v2?

Yes.

> Eric did the experiments on v2 but on real hardware where the
> performance impact was negligible.
> =

> BTW do you see similar regression for tcp as well or just sctp?

Yes, I run TCP_SENDFILE case with 'send_size'=3D=3D10K, it hits a
70%+ regressioin. =


Thanks,
Feng
--===============5124831650229455090==--

