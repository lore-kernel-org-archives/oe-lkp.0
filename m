Content-Type: multipart/mixed; boundary="===============8546448088855041247=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Fri, 07 Apr 2017 06:16:54 +0000
Message-ID: <070BEF4AC20468458C22969097656CD94BFB56A0@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <20170407061140.GA5714@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8546448088855041247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Is this not enough? Anything else I need to do?

Thanks,
-Aubrey

aubrey(a)bee:/git/aubrey/fast_idle.git$ git show ea899bd65fc285d5753d70a787=
9a7332821bbc02
commit ea899bd65fc285d5753d70a7879a7332821bbc02
Author: Aubrey Li <aubrey.li@linux.intel.com>
Date:   Fri Apr 7 11:38:04 2017 +0800

    cpuidle: use C1 as the default idle call

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index e8ee4b9..62c0b0e 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -428,7 +428,7 @@ static void mwait_idle(void)
 =

                __monitor((void *)&current_thread_info()->flags, 0, 0);
                if (!need_resched())
-                       __sti_mwait(1, 0);
+                       __sti_mwait(0, 0);
                else
                        local_irq_enable();
                trace_cpu_idle_rcuidle(PWR_EVENT_EXIT, smp_processor_id());




> >>
> >> I found your commit is not correct on inn,
> >>
> >> $ cd /c/repo/linux
> >> $ git show git show ea899bd65fc285d5753d70a7879a7332821bbc02
> >> fatal: bad object ea899bd65fc285d5753d70a7879a7332821bbc02
> >>
> >
> >The commit id does not in Linux repo, it's in my fast_idle repo, which
> >I specified in the command
> =

> I guess you haven't push your changes to git in bee?
> =

> # yexl @ bee in /gitmirror/aubrey-fast_idle on git:master o [14:14:09] C:=
128
> $ git show ea899bd65fc285d5753d70a7879a7332821bbc02
> fatal: bad object ea899bd65fc285d5753d70a7879a7332821bbc02
> =

> Thanks,
> Xiaolong

--===============8546448088855041247==--

