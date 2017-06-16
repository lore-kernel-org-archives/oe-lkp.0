Content-Type: multipart/mixed; boundary="===============5605928734817327341=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: c88d71508e ("x86/boot/64: Rewrite startup_64() in C"): BUG: kernel reboot-without-warning in early-boot stage, last printk: Booting the kernel.
Date: Fri, 16 Jun 2017 14:30:24 +0300
Message-ID: <20170616113024.ajmif63cmcszry5a@black.fi.intel.com>
In-Reply-To: <20170616081630.mvc52ku6spchsqj4@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5605928734817327341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2017 at 10:16:30AM +0200, Ingo Molnar wrote:
> =

> * kernel test robot <fengguang.wu@intel.com> wrote:
> =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> > =

> > commit c88d71508e36b514413464bd2e01f96f34583a0e
> > Author:     Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > AuthorDate: Tue Jun 6 14:31:26 2017 +0300
> > Commit:     Ingo Molnar <mingo@kernel.org>
> > CommitDate: Tue Jun 13 08:56:54 2017 +0200
> > =

> >     x86/boot/64: Rewrite startup_64() in C
> >     =

> >     The patch write most of startup_64 logic in C.
> >     =

> >     This is preparation for 5-level paging enabling.
> >     =

> >     Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.co=
m>
> =

> Kirill, should I drop the 5-level paging series for now, or is there a fi=
x in the =

> works?

The patch below works for me, but I don't really understant all details of
how linking kernel image works.

Please double check that it makes sense.

>From b8c7201e97bbe86e88401376338ed92a5a53859e Mon Sep 17 00:00:00 2001
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Date: Fri, 16 Jun 2017 14:15:44 +0300
Subject: [PATCH] x86/boot/64: Put __startup_64() into .head.text

Put __startup_64() and fixup_pointer() into .head.text section to make
sure it's always near startup_64 and always callable.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/kernel/head64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 2b2ac381195a..46c3c73e7f43 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -38,12 +38,14 @@ extern pmd_t early_dynamic_pgts[EARLY_DYNAMIC_PAGE_TABL=
ES][PTRS_PER_PMD];
 static unsigned int __initdata next_early_pgt;
 pmdval_t early_pmd_flags =3D __PAGE_KERNEL_LARGE & ~(_PAGE_GLOBAL | _PAGE_=
NX);
 =

-static void __init *fixup_pointer(void *ptr, unsigned long physaddr)
+#define __head	__section(.head.text)
+
+static void __head *fixup_pointer(void *ptr, unsigned long physaddr)
 {
 	return ptr - (void *)_text + (void *)physaddr;
 }
 =

-void __init __startup_64(unsigned long physaddr)
+void __head __startup_64(unsigned long physaddr)
 {
 	unsigned long load_delta, *p;
 	pgdval_t *pgd;
-- =

 Kirill A. Shutemov

--===============5605928734817327341==--

