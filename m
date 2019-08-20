Content-Type: multipart/mixed; boundary="===============0304117119558753232=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 323d73a8ec: kernel_selftests.kvm.vmx_set_nested_state_test.fail
Date: Tue, 20 Aug 2019 08:40:00 +0200
Message-ID: <88004f6e-dbbc-e2a9-bd80-bbedb29c0d2c@redhat.com>
In-Reply-To: <20190820005206.GG734@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0304117119558753232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 20/08/19 02:52, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 323d73a8ecad22bf3284f11112a7cce576ade6af ("KVM: nVMX: Change KVM_=
STATE_NESTED_EVMCS to signal vmcs12 is copied from eVMCS")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
> =

> in testcase: kernel_selftests
> with following parameters:
> =

> 	group: kselftests-01
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 1=
6G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Patches for these are already on the list, but I'll add the Reported-by.

Paolo

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> # selftests: kvm: vmx_set_nested_state_test
> # =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> #   lib/kvm_util.c:1277: ret =3D=3D 0
> #   pid=3D12810 tid=3D12810 - Invalid argument
> #      1	0x0000000000403624: vcpu_nested_state_set at kvm_util.c:1275
> #      2	0x0000000000401197: test_nested_state at vmx_set_nested_state_te=
st.c:32
> #      3	0x0000000000401562: test_vmx_nested_state at vmx_set_nested_stat=
e_test.c:151
> #      4	0x000000000040100f: main at vmx_set_nested_state_test.c:283
> #      5	0x00007efdc57f409a: ?? ??:0
> #      6	0x0000000000401099: _start at ??:?
> #   KVM_SET_NESTED_STATE failed, ret: -1 errno: 22
> not ok 12 selftests: kvm: vmx_set_nested_state_test
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Rong Chen
> =



--===============0304117119558753232==--

