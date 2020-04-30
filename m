Content-Type: multipart/mixed; boundary="===============8311666745894140155=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Thu, 30 Apr 2020 08:08:39 +0530
Message-ID: <444b9424-f1e1-2587-6d46-9848478d51e2@arm.com>
In-Reply-To: <410b5235-bbd0-6cff-c361-c25665a854ae@c-s.fr>
List-Id: <oe-lkp.lists.linux.dev>

--===============8311666745894140155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/30/2020 12:04 AM, Christophe Leroy wrote:
> =

> =

> Le 29/04/2020 =C3=A0 20:15, Catalin Marinas a =C3=A9crit=C2=A0:
>> On Wed, Apr 29, 2020 at 08:52:25PM +0800, Chen, Rong A wrote:
>>> On 4/29/2020 11:28 AM, Anshuman Khandual wrote:
>>>> On 04/28/2020 02:51 PM, Catalin Marinas wrote:
>>>>> On Tue, Apr 28, 2020 at 04:41:11AM -0400, Qian Cai wrote:
>>>>>> On Apr 28, 2020, at 1:54 AM, Anshuman Khandual <Anshuman.Khandual@=
arm.com> wrote:
>>>>>>> That is true. There is a slight change in the rules, making it expl=
icit yes
>>>>>>> only when both ARCH_HAS_DEBUG_VM_PGTABLE and DEBUG_VM are enabled.
>>>>>>>
>>>>>>> +config DEBUG_VM_PGTABLE
>>>>>>> +=C2=A0=C2=A0=C2=A0 bool "Debug arch page table for semantics compl=
iance"
>>>>>>> +=C2=A0=C2=A0=C2=A0 depends on MMU
>>>>>>> +=C2=A0=C2=A0=C2=A0 depends on !IA64 && !ARM
>>>>>>> +=C2=A0=C2=A0=C2=A0 depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
>>>>>>> +=C2=A0=C2=A0=C2=A0 default y if ARCH_HAS_DEBUG_VM_PGTABLE && DEBUG=
_VM
>>>>>>> +=C2=A0=C2=A0=C2=A0 help
>>>>>>>
>>>>>>> The default is really irrelevant as the config option can be set ex=
plicitly.
>>>>>> That could also explain. Since not long time ago, it was only =E2=80=
=9Cdefault
>>>>>> y if DEBUG_VM=E2=80=9D, that caused the robot saved a .config with
>>>>>> DEBUG_VM_PGTABLE=3Dy by default.
>>>>>>
>>>>>> Even though you changed the rule recently, it has no effect as the
>>>>>> robot could =E2=80=9Cmake oldconfig=E2=80=9D from the saved config f=
or each linux-next
>>>>>> tree execution and the breakage will go on.
>>>>> I'm not entirely sure that's the case. This report still points at the
>>>>> old commit fa6726c1e7 which has:
>>>>>
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on ARCH_HAS_DEBUG_VM_PG=
TABLE || EXPERT
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default n if !ARCH_HAS_DEBUG_VM=
_PGTABLE
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default y if DEBUG_VM
>>>>>
>>>>> In -next we now have commit 647d9a0de34c and subsequently modified by
>>>>> commit 0a8646638865. So hopefully with the latest -next tree we won't
>>>>> see this report.
>>>> Could some one from LKP test framework, please confirm if this still c=
auses
>>>> above problem on the latest linux-next by default ?
>>>
>>> The .config is a rand config, the problem is still exist if run "make
>>> oldconfig" for the config with commit 0a8646638865.
>>
>> Is randconfig expected to boot? I don't think it is but I guess it
>> should not trigger a BUG_ON during boot.
>>
>>> $ grep -e CONFIG_MMU=3D -e CONFIG_EXPERT=3D -e CONFIG_ARCH_HAS_DEBUG_VM=
_PGTABLE=3D
>>> -e CONFIG_DEBUG_VM=3D .config
>>> CONFIG_EXPERT=3Dy
>>> CONFIG_MMU=3Dy
>>> CONFIG_DEBUG_VM=3Dy
>>>
>>> should we disable DEBUG_VM_PGTABLE by default?
>>
>> If that's the only case where this fails in LKP, I'd rather remove the
>> EXPERT dependency so that it cannot be enabled. Architectures that want
>> to experiment with this feature will have to select
>> ARCH_HAS_DEBUG_VM_PGTABLE explicitly.
>>

Dropping the EXPERT dependency here seems like the best solution even
though I have always tried to avoid that (many times).

> =

> But when something is not selectable, people won't even know it exists

We will probably revisit this option later but for now it is really not
an absolute necessity for the test.

> =

> Why not try and fix the problems reported by the robots instead ?
Enabling all non-enabled platforms will be an ongoing process that will
require support and collaboration from their respective platforms folks.
Similar collaborative approach earlier had enabled successfully test run
on arc, s390, ppc32, ppc64 platforms after starting with just arm64 and
x86.
--===============8311666745894140155==--

