Content-Type: multipart/mixed; boundary="===============2381902288100573786=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 13:04:50 -0600
Message-ID: <CAOUHufZ4o4zmW_PyRCXWmBj4OVgVJdC6h1wZsJFMWpGxpzyGdg@mail.gmail.com>
In-Reply-To: <20210414155130.GU3762101@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2381902288100573786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 9:51 AM Andi Kleen <ak@linux.intel.com> wrote:
>
> >    2) It will not scan PTE tables under non-leaf PMD entries that do not
> >       have the accessed bit set, when
> >       CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
>
> This assumes  that workloads have reasonable locality. Could there
> be a worst case where only one or two pages in each PTE are used,
> so this PTE skipping trick doesn't work?

Hi Andi,

Yes, it does make that assumption. And yes, there could. AFAIK, only
x86 supports this.

I wrote a crude test to verify this, and it maps exactly one page
within each PTE table. And I found page table scanning didn't
underperform the rmap:

https://lore.kernel.org/linux-mm/YHFuL%2FDdtiml4biw(a)google.com/#t

The reason (sorry for repeating this) is page table scanning is conditional:

bool should_skip_mm()
{
    ...
    /* leave the legwork to the rmap if mapped pages are too sparse */
    if (RSS < mm_pgtables_bytes(mm) / PAGE_SIZE)
        return true;
    ....
}

We fall back to the rmap when it's obviously not smart to do so. There
is still a lot of room for improvement in this function though, i.e.,
it should be per VMA and NUMA aware.

Note that page table scanning doesn't replace the existing rmap scan.
It's complementary, and it happens when there is a good chance that
most of the pages on a system under pressure have been referenced.
IOW, scanning them one by one with the rmap would cost more than
scanning them all@once via page tables.

Sounds reasonable?

Thanks.
--===============2381902288100573786==--

