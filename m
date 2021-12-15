Content-Type: multipart/mixed; boundary="===============2783731188619364222=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KVM] feb627e8d6: kernel-selftests.kvm.vmx_pmu_msrs_test.fail
Date: Wed, 15 Dec 2021 16:58:56 +0100
Message-ID: <87czlxvozj.fsf@redhat.com>
In-Reply-To: <20211215154643.GE34913@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2783731188619364222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: feb627e8d6f69c9a319fe279710959efb3eba873 ("KVM: x86: Forbid KVM_S=
ET_CPUID{,2} after KVM_RUN")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>

...

>
> # selftests: kvm: vmx_pmu_msrs_test
> # =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> #   lib/x86_64/processor.c:874: rc =3D=3D 0
> #   pid=3D10415 tid=3D10415 errno=3D22 - Invalid argument
> #      1	0x000000000040b24f: vcpu_set_cpuid at processor.c:873
> #      2	0x000000000040260a: main at vmx_pmu_msrs_test.c:115
> #      3	0x00007f07e1aec09a: ?? ??:0
> #      4	0x0000000000402759: _start at ??:?
> #   KVM_SET_CPUID2 failed, rc: -1 errno: 22
> not ok 33 selftests: kvm: vmx_pmu_msrs_test # exit=3D254
>

Hm, I'm pretty sure I've tested feb627e8d6f6 on both Intel and AMD and I
don't remember seeing this failure :-( . vmx_pmu_msrs_test test does
KVM_SET_CPUID after KVM_RUN and thus needs to be fixed too. Will send a
patch shortly.

-- =

Vitaly

--===============2783731188619364222==--

