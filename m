Content-Type: multipart/mixed; boundary="===============5109441636550878149=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/kvm/lapic] d176620277: kvm-unit-tests.vmx_EPT_AD_disabled.fail
Date: Mon, 08 Oct 2018 15:11:09 +0200
Message-ID: <4bfa3e6e-2b7d-dd0b-3b2a-a15531f482be@redhat.com>
In-Reply-To: <87a7nobndo.fsf@vitty.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5109441636550878149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/10/2018 15:04, Vitaly Kuznetsov wrote:
> kernel test robot <rong.a.chen@intel.com> writes:
> =

>> [31mFAIL[0m vmx_EPT_AD_disabled (19 tests, 1 unexpected failures)
> =

> It seems the test is buggy: MMIO access is tested by reading ACPI
> version from 0xfee00030 without putting APIC to xAPIC mode first. I'll
> double check and send a patch to kvm-unit-test in case my guess is
> correct.

Yes, it's probably using x2apic mode.

Paolo

--===============5109441636550878149==--

