Content-Type: multipart/mixed; boundary="===============0740783999878536302=="
MIME-Version: 1.0
From: Daniel Latypov <dlatypov@google.com>
To: lkp@lists.01.org
Subject: Re: [kunit] 3b29021ddd: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 30 Sep 2021 10:14:10 -0700
Message-ID: <CAGS_qxrY53c9jY50ujpgnyqWTuLbgayK6StEn5rAA0+7vnyRpg@mail.gmail.com>
In-Reply-To: <20210930063730.GC29843@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0740783999878536302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 11:17 PM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with clang-14):
>
> commit: 3b29021ddd10cfb6b2565c623595bd3b02036f33 ("kunit: tool: allow fil=
tering test cases via glob")
> https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git ku=
nit
>
>
> in testcase: boot
>
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------------------------------------=
--+------------+------------+
> |                                                                        =
  | 2e53f56af3 | 3b29021ddd |
> +------------------------------------------------------------------------=
--+------------+------------+
> | BUG:kernel_NULL_pointer_dereference,address                            =
  | 0          | 22         |
> | Oops:#[##]                                                             =
  | 0          | 23         |
> | EIP:strcmp                                                             =
  | 0          | 20         |
> | Kernel_panic-not_syncing:Fatal_exception                               =
  | 0          | 22         |
> +------------------------------------------------------------------------=
--+------------+------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [   74.983767][  T243] BUG: kernel NULL pointer dereference, address: 000=
00000
> [   74.984577][  T243] #PF: supervisor read access in kernel mode
> [   74.984946][  T243] #PF: error_code(0x0000) - not-present page
> [   74.985316][  T243] *pde =3D 00000000
> [   74.985549][  T243] Oops: 0000 [#1]
> [   74.985776][  T243] CPU: 0 PID: 243 Comm: kunit_try_catch Tainted: G  =
      W         5.15.0-rc1-00002-g3b29021ddd10 #1
> [   74.986494][  T243] EIP: strcmp+0xe/0x40
> [   74.986753][  T243] Code: 75 f7 31 c0 c4 04 5e 5f c4 04 5e 5f 90 90 90=
 90 90 90 90 90 90 90 90 90 90 90 90 90 00 55 89 e5 00 55 89 e5 89 c6 ac ae=
 89 c6 <ac> ae 75
> f8 31 c0 75 f8 31 c0 0c 01 5e 5f 0c 01 5e 5f 90 90 90 90
> [   74.987988][  T243] EAX: 00000000 EBX: f53c0108 ECX: 00000001 EDX: c33=
a266c
> [   74.988425][  T243] ESI: 00000000 EDI: c33a266c EBP: f52d3ee0 ESP: f52=
d3ed8
> [   74.988864][  T243] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00010286
> [   74.989332][  T243] CR0: 80050033 CR2: 00000000 CR3: 03ec2000 CR4: 000=
406d0
> [   74.989771][  T243] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   74.990219][  T243] DR6: fffe0ff0 DR7: 00000400
> [   74.990505][  T243] Call Trace:
> [   74.990708][  T243]  filter_suites_test+0x319/0x340

This is happening in executor_test.c, in one of the test updated  for
test filtering support.
So this _might_ be an issue just with our unit tests, and not KUnit itself.

Given it's complaining about strcmp, I'd assume that means it's in
that last line of the test?

   151          KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered.start[0]);
   152          KUNIT_EXPECT_STREQ(test, (const char
*)filtered.start[0][0]->name, "suite0");
   153  }

> [   74.991021][  T243]  ? kunit_binary_ptr_assert_format+0xc0/0xc0

But the problem is, I don't understand what this is doing in the stack.
I'd expect kunit_binary_str_assert_format here.

I don't even know how this test case can call that function.
The only pointer related assertions are KUNIT_ASSERT_NOT_ERR_OR_NULL,
but that would go to kunit_ptr_not_err_assert_format.

So I'm clearly missing something when it comes to reading kernel stack trac=
es.
David, Brendan, any ideas or tips?

> [   74.991394][  T243]  ? trace_hardirqs_on+0x4f/0xc0
> [   74.991701][  T243]  kunit_try_run_case+0x3c/0xc0
> [   74.992000][  T243]  kunit_generic_run_threadfn_adapter+0x16/0x40
> [   74.992383][  T243]  kthread+0x14c/0x180
> [   74.992634][  T243]  ? kunit_try_catch_run+0x180/0x180
> [   74.992971][  T243]  ? kthread_unuse_mm+0xc0/0xc0
> [   74.993269][  T243]  ret_from_fork+0x1c/0x28
> [   74.993541][  T243] Modules linked in:
> [   74.993779][  T243] CR2: 0000000000000000
> [   74.994045][  T243] ---[ end trace e46267553c50ccd5 ]---
> [   74.994391][  T243] EIP: strcmp+0xe/0x40
> [   74.994643][  T243] Code: 75 f7 31 c0 c4 04 5e 5f c4 04 5e 5f 90 90 90=
 90 90 90 90 90 90 90 90 90 90 90 90 90 00 55 89 e5 00 55 89 e5 89 c6 ac ae=
 89 c6 <ac> ae 75
> f8 31 c0 75 f8 31 c0 0c 01 5e 5f 0c 01 5e 5f 90 90 90 90
> [   74.995853][  T243] EAX: 00000000 EBX: f53c0108 ECX: 00000001 EDX: c33=
a266c
> [   74.996456][  T243] ESI: 00000000 EDI: c33a266c EBP: f52d3ee0 ESP: f52=
d3ed8
> [   74.997031][  T243] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00010286
> [   74.997499][  T243] CR0: 80050033 CR2: 00000000 CR3: 03ec2000 CR4: 000=
406d0
> [   74.997937][  T243] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   74.998384][  T243] DR6: fffe0ff0 DR7: 00000400
> [   74.998670][  T243] Kernel panic - not syncing: Fatal exception
> [   74.999042][  T243] Kernel Offset: disabled
>
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.15.0-rc1-00002-g3b29021ddd10 .config
>         make HOSTCC=3Dclang-14 CC=3Dclang-14 ARCH=3Di386 olddefconfig pre=
pare modules_prepare bzImage
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang
>
--===============0740783999878536302==--

