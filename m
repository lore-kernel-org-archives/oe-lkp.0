Content-Type: multipart/mixed; boundary="===============6840785533989748203=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Tue, 20 Jun 2017 19:41:40 -0700
Message-ID: <alpine.LSU.2.11.1706201937340.14450@eggly.anvils>
In-Reply-To: <20170621023552.GB32082@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6840785533989748203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jun 2017, kernel test robot wrote:

> =

> FYI, we noticed the following commit:
> =

> commit: 1be7107fbe18eed3e319a6c3e83c78254b693acb ("mm: larger stack guard=
 gap, between vmas")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | 1132d5e7b6 | 1be7107fbe |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 5          | 4          |
> | boot_failures                            | 0          | 4          |
> | kernel_BUG_at_mm/mmap.c                  | 0          | 4          |
> | invalid_opcode:#[##]                     | 0          | 4          |
> | EIP:unmapped_area_topdown                | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 4          |
> +------------------------------------------+------------+------------+
> =

> =

> =

> [   87.792040] kernel BUG at mm/mmap.c:1963!
> [   87.793442] invalid opcode: 0000 [#1] DEBUG_PAGEALLOC
> [   87.794812] Modules linked in:
> [   87.795849] CPU: 0 PID: 424 Comm: trinity-c2 Not tainted 4.12.0-rc5-00=
285-g1be7107f #1
> [   87.798138] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   87.800657] task: ce6177c0 task.stack: cd0fc000
> [   87.801877] EIP: unmapped_area_topdown+0x14b/0x15c
> [   87.803063] EFLAGS: 00010206 CPU: 0
> [   87.804075] EAX: 00000000 EBX: b5200000 ECX: 00000000 EDX: b4feb000
> [   87.805469] ESI: 00201000 EDI: b4feb000 EBP: cd0fde84 ESP: cd0fde60
> [   87.806872]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
> [   87.808182] CR0: 80050033 CR2: 00000004 CR3: 0d098c60 CR4: 000006b0
> [   87.809558] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [   87.810919] DR6: fffe0ff0 DR7: 00000400
> [   87.812002] Call Trace:
> [   87.812857]  arch_get_unmapped_area_topdown+0x74/0x11f
> [   87.814011]  ? arch_get_unmapped_area+0xb4/0xb4
> [   87.815095]  get_unmapped_area+0x5b/0xae
> [   87.816103]  do_mmap+0xc7/0x2ac
> [   87.817061]  vm_mmap_pgoff+0x6b/0x94
> [   87.818080]  SYSC_mmap_pgoff+0x13f/0x162
> [   87.819004]  SyS_mmap_pgoff+0x1a/0x1c
> [   87.819873]  do_int80_syscall_32+0x65/0x79
> [   87.820791]  entry_INT80_32+0x2a/0x2a
> [   87.821710] EIP: 0x8090aa2
> [   87.822490] EFLAGS: 00000246 CPU: 0
> [   87.823345] EAX: ffffffda EBX: 00000000 ECX: 00201000 EDX: 00000003
> [   87.824489] ESI: 00000022 EDI: ffffffff EBP: 00000000 ESP: bff1c8c8
> [   87.825650]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
> [   87.826735] Code: 31 c9 e8 20 15 fb ff 39 7d ec 5a 76 02 0f 0b 31 d2 6=
a 00 39 fb 0f 97 c2 b8 c0 db b1 c1 31 c9 e8 03 15 fb ff 39 fb 89 fa 58 76 0=
7 <0f> 0b ba f4 ff ff ff 8d 65 f4 89 d0 5b 5e 5f 5d c3 55 89 e5 56
> [   87.830175] EIP: unmapped_area_topdown+0x14b/0x15c SS:ESP: 0068:cd0fde=
60
> [   87.831396] ---[ end trace 67da11e70888e7ec ]---
> =

> =

> To reproduce:
> =

>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email

Thanks for the report: yes, this is the same one as Dave Jones
found yesterday, which is fixed by this patch posted last night:

[PATCH] mm: fix new crash in unmapped_area_topdown()

Trinity gets kernel BUG at mm/mmap.c:1963! in about 3 minutes of
mmap testing.  That's the VM_BUG_ON(gap_end < gap_start)@the
end of unmapped_area_topdown().  Linus points out how MAP_FIXED
(which does not have to respect our stack guard gap intentions)
could result in gap_end below gap_start there.  Fix that, and
the similar case in its alternative, unmapped_area().

Fixes: 1be7107fbe18 ("mm: larger stack guard gap, between vmas")
Reported-by: Dave Jones <davej@codemonkey.org.uk>
Debugged-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Hugh Dickins <hughd@google.com>
---

 mm/mmap.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- 4.12-rc6/mm/mmap.c	2017-06-19 09:06:10.035407505 -0700
+++ linux/mm/mmap.c	2017-06-19 21:09:28.616707311 -0700
@@ -1817,7 +1817,8 @@ unsigned long unmapped_area(struct vm_un
 		/* Check if current node has a suitable gap */
 		if (gap_start > high_limit)
 			return -ENOMEM;
-		if (gap_end >=3D low_limit && gap_end - gap_start >=3D length)
+		if (gap_end >=3D low_limit &&
+		    gap_end > gap_start && gap_end - gap_start >=3D length)
 			goto found;
 =

 		/* Visit right subtree if it looks promising */
@@ -1920,7 +1921,8 @@ unsigned long unmapped_area_topdown(stru
 		gap_end =3D vm_start_gap(vma);
 		if (gap_end < low_limit)
 			return -ENOMEM;
-		if (gap_start <=3D high_limit && gap_end - gap_start >=3D length)
+		if (gap_start <=3D high_limit &&
+		    gap_end > gap_start && gap_end - gap_start >=3D length)
 			goto found;
 =

 		/* Visit left subtree if it looks promising */

--===============6840785533989748203==--

