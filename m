Content-Type: multipart/mixed; boundary="===============5554120998585047874=="
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
To: lkp@lists.01.org
Subject: Re: d6763026ef ("KASAN: Port KASAN Tests to KUnit"): BUG: KASAN: slab-out-of-bounds in kmalloc_oob_right
Date: Wed, 12 Aug 2020 14:08:45 +0200
Message-ID: <CAAeHK+y-+vi510ExVgoEFFoxs1NkcsSc+8nUrBG_djwzo+D4qg@mail.gmail.com>
In-Reply-To: <5f325917.lTG2uMtClt9rkROG%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5554120998585047874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2020 at 10:39 AM kernel test robot <lkp@intel.com> wrote:
>
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux/commits/David-Gow/KASAN-KUnit-Integratio=
n/20200811-134255
>
> commit d6763026efa66617014b55c97bbaf6f4c730b2ac
> Author:     Patricia Alfonso <trishalfonso@google.com>
> AuthorDate: Mon Aug 10 22:39:12 2020 -0700
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Tue Aug 11 13:43:01 2020 +0800
>
>     KASAN: Port KASAN Tests to KUnit
>
>     Transfer all previous tests for KASAN to KUnit so they can be run
>     more easily. Using kunit_tool, developers can run these tests with th=
eir
>     other KUnit tests and see "pass" or "fail" with the appropriate KASAN
>     report instead of needing to parse each KASAN report to test KASAN
>     functionalities. All KASAN reports are still printed to dmesg.
>
>     Stack tests do not work properly when KASAN_STACK is enabled so
>     those tests use a check for "if IS_ENABLED(CONFIG_KASAN_STACK)" so th=
ey
>     only run if stack instrumentation is enabled. If KASAN_STACK is not
>     enabled, KUnit will print a statement to let the user know this test
>     was not run with KASAN_STACK enabled.
>
>     copy_user_test and kasan_rcu_uaf cannot be run in KUnit so there is a
>     separate test file for those tests, which can be run as before as a
>     module.
>
>     Signed-off-by: Patricia Alfonso <trishalfonso@google.com>
>     Signed-off-by: David Gow <davidgow@google.com>
>     Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>     Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
>     Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>     Tested-by: Andrey Konovalov <andreyknvl@google.com>
>
> 8968568ccb  KUnit: KASAN Integration
> d6763026ef  KASAN: Port KASAN Tests to KUnit
> 564899a050  mm: kasan: Do not panic if both panic_on_warn and kasan_multi=
shot set
> +------------------------------------------------------------------------=
---+------------+------------+------------+
> |                                                                        =
   | 8968568ccb | d6763026ef | 564899a050 |
> +------------------------------------------------------------------------=
---+------------+------------+------------+
> | boot_successes                                                         =
   | 30         | 0          | 0          |
> | boot_failures                                                          =
   | 1          | 11         | 13         |
> | BUG:kernel_timeout_in_boot_stage                                       =
   | 1          | 2          |            |
> | BUG:KASAN:slab-out-of-bounds_in_k                                      =
   | 0          | 9          | 13         |
> | BUG:KASAN:use-after-free_in_k                                          =
   | 0          | 9          | 13         |
> | BUG:KASAN:double-free_or_invalid-free_in_k                             =
   | 0          | 9          | 13         |
> | BUG:KASAN:out-of-bounds_in_k                                           =
   | 0          | 9          | 13         |
> | BUG:KASAN:global-out-of-bounds_in_k                                    =
   | 0          | 9          | 13         |
> | BUG:KASAN:stack-out-of-bounds_in_k                                     =
   | 0          | 9          | 13         |
> | BUG:KASAN:alloca-out-of-bounds_in_k                                    =
   | 0          | 9          | 13         |
> | BUG:KASAN:slab-out-of-bounds_in_t                                      =
   | 0          | 9          | 13         |
> | BUG_kmalloc-#k(Tainted:G_B):Redzone_overwritten                        =
   | 0          | 6          | 10         |
> | INFO:#-#@offset=3D#.First_byte#instead_of                              =
     | 0          | 5          | 6          |
> | INFO:Allocated_in_kmalloc_node_oob_right_age=3D#cpu=3D#pid=3D          =
         | 0          | 6          | 10         |
> | INFO:Slab#objects=3D#used=3D#fp=3D#flags=3D                            =
           | 0          | 5          | 6          |
> | INFO:Object#@offset=3D#fp=3D                                           =
       | 0          | 5          | 6          |
> | BUG_kmalloc-#(Tainted:G_B):Redzone_overwritten                         =
   | 0          | 5          | 8          |
> | INFO:Allocated_in_ksize_unpoisons_memory_age=3D#cpu=3D#pid=3D          =
         | 0          | 5          | 8          |
> | INFO:0x(____ptrval____)-0x(____ptrval____)@offset=3D#.First_byte#instea=
d_of | 0          | 2          | 4          |
> | INFO:Slab0x(____ptrval____)objects=3D#used=3D#fp=3D0x(#)flags=3D       =
           | 0          | 2          | 4          |
> | INFO:Object0x(____ptrval____)@offset=3D#fp=3D                          =
       | 0          | 2          | 4          |
> | INFO:Object0x(____ptrval____)@offset=3D#fp=3D0x(____ptrval____)        =
       | 0          | 2          | 4          |
