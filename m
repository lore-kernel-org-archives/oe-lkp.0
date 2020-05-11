Content-Type: multipart/mixed; boundary="===============3306787408214423283=="
MIME-Version: 1.0
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 6b6a864bd7: kernel-selftests.kvm.vmx_tsc_adjust_test.fail
Date: Mon, 11 May 2020 14:35:37 -0700
Message-ID: <20200511213537.GG24052@linux.intel.com>
In-Reply-To: <20200511010926.GV5770@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3306787408214423283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 09:09:26AM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 6b6a864bd7d7eb12a82ec6da1c2dd97a43f79449 ("[PATCH v2] KVM: nVMX: =
Tweak handling of failure code for nested VM-Enter failure")
> url: https://github.com/0day-ci/linux/commits/Sean-Christopherson/KVM-nVM=
X-Tweak-handling-of-failure-code-for-nested-VM-Enter-failure/20200429-052911
> base: https://git.kernel.org/cgit/virt/kvm/kvm.git linux-next
> =

> in testcase: kernel-selftests
> with following parameters:
> =

> 	group: kselftests-kvm
> 	ucode: 0x500002c
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> =

> # selftests: kvm: vmx_tsc_adjust_test
> # =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> #   x86_64/vmx_tsc_adjust_test.c:153: false
> #   pid=3D12157 tid=3D12157 - Interrupted system call
> #      1	0x000000000040116a: main at vmx_tsc_adjust_test.c:153
> #      2	0x00007fafd54bce0a: ?? ??:0
> #      3	0x00000000004011e9: _start at ??:?
> #   Failed guest assert: (vmreadz(VM_EXIT_REASON) =3D=3D (0x80000000 | 33=
))
> # IA32_TSC_ADJUST is -4294972240 (-1 * TSC_ADJUST_VALUE + -4944).
> not ok 14 selftests: kvm: vmx_tsc_adjust_test # exit=3D254

Ugh, missed the prepare_vmcs02() path.  v3 incoming.
--===============3306787408214423283==--

