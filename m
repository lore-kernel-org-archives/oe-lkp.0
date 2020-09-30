Content-Type: multipart/mixed; boundary="===============1871808510040957128=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: 42cc27ddec ("KASAN: Port KASAN Tests to KUnit"): BUG: KASAN: slab-out-of-bounds in kmalloc_oob_right
Date: Wed, 30 Sep 2020 05:09:56 +0000
Message-ID: <c1e8cc671d8a4af5883f24fbf82a5631@intel.com>
In-Reply-To: <5f740fb5.Fx8vL6TKkZHZNi2n%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1871808510040957128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: 42cc27ddec ("KASAN: Port KASAN Tests to KUnit"): BUG: KASAN: sla=
b-
> out-of-bounds in kmalloc_oob_right
> =

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
sorry, kindly ignore this false positive as well.

> =

> commit 42cc27ddece13e7bcac2d1882c35066aff76d60b
> Author:     Patricia Alfonso <trishalfonso@google.com>
> AuthorDate: Fri Sep 25 14:50:16 2020 +1000
> Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> CommitDate: Sun Sep 27 17:23:34 2020 +1000
> =

>     KASAN: Port KASAN Tests to KUnit
> =

>     Transfer all previous tests for KASAN to KUnit so they can be run more
>     easily.  Using kunit_tool, developers can run these tests with their
> other
>     KUnit tests and see "pass" or "fail" with the appropriate KASAN report
>     instead of needing to parse each KASAN report to test KASAN
>     functionalities.  All KASAN reports are still printed to dmesg.
> =

>     Stack tests do not work properly when KASAN_STACK is enabled so those
>     tests use a check for "if IS_ENABLED(CONFIG_KASAN_STACK)" so they only
> run
>     if stack instrumentation is enabled.  If KASAN_STACK is not enabled,
> KUnit
>     will print a statement to let the user know this test was not run with
>     KASAN_STACK enabled.
> =

>     copy_user_test and kasan_rcu_uaf cannot be run in KUnit so there is a
>     separate test file for those tests, which can be run as before as a
>     module.
> =

>     Link: https://lkml.kernel.org/r/20200910070331.3358048-4-
> davidgow(a)google.com
>     Signed-off-by: Patricia Alfonso <trishalfonso@google.com>
>     Signed-off-by: David Gow <davidgow@google.com>
>     Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>     Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
>     Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>     Tested-by: Andrey Konovalov <andreyknvl@google.com>
>     Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
>     Cc: Ingo Molnar <mingo@redhat.com>
>     Cc: Juri Lelli <juri.lelli@redhat.com>
>     Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
>     Cc: Shuah Khan <shuah@kernel.org>
>     Cc: Vincent Guittot <vincent.guittot@linaro.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> =

