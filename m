Content-Type: multipart/mixed; boundary="===============7881845163574127753=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 2efd61a608: WARNING:at_arch/x86/kvm/../../../virt/kvm/kvm_main.c:#mark_page_dirty_in_slot
Date: Thu, 27 Jan 2022 08:52:54 +0100
Message-ID: <e82f74a6-437b-0db0-aba7-afd54bceac2e@redhat.com>
In-Reply-To: <20220127023015.GA34140@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7881845163574127753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/27/22 03:30, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 2efd61a608b0039911924d2e5d7028eb37496e85 ("KVM: Warn if mark_page=
_dirty() is called without an active vCPU")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> [ 123.817787][ T9801] RIP: 0010:mark_page_dirty_in_slot (arch/x86/kvm/../=
../../virt/kvm/kvm_main.c:3160 (discriminator 1))
> [ 123.935134][ T9801] __kvm_write_guest_page (arch/x86/kvm/../../../virt/=
kvm/kvm_main.c:2947)
> [ 123.940399][ T9801] kvm_write_guest (arch/x86/kvm/../../../virt/kvm/kvm=
_main.c:2978)
> [ 123.944953][ T9801] kvm_hv_invalidate_tsc_page (arch/x86/kvm/hyperv.c:1=
220)

Hi, this is known and should be fixed soon.

Paolo

--===============7881845163574127753==--

