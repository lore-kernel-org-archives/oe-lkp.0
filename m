Content-Type: multipart/mixed; boundary="===============1629230735104979243=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [epoll] fb72873666: WARNING:at_kernel/tracepoint.c:#tracepoint_probe_register_prio
Date: Mon, 14 Dec 2020 14:49:36 -0800
Message-ID: <20201214144936.0e80792630d3565033d63a80@linux-foundation.org>
In-Reply-To: <20201214145834.GI67148@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1629230735104979243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Dec 2020 22:58:34 +0800 kernel test robot <rong.a.chen@intel.c=
om> wrote:

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: fb728736669f7805bcc0fa1c4d578faf991d62a8 ("epoll: wire up syscall=
 epoll_pwait2")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

That patch was quite messed up with incorrect syscall numbers, after
some rejects storm.  I fixed that up but x86_64 was OK before so I'm
not sure this explains the crash.

 arch/alpha/kernel/syscalls/syscall.tbl      |    2 +-
 arch/arm/tools/syscall.tbl                  |    2 +-
 arch/ia64/kernel/syscalls/syscall.tbl       |    2 +-
 arch/m68k/kernel/syscalls/syscall.tbl       |    2 +-
 arch/microblaze/kernel/syscalls/syscall.tbl |    2 +-
 arch/mips/kernel/syscalls/syscall_n32.tbl   |    2 +-
 arch/mips/kernel/syscalls/syscall_n64.tbl   |    2 +-
 arch/mips/kernel/syscalls/syscall_o32.tbl   |    2 +-
 arch/parisc/kernel/syscalls/syscall.tbl     |    2 +-
 arch/powerpc/kernel/syscalls/syscall.tbl    |    2 +-
 arch/s390/kernel/syscalls/syscall.tbl       |    2 +-
 arch/sh/kernel/syscalls/syscall.tbl         |    2 +-
 arch/sparc/kernel/syscalls/syscall.tbl      |    2 +-
 arch/xtensa/kernel/syscalls/syscall.tbl     |    2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

--- a/arch/alpha/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epoll_pw=
ait2-fix
+++ a/arch/alpha/kernel/syscalls/syscall.tbl
@@ -481,4 +481,4 @@
 549	common	faccessat2			sys_faccessat2
 550	common	process_madvise			sys_process_madvise
 551	common	watch_mount			sys_watch_mount
-553	common	epoll_pwait2			sys_epoll_pwait2
+552	common	epoll_pwait2			sys_epoll_pwait2
--- a/arch/arm/tools/syscall.tbl~epoll-wire-up-syscall-epoll_pwait2-fix
+++ a/arch/arm/tools/syscall.tbl
@@ -455,4 +455,4 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	watch_mount			sys_watch_mount
-443	common	epoll_pwait2			sys_epoll_pwait2
+442	common	epoll_pwait2			sys_epoll_pwait2
--- a/arch/ia64/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epoll_pwa=
it2-fix
+++ a/arch/ia64/kernel/syscalls/syscall.tbl
@@ -362,4 +362,4 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	watch_mount			sys_watch_mount
-443	common	epoll_pwait2			sys_epoll_pwait2
+442	common	epoll_pwait2			sys_epoll_pwait2
--- a/arch/m68k/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epoll_pwa=
it2-fix
+++ a/arch/m68k/kernel/syscalls/syscall.tbl
@@ -441,4 +441,4 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	watch_mount			sys_watch_mount
-443	common	epoll_pwait2			sys_epoll_pwait2
+442	common	epoll_pwait2			sys_epoll_pwait2
--- a/arch/microblaze/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epo=
ll_pwait2-fix
+++ a/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -447,4 +447,4 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	watch_mount			sys_watch_mount
-443	common	epoll_pwait2			sys_epoll_pwait2
+442	common	epoll_pwait2			sys_epoll_pwait2
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl~epoll-wire-up-syscall-epoll=
_pwait2-fix
+++ a/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -380,4 +380,4 @@
 439	n32	faccessat2			sys_faccessat2
 440	n32	process_madvise			sys_process_madvise
 441	n32	watch_mount			sys_watch_mount
-443	n32	epoll_pwait2			sys_epoll_pwait2
+442	n32	epoll_pwait2			sys_epoll_pwait2
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl~epoll-wire-up-syscall-epoll=
_pwait2-fix
+++ a/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -356,4 +356,4 @@
 439	n64	faccessat2			sys_faccessat2
 440	n64	process_madvise			sys_process_madvise
 441	n64	watch_mount			sys_watch_mount
-443	n64	epoll_pwait2			sys_epoll_pwait2
+442	n64	epoll_pwait2			sys_epoll_pwait2
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl~epoll-wire-up-syscall-epoll=
_pwait2-fix
+++ a/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -429,4 +429,4 @@
 439	o32	faccessat2			sys_faccessat2
 440	o32	process_madvise			sys_process_madvise
 441	o32	watch_mount			sys_watch_mount
-443	o32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
+442	o32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
--- a/arch/parisc/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epoll_p=
wait2-fix
+++ a/arch/parisc/kernel/syscalls/syscall.tbl
@@ -439,4 +439,4 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	watch_mount			sys_watch_mount
-443	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
+442	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
--- a/arch/powerpc/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epoll_=
pwait2-fix
+++ a/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -531,4 +531,4 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	watch_mount			sys_watch_mount
-443	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
+442	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
--- a/arch/s390/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epoll_pwa=
it2-fix
+++ a/arch/s390/kernel/syscalls/syscall.tbl
@@ -444,4 +444,4 @@
 439  common	faccessat2		sys_faccessat2			sys_faccessat2
 440  common	process_madvise		sys_process_madvise		sys_process_madvise
 441	common	watch_mount		sys_watch_mount			sys_watch_mount
-443  common	epoll_pwait2		sys_epoll_pwait2		sys_epoll_pwait2
+442  common	epoll_pwait2		sys_epoll_pwait2		sys_epoll_pwait2
--- a/arch/sh/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epoll_pwait=
2-fix
+++ a/arch/sh/kernel/syscalls/syscall.tbl
@@ -444,4 +444,4 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	watch_mount			sys_watch_mount
-443	common	epoll_pwait2			sys_epoll_pwait2
+442	common	epoll_pwait2			sys_epoll_pwait2
--- a/arch/sparc/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epoll_pw=
ait2-fix
+++ a/arch/sparc/kernel/syscalls/syscall.tbl
@@ -487,4 +487,4 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	watch_mount			sys_watch_mount
-443	common	epoll_pwait2			sys_epoll_pwait2
+442	common	epoll_pwait2			sys_epoll_pwait2
--- a/arch/xtensa/kernel/syscalls/syscall.tbl~epoll-wire-up-syscall-epoll_p=
wait2-fix
+++ a/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -412,4 +412,4 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	watch_mount			sys_watch_mount
-443	common	epoll_pwait2			sys_epoll_pwait2
+442	common	epoll_pwait2			sys_epoll_pwait2
_

--===============1629230735104979243==--

