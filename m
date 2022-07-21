Content-Type: multipart/mixed; boundary="===============8207399932043852442=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 016a23388c: stress-ng.xattr.ops_per_sec 58.4% improvement
Date: Fri, 22 Jul 2022 08:01:42 +1000
Message-ID: <20220721220142.GW3861211@dread.disaster.area>
In-Reply-To: <Yti6PccitrglBtIj@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8207399932043852442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 10:30:21AM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a 58.4% improvement of stress-ng.xattr.ops_per_sec due to=
 commit:
> =

> =

> commit: 016a23388cdcb2740deb1379dc408f21c84efb11 ("xfs: Add order IDs to =
log items in CIL")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: stress-ng
> on test machine: 96 threads 2 sockets Ice Lake with 256G memory
> with following parameters:
> =

> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 60s
> 	fs: xfs
> 	class: filesystem
> 	test: xattr
> 	cpufreq_governor: performance
> 	ucode: 0xb000280
> =

> =

> =

> =

> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/test/testcase/testtime/ucode:
>   filesystem/gcc-11/performance/1HDD/xfs/x86_64-rhel-8.3/10%/debian-11.1-=
x86_64-20220510.cgz/lkp-icl-2sp1/xattr/stress-ng/60s/0xb000280
> =

> commit: =

>   df7a4a2134 ("xfs: convert CIL busy extents to per-cpu")
>   016a23388c ("xfs: Add order IDs to log items in CIL")

This bisect looks like it's identified the wrong commit. The reason
things went faster was:

> df7a4a2134b0a201 016a23388cdcb2740deb1379dc4 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

.....
>      25.64 =C2=B1  8%     -25.6        0.00        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.xlog_cil_insert_=
items.xlog_cil_commit.__xfs_trans_commit

A huge amount of spinlock contention in the xlog_commit_cil() path
went away. The commit identified doesn't remove/change any
spinlocks, it actually adds more overhead to the critical section of
the above spinlock in preparation for removing said spinlocks.

That removal happens in the next commit in that series - c0fb4765c508 ("xfs:
convert CIL to unordered per cpu lists") - so I'd be expecting a
bisect to demonstrate that the spinlock contention goes away with
the commit that removed the spinlocks (as it does in all the testing
of this I've done over the past 2 years), not the commit this bisect
identified. Hence I think the bisect went wrong somewhere...

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============8207399932043852442==--