> 77a8004d0e  KUnit: KASAN Integration
> 42cc27ddec  KASAN: Port KASAN Tests to KUnit
> +--------------------------------------------+------------+------------+
> |                                            | 77a8004d0e | 42cc27ddec |
> +--------------------------------------------+------------+------------+
> | boot_successes                             | 32         | 0          |
> | boot_failures                              | 0          | 15         |
> | BUG:KASAN:slab-out-of-bounds_in_k          | 0          | 15         |
> | BUG:KASAN:out-of-bounds_in_k               | 0          | 15         |
> | BUG:KASAN:use-after-free_in_k              | 0          | 15         |
> | BUG:KASAN:global-out-of-bounds_in_k        | 0          | 15         |
> | BUG:KASAN:stack-out-of-bounds_in_k         | 0          | 15         |
> | BUG:KASAN:alloca-out-of-bounds_in_k        | 0          | 15         |
> | BUG:KASAN:double-free_or_invalid-free_in_k | 0          | 15         |
> | BUG:KASAN:slab-out-of-bounds_in_t          | 0          | 15         |
> | BUG:KASAN:vmalloc-out-of-bounds_in_v       | 0          | 15         |
> +--------------------------------------------+------------+------------+
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> [   14.465638] Btrfs loaded, crc32c=3Dcrc32c-generic, debug=3Don, ref-ver=
ify=3Don
> [   14.469661] Key type big_key registered
> [   14.473561]     # Subtest: kasan
> [   14.473569]     1..36
> [   14.481549]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   14.487271] BUG: KASAN: slab-out-of-bounds in
> kmalloc_oob_right+0x190/0x26c
> [   14.490566] Write of size 1 at addr ffff8881ee42f47b by task
> kunit_try_catch/220
> [   14.493839]
> [   14.496419] CPU: 1 PID: 220 Comm: kunit_try_catch Not tainted 5.9.0-rc=
6-
> 00463-g42cc27ddece13 #1
> [   14.500161] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.12.0-1 04/01/2014
> [   14.507888] Call Trace:
> [   14.511057]  dump_stack+0x96/0xc4
> [   14.514227]  print_address_description+0x21/0x41f
> [   14.517722]  ? _raw_spin_lock_irqsave+0x91/0xe1
> [   14.521245]  ? _raw_write_lock_irqsave+0x33/0x33
> [   14.527489]  ? kmalloc_oob_right+0x190/0x26c
> [   14.531050]  kasan_report+0x14c/0x187
> [   14.534502]  ? kmalloc_oob_right+0x190/0x26c
> [   14.538064]  __asan_report_store1_noabort+0x17/0x19
> [   14.541623]  kmalloc_oob_right+0x190/0x26c
> [   14.545329]  ? kmalloc_oob_left+0x29c/0x29c
> [   14.549033]  ? kunit_binary_str_assert_format+0x178/0x178
> [   14.553015]  ? finish_task_switch+0x37f/0x4d3
> [   14.556934]  ? preempt_latency_start+0x23/0x80
> [   14.560866]  ? __kasan_check_write+0x14/0x16
> [   14.564827]  ? _raw_spin_lock_irqsave+0x91/0xe1
> [   14.568689]  ? _raw_write_lock_irqsave+0x33/0x33
> [   14.572620]  ? _raw_spin_lock_irqsave+0x91/0xe1
> [   14.576343]  ? _raw_write_lock_irqsave+0x33/0x33
> [   14.580190]  kunit_try_run_case+0x1d8/0x221
> [   14.583805]  ? kunit_do_assertion+0x570/0x570
> [   14.587697]  kunit_generic_run_threadfn_adapter+0x55/0x87
> [   14.591474]  kthread+0x341/0x350
> [   14.595113]  ? kunit_try_catch_throw+0x6c/0x6c
> [   14.598993]  ? kthread_create_worker_on_cpu+0xce/0xce
> [   14.602975]  ret_from_fork+0x22/0x30
> [   14.606711]
> [   14.610327] Allocated by task 220:
> [   14.614000]  kasan_save_stack+0x23/0x4d
> [   14.617714]  kasan_set_track+0x20/0x26
> [   14.621373]  __kasan_kmalloc+0x7b/0x8a
> [   14.625275]  kasan_kmalloc+0x9/0xb
> [   14.628905]  kmalloc_oob_right+0xc4/0x26c
> [   14.632594]  kunit_try_run_case+0x1d8/0x221
> [   14.636089]  kunit_generic_run_threadfn_adapter+0x55/0x87
> [   14.639805]  kthread+0x341/0x350
> [   14.643246]  ret_from_fork+0x22/0x30
> [   14.646700]
> [   14.652903] The buggy address belongs to the object at ffff8881ee42f400
> [   14.652903]  which belongs to the cache kmalloc-128 of size 128
> [   14.660520] The buggy address is located 123 bytes inside of
> [   14.660520]  128-byte region [ffff8881ee42f400, ffff8881ee42f480)
> =

