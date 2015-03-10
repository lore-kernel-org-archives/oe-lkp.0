Content-Type: multipart/mixed; boundary="===============3980316993141126300=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Tue, 10 Mar 2015 08:51:22 +0100
Message-ID: <20150310075122.GA19571@gmail.com>
In-Reply-To: <CA+55aFxHfqS=GJLtcmd9NsP9qpquzd8Ow+AtOi+-hfxD=O-NDg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3980316993141126300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, Mar 9, 2015 at 9:55 AM, Borislav Petkov <bp@alien8.de> wrote:
> > On Mon, Mar 09, 2015 at 09:49:42AM -0700, Linus Torvalds wrote:
> >>
> >> I don't remember when it was open-coded, and I never created a git
> >> archive of all the old tar-files from before BK, so it's not trivial
> >> to check ;(
> >
> > This maybe:
> >
> > http://git.kernel.org/cgit/linux/kernel/git/history/history.git/
> =

> Ahh.  Yes. Not a very good import (dates are generally crap etc), but
> better than nothing.
> =

> It's still an ljmp to the TSS in 2.0.
> =

> Looks like it got open coded in  v2.1.109pre1 according to that.
> =

> Around July -98 or something similar.

Yeah, and I initially thought that it was me who removed TSS switching =

back then - but clearly, by the style of the new comment, the =

v2.1.109pre1 change was written by you:

+/*
+ *     switch_to(x,yn) should switch tasks from x to y.
+ *
+ * We fsave/fwait so that an exception goes off at the right time
+ * (as a call from the fsave or fwait in effect) rather than to
+ * the wrong process. Lazy FP saving no longer makes any sense
+ * with modern CPU's, and this simplifies a lot of things (SMP
+ * and UP become the same).
+ *
+ * NOTE! We used to use the x86 hardware context switching. The
+ * reason for not using it any more becomes apparent when you
+ * try to recover gracefully from saved state that is no longer
+ * valid (stale segment register values in particular). With the
+ * hardware task-switch, there is no way to fix up bad state in
+ * a reasonable manner.
+ *
+ * The fact that Intel documents the hardware task-switching to
+ * be slow is a fairly red herring - this code is not noticeably
+ * faster. However, there _is_ some room for improvement here,
+ * so the performance issues may eventually be a valid point.
+ * More important, however, is the fact that this allows us much
+ * more flexibility.
+ */

But ... I indeed did something in that area too, in 2.3.11pre3 =

(historic git 4c16d0765b0c6), I removed the TR loading from the =

context switch path and removed the last remains of hardware based =

task switching and made it all soft-switching:

+/*
+ * per-CPU TSS segments. Threads are completely 'soft' on Linux,
+ * no more per-task TSS's. The TSS size is kept cacheline-aligned
+ * so they are allowed to end up in the .data.cacheline_aligned
+ * section. Since TSS's are completely CPU-local, we want them
+ * on exact cacheline boundaries, to eliminate cacheline ping-pong.
+ */ =

+struct hard_thread_struct init_tss[NR_CPUS] __cacheline_aligned =3D
+                                       { [0 ... NR_CPUS-1] =3D INIT_TSS =

};

Thanks,

	Ingo

--===============3980316993141126300==--

