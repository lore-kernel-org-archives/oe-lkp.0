Content-Type: multipart/mixed; boundary="===============3749637464381955674=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] ed9f007ee6: -- System halted
Date: Tue, 28 Jun 2016 13:43:54 +0800
Message-ID: <20160628054354.GA9620@yexl-desktop>
In-Reply-To: <CAE9FiQWoNoHF0zVsXwudU3iyNYAt8rnbf64Pk-2pVUq3AB1COQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3749637464381955674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 11:59:37AM -0700, Yinghai Lu wrote:
>output is:
>
>early console in setup code
>early console in extract_kernel
>input_data: 0x0000000008fbb276
>input_len: 0x00000000018c6e00
>output: 0x0000000001000000
>output_len: 0x0000000009867c98
>kernel_total_size: 0x0000000008769000
>booted via startup_32()
>Physical KASLR using RDTSC...
>Virtual KASLR using RDTSC...
>
>Decompressing Linux...
>
>XZ-compressed data is corrupt
>
> -- System halted
>
>Can you apply attached debug patch and send out dmesg?

There are 4 patches you attached, do you mean to apply them all based on
commit ed9f007ee6? I tried and seemed they can't apply clearly on it.

Thanks,
Xiaolong

>---
> arch/x86/boot/compressed/misc.c      |   24 ------------------------
> arch/x86/boot/compressed/misc.h      |   10 ----------
> arch/x86/boot/compressed/pagetable.c |    2 --
> 3 files changed, 36 deletions(-)
>
>Index: linux-2.6/arch/x86/boot/compressed/misc.c
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>--- linux-2.6.orig/arch/x86/boot/compressed/misc.c
>+++ linux-2.6/arch/x86/boot/compressed/misc.c
>@@ -152,23 +152,6 @@ void __putstr(const char *s)
> 	outb(0xff & (pos >> 1), vidport+1);
> }
> =

>-void __puthex(unsigned long value)
>-{
>-	char alpha[2] =3D "0";
>-	int bits;
>-
>-	for (bits =3D sizeof(value) * 8 - 4; bits >=3D 0; bits -=3D 4) {
>-		unsigned long digit =3D (value >> bits) & 0xf;
>-
>-		if (digit < 0xA)
>-			alpha[0] =3D '0' + digit;
>-		else
>-			alpha[0] =3D 'a' + (digit - 0xA);
>-
>-		__putstr(alpha);
>-	}
>-}
>-
> #if CONFIG_X86_NEED_RELOCS
> static void handle_relocations(void *output, unsigned long output_len,
> 			       unsigned long virt_addr)
>@@ -365,13 +348,6 @@ asmlinkage __visible void *extract_kerne
> 	free_mem_ptr     =3D heap;	/* Heap */
> 	free_mem_end_ptr =3D heap + BOOT_HEAP_SIZE;
> =

>-	/* Report initial kernel position details. */
>-	debug_putaddr(input_data);
>-	debug_putaddr(input_len);
>-	debug_putaddr(output);
>-	debug_putaddr(output_len);
>-	debug_putaddr(kernel_total_size);
>-
> 	/*
> 	 * The memory hole needed for the kernel is the larger of either
> 	 * the entire decompressed kernel plus relocation table, or the
>Index: linux-2.6/arch/x86/boot/compressed/misc.h
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>--- linux-2.6.orig/arch/x86/boot/compressed/misc.h
>+++ linux-2.6/arch/x86/boot/compressed/misc.h
>@@ -34,27 +34,17 @@ extern memptr free_mem_ptr;
> extern memptr free_mem_end_ptr;
> extern struct boot_params *boot_params;
> void __putstr(const char *s);
>-void __puthex(unsigned long value);
> #define error_putstr(__x)  __putstr(__x)
> #define error_puthex(__x)  __puthex(__x)
> =

> #ifdef CONFIG_X86_VERBOSE_BOOTUP
> =

> #define debug_putstr(__x)  __putstr(__x)
>-#define debug_puthex(__x)  __puthex(__x)
>-#define debug_putaddr(__x) { \
>-		debug_putstr(#__x ": 0x"); \
>-		debug_puthex((unsigned long)(__x)); \
>-		debug_putstr("\n"); \
>-	}
> =

> #else
> =

> static inline void debug_putstr(const char *s)
> { }
>-static inline void debug_puthex(const char *s)
>-{ }
>-#define debug_putaddr(x) /* */
> =

> #endif
> =

