Content-Type: multipart/mixed; boundary="===============7475520429076268015=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/kvm/lapic] d176620277: kvm-unit-tests.vmx_EPT_AD_disabled.fail
Date: Mon, 08 Oct 2018 15:04:35 +0200
Message-ID: <87a7nobndo.fsf@vitty.brq.redhat.com>
In-Reply-To: <20181008092905.GA22413@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7475520429076268015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> writes:

> [31mFAIL[0m vmx_EPT_AD_disabled (19 tests, 1 unexpected failures)

It seems the test is buggy: MMIO access is tested by reading ACPI
version from 0xfee00030 without putting APIC to xAPIC mode first. I'll
double check and send a patch to kvm-unit-test in case my guess is
correct.

Thanks,

-- =

Vitaly

--===============7475520429076268015==--

