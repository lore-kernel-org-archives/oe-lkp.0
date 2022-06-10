Content-Type: multipart/mixed; boundary="===============0759090438582743980=="
MIME-Version: 1.0
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: lkp@lists.01.org
Subject: Re: [mm] 9b12e49e9b: BUG:Bad_page_state_in_process
Date: Fri, 10 Jun 2022 11:58:54 +0800
Message-ID: <6351ead6-b4b8-dc43-2c1d-c099094cadc9@linux.alibaba.com>
In-Reply-To: <YqHlKj5LbmtYGWUy@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0759090438582743980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/9/2022 8:18 PM, Matthew Wilcox wrote:
> On Thu, Jun 09, 2022 at 12:42:16PM +0800, Baolin Wang wrote:
>> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
>> index 6cccf52e156a..cae74e972426 100644
>> --- a/arch/x86/mm/pgtable.c
>> +++ b/arch/x86/mm/pgtable.c
>> @@ -858,6 +858,7 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>>          /* INVLPG to clear all paging-structure caches */
>>          flush_tlb_kernel_range(addr, addr + PAGE_SIZE-1);
>>
>> +       pgtable_clear_and_dec(virt_to_page(pte));
>>          free_page((unsigned long)pte);
>>
>>          return 1;
> =

> If you're going to call virt_to_page() here, you may as well cache the
> result and call __free_page(page) to avoid calling virt_to_page() twice.

Right, will do in next version. Thanks.
--===============0759090438582743980==--

