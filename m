Content-Type: multipart/mixed; boundary="===============8030761498939977618=="
MIME-Version: 1.0
From: Hao, Xudong <xudong.hao@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 5fc3cfa62b: kernel-selftests.kvm.vmx_pmu_msrs_test.fail
Date: Wed, 18 May 2022 01:41:18 +0000
Message-ID: <DM4PR11MB52781191C81A415B044667B288D19@DM4PR11MB5278.namprd11.prod.outlook.com>
In-Reply-To: <20220517131654.GB3820@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8030761498939977618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+Weijiang who submitted a fix patch.

> -----Original Message-----
> From: Sang, Oliver <oliver.sang@intel.com>
> Sent: Tuesday, May 17, 2022 9:17 PM
> To: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; lkp(a)lists.01.org=
; lkp
> <lkp@intel.com>; Hao, Xudong <xudong.hao@intel.com>; LKML <linux-
> kernel(a)vger.kernel.org>
> Subject: [KVM] 5fc3cfa62b: kernel-selftests.kvm.vmx_pmu_msrs_test.fail
> =

> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 5fc3cfa62b85fb60d2383229791f755f333963ed ("KVM: x86: Drop guest
> CPUID check for host initiated writes to MSR_IA32_PERF_CAPABILITIES")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git l=
inux-5.15.y
> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-a6eb654d-1_20220501
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

> on test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz with=
 16G
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

> # selftests: kvm: vmx_pmu_msrs_test
> # =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> #   x86_64/vmx_pmu_msrs_test.c:117: ret =3D=3D 0
> #   pid=3D10285 tid=3D10285 errno=3D0 - Success
> #      1	0x0000000000402643: main at vmx_pmu_msrs_test.c:117
> #      2	0x00007f8bb619309a: ?? ??:0
> #      3	0x0000000000402759: _start at ??:?
> #   Bad PERF_CAPABILITIES didn't fail.
> not ok 32 selftests: kvm: vmx_pmu_msrs_test # exit=3D254
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
>=20

--===============8030761498939977618==--