> +------------------------------------------------------------------------=
---+------------+------------+------------+
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
>
> [   30.571722]     ok 1 - inode_test_xtimestamp_decoding
> [   30.572664] ok 2 - ext4_inode_test
> [   30.576505]     # Subtest: kasan
> [   30.576509]     1..36
> [   30.577996] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   30.583121] BUG: KASAN: slab-out-of-bounds in kmalloc_oob_right+0x110/=
0x1e8

Well, this is expected. Now KASAN tests can be built into the kernel
and run during boot, and therefore can produce boot time KASAN
reports. Perhaps we should specifically disable
CONFIG_KASAN_KUNIT_TEST on kernel test robot?

> [   30.584567] Write of size 1 at addr ffff88839349087b by task kunit_try=
_catch/211
> [   30.586636]
> [   30.587421] CPU: 0 PID: 211 Comm: kunit_try_catch Not tainted 5.8.0-12=
302-gd6763026efa66 #1
> [   30.589571] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [   30.591741] Call Trace:
> [   30.592675]  dump_stack+0x9e/0xda
> [   30.593731]  print_address_description+0x1c/0x43c
> [   30.595060]  ? kmsg_dump_rewind+0x55/0x55
> [   30.596173]  ? _raw_spin_lock_irqsave+0x7e/0xb9
> [   30.597359]  ? _raw_write_lock_irqsave+0x2c/0x2c
> [   30.598565]  ? kmalloc_oob_right+0x110/0x1e8
> [   30.599715]  kasan_report+0x157/0x190
> [   30.612316]  ? kunit_add_resource+0x4d/0xcb
> [   30.613493]  ? kmalloc_oob_right+0x110/0x1e8
> [   30.614680]  kmalloc_oob_right+0x110/0x1e8
> [   30.615837]  ? kmalloc_oob_left+0x1f8/0x1f8
> [   30.617097]  ? tracer_hardirqs_on+0xc/0x1c
> [   30.618263]  ? kunit_binary_str_assert_format+0xcc/0xcc
> [   30.619569]  ? __schedule+0x797/0x7bb
> [   30.620670]  ? _raw_spin_lock_irqsave+0x7e/0xb9
> [   30.621906]  ? _raw_write_lock_irqsave+0x2c/0x2c
> [   30.623150]  kunit_try_run_case+0xe3/0x113
> [   30.624307]  ? kunit_do_assertion+0x333/0x333
> [   30.625519]  ? kunit_try_catch_throw+0x3b/0x3b
> [   30.626711]  kunit_generic_run_threadfn_adapter+0x29/0x45
> [   30.628004]  kthread+0x1b1/0x1c0
> [   30.629041]  ? kthread_associate_blkcg+0x12f/0x12f
> [   30.630268]  ret_from_fork+0x22/0x30
> [   30.631352]
> [   30.632155] Allocated by task 211:
> [   30.633229]  kasan_save_stack+0x1b/0x3c
> [   30.634345]  kasan_set_track+0x1c/0x21
> [   30.635463]  __kasan_kmalloc+0x72/0x80
> [   30.636722]  kmem_cache_alloc_trace+0x160/0x16f
> [   30.637926]  kmalloc_oob_right+0x78/0x1e8
> [   30.639011]  kunit_try_run_case+0xe3/0x113
> [   30.640142]  kunit_generic_run_threadfn_adapter+0x29/0x45
> [   30.641495]  kthread+0x1b1/0x1c0
> [   30.642563]  ret_from_fork+0x22/0x30
> [   30.643635]
> [   30.644397] The buggy address belongs to the object at ffff888393490800
> [   30.644397]  which belongs to the cache kmalloc-128 of size 128
> [   30.647045] The buggy address is located 123 bytes inside of
> [   30.647045]  128-byte region [ffff888393490800, ffff888393490880)
>
>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 564899a050ffd61182a7222fe84f8827d94f60a8 00e4db51259a5f9=
36fec1424b884f029479d3981 --
> git bisect  bad d6763026efa66617014b55c97bbaf6f4c730b2ac  # 15:54  B     =
 0     8   24   0  KASAN: Port KASAN Tests to KUnit
> git bisect good aadfe7120b499e40cef975c49337424662d9e2a2  # 16:04  G     =
10     0    0   0  Add KUnit Struct to Current Task
> git bisect good 8968568ccb9f283d79af0c9dad77eafde93fd540  # 16:16  G     =
11     0    0   0  KUnit: KASAN Integration
> # first bad commit: [d6763026efa66617014b55c97bbaf6f4c730b2ac] KASAN: Por=
t KASAN Tests to KUnit
> git bisect good 8968568ccb9f283d79af0c9dad77eafde93fd540  # 16:22  G     =
30     0    0   0  KUnit: KASAN Integration
> # extra tests with debug options
> git bisect  bad d6763026efa66617014b55c97bbaf6f4c730b2ac  # 16:27  B     =
 0     2   18   0  KASAN: Port KASAN Tests to KUnit
> # extra tests on head commit of linux-review/David-Gow/KASAN-KUnit-Integr=
ation/20200811-134255
> git bisect  bad 564899a050ffd61182a7222fe84f8827d94f60a8  # 16:38  B     =
 0    13   32   0  mm: kasan: Do not panic if both panic_on_warn and kasan_=
multishot set
> # bad: [564899a050ffd61182a7222fe84f8827d94f60a8] mm: kasan: Do not panic=
 if both panic_on_warn and kasan_multishot set
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
--===============5554120998585047874==--

