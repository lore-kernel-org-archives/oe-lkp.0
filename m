Content-Type: multipart/mixed; boundary="===============5906214831438934992=="
MIME-Version: 1.0
From: Sean Christopherson <seanjc@google.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 7055fb1131: WARNING:at_arch/x86/kvm/x86.c:#inject_pending_event[kvm]
Date: Fri, 30 Sep 2022 13:35:01 +0000
Message-ID: <YzbwhXJnQQPpFm7Q@google.com>
In-Reply-To: <202209301338.aca913c3-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5906214831438934992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 7055fb11311622852c16463b1ccaa59e7691e42e ("KVM: x86: Treat pendin=
g TRIPLE_FAULT requests as pending exceptions")
> https://git.kernel.org/cgit/virt/kvm/kvm.git queue

...

> # =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> #   x86_64/mmio_warning_test.c:117: warnings_before =3D=3D warnings_after

...
 =

> [  100.924976][ T4704] ------------[ cut here ]------------
> [  100.931287][ T4704] WARNING: CPU: 67 PID: 4704 at arch/x86/kvm/x86.c:9=
934 inject_pending_event+0x6e6/0xe00 [kvm]
> [  101.237320][ T4704] Call Trace:
> [  101.241522][ T4704]  <TASK>
> [  101.245343][ T4704]  vcpu_enter_guest+0x61a/0x3540 [kvm]
> [  101.271009][ T4704]  vcpu_run+0xbe/0x780 [kvm]
> [  101.282791][ T4704]  kvm_arch_vcpu_ioctl_run+0x334/0x1540 [kvm]
> [  101.289810][ T4704]  kvm_vcpu_ioctl+0x455/0xb00 [kvm]
> [  101.359680][ T4704]  __x64_sys_ioctl+0x128/0x1c0
> [  101.365052][ T4704]  do_syscall_64+0x38/0xc0
> [  101.370066][ T4704]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [  101.376647][ T4704] RIP: 0033:0x7f2a78126547

Good ol' emulated real mode.  The warning exists to assert that KVM didn't =
queue
a new exception while injecting events, but when emulating Real Mode due to=
 lack
of unrestricted guest, KVM needs to emulate the actual event injection and =
so can
trigger triple fault.

Ideally the assertion would filter out this exact case, but rmode.vm86_acti=
ve is
buried in vcpu_vmx.  Easiest thing is to just exempt KVM_REQ_TRIPLE_FAULT.

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index eb9d2c23fb04..1d02cc416cbc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9972,7 +9972,15 @@ static int kvm_check_and_inject_events(struct kvm_vc=
pu *vcpu,
            kvm_x86_ops.nested_ops->has_events(vcpu))
                *req_immediate_exit =3D true;
 =

-       WARN_ON(kvm_is_exception_pending(vcpu));
+       /*
+        * KVM should never attempt to queue a new exception while injectin=
g an
+        * event, at this point KVM is done emulating and should only propa=
gate
+        * the exception to the VMCS/VMCB.  Exempt triple faults as VMX wit=
hout
+        * unrestricted guest needs to emulate Real Mode events and queues a
+        * triple fault if injection fails (see kvm_inject_realmode_interru=
pt()).
+        */
+       WARN_ON_ONCE(vcpu->arch.exception.pending ||
+                    vcpu->arch.exception_vmexit.pending);
        return 0;
 =

 out:
--===============5906214831438934992==--

