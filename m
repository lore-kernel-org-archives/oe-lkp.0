Content-Type: multipart/mixed; boundary="===============2739857634006124286=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Tue, 28 Apr 2020 09:23:37 +0530
Message-ID: <a7816294-05af-b325-c699-84bb143b3d6a@arm.com>
In-Reply-To: <D30E4C88-408A-438B-803B-D9F8F82D87A7@lca.pw>
List-Id: <oe-lkp.lists.linux.dev>

--===============2739857634006124286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/28/2020 08:21 AM, Qian Cai wrote:
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

Okay, will add X86_PAE to the explicitly disabled list along with
IA64 and ARM.

----
From: Anshuman Khandual <anshuman.khandual@arm.com>
Date: Tue, 28 Apr 2020 04:30:04 +0100
Subject: [PATCH 3/3] mm/debug/pgtable: Completely disable X86_PAE

Completely disable X86_PAE, even via CONFIG_EXPERT.

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6a492e32579a..79e097a2285f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -697,7 +697,7 @@ config DEBUG_VM_PGFLAGS
 config DEBUG_VM_PGTABLE
        bool "Debug arch page table for semantics compliance"
        depends on MMU
-       depends on !IA64 && !ARM
+       depends on !IA64 && !ARM && !X86_PAE
        depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
        default y if ARCH_HAS_DEBUG_VM_PGTABLE && DEBUG_VM
        help
-- =


Hello Andrew/Stephen,

Could you please fold the above patch in linux-next. Also please do
let me know if I should respin the series as well. Thank you.

- Anshuman
--===============2739857634006124286==--

