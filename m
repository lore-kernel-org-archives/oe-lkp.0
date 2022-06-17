Content-Type: multipart/mixed; boundary="===============0550445049516426980=="
MIME-Version: 1.0
From: Filipe Manana <fdmanana@kernel.org>
To: lkp@lists.01.org
Subject: Re: [btrfs] 62bd8124e2: WARNING:at_fs/btrfs/block-rsv.c:#btrfs_release_global_block_rsv[btrfs]
Date: Fri, 17 Jun 2022 11:32:44 +0100
Message-ID: <20220617103244.GA4042635@falcondesktop>
In-Reply-To: <20220616024204.GA25633@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0550445049516426980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2022 at 10:42:04AM +0800, Oliver Sang wrote:
> hi, Filipe Manana,
> =

> On Mon, Jun 13, 2022 at 11:50:05AM +0100, Filipe Manana wrote:
> > =

> > Thanks for running the test again Oliver.
> > Running the fxmark test on my machines, I can't trigger anything.
> > =

> > May I ask you to run again the test but with the attached debug patch
> > on top of it?
> =

> I reran the test by applied your patch upon 62bd8124e2. one dmesg is atta=
ched.
> =

> not sure if it supplies enough information? we need some extra effort to
> enable below ftrace in our auto-test framework. so if dmesg is good enoug=
h,
> please let us know, then we can save some efforts :) Thanks a lot!

Thanks Oliver.

In the meanwhile I found a way to reproduce the issue with a test case
from fstests, so I now have everything I need to debug and fix the issue.

Thanks!

> =

> > =

> > Also, if possible, with ftrace enabled like this:
> > =

> > modprobe btrfs
> > echo 0 > /sys/kernel/debug/tracing/tracing_on
> > echo > /sys/kernel/debug/tracing/trace
> > echo $((1 << 24)) > /sys/kernel/debug/tracing/buffer_size_kb
> > echo nop > /sys/kernel/debug/tracing/current_tracer
> > echo 1 > /sys/kernel/tracing/events/btrfs/btrfs_space_reservation/enable
> > =

> > echo 1 > /sys/kernel/debug/tracing/tracing_on
> > =

> > <run the test>
> > =

> > echo 0 > /sys/kernel/debug/tracing/tracing_on
> > =

> > Then collect the trace to a file and send it over to me:
> > =

> > cat /sys/kernel/debug/tracing/trace | xz -9 > trace.txt.xz
> > =

> > And of course, the dmesg result as well.
> > =

> > Thanks!
> > =

> > =

> > =

> > >
> > > >
> =



--===============0550445049516426980==--

