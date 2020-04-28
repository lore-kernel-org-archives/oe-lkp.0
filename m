Content-Type: multipart/mixed; boundary="===============1079364269887034727=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Tue, 28 Apr 2020 08:05:02 +0530
Message-ID: <096a07fc-4525-feb6-5658-40bcffbd0a58@arm.com>
In-Reply-To: <31CD915D-2E14-4897-AF62-82B6C5FD567A@lca.pw>
List-Id: <oe-lkp.lists.linux.dev>

--===============1079364269887034727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/28/2020 07:35 AM, Qian Cai wrote:
> =

> =

>> On Apr 27, 2020, at 9:49 PM, Anshuman Khandual <Anshuman.Khandual@arm.=
com> wrote:
>>
>> This is an unsupported (enabled via CONFIG_EXPERT) X86 platform (CONFIG_=
X86_PAE)
>> and is known to fail. The latest (V17) patch had moved the test invocati=
on into
>> a late_initcall() per Linus thus pushing down any possible failures (lik=
e this)
>> after early boot. Please ignore this report.
>>
>> Apart from this X86_PAE based config, no other platform failures have re=
ported
>> so far. Assuming that this test robot does have a good platform coverage=
, the
>> CONFIG_EXPERT method of enabling CONFIG_DEBUG_VM_PGTABLE should help in =
getting
>> more platform coverage for this test.
> =

> This sounds really sloppy. Why can=E2=80=99t we make it impossible to sel=
ect this combination if nobody is willing to fix it?

Letting CONFIG_DEBUG_VM_PGTABLE enabled via CONFIG_EXPERT for unsupported
platforms i.e without ARCH_HAS_DEBUG_VM_PGTABLE, was a conscious decision
meant to expand it's adaptability and coverage without requiring any code
(i.e Kconfig) change. The easier it is to enable the test on unsupported
platforms right now, more folks are likely to try it out thus increasing
it's probability to get fixed on those platforms. That is a valid enough
reason to have CONFIG_EXPERT based enablement method, IMHO. Also even with
CONFIG_EXPERT set, CONFIG_DEBUG_VM_PGTABLE does not get enabled by default
automatically.
--===============1079364269887034727==--

