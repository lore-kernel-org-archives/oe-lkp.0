Content-Type: multipart/mixed; boundary="===============7037650518493565390=="
MIME-Version: 1.0
From: Iurii Zaikin <yzaikin@google.com>
To: lkp@lists.01.org
Subject: Re: 2c7abad740 ("kunit: test: create a single centralized executor .."): [ 409.679449] BUG: kernel NULL pointer dereference, address: 00000000
Date: Fri, 28 Feb 2020 09:45:46 -0800
Message-ID: <CAAXuY3q2nPeg7LEyswgQZfXNzR5GSQD93-Kx1ChU_vCcnMke7g@mail.gmail.com>
In-Reply-To: <CAFd5g46iBLfoK4bowk0WRdJYtHFBmBOGjkS-Bo90nb3X0vMWpw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7037650518493565390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm curious, in the cases where the alignment was mismatched, what was
the offset?

On Thu, Feb 27, 2020 at 11:12 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> I found the problem: We were aligned along an 8 byte boundary which
> works fine for 64 bit x86 always, but only sometimes for 32 bit.
> Aligning everything to a 4 byte boundary seems to solve the problem.
>
> On Thu, Feb 27, 2020 at 6:04 PM Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >
> > I was able to reproduce this on my machine, but it doesn't seem to
> > consistently NPE in the same place. I am guessing this is due to
> > memory corruption from somewhere. I am going to keep playing around
> > with this.
> >
> > On Wed, Feb 5, 2020 at 4:08 AM kernel test robot <lkp@intel.com> wrot=
e:
> > >
> > > Greetings,
> > >
> > > 0day kernel testing robot got the below dmesg and the first bad commi=
t is
> > >
> > > https://github.com/0day-ci/linux/commits/Brendan-Higgins/kunit-create=
-a-centralized-executor-to-dispatch-all-KUnit-tests/20200203-035040
> > >
> > > commit 2c7abad74010ee4f27b0b1f3c68353171e19967b
> > > Author:     Alan Maguire <alan.maguire@oracle.com>
> > > AuthorDate: Thu Jan 30 15:08:08 2020 -0800
> > > Commit:     0day robot <lkp@intel.com>
> > > CommitDate: Mon Feb 3 03:50:54 2020 +0800
> > >
> > >     kunit: test: create a single centralized executor for all tests
> > >
> > >     Add a centralized executor to dispatch tests rather than relying =
on
> > >     late_initcall to schedule each test suite separately.  Centralized
> > >     execution is for built-in tests only; modules will execute tests
> > >     when loaded.
> > >
> > >     Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> > >     Co-developed-by: Iurii Zaikin <yzaikin@google.com>
> > >     Signed-off-by: Iurii Zaikin <yzaikin@google.com>
> > >     Co-developed-by: Brendan Higgins <brendanhiggins@google.com>
> > >     Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > >     Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > >
> > > bf1af76d02  arch: um: add linker section for KUnit test suites
> > > 2c7abad740  kunit: test: create a single centralized executor for all=
 tests
> > > 11385b32f9  Documentation: Add kunit_shutdown to kernel-parameters.txt
> > > +-----------------------------------------------------------+--------=
----+------------+------------+
> > > |                                                           | bf1af76=
d02 | 2c7abad740 | 11385b32f9 |
> > > +-----------------------------------------------------------+--------=
----+------------+------------+
> > > | boot_successes                                            | 28     =
    | 1          | 0          |
> > > | boot_failures                                             | 7      =
    | 10         | 7          |
> > > | WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_oom_notify | 1      =
    |            |            |
> > > | EIP:rcutorture_oom_notify                                 | 1      =
    |            |            |
> > > | Mem-Info                                                  | 1      =
    |            |            |
> > > | BUG:kernel_NULL_pointer_dereference,address               | 1      =
    | 7          | 7          |
> > > | Oops:#[##]                                                | 1      =
    | 7          | 7          |
> > > | EIP:rcu_torture_fwd_cb_hist                               | 1      =
    |            |            |
> > > | Kernel_panic-not_syncing:Fatal_exception                  | 3      =
    | 7          | 7          |
> > > | kernel_BUG_at_mm/vmalloc.c                                | 2      =
    |            |            |
> > > | invalid_opcode:#[##]                                      | 2      =
    |            |            |
> > > | EIP:alloc_vmap_area                                       | 2      =
    |            |            |
> > > | BUG:kernel_timeout_in_torture_test_stage                  | 4      =
    | 3          |            |
> > > | EIP:kunit_run_all_tests                                   | 0      =
    | 7          | 7          |
> > > +-----------------------------------------------------------+--------=
----+------------+------------+
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > [  409.675220]  ok 7 - sysctl_test_dointvec_write_happy_single_positi=
ve
> > > [  409.675796]  ok 8 - sysctl_test_dointvec_write_happy_single_negati=
ve
> > > [  409.676601]  ok 9 - sysctl_test_api_dointvec_write_single_less_int=
_min
> > > [  409.678166]  ok 10 - sysctl_test_api_dointvec_write_single_greater=
_int_max
> > > [  409.679009] ok 1 - sysctl_test
> > > [  409.679449] BUG: kernel NULL pointer dereference, address: 00000000
> > > [  409.680224] #PF: supervisor read access in kernel mode
> > > [  409.680846] #PF: error_code(0x0000) - not-present page
> > > [  409.682123] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53
> > > [  409.682801] Oops: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC PTI
> > > [  409.683475] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G              =
  T 5.5.0-08693-g2c7abad74010e #1
