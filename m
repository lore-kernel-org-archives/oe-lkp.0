Content-Type: multipart/mixed; boundary="===============8603731154641267863=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [cpuidle] 259231a045: will-it-scale.per_process_ops -12.6% regression
Date: Fri, 03 Jan 2020 02:34:39 +0000
Message-ID: <20200103023117.GA1313@shbuild999.sh.intel.com>
In-Reply-To: <20191231055923.GA70013@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8603731154641267863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2019 at 01:59:23PM +0800, Feng Tang wrote:
> Hi Marcelo,
> =

> On Wed, Sep 18, 2019 at 10:13:34AM +0800, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed a -12.6% regression of will-it-scale.per_process_ops du=
e to commit:
> > =

> > =

> > commit: 259231a045616c4101d023a8f4dcc8379af265a6 ("cpuidle: add poll_li=
mit_ns to cpuidle_device structure")
> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
> =

> Any comments on this? We re-run the test for 5.5-rc1, and the regression =
remains.

Anyway, I found commit 259231a04 lost one "break" when moving
the original code, thus the semantics is changed to the last
enabled state's target_residency instead of the first enabled
one's.

I don't know if it's intentional, and I guess no, so here =

is a fix patch, please review, thanks

But even with this patch, the regression is still not recovered.

- Feng

>From cddd6b409e18ce97a8d7b851db4400396f71d857 Mon Sep 17 00:00:00 2001
From: Feng Tang <feng.tang@intel.com>
Date: Thu, 2 Jan 2020 16:58:31 +0800
Subject: [PATCH] cpuidle: Add back the lost break in cpuidle_poll_time

Commit c4cbb8b649b5 move the poll time calculation into a
new function cpuidle_poll_time(), during which one "break"
get lost, and the semantic is changed from the last enabled
state's target_residency instead of the first enabled one's.

So add it back.

Fixes: c4cbb8b649b5 "cpuidle: add poll_limit_ns to cpuidle_device structure"
Signed-off-by: Feng Tang <feng.tang@intel.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
---
 drivers/cpuidle/cpuidle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
index 0895b98..29d2d7a 100644
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -384,6 +384,7 @@ u64 cpuidle_poll_time(struct cpuidle_driver *drv,
 			continue;
 =

 		limit_ns =3D (u64)drv->states[i].target_residency * NSEC_PER_USEC;
+		break;
 	}
 =

 	dev->poll_limit_ns =3D limit_ns;
-- =

2.7.4

> =

> Thanks,
> Feng
> =

> > =

> > in testcase: will-it-scale
> > on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz w=
ith 80G memory
> > with following parameters:
> > =

> > 	nr_task: 100%
> > 	mode: process
> > 	test: mmap1
> > 	cpufreq_governor: performance
> > =

> > test-description: Will It Scale takes a testcase and runs it from 1 thr=
ough to n parallel copies to see if the testcase will scale. It builds both=
 a process and threads based test in order to see any differences between t=
he two.
> > test-url: https://github.com/antonblanchard/will-it-scale
> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > =

> > =

> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->
> > =

> > =

> > To reproduce:
> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp install job.yaml  # job file is attached in this email
> >         bin/lkp run     job.yaml
> > =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/t=
estcase:
> >   gcc-7/performance/x86_64-rhel-7.6/process/100%/debian-x86_64-2019-05-=
14.cgz/lkp-knm01/mmap1/will-it-scale
> > =

> > commit: =

> >   fa86ee90eb ("add cpuidle-haltpoll driver")
> >   259231a045 ("cpuidle: add poll_limit_ns to cpuidle_device structure")
> > =

> > fa86ee90eb111126 259231a045616c4101d023a8f4d =

> > ---------------- --------------------------- =

> >        fail:runs  %reproduction    fail:runs
> >            |             |             |    =

> >            :4           25%           1:4     dmesg.WARNING:at#for_ip_s=
wapgs_restore_regs_and_return_to_usermode/0x
> >          %stddev     %change         %stddev
> >              \          |                \  =

> >       1611           -12.6%       1408        will-it-scale.per_process=
_ops
> >     464144           -12.6%     405580        will-it-scale.workload
> >       1581 =C2=B1  2%      +3.3%       1633        vmstat.system.cs
--===============8603731154641267863==--

