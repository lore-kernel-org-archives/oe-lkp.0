Content-Type: multipart/mixed; boundary="===============6169139423748805447=="
MIME-Version: 1.0
From: Sean Christopherson <seanjc@google.com>
To: lkp@lists.01.org
Subject: Re: [KVM] e923b0537d: kernel-selftests.kvm.rseq_test.fail
Date: Mon, 15 Aug 2022 21:42:27 +0000
Message-ID: <Yvq9wzXNF4ZnlCdk@google.com>
In-Reply-To: <Yvn60W/JpPO8URLY@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6169139423748805447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022, kernel test robot wrote:
> commit: e923b0537d28e15c9d31ce8b38f810b325816903 ("KVM: selftests: Fix ta=
rget thread to be migrated in rseq_test")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

...

> # selftests: kvm: rseq_test
> # =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> #   rseq_test.c:278: i > (NR_TASK_MIGRATIONS / 2)
> #   pid=3D49599 tid=3D49599 errno=3D4 - Interrupted system call
> #      1	0x000000000040265d: main at rseq_test.c:278
> #      2	0x00007fe44eed07fc: ?? ??:0
> #      3	0x00000000004026d9: _start at ??:?
> #   Only performed 23174 KVM_RUNs, task stalled too much?
> # =

> not ok 56 selftests: kvm: rseq_test # exit=3D254

...

> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.19.0-rc6 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-11 (Debian 11.3.0-3) 11.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D110300
> CONFIG_CLANG_VERSION=3D0
> CONFIG_AS_IS_GNU=3Dy
> CONFIG_AS_VERSION=3D23800
> CONFIG_LD_IS_BFD=3Dy
> CONFIG_LD_VERSION=3D23800
> CONFIG_LLD_VERSION=3D0

Assuming 23800 =3D=3D 2.38, this is a known issue.

https://lore.kernel.org/all/20220810104114.6838-1-gshan(a)redhat.com
--===============6169139423748805447==--

