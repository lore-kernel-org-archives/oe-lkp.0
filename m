Content-Type: multipart/mixed; boundary="===============7228524158757315958=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rjw@rjwysocki.net>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 41e0d37f7a: divide error: 0000 [#1] SMP
Date: Thu, 05 May 2016 15:46:19 +0200
Message-ID: <2986116.vKjD9YH9EZ@vostro.rjw.lan>
In-Reply-To: <CANRm+CyaMDJBK1gxoJo+v7CXuhcN=x-mhgfgCVFm-bahXPUKKA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7228524158757315958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thursday, May 05, 2016 01:05:41 PM Wanpeng Li wrote:
> 2016-05-03 23:10 GMT+08:00 Rafael J. Wysocki <rjw@rjwysocki.net>:
> > On Tuesday, May 03, 2016 03:53:12 PM Rafael J. Wysocki wrote:
> >> On Tuesday, May 03, 2016 03:22:24 PM Rafael J. Wysocki wrote:
> >> > On Tue, May 3, 2016 at 2:58 PM, Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
> >> > > On Tue, May 3, 2016 at 2:54 PM, Rafael J. Wysocki <rafael@kernel=
.org> wrote:
> >> > >> On Tue, May 3, 2016 at 2:15 PM, Rafael J. Wysocki <rafael@kerne=
l.org> wrote:
> >> > >>> On Tue, May 3, 2016 at 10:32 AM, Peter Zijlstra <peterz@infrad=
ead.org> wrote:
> >> > >>>> On Tue, May 03, 2016 at 09:10:51AM +0800, kernel test robot wro=
te:
> >> > >>>>> FYI, we noticed the following commit:
> >> > >>>>>
> >> > >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sc=
hed/core
> >> > >>>>> commit 41e0d37f7ac81297c07ba311e4ad39465b8c8295 ("sched/fair: =
Do not call cpufreq hook unless util changed")
> >> > >>>>
> >> > >>>>
> >> > >>>>> [   14.860950] Freeing unused kernel memory: 260K (ffff88103ed=
bf000 - ffff88103ee00000)
> >> > >>>>> [   14.873013] systemd[1]: RTC configured in localtime, applyi=
ng delta of 480 minutes to system time.
> >> > >>>>> [   14.884474] random: systemd urandom read with 5 bits of ent=
ropy available
> >> > >>>>> [   14.903975] divide error: 0000 [#1] SMP
> >> > >>>>> [   14.908375] Modules linked in:
> >> > >>>>> [   14.911793] CPU: 39 PID: 1 Comm: systemd Not tainted 4.6.0-=
rc4-00016-g41e0d37 #1
> >> > >>>>> [   14.920051] Hardware name: Intel Corporation S2600WP/S2600W=
P, BIOS SE5C600.86B.02.02.0002.122320131210 12/23/2013
> >> > >>>>> [   14.931509] task: ffff8810101d8000 ti: ffff88081ab20000 tas=
k.ti: ffff88081ab20000
> >> > >>>>> [   14.939862] RIP: 0010:[<ffffffff8176ad32>]  [<ffffffff8176a=
d32>] intel_pstate_get+0x32/0x40
> >> > >>>>> [   14.949202] RSP: 0018:ffff88081ab23d70  EFLAGS: 00010006
> >> > >>>>> [   14.955129] RAX: 0000000000000000 RBX: 0000000000000024 RCX=
: ffff8808091e0300
> >> > >>>>> [   14.963094] RDX: 0000000000000000 RSI: 0000000000000100 RDI=
: 0000000000000024
> >> > >>>>> [   14.971057] RBP: ffff88081ab23d88 R08: 0000000000001000 R09=
: 00000000096a1000
> >> > >>>>> [   14.979022] R10: 0000000000ffff10 R11: 000000000000000f R12=
: 0000000000000202
> >> > >>>>> [   14.986984] R13: ffff88101390a040 R14: ffff88100e48e180 R15=
: ffff88101390a040
> >> > >>>>> [   14.994950] FS:  00007f66fe117880(0000) GS:ffff8810139c0000=
(0000) knlGS:0000000000000000
> >> > >>>>> [   15.003982] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
> >> > >>>>> [   15.010393] CR2: 000055f78b760098 CR3: 000000103d759000 CR4=
: 00000000001406e0
> >> > >>>>> [   15.018359] Stack:
> >> > >>>>> [   15.020602]  ffffffff81764dad 0000000000000024 ffff88100e48=
e180 ffff88081ab23dc8
> >> > >>>>> [   15.028899]  ffffffff81040267 ffff88101390a0ac 000000000000=
0340 ffff88081ab23f20
> >> > >>>>> [   15.037197]  ffff88103cd7c400 ffff88100e48e180 ffff88101390=
a040 ffff88081ab23e30
> >> > >>>>> [   15.045493] Call Trace:
> >> > >>>>> [   15.048223]  [<ffffffff81764dad>] ? cpufreq_quick_get+0x3d/=
0x90
> >> > >>>>> [   15.054832]  [<ffffffff81040267>] show_cpuinfo+0x3c7/0x410
> >> > >>>>> [   15.060956]  [<ffffffff8121f5c4>] seq_read+0x2c4/0x3a0
> >> > >>>>> [   15.066685]  [<ffffffff81266ea8>] proc_reg_read+0x48/0x70
> >> > >>>>> [   15.072713]  [<ffffffff811f9d58>] __vfs_read+0x28/0xd0
> >> > >>>>> [   15.078451]  [<ffffffff813bab63>] ? security_file_permissio=
n+0xa3/0xc0
> >> > >>>>> [   15.085737]  [<ffffffff811faa97>] ? rw_verify_area+0x57/0xd0
> >> > >>>>> [   15.092054]  [<ffffffff811fab96>] vfs_read+0x86/0x130
> >> > >>>>> [   15.097691]  [<ffffffff811fbf96>] SyS_read+0x46/0xa0
> >> > >>>>> [   15.103234]  [<ffffffff818f71b2>] entry_SYSCALL_64_fastpath=
+0x1a/0xa4
> >> > >>>>> [   15.110421] Code: 05 dc 1b c3 00 89 ff 55 48 89 e5 48 8b 0c=
 f8 48 85 c9 74 1f 48 63 51 1c 48 63 41 20 5d 48 0f af c2 31 d2 48 0f af 81=
 88 00 00 00 <48> f7 b1 90 00 00 00 c3 31 c0 5d c3 66 90 0f 1f 44 00 00 8b =
77
> >> > >>>>> [   15.132161] RIP  [<ffffffff8176ad32>] intel_pstate_get+0x32=
/0x40
> >> > >>>>> [   15.138875]  RSP <ffff88081ab23d70>
> >> > >>>>> [   15.142770] ---[ end trace e5d5a8bedf5502e1 ]---
> >> > >>>>> [   15.149323] Kernel panic - not syncing: Fatal exception
> >> > >>>>>
> >> > >>>>
> >> > >>>> That's intel_pstate.c:get_avg_frequency(), which assumes mperf =
!=3D 0. It
> >> > >>>> being 0 seems to suggest intel_pstate_sample() hasn't been call=
ed yet or
> >> > >>>> so.
> >> > >>>
> >> > >>> Well, what's the tree based on?
> >> > >>>
> >> > >>> The mainline does this:
> >> > >>>
> >> > >>> bool sample_taken =3D intel_pstate_sample(cpu, time);
> >> > >>>
> >> > >>> if (sample_taken && !hwp_active)
> >> > >>>         intel_pstate_adjust_busy_pstate(cpu);
> >> > >>>
> >> > >>> and (the mainline version of) intel_pstate_sample() returns fals=
e when
> >> > >>> it is called for the first time after setting the update_util ho=
ok.
> >> > >>
> >> > >> If that helps, I can expose my pm-cpufreq-fixes branch to pull fr=
om.
> >> > >> It contains all cpufreq material that went into the Linus' tree to
> >> > >> date and is based on 4.5-rc3.
> >> > >
> >> > > In fact, it is exposed already:
> >> > >
> >> > > git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
> >> > > pm-cpufreq-fixes
> >> > >
> >> > > and the top-most commit is 1becf03545a0859ceaaf9e8c2d9861882a71cb01
> >> > > (cpufreq: intel_pstate: Fix processing for turbo activation ratio).
> >> >
> >> > Ah, that will fail as well.
> >> >
> >> > The problem is that intel_pstate_get() can be called before we take
> >> > the first sample.
> >> >
> >> > I need to think about how to fix that.
> >>
> >> Maybe something like the below (untested, but builds).
> >>
> >> It will make intel_pstate_get() return 0 until avg_frequency gets popu=
lated
> >> which is actually OK.
> >
> > The previous one would break the HWP case, so below is a new one (still
> > untested).
> =

> I can reproduce the bug and your patch fix it.
> =

> Tested-by: Wanpeng Li <wanpeng.li@hotmail.com>

Thanks!

Please also try this one:

https://patchwork.kernel.org/patch/9012861/

which is the final fix for this bug.


--===============7228524158757315958==--

