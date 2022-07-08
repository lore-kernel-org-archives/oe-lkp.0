Content-Type: multipart/mixed; boundary="===============9055860384145782861=="
MIME-Version: 1.0
From: Sean Christopherson <seanjc@google.com>
To: lkp@lists.01.org
Subject: Re: [KVM] cf8e55fe50: kvm-unit-tests.msr.fail
Date: Fri, 08 Jul 2022 14:56:42 +0000
Message-ID: <YshFqkODttAUVeMU@google.com>
In-Reply-To: <YsfUdeft2F4f5OuL@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============9055860384145782861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: cf8e55fe50df0c0292b389a165daa81193cd39d1 ("KVM: x86/pmu: Expose C=
PUIDs feature bits PDCM, DS, DTES64")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: kvm-unit-tests
> version: kvm-unit-tests-x86_64-8719e83-1_20220518

kvm-unit-tests needs to be updated, commit bab19ca ("x86: do not overwrite =
bits
7, 11 and 12 of MSR_IA32_MISC_ENABLE") fixes a test bug where it attempts t=
o toggle
read-only bits.
--===============9055860384145782861==--

