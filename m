Content-Type: multipart/mixed; boundary="===============7387972041654633005=="
MIME-Version: 1.0
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: lkp@lists.01.org
Subject: Re: 87c4696d57 ("mm/debug: Add tests validating architecture page .."): [ 1.395296] kernel BUG at include/linux/mm.h:2007!
Date: Fri, 24 Jan 2020 09:52:55 +0100
Message-ID: <1077e260-d2c3-fcc6-1150-fb46b6273db3@c-s.fr>
In-Reply-To: <78f5a3f0-7098-0cd9-130d-393c0384b89a@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7387972041654633005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Le 24/01/2020 =C3=A0 08:17, Anshuman Khandual a =C3=A9crit=C2=A0:
> =

> On 01/07/2020 12:00 PM, Rong Chen wrote:
>>
>>
>> On 1/7/20 1:57 PM, Anshuman Khandual wrote:
>>> On 12/26/2019 02:19 PM, kernel test robot wrote:
> 	...............................................
>          p4d_free(mm, saved_p4dp);
>          pud_free(mm, saved_pudp);
>          pmd_free(mm, saved_pmdp);
>          pte_free(mm, saved_ptep);
>          mm_dec_nr_puds(mm);
>          mm_dec_nr_pmds(mm);
>          mm_dec_nr_ptes(mm);
>          __mmdrop(mm);
> 	..............................................
> =


You should use mmdrop() instead of __mmdrop(), shouldn't you ?

Christophe
--===============7387972041654633005==--

