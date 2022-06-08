Content-Type: multipart/mixed; boundary="===============7766068731610638876=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm] 9b12e49e9b: BUG:Bad_page_state_in_process
Date: Wed, 08 Jun 2022 16:07:23 +0100
Message-ID: <YqC7K0e2FFp7vT6i@casper.infradead.org>
In-Reply-To: <20220608143819.GA31193@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7766068731610638876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 10:38:19PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 9b12e49e9b02bbaca8041f236a6b2fd4586d45c8 ("[RFC PATCH 3/3] mm: Ad=
d kernel PTE level pagetable pages account")

> [   75.338681][ T4873] BUG: Bad page state in process 444  pfn:20b066
> [   75.338840][ T4873] page:0000000016cf0259 refcount:0 mapcount:-512 map=
ping:0000000000000000 index:0x0 pfn:0x20b066

mapcount:-512 is PG_table.  Somebody forgot to call
pgtable_pte_page_dtor() (or similar)

> [   75.339041][ T4873] flags: 0x17ffffc0000000(node=3D0|zone=3D2|lastcpup=
id=3D0x1fffff)
> [   75.339190][ T4873] raw: 0017ffffc0000000 dead000000000100 dead0000000=
00122 0000000000000000
> [   75.339350][ T4873] raw: 0000000000000000 0000000000000000 00000000fff=
ffdff 0000000000000000
> [   75.339508][ T4873] page dumped because: nonzero mapcount
> [   75.341013][ T4873] Call Trace:
> [   75.341080][ T4873]  <TASK>
> [ 75.341142][ T4873] dump_stack_lvl (lib/dump_stack.c:107 (discriminator =
1)) =

> [ 75.341236][ T4873] bad_page.cold (mm/page_alloc.c:637) =

> [ 75.341326][ T4873] free_pcppages_bulk (mm/page_alloc.c:1511) =

> [ 75.341428][ T4873] free_unref_page (arch/x86/include/asm/irqflags.h:137=
 mm/page_alloc.c:3444) =

> [ 75.341524][ T4873] __mmdrop (arch/x86/include/asm/mmu_context.h:125 (di=
scriminator 3) kernel/fork.c:791 (discriminator 3)) =

> [ 75.341608][ T4873] ? __mmput (arch/x86/include/asm/atomic.h:123 include=
/linux/atomic/atomic-instrumented.h:576 include/linux/sched/mm.h:49 kernel/=
fork.c:1194) =

> [ 75.341889][ T4873] exec_mmap (fs/exec.c:1035) =

> [ 75.341977][ T4873] begin_new_exec (fs/exec.c:1293) =

> [ 75.342071][ T4873] ? kernel_read (fs/read_write.c:455) =

> [ 75.342160][ T4873] load_elf_binary (fs/binfmt_elf.c:1002)=20
--===============7766068731610638876==--

