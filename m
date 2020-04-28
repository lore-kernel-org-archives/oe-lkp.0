Content-Type: multipart/mixed; boundary="===============4701253100356991642=="
MIME-Version: 1.0
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Tue, 28 Apr 2020 07:24:52 +0200
Message-ID: <b3e5d138-9e14-826c-82c9-2cec9bd41ca5@c-s.fr>
In-Reply-To: <D30E4C88-408A-438B-803B-D9F8F82D87A7@lca.pw>
List-Id: <oe-lkp.lists.linux.dev>

--===============4701253100356991642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Le 28/04/2020 =C3=A0 04:51, Qian Cai a =C3=A9crit=C2=A0:
> =

> =

>> On Apr 27, 2020, at 10:35 PM, Anshuman Khandual <Anshuman.Khandual@arm=
.com> wrote:
>>
>> Letting CONFIG_DEBUG_VM_PGTABLE enabled via CONFIG_EXPERT for unsupported
>> platforms i.e without ARCH_HAS_DEBUG_VM_PGTABLE, was a conscious decision
>> meant to expand it's adaptability and coverage without requiring any code
>> (i.e Kconfig) change. The easier it is to enable the test on unsupported
>> platforms right now, more folks are likely to try it out thus increasing
>> it's probability to get fixed on those platforms. That is a valid enough
>> reason to have CONFIG_EXPERT based enablement method, IMHO. Also even wi=
th
>> CONFIG_EXPERT set, CONFIG_DEBUG_VM_PGTABLE does not get enabled by defau=
lt
>> automatically.
> =

> No, I am talking about PAE. There is a distinction between known broken t=
hat nobody cares (like arm32) and in-progress/unknown status (like s390).
> =

> Also, it is not very nice to introduce regressions for robots when testin=
g PAE because they always select CONFIG__EXPERT and CONFIG_DEBUG_VM.
> =


Having CONFIG_EXPERT and CONFIG_DEBUG_VM is not enough to get =

CONFIG_DEBUG_VM_PGTABLE set to yes.

By default, CONFIG_DEBUG_VM_PGTABLE is set to no when =

ARCH_HAS_DEBUG_VM_PGTABLE is not set.

Christophe
--===============4701253100356991642==--

