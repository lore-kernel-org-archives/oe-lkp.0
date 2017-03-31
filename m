Content-Type: multipart/mixed; boundary="===============6770322413789465890=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 31 Mar 2017 23:47:30 +0900
Message-ID: <20170331144730.GA10578@tigerII.localdomain>
In-Reply-To: <20170331063913.GE20961@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6770322413789465890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (03/31/17 14:39), Ye Xiaolong wrote:
> On 03/31, Sergey Senozhatsky wrote:
> >On (03/31/17 11:35), Sergey Senozhatsky wrote:
> >[..]
> >> > [   21.009531] VFS: Warning: trinity-c2 using old stat() call. Recom=
pile your binary.
> >> > [   21.148898] VFS: Warning: trinity-c0 using old stat() call. Recom=
pile your binary.
> >> > [   22.298208] warning: process `trinity-c2' used the deprecated sys=
ctl system call with =

> >> > =

> >> > Elapsed time: 310
> >> > BUG: kernel reboot-without-warning in test stage
> >> =

> >> so as far as I understand, this is the "missing kernel messages"
> >> type of bug report. a worst case scenario.
> >
> >panic() should have called console_flush_on_panic(), which sould have
> >flushed the messages regardless the printk_kthread state. so it probably
> >was not panic() that rebooted the kernel. (probably).
> >
> >kernel_restart() and kernel_halt() have pr_emerg() messages, printk swit=
ches
> >to printk_emergency mode the first time it sees EMERG level message. (ma=
y be
> >we switch to late).
> >
> >on the other hand, there is a emergency_restart(), where we don't switch
> >to printk_emergency mode and don't flush the existing kernel messages.
> >there is a bunch of places that call emergency_restart(), including sysr=
q.
> >
> >may I ask you, how do you usually restart the vm after the test?
> >`echo X > /proc/sysrq-trigger'?
> =

> Yes.
> =

> >
> >does this patch make it any better?
> =

> I am trying it and will post the result once I get it.


... I'd also probably add pr_emerg() print-out to emergency_restart(),
the same way kernel_restart()/kernel_halt()/kernel_power_off() do.

for those cases when emergency_restart() is called with printk in
kthreaded mode, not in emergency mode.

---

diff --git a/kernel/reboot.c b/kernel/reboot.c
index e4ced883d8de..5bce29da913b 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -60,6 +60,7 @@ void (*pm_power_off_prepare)(void);
  */
 void emergency_restart(void)
 {
+	pr_emerg("Emergency restart\n");
 	kmsg_dump(KMSG_DUMP_EMERG);
 	machine_emergency_restart();
 }


--===============6770322413789465890==--

