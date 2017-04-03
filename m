Content-Type: multipart/mixed; boundary="===============8419696169436619591=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Mon, 03 Apr 2017 12:06:41 +0200
Message-ID: <20170403100641.GE29537@pathway.suse.cz>
In-Reply-To: <20170403093152.GB15168@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8419696169436619591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 2017-04-03 11:31:52, Jan Kara wrote:
> On Fri 31-03-17 10:28:15, Eric W. Biederman wrote:
> > Sergey Senozhatsky <sergey.senozhatsky@gmail.com> writes:
> > =

> > > On (03/31/17 14:39), Ye Xiaolong wrote:
> > >> On 03/31, Sergey Senozhatsky wrote:
> > >> >On (03/31/17 11:35), Sergey Senozhatsky wrote:
> > >> >[..]
> > >> >> > [   21.009531] VFS: Warning: trinity-c2 using old stat() call. =
Recompile your binary.
> > >> >> > [   21.148898] VFS: Warning: trinity-c0 using old stat() call. =
Recompile your binary.
> > >> >> > [   22.298208] warning: process `trinity-c2' used the deprecate=
d sysctl system call with =

> > >> >> > =

> > >> >> > Elapsed time: 310
> > >> >> > BUG: kernel reboot-without-warning in test stage
> > >> >> =

> > >> >> so as far as I understand, this is the "missing kernel messages"
> > >> >> type of bug report. a worst case scenario.
> > >> >
> > >> >panic() should have called console_flush_on_panic(), which sould ha=
ve
> > >> >flushed the messages regardless the printk_kthread state. so it pro=
bably
> > >> >was not panic() that rebooted the kernel. (probably).
> > >> >
> > >> >kernel_restart() and kernel_halt() have pr_emerg() messages, printk=
 switches
> > >> >to printk_emergency mode the first time it sees EMERG level message=
. (may be
> > >> >we switch to late).
> > >> >
> > >> >on the other hand, there is a emergency_restart(), where we don't s=
witch
> > >> >to printk_emergency mode and don't flush the existing kernel messag=
es.
> > >> >there is a bunch of places that call emergency_restart(), including=
 sysrq.
> > >> >
> > >> >may I ask you, how do you usually restart the vm after the test?
> > >> >`echo X > /proc/sysrq-trigger'?
> > >> =

> > >> Yes.
> > >> =

> > >> >
> > >> >does this patch make it any better?
> > >> =

> > >> I am trying it and will post the result once I get it.
> > >
> > >
> > > ... I'd also probably add pr_emerg() print-out to emergency_restart(),
> > > the same way kernel_restart()/kernel_halt()/kernel_power_off() do.
> > >
> > > for those cases when emergency_restart() is called with printk in
> > > kthreaded mode, not in emergency mode.
> > =

> > No. No. No.
> > =

> > emergency_restart should be the equivalent of a watchdog going off.
> > AKA it is long past the point where you want to be coordinating
> > with other parts of the kernel.  Rebooting is the priority.
> > A print statement absolutely does not belong in emergency_restart.

Sergey suggested to add pr_emerg() because it would signalize
emergency situation, printk kthread would be disabled and all
messages would be printed to the console directly (the old way).
It will _not_ be necessary to wakeup the kthread.

Note that the we could do it also _without_ pr_emerg().
Instead we could call simple/fast printk_emergency_begin()
as we do in other similar situations, for example during
kexec, suspend, see 4th and 6th patch of this patchset.


> > The fact that nothing managed to get printed out without magic flushing
> > code is highly disturbing.
> > =

> > Looking from the outside this patchset appears to be broken by design.
> > =

> > If you don't want kernel functions suffering from the overhead of
> > printing to a slow output device, don't do that then.
> =

> Sorry, but the above is just contradictory. On one hand you say that
> missing messages is disturbing and on the other hand you say we should ha=
ve
> no messages to avoid the overhead of printing. The fact is kernel has tons
> of messages because people want to see what happens to possibly debug stu=
ff.
> And I don't see as viable to reduce amount of messages as it is neverendi=
ng
> fight and always someone will be unhappy. As a result currently some mach=
ines
> are not able to boot due to printk traffic and there are other nasty
> effects from CPUs getting stuck printing messages to serial console (and
> this really bothers people as is proved by the fact that about every 6
> months someone comes with a hack to printk to fix the particular lockup he
> is hitting).

Yup, the fact is that there are situations when printk() itself brings
the system into problems, for example when too many messages are
flushed to a slow console in interrupt context.


> This patch set gives up part of the printk() reliability for bounded
> latency (at least unless we detect we are really in trouble) which is IMHO
> a good trade-off for lots of users (and others can just turn this feature
> off).

My view of this patchset is the following:

Deferred console output is perfectly fine when the system is in
reasonable state. The deferring is needed to keep the system safe
in some situations.

Of course, the view is different when the deferring is not longer
reliable (panic, kexec, suspend, restart). We try to detect these
situations, disable deferring, and push the messages the old way.
We call this emergency mode.

I am sure that we miss some situations. Also they might be hard
to detect. For this case, there is the kernel parameter, sysfs
knob that will allow to keep the old mode all the time, see
7th patch.

Best Regards,
Petr

--===============8419696169436619591==--

