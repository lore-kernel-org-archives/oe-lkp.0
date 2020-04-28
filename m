Content-Type: multipart/mixed; boundary="===============5903240487783901832=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Tue, 28 Apr 2020 11:23:51 +0530
Message-ID: <9e9091b9-6918-d0af-dd92-3bdc0e29a4d5@arm.com>
In-Reply-To: <b3e5d138-9e14-826c-82c9-2cec9bd41ca5@c-s.fr>
List-Id: <oe-lkp.lists.linux.dev>

--===============5903240487783901832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/28/2020 10:54 AM, Christophe Leroy wrote:
> =

> =

> Le 28/04/2020 =C3=A0 04:51, Qian Cai a =C3=A9crit=C2=A0:
>>
>>
>>> On Apr 27, 2020, at 10:35 PM, Anshuman Khandual <Anshuman.Khandual@ar=
m.com> wrote:
>>>
>>> Letting CONFIG_DEBUG_VM_PGTABLE enabled via CONFIG_EXPERT for unsupport=
ed
>>> platforms i.e without ARCH_HAS_DEBUG_VM_PGTABLE, was a conscious decisi=
on
>>> meant to expand it's adaptability and coverage without requiring any co=
de
>>> (i.e Kconfig) change. The easier it is to enable the test on unsupported
>>> platforms right now, more folks are likely to try it out thus increasing
>>> it's probability to get fixed on those platforms. That is a valid enough
>>> reason to have CONFIG_EXPERT based enablement method, IMHO. Also even w=
ith
>>> CONFIG_EXPERT set, CONFIG_DEBUG_VM_PGTABLE does not get enabled by defa=
ult
>>> automatically.
>>
>> No, I am talking about PAE. There is a distinction between known broken =
that nobody cares (like arm32) and in-progress/unknown status (like s390).
>>
>> Also, it is not very nice to introduce regressions for robots when testi=
ng PAE because they always select CONFIG__EXPERT and CONFIG_DEBUG_VM.
>>
> =

> Having CONFIG_EXPERT and CONFIG_DEBUG_VM is not enough to get CONFIG_DEBU=
G_VM_PGTABLE set to yes.

Not automatically, that is right. But it can be set if required. Seems like
the testing robots can and will test with each and every config whether they
are enabled by default or not. So if we really need to prevent all possible
testing robot regressions, X86_PAE needs to be disabled completely.

> =

> By default, CONFIG_DEBUG_VM_PGTABLE is set to no when ARCH_HAS_DEBUG_VM_P=
GTABLE is not set.

That is true. There is a slight change in the rules, making it explicit yes
only when both ARCH_HAS_DEBUG_VM_PGTABLE and DEBUG_VM are enabled.

+config DEBUG_VM_PGTABLE
+	bool "Debug arch page table for semantics compliance"
+	depends on MMU
+	depends on !IA64 && !ARM
+	depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
+	default y if ARCH_HAS_DEBUG_VM_PGTABLE && DEBUG_VM
+	help

The default is really irrelevant as the config option can be set explicitly.
--===============5903240487783901832==--

