Content-Type: multipart/mixed; boundary="===============1540351821659924064=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [lib] 0c5a9920fb: WARNING:at_lib/test_linktables/test-linktables.c:#test_linktable_init
Date: Wed, 04 Jan 2017 21:36:06 +0100
Message-ID: <20170104203606.GQ13946@wotan.suse.de>
In-Reply-To: <20161229173415.GD21987@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1540351821659924064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2016 at 01:34:15AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 0c5a9920fbb514bd4098e2fb6340d3274bf2bca7 ("lib: add linker tables=
 test driver")
> https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 201=
61216-linker-tables-v5
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

> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 320M
> =

> caused below changes:
> =

> =

> +-----------------------------------------------------------------------+=
------------+------------+
> |                                                                       |=
 d658aa6259 | 0c5a9920fb |
> +-----------------------------------------------------------------------+=
------------+------------+
> | boot_successes                                                        |=
 2          | 0          |
> | boot_failures                                                         |=
 6          | 8          |
> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page                   |=
 6          | 8          |
> | invoked_oom-killer:gfp_mask=3D0x                                       =
 | 1          | 2          |
> | Mem-Info                                                              |=
 1          | 2          |
> | WARNING:at_lib/test_linktables/test-linktables.c:#test_linktable_init |=
 0          | 8          |
> | inconsistent{SOFTIRQ-ON-W}->{IN-SOFTIRQ-W}usage                       |=
 0          | 3          |
> +-----------------------------------------------------------------------+=
------------+------------+
> =

> =

> =

> [   13.774713] Key type big_key registered
> [   13.775796] test_linktables: expected: 0 test
> [   13.776549] ------------[ cut here ]------------
> [   13.777372] WARNING: CPU: 0 PID: 1 at lib/test_linktables/test-linktab=
les.c:760 test_linktable_init+0x126/0x1a1
> [   13.779332] Modules linked in:
> [   13.779907] CPU: 0 PID: 1 Comm: swapper Not tainted 4.9.0-next-2016121=
6-00014-g0c5a992 #2
> [   13.781330] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   13.783135] Call Trace:
> [   13.783608]  dump_stack+0x16/0x18
> [   13.784188]  __warn+0xa5/0xbc
> [   13.784694]  ? test_linktable_init+0x126/0x1a1
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email

This seems to rely on klibc and klibc does not compile on the latest
kernels. I tried to fix this but this needs more work. I changed your
tests to use gcc but that also does not work. hpa, attached was my latest
attempt to try to get klibc to compile on x86_64 with the latest kernel
but no go yet. We need to resolve a bit more issues.

So this test is not useful unless we change it to use gcc or fix klibc.

The only reason I can think of this warning to trigger with trinity
is *perhaps* a race with freeing __init and running the module's init call.=
...
but I think that would have oops instead. So really not sure how trinity
would cause this. I am motivated to figure out but I am stuck!

diff --git a/scripts/Kbuild.klibc b/scripts/Kbuild.klibc
index f500d5358ef6..b825daeb8277 100644
--- a/scripts/Kbuild.klibc
+++ b/scripts/Kbuild.klibc
@@ -77,7 +77,8 @@ KLIBCLDFLAGS      :=3D
 KLIBCCFLAGS       :=3D
 =

 # Defaults for arch to override
-KLIBCARCHINCFLAGS =3D -I$(KLIBCKERNELOBJ)/arch/$(KLIBCARCH)/include
+KLIBCARCHINCFLAGS =3D -I$(KLIBCKERNELOBJ)/arch/$(KLIBCARCH)/include \
+		    -I$(KLIBCKERNELOBJ)/arch/$(KLIBCARCH)/include/uapi
 =

 # Arch specific definitions for klibc
 include $(srctree)/$(KLIBCSRC)/arch/$(KLIBCARCHDIR)/MCONFIG
@@ -114,6 +115,7 @@ KLIBCCPPFLAGS    :=3D -nostdinc -iwithprefix include \
 KLIBCKERNELSRC	 ?=3D $(srctree)
 KLIBCKERNELOBJ	 ?=3D $(objtree)
 KLIBCCPPFLAGS    +=3D -I$(KLIBCKERNELSRC)/include				    \
+		    -I$(KLIBCKERNELSRC)/include/uapi			    \
                      $(if $(KBUILD_SRC),-I$(KLIBCKERNELOBJ)/include2 	    \
 		       -I$(KLIBCKERNELOBJ)/include -I$(srctree)/include)    \
 		     $(KLIBCARCHINCFLAGS)
diff --git a/usr/klibc/arch/x86_64/MCONFIG b/usr/klibc/arch/x86_64/MCONFIG
index 4b1a33ad9f37..e45dfb029b31 100644
--- a/usr/klibc/arch/x86_64/MCONFIG
+++ b/usr/klibc/arch/x86_64/MCONFIG
@@ -36,4 +36,7 @@ KLIBCLDFLAGS      =3D -m elf_x86_64
 KLIBCSHAREDFLAGS     =3D -Ttext 0x00200200 -z max-page-size=3D0x100000
 =

 # Asm includes for x86_64 are in the merged x86 tree
-KLIBCARCHINCFLAGS =3D -I$(KLIBCKERNELOBJ)/arch/x86/include
+KLIBCARCHINCFLAGS =3D -I$(KLIBCKERNELOBJ)/arch/x86/include \
+		    -I$(KLIBCKERNELOBJ)/arch/x86/include/uapi \
+		    -I$(KLIBCKERNELOBJ)/arch/x86/include/generated/ \
+		    -I$(KLIBCKERNELOBJ)/arch/x86/include/generated/uapi

--===============1540351821659924064==--