>Index: linux-2.6/arch/x86/boot/compressed/pagetable.c
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>--- linux-2.6.orig/arch/x86/boot/compressed/pagetable.c
>+++ linux-2.6/arch/x86/boot/compressed/pagetable.c
>@@ -45,8 +45,6 @@ static void *alloc_pgt_page(void *contex
> 	/* Validate there is space available for a new page. */
> 	if (pages->pgt_buf_offset >=3D pages->pgt_buf_size) {
> 		debug_putstr("out of pgt_buf in " __FILE__ "!?\n");
>-		debug_putaddr(pages->pgt_buf_offset);
>-		debug_putaddr(pages->pgt_buf_size);
> 		return NULL;
> 	}
> =


>Subject: [PATCH] x86, boot: Add printf support for early console in compre=
ssed/misc.c
>
>Reuse printf.c in x86 setup code.
>
>Later decompresser code could print out more info for debug info.
>
>Signed-off-by: Yinghai Lu <yinghai@kernel.org>
>
>---
> arch/x86/boot/compressed/Makefile    |    1 +
> arch/x86/boot/compressed/misc.h      |    7 +++++++
> arch/x86/boot/compressed/pagetable.c |    4 ++++
> arch/x86/boot/compressed/printf.c    |    5 +++++
> 4 files changed, 17 insertions(+)
>
>Index: linux-2.6/arch/x86/boot/compressed/Makefile
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>--- linux-2.6.orig/arch/x86/boot/compressed/Makefile
>+++ linux-2.6/arch/x86/boot/compressed/Makefile
>@@ -73,6 +73,7 @@ vmlinux-objs-y :=3D $(obj)/vmlinux.lds $(o
> 	$(obj)/string.o $(obj)/cmdline.o $(obj)/error.o \
> 	$(obj)/piggy.o $(obj)/cpuflags.o
> =

>+vmlinux-objs-$(CONFIG_X86_VERBOSE_BOOTUP) +=3D $(obj)/printf.o
> vmlinux-objs-$(CONFIG_EARLY_PRINTK) +=3D $(obj)/early_serial_console.o
> vmlinux-objs-$(CONFIG_RANDOMIZE_BASE) +=3D $(obj)/kaslr.o
> ifdef CONFIG_X86_64
>Index: linux-2.6/arch/x86/boot/compressed/printf.c
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>--- /dev/null
>+++ linux-2.6/arch/x86/boot/compressed/printf.c
>@@ -0,0 +1,5 @@
>+#include "misc.h"
>+
>+#define puts(__x)  __putstr(__x)
>+
>+#include "../printf.c"
>Index: linux-2.6/arch/x86/boot/compressed/misc.h
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>--- linux-2.6.orig/arch/x86/boot/compressed/misc.h
>+++ linux-2.6/arch/x86/boot/compressed/misc.h
>@@ -37,14 +37,21 @@ void __putstr(const char *s);
> #define error_putstr(__x)  __putstr(__x)
> #define error_puthex(__x)  __puthex(__x)
> =

>+/* printf.c */
>+int sprintf(char *buf, const char *fmt, ...);
>+int printf(const char *fmt, ...);
>+
> #ifdef CONFIG_X86_VERBOSE_BOOTUP
> =

> #define debug_putstr(__x)  __putstr(__x)
>+#define debug_printf printf
> =

> #else
> =

> static inline void debug_putstr(const char *s)
> { }
>+static inline int debug_printf(const char *fmt, ...)
>+{ }
> =

> #endif
> =


>Subject: [PATCH] x86, boot: Add print out for input/output info early cons=
ole in compressed/misc.c
>
>Use printf to print out decompress_kernel input and output info.
>
>Signed-off-by: Yinghai Lu <yinghai@kernel.org>
>
>---
> arch/x86/boot/compressed/misc.c |   42 ++++++++++++++++++++++++++++++++++=
++++--
> 1 file changed, 40 insertions(+), 2 deletions(-)
>
>Index: linux-2.6/arch/x86/boot/compressed/misc.c
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>--- linux-2.6.orig/arch/x86/boot/compressed/misc.c
>+++ linux-2.6/arch/x86/boot/compressed/misc.c
>@@ -322,6 +322,8 @@ asmlinkage __visible void *extract_kerne
> {
> 	const unsigned long kernel_total_size =3D VO__end - VO__text;
> 	unsigned long virt_addr =3D (unsigned long)output;
>+	unsigned long output_run_size =3D max(output_len, kernel_total_size);
>+	unsigned long init_size;
> =

> 	/* Retain x86 boot parameters pointer passed from startup_32/64. */
> 	boot_params =3D rmode;
>@@ -348,6 +350,37 @@ asmlinkage __visible void *extract_kerne
> 	free_mem_ptr     =3D heap;	/* Heap */
> 	free_mem_end_ptr =3D heap + BOOT_HEAP_SIZE;
> =

>+	init_size =3D boot_params->hdr.init_size;
>+	debug_putstr("decompress_kernel:\n");
>+	debug_printf("       input: [0x%010lx-0x%010lx]\n",
>+		 (unsigned long)input_data,
>+		 (unsigned long)input_data + input_len - 1);
>+	debug_printf("      output: [0x%010lx-0x%010lx] 0x%08lx: output_len\n",
>+		 (unsigned long)output,
>+		 (unsigned long)output + output_len - 1,
>+		 (unsigned long)output_len);
>+	debug_printf("              [0x%010lx-0x%010lx] 0x%08lx: run_size\n",
>+		 (unsigned long)output,
>+		 (unsigned long)output + kernel_total_size - 1,
>+		 (unsigned long)kernel_total_size);
>+	debug_printf("              [0x%010lx-0x%010lx] 0x%08lx: output_run_size=
\n",
>+		 (unsigned long)output,
>+		 (unsigned long)output + output_run_size - 1,
>+		 (unsigned long)output_run_size);
>+	debug_printf("              [0x%010lx-0x%010lx] 0x%08lx: init_size\n",
>+		 (unsigned long)output,
>+		 (unsigned long)output + init_size - 1,
>+		 (unsigned long)init_size);
>+	debug_printf("ZO text/data: [0x%010lx-0x%010lx]\n",
>+		 (unsigned long)input_data + input_len,
>+		 (unsigned long)output + init_size - 1);
>+	debug_printf("     ZO heap: [0x%010lx-0x%010lx]\n",
>+		 (unsigned long)heap,
>+		 (unsigned long)heap + BOOT_HEAP_SIZE - 1);
>+	debug_printf("  VO bss/brk: [0x%010lx-0x%010lx]\n",
>+		 (unsigned long)output + (VO___bss_start - VO__text),
>+		 (unsigned long)output + kernel_total_size - 1);
>+
> 	/*
> 	 * The memory hole needed for the kernel is the larger of either
> 	 * the entire decompressed kernel plus relocation table, or the
>@@ -355,8 +388,13 @@ asmlinkage __visible void *extract_kerne
> 	 */
> 	choose_random_location((unsigned long)input_data, input_len,
> 				(unsigned long *)&output,
>-				max(output_len, kernel_total_size),
>-				&virt_addr);
>+				output_run_size, &virt_addr);
>+
>+	if ((unsigned long)output !=3D virt_addr)
>+		debug_printf("  new output: [0x%010lx-0x%010lx] 0x%08lx: output_run_siz=
e\n",
>+			 virt_addr,
>+			 virt_addr + output_run_size - 1,
>+			 output_run_size);
> =

> 	/* Validate memory location choices. */
> 	if ((unsigned long)output & (MIN_KERNEL_ALIGN - 1))

>Subject: [PATCH] x86, boot: Add more debug printout in compressed/misc.c
>
>with support that use printf.c in x86 setup code.
>print out more info for debug info.
>
>Signed-off-by: Yinghai Lu <yinghai@kernel.org>
>
>
>---
> arch/x86/boot/compressed/misc.c |   12 +++++++++++-
> 1 file changed, 11 insertions(+), 1 deletion(-)
>
>Index: linux-2.6/arch/x86/boot/compressed/misc.c
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>--- linux-2.6.orig/arch/x86/boot/compressed/misc.c
>+++ linux-2.6/arch/x86/boot/compressed/misc.c
>@@ -287,7 +287,7 @@ static void parse_elf(void *output)
> 		return;
> 	}
> =

>-	debug_putstr("Parsing ELF... ");
>+	debug_putstr("Parsing ELF...\n");
> =

> 	phdrs =3D malloc(sizeof(*phdrs) * ehdr.e_phnum);
> 	if (!phdrs)
>@@ -307,6 +307,11 @@ static void parse_elf(void *output)
> 			dest =3D (void *)(phdr->p_paddr);
> #endif
> 			memmove(dest, output + phdr->p_offset, phdr->p_filesz);
>+			debug_printf("   parse_elf: [0x%010lx-0x%010lx] <=3D=3D=3D [0x%010lx-0=
x%010lx]\n",
>+				(unsigned long)dest,
>+				(unsigned long)dest + phdr->p_filesz - 1,
>+				(unsigned long)output + phdr->p_offset,
>+				(unsigned long)output + phdr->p_offset + phdr->p_filesz - 1);
> 			break;
> 		default: /* Ignore other PT_* */ break;
> 		}
>@@ -431,6 +436,11 @@ asmlinkage __visible void *extract_kerne
> 		error("Wrong destination address");
> #endif
> =

>+	debug_printf("  decompress: [0x%010lx-0x%010lx] <=3D=3D=3D [0x%010lx-0x%=
010lx]\n",
>+		(unsigned long)output,
>+		(unsigned long)output + output_len - 1,
>+		(unsigned long)input_data,
>+		(unsigned long)input_data + input_len - 1);
> 	debug_putstr("\nDecompressing Linux... ");
> 	__decompress(input_data, input_len, NULL, NULL, output, output_len,
> 			NULL, error);


--===============3749637464381955674==--

