Content-Type: multipart/mixed; boundary="===============3990072776105186048=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Fri, 24 Jun 2022 14:43:58 +0000
Message-ID: <20220624144358.lqt2ffjdry6p5u4d@google.com>
In-Reply-To: <20220624070656.GE79500@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3990072776105186048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2022 at 03:06:56PM +0800, Feng Tang wrote:
> On Thu, Jun 23, 2022 at 11:34:15PM -0700, Shakeel Butt wrote:
[...]
> > =

> > Feng, can you please explain the memcg setup on these test machines
> > and if the tests are run in root or non-root memcg?
> =

> I don't know the exact setup, Philip/Oliver from 0Day can correct me.
> =

> I logged into a test box which runs netperf test, and it seems to be
> cgoup v1 and non-root memcg. The netperf tasks all sit in dir:
> '/sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service'
> =


Thanks Feng. Can you check the value of memory.kmem.tcp.max_usage_in_bytes
in /sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service after making
sure that the netperf test has already run?

If this is non-zero then network memory accounting is enabled and the
slowdown is expected.

> And the rootfs is a debian based rootfs
> =

> Thanks,
> Feng
> =

> =

> > thanks,
> > Shakeel
--===============3990072776105186048==--

