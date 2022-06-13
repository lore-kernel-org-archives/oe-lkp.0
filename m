Content-Type: multipart/mixed; boundary="===============0745521199339093600=="
MIME-Version: 1.0
From: Sang, Oliver <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] a5202946dc: kernel-selftests.kvm.make_fail
Date: Mon, 13 Jun 2022 07:26:51 +0000
Message-ID: <d16188160405497a9ea9b206e4178730@intel.com>
In-Reply-To: <SA2PR11MB50525D04633E934148F8132781AB9@SA2PR11MB5052.namprd11.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0745521199339093600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chenyi,

> From: Qiang, Chenyi <chenyi.qiang@intel.com>
> Sent: Monday, June 13, 2022 12:02 PM
> =

> Hi Oliver
> =

> I found this issue is already fixed by Sean in queue branch. Thanks for y=
our
> testing and report.

Thanks a lot for information!

> =

> Thanks
> Chenyi
> =

> -----Original Message-----
> From: Sang, Oliver <oliver.sang@intel.com>
> Sent: Monday, June 13, 2022 9:27 AM
> To: Qiang, Chenyi <chenyi.qiang@intel.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Christopherson,, Sean
> <seanjc@google.com>; LKML <linux-kernel@vger.kernel.org>;
> kvm(a)vger.kernel.org; Hu, Robert <robert.hu@intel.com>; Chen, Farrah
> <farrah.chen@intel.com>; Wei, Danmei <danmei.wei@intel.com>;
> lkp(a)lists.01.org; lkp <lkp@intel.com>; Hao, Xudong <xudong.hao@inte=
l.com>
> Subject: [KVM] a5202946dc: kernel-selftests.kvm.make_fail
> =

> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: a5202946dc7b20bf2abe1bd35adf2f46aa155ac0 ("KVM: selftests: Add a
> test to get/set triple fault event") https://git.kernel.org/cgit/virt/kvm=
/kvm.git
> lbr-for-weijiang
> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-d889b151-1_20220608
> with following parameters:
> =

> 	group: kvm
> 	ucode: 0xec
> =

> test-description: The kernel contains a set of "self tests" under the
> tools/testing/selftests/ directory. These are intended to be small unit t=
ests to
> exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 2=
8G
> memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> =

> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-
> protector -fno-PIE -I../../../../tools/include -I../../../../tools/arch/x=
86/include -
> I../../../../usr/include/ -Iinclude -Ix86_64 -Iinclude/x86_64 -I..    -pt=
hread  -no-pie
> x86_64/triple_fault_event_test.c /usr/src/perf_selftests-x86_64-rhel-8.3-
> kselftests-
> a5202946dc7b20bf2abe1bd35adf2f46aa155ac0/tools/testing/selftests/kvm/libk
> vm.a  -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-
> a5202946dc7b20bf2abe1bd35adf2f46aa155ac0/tools/testing/selftests/kvm/x86
> _64/triple_fault_event_test
> x86_64/triple_fault_event_test.c: In function =E2=80=98main=E2=80=99:
> x86_64/triple_fault_event_test.c:50:10: error:
> =E2=80=98KVM_CAP_TRIPLE_FAULT_EVENT=E2=80=99 undeclared (first use in thi=
s function); did you
> mean =E2=80=98KVM_CAP_X86_TRIPLE_FAULT_EVENT=E2=80=99?
>    50 |   .cap =3D KVM_CAP_TRIPLE_FAULT_EVENT,
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
>       |          KVM_CAP_X86_TRIPLE_FAULT_EVENT
> x86_64/triple_fault_event_test.c:50:10: note: each undeclared identifier =
is
> reported only once for each function it appears in
> make: *** [../lib.mk:152: /usr/src/perf_selftests-x86_64-rhel-8.3-kselfte=
sts-
> a5202946dc7b20bf2abe1bd35adf2f46aa155ac0/tools/testing/selftests/kvm/x86
> _64/triple_fault_event_test] Error 1
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftes=
ts-
> a5202946dc7b20bf2abe1bd35adf2f46aa155ac0/tools/testing/selftests/kvm'
> =

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

> =

> =

> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> =

> =



--===============0745521199339093600==--

