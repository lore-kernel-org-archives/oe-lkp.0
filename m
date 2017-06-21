Content-Type: multipart/mixed; boundary="===============0572622834308066847=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Wed, 21 Jun 2017 21:33:39 +0200
Message-ID: <20170621193338.GA29222@redhat.com>
In-Reply-To: <CA+55aFxzdtZ787snPhLhU8+2xUHKd74Som82yRCiFSQVXCNFhA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0572622834308066847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/21, Linus Torvalds wrote:
>
> Hugh, Michal - I also merged Helge's drop-up cleanup, is there
> anything I've missed? I think Oleg had something, but I can't recall
> right now, and I might just have missed it.

Well, I meant, perhaps we need a bit more changes to ensure that a new
GROWSDOWN vma can't come without a gap below. But this is really minor,
we can do this later even if I am right.

However, there is another regression reported by Cyrill. Fixed by the
patch below.

And yes, I think this check should either go away, or we need to make
it more clever.

In short, the vma created by mmap(MAP_GROWSDOWN) does not grow down
automatically, because of this check.

This worked before, because with the stack guard page at ->vm_start
__do_page_fault() hits this expand-stack path only if the stack grows
by more than PAGE_SIZE, now it is called every time. I'll send the
patch tomorrow if nobody else does this before.

Oleg.
---

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 8ad91a0..edc5d68 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1416,7 +1416,7 @@ __do_page_fault(struct pt_regs *regs, unsigned long e=
rror_code,
 		 * and pusha to work. ("enter $65535, $31" pushes
 		 * 32 pointers and then decrements %sp by 65535.)
 		 */
-		if (unlikely(address + 65536 + 32 * sizeof(unsigned long) < regs->sp)) {
+if (0)		if (unlikely(address + 65536 + 32 * sizeof(unsigned long) < regs->=
sp)) {
 			bad_area(regs, error_code, address);
 			return;
 		}


--===============0572622834308066847==--