> > > [  409.684540] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS 1.10.2-1 04/01/2014
> > > [  409.685584] EIP: kunit_run_all_tests+0x22/0x43
> > > [  409.686112] Code: 8d 65 f4 5b 5e 5f 5d c3 55 89 e5 57 56 31 f6 53 =
bb b0 44 3a 5d eb 1c 8b 3b eb 0f e8 86 f7 ff ff 85 c0 b0 01 0f 45 f0 83 c7 =
04 <8b> 07 85 c0 75 eb 83 c3 04 81 fb bc 44 3a 5d 72 dc 89 f0 3c 01 19
> > > [  409.688277] EAX: 00000000 EBX: 5d3a44b4 ECX: 00000000 EDX: 00000001
> > > [  409.689019] ESI: 00000000 EDI: 00000000 EBP: 40073f28 ESP: 40073f1c
> > > [  409.689841] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 0=
0010293
> > > [  409.690633] CR0: 80050033 CR2: 00000000 CR3: 1d516000 CR4: 003406b0
> > > [  409.691386] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> > > [  409.692226] DR6: fffe0ff0 DR7: 00000400
> > > [  409.692690] Call Trace:
> > > [  409.693002]  ? kunit_try_catch_run+0xd1/0xd1
> > > [  409.693550]  ? do_one_initcall+0xa4/0x1cd
> > > [  409.694053]  ? trace_initcall_level+0x7e/0x82
> > > [  409.694559]  ? kernel_init_freeable+0x100/0x16f
> > > [  409.695092]  ? kernel_init_freeable+0x118/0x16f
> > > [  409.695628]  ? rest_init+0xdc/0xdc
> > > [  409.696032]  ? kernel_init+0x8/0xd5
> > > [  409.696452]  ? ret_from_fork+0x2e/0x38
> > > [  409.696882] Modules linked in:
> > > [  409.697290] CR2: 0000000000000000
> > > [  409.697628] ---[ end trace 045ceeef56b43c7f ]---
> > > [  409.697984] EIP: kunit_run_all_tests+0x22/0x43
> > >
> > >                                                           # HH:MM RES=
ULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> > > git bisect start 7f777d6b2b6ba2646d7facc3c6201073ff3d91ed d5226fa6dba=
e0569ee43ecfc08bdcd6770fc4755 --
> > > git bisect good 213420b8b9d31ed07f465bfeecc4ac136b12eb2f  # 20:37  G =
    10     0    1   4  Merge 'hwmon/hwmon' into devel-catchup-202002030406
> > > git bisect  bad 71e7078961cd57921eccfcea97a5ac01652a3372  # 21:38  B =
     0     1   17   0  Merge 'linux-review/Brendan-Higgins/kunit-create-a-c=
entralized-executor-to-dispatch-all-KUnit-tests/20200203-035040' into devel=
-catchup-202002030406
> > > git bisect good a2c8e1e21fa488760d9854643c459b9d13fa1d0e  # 22:18  G =
    10     0    2   2  Merge 'linux-review/Yulia-Kartseva/runqslower-fix-Ma=
kefile/20200203-035351' into devel-catchup-202002030406
> > > git bisect good 8f9cc5912605f2f915ba317d01d0076068f0a7e2  # 23:55  G =
    10     0    2   2  Merge 'linux-review/Vinicius-Costa-Gomes/igc-Add-ini=
tial-TSN-qdiscs-offloading/20200203-025747' into devel-catchup-202002030406
> > > git bisect  bad 0401f14bd224ed7f2d47b0b9f27bdfbb1552c399  # 00:29  B =
     0     1   17   0  init: main: add KUnit to kernel init
> > > git bisect good bf1af76d02c3998127b3164b1b5e8638f175a602  # 01:39  G =
    10     0    3   3  arch: um: add linker section for KUnit test suites
> > > git bisect  bad 2c7abad74010ee4f27b0b1f3c68353171e19967b  # 02:24  B =
     0     1   17   0  kunit: test: create a single centralized executor fo=
r all tests
> > > # first bad commit: [2c7abad74010ee4f27b0b1f3c68353171e19967b] kunit:=
 test: create a single centralized executor for all tests
> > > git bisect good bf1af76d02c3998127b3164b1b5e8638f175a602  # 03:04  G =
    30     0    2   6  arch: um: add linker section for KUnit test suites
> > > # extra tests with debug options
> > > git bisect good 2c7abad74010ee4f27b0b1f3c68353171e19967b  # 03:42  G =
    10     0   10  10  kunit: test: create a single centralized executor fo=
r all tests
> > > # extra tests on head commit of linux-review/Brendan-Higgins/kunit-cr=
eate-a-centralized-executor-to-dispatch-all-KUnit-tests/20200203-035040
> > > git bisect  bad 11385b32f9e52707959f8566f2c719e66159d2e0  # 04:29  B =
     0     1   17   0  Documentation: Add kunit_shutdown to kernel-paramete=
rs.txt
> > > # bad: [11385b32f9e52707959f8566f2c719e66159d2e0] Documentation: Add =
kunit_shutdown to kernel-parameters.txt
> > >
> > > ---
> > > 0-DAY kernel test infrastructure                Open Source Technolog=
y Center
> > > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel C=
orporation
--===============7037650518493565390==--