>                                                           # HH:MM RESULT
> GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 49e7e3e905e437a02782019570f70997e2da9101 v5.8 --
> git bisect good d849ca483dba7546ad176da83bf66d1c013725f6  # 00:35  G     =
10
> 0    0   0  Merge tag 'io_uring-5.9-2020-09-04' of
> git://git.kernel.dk/linux-block
> git bisect good e62584618d93201358c3e897f9595fcd28aa925d  # 00:53  G     =
10
> 0    0   0  Merge remote-tracking branch 'arm64/for-next/core' into master
> git bisect good 006eef11777e23ffdb60ccf45be817770318bacb  # 01:14  G     =
11
> 0    0   0  Merge remote-tracking branch 'mtd/mtd/next' into master
> git bisect good 2061dc795bd8a07388636092652fa0abc5cf07ef  # 01:36  G     =
11
> 0    0   0  Merge remote-tracking branch 'chrome-platform/for-next' into
> master
> git bisect good 9bb4ec01566d43b32e335af167631bac1adf3174  # 02:50  G     =
10
> 0    1   1  Merge remote-tracking branch 'pwm/for-next' into master
> git bisect good d3fc492211d3935c3ba570d80758888bc985213a  # 03:49  G     =
10
> 0    0   0  Merge remote-tracking branch 'nvmem/for-next' into master
> git bisect good cb38a851eb8a18edf44797040ac2c3075ca4ddc1  # 04:19  G     =
11
> 0    0   0  Merge remote-tracking branch 'trivial/for-next' into master
> git bisect good b2a6843cfff9cab0387e0fd9316dcbc57a6068e7  # 05:23  G     =
10
> 0    0   0  Merge remote-tracking branch 'memblock/for-next' into master
> git bisect  bad 3f91859d3d7941000d51704d11ad4835f2026bfe  # 06:13  B     =
 0
> 1   10   0  Merge branch 'akpm-current/current' into master
> git bisect  bad eec17018489b6a5bd5d04cd8e884f0bffb6ff948  # 07:03  B     =
 0
> 2   11   0  hugetlb: add lockdep check for i_mmap_rwsem held in
> huge_pmd_share
> git bisect good 4ea9429970547632b609cebd4135d086407c3c55  # 08:17  G     =
10
> 0    0   3  mm: add find_lock_head
> git bisect good e0c358f3a1cc904f8e05515c07b868286dd402e2  # 08:51  G     =
10
> 0    0   0  mm/mmap.c: use helper function allow_write_access() in
> __remove_shared_vm_struct()
> git bisect  bad a3f39c26a8db0040c8a2ad1b9eeb3ac5ec517706  # 09:07  B     =
 0
> 3   13   1  mm, isolation: avoid checking unmovable pages across pageblock
> boundary
> git bisect good 77a8004d0e0420aab36d80eee23fef1813853eaf  # 10:30  G     =
11
> 0    1   1  KUnit: KASAN Integration
> git bisect  bad 71b5099c7c2247f0072575ecc755e1e789058fb1  # 11:17  B     =
 0
> 3   13   1  mm/page_alloc: tweak comments in has_unmovable_pages()
> git bisect  bad 1c5d1dcc17456092bbdb51470ab88157bb3c7867  # 11:50  B     =
 0
> 8   22   5  kasan-port-kasan-tests-to-kunit-v14
> git bisect  bad 42cc27ddece13e7bcac2d1882c35066aff76d60b  # 12:07  B     =
 0
> 9   21   3  KASAN: Port KASAN Tests to KUnit
> # first bad commit: [42cc27ddece13e7bcac2d1882c35066aff76d60b] KASAN: Port
> KASAN Tests to KUnit
> git bisect good 77a8004d0e0420aab36d80eee23fef1813853eaf  # 12:17  G     =
31
> 0    0   1  KUnit: KASAN Integration
> # extra tests with debug options
> git bisect  bad 42cc27ddece13e7bcac2d1882c35066aff76d60b  # 12:37  B     =
 0
> 4   14   1  KASAN: Port KASAN Tests to KUnit
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
--===============1871808510040957128==--

