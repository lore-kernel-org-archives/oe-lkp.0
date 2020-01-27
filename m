Content-Type: multipart/mixed; boundary="===============2170851785124655475=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: 87c4696d57 ("mm/debug: Add tests validating architecture page .."): [ 1.395296] kernel BUG at include/linux/mm.h:2007!
Date: Mon, 27 Jan 2020 13:34:50 +0530
Message-ID: <628ec098-9343-5b92-7bca-ad330533e828@arm.com>
In-Reply-To: <1077e260-d2c3-fcc6-1150-fb46b6273db3@c-s.fr>
List-Id: <oe-lkp.lists.linux.dev>

--===============2170851785124655475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 01/24/2020 02:22 PM, Christophe Leroy wrote:
> =

> =

> Le 24/01/2020 =C3=A0 08:17, Anshuman Khandual a =C3=A9crit=C2=A0:
>>
>> On 01/07/2020 12:00 PM, Rong Chen wrote:
>>>
>>>
>>> On 1/7/20 1:57 PM, Anshuman Khandual wrote:
>>>> On 12/26/2019 02:19 PM, kernel test robot wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0...............................................
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p4d_free(mm, saved_p4dp=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pud_free(mm, saved_pudp=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmd_free(mm, saved_pmdp=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_free(mm, saved_ptep=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm_dec_nr_puds(mm);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm_dec_nr_pmds(mm);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm_dec_nr_ptes(mm);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __mmdrop(mm);
>> =C2=A0=C2=A0=C2=A0=C2=A0..............................................
>>
> =

> You should use mmdrop() instead of __mmdrop(), shouldn't you ?

Yes, though I am afraid that it does not change much as mm->mm_count
gets initialized to 1 through mm_alloc()->mm_init(). But will fix
this next time around.

Coming back to the original problem, seems like both the reported bugs
are probably related and because of CONFIG_X86_PAE. On X86 PAE systems,
there are these additional user and kernel PMD pages which are stored
in the page table (PREALLOCATED_USER_PMDS and MAX_PREALLOCATED_PMDS).

pgd_alloc()
	preallocate_pmds()
		__get_free_page()
		pgtable_pmd_page_ctor()
	pgd_prepopulate_pmd()
		p4d =3D p4d_offset(pgd, 0);
        	pud =3D pud_offset(p4d, 0);
		pud_populate(mm, pud, pmd);	/* For each pre-allocated PMD */

The test case explicitly allocates and frees intermittent level page
table pages for any given vaddr. So when __mmdrop() --> pgd_free() -->
mop_up_pmds() --> mop_up_one_pmd() --> pmd_free(), it tries to free some
possible garbage memory (probably caused by the test case) and hits
VM_BUG_ON().

The test assumes a bare bones page table to conduct the test and the PAE
based page table setup violates that assumption. Will disable this test
on x86 platform when CONFIG_X86_PAE is enabled.

> =

> Christophe
>=20
--===============2170851785124655475==--

