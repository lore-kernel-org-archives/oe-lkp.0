Content-Type: multipart/mixed; boundary="===============8456183922987519939=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/cpa] c77d419f92: WARNING:at_arch/x86/mm/pageattr.c:#__change_page_attr_set_clr
Date: Mon, 17 Sep 2018 13:05:22 +0200
Message-ID: <alpine.DEB.2.21.1809171258560.16580@nanos.tec.linutronix.de>
In-Reply-To: <20180917003127.GJ7632@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8456183922987519939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Sep 2018, kernel test robot wrote:
>
> [    5.168861] WARNING: CPU: 0 PID: 1 at arch/x86/mm/pageattr.c:829 __cha=
nge_page_attr_set_clr+0x324/0x7b8

> [    5.172255] EIP: __change_page_attr_set_clr+0x324/0x7b8
> [    5.178966]  change_page_attr_set_clr+0x101/0x29c
> [    5.179497]  ? preempt_count_add+0x5b/0x8c
> [    5.179953]  set_memory_ro+0x19/0x1b
> [    5.180356]  set_pages_ro+0x14/0x16
> [    5.180757]  mark_rodata_ro+0x73/0xa5

That's caused by 32bit mark_rodata_ro() doing:

       set_ro(kernel_text)
       kernel_set_to_readonly =3D 1;
       set_ro(rodata);

kernel_set_to_readonly enables the protection mechanism in CPA and
consequently triggers the WARN_ON() telling that the existing PTE/PMD is
incorrect vs. static protections.

64bit does not trigger this because it makes kernel text and rodata
readonly in one go. There is no real reasons not to do so on 32bit, so the
fix is obvious.

Thanks,

	tglx

8<------------------
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -923,34 +923,19 @@ static void mark_nxdata_nx(void)
 void mark_rodata_ro(void)
 {
 	unsigned long start =3D PFN_ALIGN(_text);
-	unsigned long size =3D PFN_ALIGN(_etext) - start;
+	unsigned long size =3D (unsigned long)__end_rodata - start;
 =

 	set_pages_ro(virt_to_page(start), size >> PAGE_SHIFT);
-	printk(KERN_INFO "Write protecting the kernel text: %luk\n",
+	pr_info("Write protecting kernel text and read-only data: %luk\n",
 		size >> 10);
 =

 	kernel_set_to_readonly =3D 1;
 =

 #ifdef CONFIG_CPA_DEBUG
-	printk(KERN_INFO "Testing CPA: Reverting %lx-%lx\n",
-		start, start+size);
-	set_pages_rw(virt_to_page(start), size>>PAGE_SHIFT);
-
-	printk(KERN_INFO "Testing CPA: write protecting again\n");
-	set_pages_ro(virt_to_page(start), size>>PAGE_SHIFT);
-#endif
-
-	start +=3D size;
-	size =3D (unsigned long)__end_rodata - start;
-	set_pages_ro(virt_to_page(start), size >> PAGE_SHIFT);
-	printk(KERN_INFO "Write protecting the kernel read-only data: %luk\n",
-		size >> 10);
-
-#ifdef CONFIG_CPA_DEBUG
-	printk(KERN_INFO "Testing CPA: undo %lx-%lx\n", start, start + size);
+	pr_info("Testing CPA: Reverting %lx-%lx\n", start, start + size);
 	set_pages_rw(virt_to_page(start), size >> PAGE_SHIFT);
 =

-	printk(KERN_INFO "Testing CPA: write protecting again\n");
+	pr_info("Testing CPA: write protecting again\n");
 	set_pages_ro(virt_to_page(start), size >> PAGE_SHIFT);
 #endif
 	mark_nxdata_nx();



--===============8456183922987519939==--

