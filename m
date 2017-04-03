Content-Type: multipart/mixed; boundary="===============1584600298081152481=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Mon, 03 Apr 2017 11:31:52 +0200
Message-ID: <20170403093152.GB15168@quack2.suse.cz>
In-Reply-To: <87a881v52o.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1584600298081152481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 31-03-17 10:28:15, Eric W. Biederman wrote:
> Sergey Senozhatsky <sergey.senozhatsky@gmail.com> writes:
> =

> > On (03/31/17 14:39), Ye Xiaolong wrote:
> >> On 03/31, Sergey Senozhatsky wrote:
> >> >On (03/31/17 11:35), Sergey Senozhatsky wrote:
> >> >[..]
> >> >> > [   21.009531] VFS: Warning: trinity-c2 using old stat() call. Re=
compile your binary.
> >> >> > [   21.148898] VFS: Warning: trinity-c0 using old stat() call. Re=
compile your binary.
> >> >> > [   22.298208] warning: process `trinity-c2' used the deprecated =
sysctl system call with =

> >> >> > =

> >> >> > Elapsed time: 310
> >> >> > BUG: kernel reboot-without-warning in test stage
> >> >> =

> >> >> so as far as I understand, this is the "missing kernel messages"
> >> >> type of bug report. a worst case scenario.
> >> >
> >> >panic() should have called console_flush_on_panic(), which sould have
> >> >flushed the messages regardless the printk_kthread state. so it proba=
bly
> >> >was not panic() that rebooted the kernel. (probably).
> >> >
> >> >kernel_restart() and kernel_halt() have pr_emerg() messages, printk s=
witches
> >> >to printk_emergency mode the first time it sees EMERG level message. =
(may be
> >> >we switch to late).
> >> >
> >> >on the other hand, there is a emergency_restart(), where we don't swi=
tch
> >> >to printk_emergency mode and don't flush the existing kernel messages.
> >> >there is a bunch of places that call emergency_restart(), including s=
ysrq.
> >> >
> >> >may I ask you, how do you usually restart the vm after the test?
> >> >`echo X > /proc/sysrq-trigger'?
> >> =

> >> Yes.
> >> =

> >> >
> >> >does this patch make it any better?
> >> =

> >> I am trying it and will post the result once I get it.
> >
> >
> > ... I'd also probably add pr_emerg() print-out to emergency_restart(),
> > the same way kernel_restart()/kernel_halt()/kernel_power_off() do.
> >
> > for those cases when emergency_restart() is called with printk in
> > kthreaded mode, not in emergency mode.
> =

> No. No. No.
> =

> emergency_restart should be the equivalent of a watchdog going off.
> AKA it is long past the point where you want to be coordinating
> with other parts of the kernel.  Rebooting is the priority.
> A print statement absolutely does not belong in emergency_restart.
>
> The fact that nothing managed to get printed out without magic flushing
> code is highly disturbing.
> =

> Looking from the outside this patchset appears to be broken by design.
> =

> If you don't want kernel functions suffering from the overhead of
> printing to a slow output device, don't do that then.

Sorry, but the above is just contradictory. On one hand you say that
missing messages is disturbing and on the other hand you say we should have
no messages to avoid the overhead of printing. The fact is kernel has tons
of messages because people want to see what happens to possibly debug stuff.
And I don't see as viable to reduce amount of messages as it is neverending
fight and always someone will be unhappy. As a result currently some machin=
es
are not able to boot due to printk traffic and there are other nasty
effects from CPUs getting stuck printing messages to serial console (and
this really bothers people as is proved by the fact that about every 6
months someone comes with a hack to printk to fix the particular lockup he
is hitting).

This patch set gives up part of the printk() reliability for bounded
latency (at least unless we detect we are really in trouble) which is IMHO
a good trade-off for lots of users (and others can just turn this feature
off).

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============1584600298081152481==--

