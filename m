Content-Type: multipart/mixed; boundary="===============6776210964303946186=="
MIME-Version: 1.0
From: Sean Christopherson <seanjc@google.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 9daee8ca83: kvm-unit-tests.apic.fail
Date: Fri, 25 Feb 2022 16:24:45 +0000
Message-ID: <YhkCzS1rGYyJ0mKP@google.com>
In-Reply-To: <20220225014911.GA30182@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6776210964303946186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022, kernel test robot wrote:
> commit: 9daee8ca835bf3ba264414c6f3a3924e23455449 ("[PATCH v2] KVM: x86: p=
ull kvm->srcu read-side to kvm_arch_vcpu_ioctl_run")
> url: https://github.com/0day-ci/linux/commits/Paolo-Bonzini/KVM-x86-pull-=
kvm-srcu-read-side-to-kvm_arch_vcpu_ioctl_run/20220220-190039
> base: https://git.kernel.org/cgit/virt/kvm/kvm.git master
> patch link: https://lore.kernel.org/lkml/20220219093404.367207-1-pbonzini=
(a)redhat.com
> =

> in testcase: kvm-unit-tests
> version: kvm-unit-tests-x86_64-882825e-1_20220215
> with following parameters:
> =

> 	ucode: 0x28

> please be noted, besides kvm-unit-tests.apic.fail in title, we also found=
 below
> cases fail upon this commit while pass on parent:

Same thing I hit[*].  Paolo temporarily dropped the buggy patch, a new one =
will
presumably show up soonish.

[*] https://lore.kernel.org/all/20220224212646.3544811-1-seanjc(a)google.com
--===============6776210964303946186==--

