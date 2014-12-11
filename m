Content-Type: multipart/mixed; boundary="===============0212798862047170257=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [ftrace/fgraph/x86] BUG: unable to handle kernel paging request at 3d00c17d
Date: Wed, 10 Dec 2014 23:09:13 -0500
Message-ID: <20141210230913.0bcbb124@gandalf.local.home>
In-Reply-To: <20141210231732.GA24163@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0212798862047170257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Dec 2014 15:17:32 -0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi Steven,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 6a06bdbf7f9c669743f58084991ba280f2925586
> Author:     Steven Rostedt (Red Hat) <rostedt@goodmis.org>
> AuthorDate: Mon Nov 24 21:00:34 2014 -0500
> Commit:     Steven Rostedt <rostedt@goodmis.org>
> CommitDate: Mon Dec 1 14:08:58 2014 -0500
> =

>     ftrace/fgraph/x86: Have prepare_ftrace_return() take ip as first para=
meter
>     =

>     The function graph helper function prepare_ftrace_return() which does=
 the work
>     to hijack the parent pointer has that parent pointer as its first par=
ameter.
>     Instead, if we make it the second parameter and have ip as the first =
parameter
>     (self_addr), then it can use the %rdi from save_mcount_regs that load=
s it
>     already.
>     =

>     Link: http://lkml.kernel.org/r/alpine.DEB.2.11.1411262304010.3961(a)n=
anos
>     =

>     Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>     Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Crap! Yeah, I was wondering how this could be the bug, but then I
realized this was i386 not x86_64 and I never updated the i386 call to
prepare_ftrace_return().

Does this patch fix it?

-- Steve

diff --git a/arch/x86/kernel/entry_32.S b/arch/x86/kernel/entry_32.S
index b553ed89e5f5..df3e608d409b 100644
--- a/arch/x86/kernel/entry_32.S
+++ b/arch/x86/kernel/entry_32.S
@@ -1192,10 +1192,10 @@ ENTRY(ftrace_graph_caller)
 	pushl %eax
 	pushl %ecx
 	pushl %edx
-	movl 0xc(%esp), %edx
-	lea 0x4(%ebp), %eax
+	movl 0xc(%esp), %eax
+	lea 0x4(%ebp), %edx
 	movl (%ebp), %ecx
-	subl $MCOUNT_INSN_SIZE, %edx
+	subl $MCOUNT_INSN_SIZE, %eax
 	call prepare_ftrace_return
 	popl %edx
 	popl %ecx

--===============0212798862047170257==--

