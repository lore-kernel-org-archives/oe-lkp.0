Content-Type: multipart/mixed; boundary="===============9214818190574306397=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] 9ddc8abf03: BUG:KASAN:null-ptr-deref_in_lockdep_init_map_type
Date: Mon, 08 Mar 2021 11:38:53 -0800
Message-ID: <YEZ9Tb4oJng85mH9@google.com>
In-Reply-To: <20210308152620.GE4324@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============9214818190574306397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 11:26:20PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 9ddc8abf031750362cda61a9fb8a28be8871eaae ("[PATCH v4] mm: cma: su=
pport sysfs")
> url: https://github.com/0day-ci/linux/commits/Minchan-Kim/mm-cma-support-=
sysfs/20210305-002050
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git f69=
d02e37a85645aa90d18cacfff36dba370f797
> =

> in testcase: trinity
> version: trinity-i386-4d2343bd-1_20200320
> with following parameters:
> =

> 	group: group-01
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
-+------------+------------+
> |                                                                        =
 | f69d02e37a | 9ddc8abf03 |
> +------------------------------------------------------------------------=
-+------------+------------+
> | BUG:KASAN:null-ptr-deref_in_lockdep_init_map_type                      =
 | 0          | 12         |
> | BUG:kernel_NULL_pointer_dereference,address                            =
 | 0          | 12         |
> | Oops:#[##]                                                             =
 | 0          | 12         |
> | RIP:lockdep_init_map_type                                              =
 | 0          | 12         |
> +------------------------------------------------------------------------=
-+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   16.842917] BUG: KASAN: null-ptr-deref in lockdep_init_map_type (kbuil=
d/src/consumer/kernel/locking/lockdep.c:4654) =

> [   16.844311] Write of size 8 at addr 0000000000000030 by task swapper/0=
/1
> [   16.844311]
> [   16.844311] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc1-00023=
-g9ddc8abf0317 #1
> [   16.844311] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [   16.844311] Call Trace:
> [   16.844311] dump_stack (kbuild/src/consumer/lib/dump_stack.c:122) =

> [   16.844311] ? lockdep_init_map_type (kbuild/src/consumer/kernel/lockin=
g/lockdep.c:4654) =

> [   16.844311] kasan_report.cold (kbuild/src/consumer/mm/kasan/report.c:4=
03 kbuild/src/consumer/mm/kasan/report.c:416) =

> [   16.844311] ? lockdep_init_map_type (kbuild/src/consumer/kernel/lockin=
g/lockdep.c:4654) =

> [   16.844311] lockdep_init_map_type (kbuild/src/consumer/kernel/locking/=
lockdep.c:4654) =

> [   16.844311] __raw_spin_lock_init (kbuild/src/consumer/kernel/locking/s=
pinlock_debug.c:26) =

> [   16.844311] cma_sysfs_init (kbuild/src/consumer/mm/cma_sysfs.c:91) =

> [   16.844311] ? cma_debugfs_init (kbuild/src/consumer/mm/cma_sysfs.c:74) =

> [   16.844311] do_one_initcall (kbuild/src/consumer/init/main.c:1226) =

> [   16.844311] ? perf_trace_initcall_level (kbuild/src/consumer/init/main=
.c:1217) =

> [   16.844311] ? rcu_read_lock_sched_held (kbuild/src/consumer/kernel/rcu=
/update.c:125) =

> [   16.844311] ? trace_event_raw_event_rcu_torture_read (kbuild/src/consu=
mer/kernel/rcu/update.c:120) =

> [   16.844311] ? write_comp_data (kbuild/src/consumer/kernel/kcov.c:218) =

> [   16.844311] ? __sanitizer_cov_trace_pc (kbuild/src/consumer/kernel/kco=
v.c:197) =

> [   16.844311] kernel_init_freeable (kbuild/src/consumer/init/main.c:1298=
 kbuild/src/consumer/init/main.c:1315 kbuild/src/consumer/init/main.c:1335 =
kbuild/src/consumer/init/main.c:1537) =

> [   16.844311] ? console_on_rootfs (kbuild/src/consumer/init/main.c:1503) =

> [   16.844311] ? tracer_hardirqs_on (kbuild/src/consumer/kernel/trace/tra=
ce_irqsoff.c:57 kbuild/src/consumer/kernel/trace/trace_irqsoff.c:610) =

> [   16.844311] ? mark_held_locks (kbuild/src/consumer/kernel/locking/lock=
dep.c:4067) =

> [   16.844311] ? rest_init (kbuild/src/consumer/init/main.c:1421) =

> [   16.844311] kernel_init (kbuild/src/consumer/init/main.c:1426) =

> [   16.844311] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry_64=
.S:300) =

> [   16.844311] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   16.844311] Disabling lock debugging due to kernel taint
> [   16.844425] BUG: kernel NULL pointer dereference, address: 00000000000=
00030
> [   16.845925] #PF: supervisor write access in kernel mode
> [   16.847149] #PF: error_code(0x0002) - not-present page
> [   16.848311] PGD 0 P4D 0
> [   16.848311] Oops: 0002 [#1] SMP KASAN PTI
> [   16.848311] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             =
5.12.0-rc1-00023-g9ddc8abf0317 #1


>From 758182a763fbc0fbd6b5e143ca64a4eb31d22a1a Mon Sep 17 00:00:00 2001
From: Minchan Kim <minchan@kernel.org>
Date: Mon, 8 Mar 2021 11:33:47 -0800
Subject: [PATCH] mm: cma: fix ZERO_SIZE_PTR check

If there is no cma instance, cma_area_count will be zero and
kmalloc_arrary will return ZERO_SITE_PTR instead of NULL.

Use ZERO_OR_NULL_PTR to check both cases.

Link: https://lore.kernel.org/linux-mm/20210308152620.GE4324(a)xsang-OptiPl=
ex-9020/
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 mm/cma_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/cma_sysfs.c b/mm/cma_sysfs.c
index 67b63167eaf5..fdcb952ff13f 100644
--- a/mm/cma_sysfs.c
+++ b/mm/cma_sysfs.c
@@ -81,7 +81,7 @@ static int __init cma_sysfs_init(void)
 =

 	cma_stats =3D kmalloc_array(cma_area_count, sizeof(struct cma_stat),
 				GFP_KERNEL|__GFP_ZERO);
-	if (!cma_stats)
+	if (ZERO_OR_NULL_PTR(cma_stats))
 		goto out;
 =

 	do {
-- =

2.30.1.766.gb4fecdf3b7-goog

--===============9214818190574306397==--

