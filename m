Content-Type: multipart/mixed; boundary="===============8233623817159499768=="
MIME-Version: 1.0
From: Daniel Latypov <dlatypov@google.com>
To: lkp@lists.01.org
Subject: Re: [kunit] 3b29021ddd: BUG:kernel_NULL_pointer_dereference, address
Date: Fri, 01 Oct 2021 18:41:22 -0700
Message-ID: <CAGS_qxrH25tAvXxk8rvNZQuKwQ2aDDrosawLpsezj5Fm3k1LnQ@mail.gmail.com>
In-Reply-To: <CAGS_qxrY53c9jY50ujpgnyqWTuLbgayK6StEn5rAA0+7vnyRpg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8233623817159499768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 10:14 AM Daniel Latypov <dlatypov@google.com> wro=
te:
>
> On Wed, Sep 29, 2021 at 11:17 PM kernel test robot
> <oliver.sang@intel.com> wrote:
> >
> >
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with clang-14):
> >
> > commit: 3b29021ddd10cfb6b2565c623595bd3b02036f33 ("kunit: tool: allow f=
iltering test cases via glob")
> > https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git =
kunit
> >
> >
> > in testcase: boot
> >
> > on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> > +----------------------------------------------------------------------=
----+------------+------------+
> > |                                                                      =
    | 2e53f56af3 | 3b29021ddd |
> > +----------------------------------------------------------------------=
----+------------+------------+
> > | BUG:kernel_NULL_pointer_dereference,address                          =
    | 0          | 22         |
> > | Oops:#[##]                                                           =
    | 0          | 23         |
> > | EIP:strcmp                                                           =
    | 0          | 20         |
> > | Kernel_panic-not_syncing:Fatal_exception                             =
    | 0          | 22         |
> > +----------------------------------------------------------------------=
----+------------+------------+
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> >
> >
> > [   74.983767][  T243] BUG: kernel NULL pointer dereference, address: 0=
0000000
> > [   74.984577][  T243] #PF: supervisor read access in kernel mode
> > [   74.984946][  T243] #PF: error_code(0x0000) - not-present page
> > [   74.985316][  T243] *pde =3D 00000000
> > [   74.985549][  T243] Oops: 0000 [#1]
> > [   74.985776][  T243] CPU: 0 PID: 243 Comm: kunit_try_catch Tainted: G=
        W         5.15.0-rc1-00002-g3b29021ddd10 #1
> > [   74.986494][  T243] EIP: strcmp+0xe/0x40
> > [   74.986753][  T243] Code: 75 f7 31 c0 c4 04 5e 5f c4 04 5e 5f 90 90 =
90 90 90 90 90 90 90 90 90 90 90 90 90 90 00 55 89 e5 00 55 89 e5 89 c6 ac =
ae 89 c6 <ac> ae 75
> > f8 31 c0 75 f8 31 c0 0c 01 5e 5f 0c 01 5e 5f 90 90 90 90
> > [   74.987988][  T243] EAX: 00000000 EBX: f53c0108 ECX: 00000001 EDX: c=
33a266c
> > [   74.988425][  T243] ESI: 00000000 EDI: c33a266c EBP: f52d3ee0 ESP: f=
52d3ed8
> > [   74.988864][  T243] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFL=
AGS: 00010286
> > [   74.989332][  T243] CR0: 80050033 CR2: 00000000 CR3: 03ec2000 CR4: 0=
00406d0
> > [   74.989771][  T243] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 0=
0000000
> > [   74.990219][  T243] DR6: fffe0ff0 DR7: 00000400
> > [   74.990505][  T243] Call Trace:
> > [   74.990708][  T243]  filter_suites_test+0x319/0x340
>
> This is happening in executor_test.c, in one of the test updated  for
> test filtering support.
> So this _might_ be an issue just with our unit tests, and not KUnit itsel=
f.

This is a KUnit issue.
Specifically when using a kunit.filter_glob that only has a suite
part, and no test part.

The fix is https://lore.kernel.org/linux-kselftest/20211002013635.2076371-1=
-dlatypov(a)google.com/

>
> Given it's complaining about strcmp, I'd assume that means it's in
> that last line of the test?
>
>    151          KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered.start[0]);
>    152          KUNIT_EXPECT_STREQ(test, (const char
> *)filtered.start[0][0]->name, "suite0");
>    153  }
>
> > [   74.991021][  T243]  ? kunit_binary_ptr_assert_format+0xc0/0xc0
>
> But the problem is, I don't understand what this is doing in the stack.
> I'd expect kunit_binary_str_assert_format here.
>
> I don't even know how this test case can call that function.
> The only pointer related assertions are KUNIT_ASSERT_NOT_ERR_OR_NULL,
> but that would go to kunit_ptr_not_err_assert_format.
>
> So I'm clearly missing something when it comes to reading kernel stack tr=
aces.
> David, Brendan, any ideas or tips?
>
> > [   74.991394][  T243]  ? trace_hardirqs_on+0x4f/0xc0
> > [   74.991701][  T243]  kunit_try_run_case+0x3c/0xc0
> > [   74.992000][  T243]  kunit_generic_run_threadfn_adapter+0x16/0x40
> > [   74.992383][  T243]  kthread+0x14c/0x180
> > [   74.992634][  T243]  ? kunit_try_catch_run+0x180/0x180
> > [   74.992971][  T243]  ? kthread_unuse_mm+0xc0/0xc0
> > [   74.993269][  T243]  ret_from_fork+0x1c/0x28
> > [   74.993541][  T243] Modules linked in:
> > [   74.993779][  T243] CR2: 0000000000000000
> > [   74.994045][  T243] ---[ end trace e46267553c50ccd5 ]---
> > [   74.994391][  T243] EIP: strcmp+0xe/0x40
> > [   74.994643][  T243] Code: 75 f7 31 c0 c4 04 5e 5f c4 04 5e 5f 90 90 =
90 90 90 90 90 90 90 90 90 90 90 90 90 90 00 55 89 e5 00 55 89 e5 89 c6 ac =
ae 89 c6 <ac> ae 75
> > f8 31 c0 75 f8 31 c0 0c 01 5e 5f 0c 01 5e 5f 90 90 90 90
> > [   74.995853][  T243] EAX: 00000000 EBX: f53c0108 ECX: 00000001 EDX: c=
33a266c
> > [   74.996456][  T243] ESI: 00000000 EDI: c33a266c EBP: f52d3ee0 ESP: f=
52d3ed8
> > [   74.997031][  T243] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFL=
AGS: 00010286
> > [   74.997499][  T243] CR0: 80050033 CR2: 00000000 CR3: 03ec2000 CR4: 0=
00406d0
> > [   74.997937][  T243] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 0=
0000000
> > [   74.998384][  T243] DR6: fffe0ff0 DR7: 00000400
> > [   74.998670][  T243] Kernel panic - not syncing: Fatal exception
> > [   74.999042][  T243] Kernel Offset: disabled
> >
> >
> >
> > To reproduce:
> >
> >         # build kernel
> >         cd linux
> >         cp config-5.15.0-rc1-00002-g3b29021ddd10 .config
> >         make HOSTCC=3Dclang-14 CC=3Dclang-14 ARCH=3Di386 olddefconfig p=
repare modules_prepare bzImage
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> >
> >         # if come across any failure that blocks the test,
> >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> >
> >
> >
> > ---
> > 0DAY/LKP+ Test Infrastructure                   Open Source Technology =
Center
> > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Cor=
poration
> >
> > Thanks,
> > Oliver Sang
> >
--===============8233623817159499768==--

