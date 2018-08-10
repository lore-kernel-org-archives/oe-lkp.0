Content-Type: multipart/mixed; boundary="===============1434240066831503929=="
MIME-Version: 1.0
From: Joerg Roedel <jroedel@suse.de>
To: lkp@lists.01.org
Subject: Re: a13c600e15 ("x86/mm/pti: Move user W+X check into .."): WARNING: CPU: 0 PID: 1 at arch/x86/mm/dump_pagetables.c:283 note_page
Date: Fri, 10 Aug 2018 10:35:04 +0200
Message-ID: <20180810083504.55pljlr733lctz5k@suse.de>
In-Reply-To: <5b6cc146.lVmfvLKHKgZxC5d8%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1434240066831503929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2018 at 06:33:42AM +0800, kernel test robot wrote:
> commit a13c600e15de44ccf03df28d3311ef3cb754ed9b
> Author:     Joerg Roedel <jroedel@suse.de>
> AuthorDate: Wed Aug 8 13:16:40 2018 +0200
> Commit:     Thomas Gleixner <tglx@linutronix.de>
> CommitDate: Thu Aug 9 20:42:07 2018 +0200
> =

>     x86/mm/pti: Move user W+X check into pti_finalize()

Okay, I found the problem and the diff below fixes it.

Ingo, Thomas, can you fold that diff into above commit or do you prefer
a separate patch?

Thanks and sorry for the hassle,


       Joerg

diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 026a89aa16d7..d1435c78ae4f 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -629,5 +629,6 @@ void pti_finalize(void)
 	pti_clone_entry_text();
 	pti_clone_kernel_text();
 =

-	debug_checkwx_user();
+	if (__supported_pte_mask & _PAGE_NX)
+		debug_checkwx_user();
 }

--===============1434240066831503929==--

