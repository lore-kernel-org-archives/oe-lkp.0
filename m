Content-Type: multipart/mixed; boundary="===============7893649404728511389=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [rcuperf] 4e88ec4a9e: UBSAN:division-overflow_in_arch/x86/include/asm/div64.h
Date: Mon, 31 Aug 2020 08:50:37 -0700
Message-ID: <20200831155037.GZ2855@paulmck-ThinkPad-P72>
In-Reply-To: <20200831120122.GH4299@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7893649404728511389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 08:01:22PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 4e88ec4a9eb17527e640b063f79e5b875733eb53 ("rcuperf: Change rcuper=
f to rcuscale")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------------------+------------+-=
-----------+
> |                                                         | 65bd77f554 | =
4e88ec4a9e |
> +---------------------------------------------------------+------------+-=
-----------+
> | boot_successes                                          | 13         | =
0          |
> | boot_failures                                           | 0          | =
14         |
> | UBSAN:division-overflow_in_arch/x86/include/asm/div64.h | 0          | =
14         |
> | error:#[##]                                             | 0          | =
14         |
> | EIP:main_func.cold                                      | 0          | =
14         |
> | Kernel_panic-not_syncing:Fatal_exception                | 0          | =
14         |
> +---------------------------------------------------------+------------+-=
-----------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>

Does the patch below fix this for you?

							Thanx, Paul

------------------------------------------------------------------------

commit d301e320e952e2e604d83d9540e52510b0eb3d94
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Thu Aug 27 09:58:19 2020 -0700

    refscale: Bounds-check module parameters
    =

    The default value for refscale.nreaders is -1, which results in the code
    setting the value to three-quarters of the number of CPUs.  On single-C=
PU
    systems, this results in three-quarters of the value one, which the C
    language's integer arithmetic rounds to zero.  This in turn results in
    a divide-by-zero error.
    =

    This commit therefore adds bounds checking to the refscale module
    parameters, so that if they are less than one, they are set to the
    value one.
    =

    Reported-by: kernel test robot <lkp@intel.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/refscale.c b/kernel/rcu/refscale.c
index 952595c..fb5f20d 100644
--- a/kernel/rcu/refscale.c
+++ b/kernel/rcu/refscale.c
@@ -681,6 +681,12 @@ ref_scale_init(void)
 	// Reader tasks (default to ~75% of online CPUs).
 	if (nreaders < 0)
 		nreaders =3D (num_online_cpus() >> 1) + (num_online_cpus() >> 2);
+	if (WARN_ONCE(loops <=3D 0, "%s: loops =3D %ld, adjusted to 1\n", __func_=
_, loops))
+		loops =3D 1;
+	if (WARN_ONCE(nreaders <=3D 0, "%s: nreaders =3D %d, adjusted to 1\n", __=
func__, nreaders))
+		nreaders =3D 1;
+	if (WARN_ONCE(nruns <=3D 0, "%s: nruns =3D %d, adjusted to 1\n", __func__=
, nruns))
+		nruns =3D 1;
 	reader_tasks =3D kcalloc(nreaders, sizeof(reader_tasks[0]),
 			       GFP_KERNEL);
 	if (!reader_tasks) {
--===============7893649404728511389==--

