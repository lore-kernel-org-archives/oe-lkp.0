Content-Type: multipart/mixed; boundary="===============5857143648214906687=="
MIME-Version: 1.0
From: gregkh@linuxfoundation.org
To: lkp@lists.01.org
Subject: Patch "mm: Fix false-positive VM_BUG_ON() in page_cache_{get, add}_speculative()" has been added to the 3.18-stable tree
Date: Mon, 19 Mar 2018 10:13:09 +0100
Message-ID: <152145078913724@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5857143648214906687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


This is a note to let you know that I've just added the patch titled

    mm: Fix false-positive VM_BUG_ON() in page_cache_{get,add}_speculative()

to the 3.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=3Dlinux/kernel/git/stable/stable-queue.git=
;a=3Dsummary

The filename of the patch is:
     mm-fix-false-positive-vm_bug_on-in-page_cache_-get-add-_speculative.pa=
tch
and it can be found in the queue-3.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From foo(a)baz Mon Mar 19 10:11:52 CET 2018
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Date: Fri, 24 Mar 2017 14:13:05 +0300
Subject: mm: Fix false-positive VM_BUG_ON() in page_cache_{get,add}_specula=
tive()

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>


[ Upstream commit 591a3d7c09fa08baff48ad86c2347dbd28a52753 ]

0day testing by Fengguang Wu triggered this crash while running Trinity:

  kernel BUG at include/linux/pagemap.h:151!
  ...
  CPU: 0 PID: 458 Comm: trinity-c0 Not tainted 4.11.0-rc2-00251-g2947ba0 #1
  ...
  Call Trace:
   __get_user_pages_fast()
   get_user_pages_fast()
   get_futex_key()
   futex_requeue()
   do_futex()
   SyS_futex()
   do_syscall_64()
   entry_SYSCALL64_slow_path()

It' VM_BUG_ON() due to false-negative in_atomic(). We call
page_cache_get_speculative() with disabled local interrupts.
It should be atomic enough.

So let's check for disabled interrupts in the VM_BUG_ON() condition
too, to resolve this.

( This got triggered by the conversion of the x86 GUP code to the
  generic GUP code. )

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Cc: LKP <lkp@01.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mm(a)kvack.org
Link: http://lkml.kernel.org/r/20170324114709.pcytvyb3d6ajux33(a)black.fi.i=
ntel.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/pagemap.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -146,7 +146,7 @@ static inline int page_cache_get_specula
 =

 #ifdef CONFIG_TINY_RCU
 # ifdef CONFIG_PREEMPT_COUNT
-	VM_BUG_ON(!in_atomic());
+	VM_BUG_ON(!in_atomic() && !irqs_disabled());
 # endif
 	/*
 	 * Preempt must be disabled here - we rely on rcu_read_lock doing
@@ -184,7 +184,7 @@ static inline int page_cache_add_specula
 =

 #if !defined(CONFIG_SMP) && defined(CONFIG_TREE_RCU)
 # ifdef CONFIG_PREEMPT_COUNT
-	VM_BUG_ON(!in_atomic());
+	VM_BUG_ON(!in_atomic() && !irqs_disabled());
 # endif
 	VM_BUG_ON_PAGE(page_count(page) =3D=3D 0, page);
 	atomic_add(count, &page->_count);


Patches currently in stable-queue which might be from kirill.shutemov(a)lin=
ux.intel.com are

queue-3.18/mm-fix-false-positive-vm_bug_on-in-page_cache_-get-add-_speculat=
ive.patch

--===============5857143648214906687==--

