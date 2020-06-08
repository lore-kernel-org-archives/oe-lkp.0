Content-Type: multipart/mixed; boundary="===============7177000113830698544=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: lkp@lists.01.org
Subject: Re: 0887a7ebc9 ("ubsan: add trap instrumentation option"): BUG: kernel hang in early-boot stage, last printk: early console in setup code
Date: Mon, 08 Jun 2020 12:32:17 -0700
Message-ID: <CAKwvOdn6EVkYkjgsg6VOamR-QUQGAiL6=LwvrxHZsQ3Oj+SyoQ@mail.gmail.com>
In-Reply-To: <20200608192828.GB987@lca.pw>
List-Id: <oe-lkp.lists.linux.dev>

--===============7177000113830698544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2020 at 12:28 PM Qian Cai <cai@lca.pw> wrote:
>
> On Mon, Jun 08, 2020 at 12:00:11PM -0700, Kees Cook wrote:
> > On Mon, Jun 08, 2020 at 02:04:08PM +0800, kernel test robot wrote:
> > > The issue seems due to the lack of "-fsanitize-undefined-trap-on-erro=
r" in clang.
> >
> > Hm? No, that's supported in Clang (at least as far back as Clang 9.)
> >
> > > Greetings,
> > >
> > > 0day kernel testing robot got the below dmesg and the first bad commi=
t is
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma=
ster
> > >
> > > commit 0887a7ebc97770c7870abf3075a2e8cd502a7f52
> > > Author:     Kees Cook <keescook@chromium.org>
> > > AuthorDate: Mon Apr 6 20:12:27 2020 -0700
> > > Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> > > CommitDate: Tue Apr 7 10:43:44 2020 -0700
> > >
> > >     ubsan: add trap instrumentation option
> >
> > In the randconfig, I see CONFIG_UBSAN_TRAP is enabled with lots of other
> > UBSAN options. If you're not expecting the results, it's very likely the
> > false positives in UBSAN are going to do bad things. :) This is "working
> > as expected", as noted in the commit log quoted below.
> >
> > >
> > >     Patch series "ubsan: Split out bounds checker", v5.
> > >
> > >     This splits out the bounds checker so it can be individually used=
.  This
> > >     is enabled in Android and hopefully for syzbot.  Includes LKDTM t=
ests for
> > >     behavioral corner-cases (beyond just the bounds checker), and adj=
usts
> > >     ubsan and kasan slightly for correct panic handling.
> > >
> > >     This patch (of 6):
> > >
> > >     The Undefined Behavior Sanitizer can operate in two modes: warning
> > >     reporting mode via lib/ubsan.c handler calls, or trap mode, which=
 uses
> > >     __builtin_trap() as the handler.  Using lib/ubsan.c means the ker=
nel image
> > >     is about 5% larger (due to all the debugging text and reporting s=
tructures
> > >     to capture details about the warning conditions).  Using the trap=
 mode,
> > >     the image size changes are much smaller, though at the loss of the
> > >     "warning only" mode.
> > >
> > >     In order to give greater flexibility to system builders that want=
 minimal
