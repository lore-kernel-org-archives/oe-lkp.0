Content-Type: multipart/mixed; boundary="===============3970554933576883668=="
MIME-Version: 1.0
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Tue, 28 Apr 2020 08:12:48 +0200
Message-ID: <018a6f32-5cf6-b38c-7b8c-78b6e5c2d98d@c-s.fr>
In-Reply-To: <9e9091b9-6918-d0af-dd92-3bdc0e29a4d5@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3970554933576883668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Le 28/04/2020 =C3=A0 07:53, Anshuman Khandual a =C3=A9crit=C2=A0:
> =

> =

> On 04/28/2020 10:54 AM, Christophe Leroy wrote:
>>
>>
>> Le 28/04/2020 =C3=A0 04:51, Qian Cai a =C3=A9crit=C2=A0:
>>>
>>>
>>>> On Apr 27, 2020, at 10:35 PM, Anshuman Khandual <Anshuman.Khandual@a=
rm.com> wrote:
>>>>
>>>> Letting CONFIG_DEBUG_VM_PGTABLE enabled via CONFIG_EXPERT for unsuppor=
ted
>>>> platforms i.e without ARCH_HAS_DEBUG_VM_PGTABLE, was a conscious decis=
ion
>>>> meant to expand it's adaptability and coverage without requiring any c=
ode
>>>> (i.e Kconfig) change. The easier it is to enable the test on unsupport=
ed
>>>> platforms right now, more folks are likely to try it out thus increasi=
ng
>>>> it's probability to get fixed on those platforms. That is a valid enou=
gh
>>>> reason to have CONFIG_EXPERT based enablement method, IMHO. Also even =
with
>>>> CONFIG_EXPERT set, CONFIG_DEBUG_VM_PGTABLE does not get enabled by def=
ault
>>>> automatically.
>>>
>>> No, I am talking about PAE. There is a distinction between known broken=
 that nobody cares (like arm32) and in-progress/unknown status (like s390).
>>>
>>> Also, it is not very nice to introduce regressions for robots when test=
ing PAE because they always select CONFIG__EXPERT and CONFIG_DEBUG_VM.
>>>
>>
>> Having CONFIG_EXPERT and CONFIG_DEBUG_VM is not enough to get CONFIG_DEB=
UG_VM_PGTABLE set to yes.
> =

> Not automatically, that is right. But it can be set if required. Seems li=
ke
> the testing robots can and will test with each and every config whether t=
hey
> are enabled by default or not. So if we really need to prevent all possib=
le
> testing robot regressions, X86_PAE needs to be disabled completely.
> =

>>
>> By default, CONFIG_DEBUG_VM_PGTABLE is set to no when ARCH_HAS_DEBUG_VM_=
PGTABLE is not set.
> =

> That is true. There is a slight change in the rules, making it explicit y=
es
> only when both ARCH_HAS_DEBUG_VM_PGTABLE and DEBUG_VM are enabled.
> =

> +config DEBUG_VM_PGTABLE
> +	bool "Debug arch page table for semantics compliance"
> +	depends on MMU
> +	depends on !IA64 && !ARM
> +	depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> +	default y if ARCH_HAS_DEBUG_VM_PGTABLE && DEBUG_VM
> +	help
> =

> The default is really irrelevant as the config option can be set explicit=
ly.
> =


Yes but Qian was saying: "Also, it is not very nice to introduce =

regressions for robots when testing PAE because they always select =

CONFIG__EXPERT and CONFIG_DEBUG_VM"

Here we see that the said regression is not introduced because they =

select CONFIG__EXPERT and CONFIG_DEBUG_VM. This is because the robots =

explicitely select DEBUG_VM_PGTABLE.

Christophe
--===============3970554933576883668==--

