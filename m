Content-Type: multipart/mixed; boundary="===============8432105521627732188=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm] 9b12e49e9b: BUG:Bad_page_state_in_process
Date: Thu, 09 Jun 2022 13:18:50 +0100
Message-ID: <YqHlKj5LbmtYGWUy@casper.infradead.org>
In-Reply-To: <d64da0da-9f71-3ae9-4d72-00b0c42fce5e@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8432105521627732188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 12:42:16PM +0800, Baolin Wang wrote:
> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
> index 6cccf52e156a..cae74e972426 100644
> --- a/arch/x86/mm/pgtable.c
> +++ b/arch/x86/mm/pgtable.c
> @@ -858,6 +858,7 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>         /* INVLPG to clear all paging-structure caches */
>         flush_tlb_kernel_range(addr, addr + PAGE_SIZE-1);
> =

> +       pgtable_clear_and_dec(virt_to_page(pte));
>         free_page((unsigned long)pte);
> =

>         return 1;

If you're going to call virt_to_page() here, you may as well cache the
result and call __free_page(page) to avoid calling virt_to_page() twice.
--===============8432105521627732188==--