> > >     changes to image size and are prepared to deal with kernel code b=
eing
> > >     aborted and potentially destabilizing the system, this introduces
> > >     CONFIG_UBSAN_TRAP.  The resulting image sizes comparison:
> > >
> > >        text    data     bss       dec       hex     filename
> > >     19533663   6183037  18554956  44271656  2a38828 vmlinux.stock
> > >     19991849   7618513  18874448  46484810  2c54d4a vmlinux.ubsan
> > >     19712181   6284181  18366540  44362902  2a4ec96 vmlinux.ubsan-trap
> > >
> > >     CONFIG_UBSAN=3Dy:      image +4.8% (text +2.3%, data +18.9%)
> > >     CONFIG_UBSAN_TRAP=3Dy: image +0.2% (text +0.9%, data +1.6%)
> > >
> > >     Additionally adjusts the CONFIG_UBSAN Kconfig help for clarity an=
d removes
> > >     the mention of non-existing boot param "ubsan_handle".
> >
> > If you're trying to _boot_ a randconfig, I suspect there are going to be
> > a lot of surprises with UBSAN (in any mode) enabled. Right now, likely =
the
> > least noisy of them all is UBSAN_BOUNDS, which was split out for fuzzer=
s.
> >
> > FWIW, the dmesg appears to be catching a NULL pointer dereference
> > (enabled via CONFIG_UBSAN_MISC):
> >
> > [    0.047646] UBSAN: Undefined behaviour in drivers/acpi/acpica/tbfadt=
.c:459:37
> > [    0.047650] member access within null pointer of type 'struct acpi_t=
able_fadt'
> > [    0.047655] CPU: 0 PID: 0 Comm: swapper Not tainted 5.6.0-11597-g7ba=
f219982281 #1
> > [    0.047659] Call Trace:
> > [    0.047676]  dump_stack+0x88/0xb9
> > [    0.047684]  ? ubsan_prologue+0x21/0x46
> > [    0.047689]  ? ubsan_type_mismatch_common+0x188/0x19e
> > [    0.047695]  ? __ubsan_handle_type_mismatch_v1+0x45/0x4a
> > [    0.047701]  ? acpi_tb_create_local_fadt+0xaa/0x435
> > [    0.047706]  ? acpi_tb_parse_fadt+0x54/0xd4
> > [    0.047712]  ? acpi_tb_parse_root_table+0x192/0x1bf
> > [    0.047717]  ? acpi_table_init+0x3b/0x56
> > [    0.047721]  ? acpi_boot_table_init+0xf/0x6e
> > [    0.047726]  ? setup_arch+0x459/0x520
> > [    0.047732]  ? start_kernel+0x5e/0x3ba
> > [    0.047737]  ? secondary_startup_64+0xa4/0xb0
> >
> > I'm not sure how ACPI defines acpi_gbl_FADT though? There's no
> > dereference...
> >
> > 459:         if (acpi_gbl_FADT.header.length <=3D ACPI_FADT_V2_SIZE) {
> >
> >
> > BTW, this report only contained 1 actual dmesg. There were two files wi=
th
> > dmesg file names, but one of them was the gzipped reproduction steps ag=
ain.
>
> No, it does not complain about a NULL pointer dereference but rather a
> member access within NULL pointer.
>
> # ./scripts/faddr2line vmlinux acpi_tb_create_local_fadt+0x104/0x6ec
> acpi_tb_create_local_fadt+0x104/0x6ec:
> acpi_tb_convert_fadt at drivers/acpi/acpica/tbfadt.c:459
> (inlined by) acpi_tb_create_local_fadt at drivers/acpi/acpica/tbfadt.c:388

There's an issue with the use of ACPI_OFFSET w/ UBSAN (member access
within NULL) that was previously reported; I'm working on patches now.
(replacing the use of ACPI_OFFSET w/ offsetof from linux/stddef.h).
Not sure if it's precisely the same issue, but looks quite like it.
https://lore.kernel.org/lkml/20200601231805.207441-1-ndesaulniers(a)google.=
com/



>
> Clang would report several of those,
>
> https://lore.kernel.org/lkml/CA6078C3-3489-40E4-B756-A0AF6DB3A3A5(a)lca.p=
w/
>
> There are many examples how to "fix" those.
>
> $ git log  --oneline --grep=3D'member access within null pointer'
>
> Anyway, this line,
>
>         if (acpi_gbl_FADT.header.length <=3D ACPI_FADT_V2_SIZE) {
>
> acpi_gbl_FADT was defined in,
>
> .//include/acpi/acpixf.h:266:ACPI_GLOBAL(struct acpi_table_fadt, acpi_gbl=
_FADT);
>
> #ifdef DEFINE_ACPI_GLOBALS
> #define ACPI_GLOBAL(type,name) \
>         extern type name; \
>         type name
>
>
>
> #define ACPI_INIT_GLOBAL(type,name,value) \
>         type name=3Dvalue
>
>
>
> #else
> #ifndef ACPI_GLOBAL
> #define ACPI_GLOBAL(type,name) \
>         extern type name
> #endif
>
>
>
> #ifndef ACPI_INIT_GLOBAL
> #define ACPI_INIT_GLOBAL(type,name,value) \
>         extern type name
> #endif
> #endif
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/20200608192828.GB987%40lca.pw.



--
Thanks,
~Nick Desaulniers
--===============7177000113830698544==--

