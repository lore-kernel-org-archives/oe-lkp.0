Content-Type: multipart/mixed; boundary="===============3424497663240790093=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Wed, 29 Apr 2020 08:58:02 +0530
Message-ID: <b62c66c8-1550-087f-f5d2-b33a18bb0edc@arm.com>
In-Reply-To: <20200428092105.GB3868@gaia>
List-Id: <oe-lkp.lists.linux.dev>

--===============3424497663240790093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/28/2020 02:51 PM, Catalin Marinas wrote:
> On Tue, Apr 28, 2020 at 04:41:11AM -0400, Qian Cai wrote:
>> On Apr 28, 2020, at 1:54 AM, Anshuman Khandual <Anshuman.Khandual@arm.=
com> wrote:
>>> That is true. There is a slight change in the rules, making it explicit=
 yes
>>> only when both ARCH_HAS_DEBUG_VM_PGTABLE and DEBUG_VM are enabled.
>>>
>>> +config DEBUG_VM_PGTABLE
>>> +    bool "Debug arch page table for semantics compliance"
>>> +    depends on MMU
>>> +    depends on !IA64 && !ARM
>>> +    depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
>>> +    default y if ARCH_HAS_DEBUG_VM_PGTABLE && DEBUG_VM
>>> +    help
>>>
>>> The default is really irrelevant as the config option can be set explic=
itly.
>>
>> That could also explain. Since not long time ago, it was only =E2=80=9Cd=
efault
>> y if DEBUG_VM=E2=80=9D, that caused the robot saved a .config with
>> DEBUG_VM_PGTABLE=3Dy by default.
>>
>> Even though you changed the rule recently, it has no effect as the
>> robot could =E2=80=9Cmake oldconfig=E2=80=9D from the saved config for e=
ach linux-next
>> tree execution and the breakage will go on.
> =

> I'm not entirely sure that's the case. This report still points at the
> old commit fa6726c1e7 which has:
> =

> +       depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> +       default n if !ARCH_HAS_DEBUG_VM_PGTABLE
> +       default y if DEBUG_VM
> =

> In -next we now have commit 647d9a0de34c and subsequently modified by
> commit 0a8646638865. So hopefully with the latest -next tree we won't
> see this report.

Could some one from LKP test framework, please confirm if this still causes
above problem on the latest linux-next by default ?
--===============3424497663240790093==--

