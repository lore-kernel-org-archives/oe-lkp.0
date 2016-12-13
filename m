Content-Type: multipart/mixed; boundary="===============4793100250859239152=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm-add-vfree_atomic-fix
Date: Tue, 13 Dec 2016 18:24:41 +0100
Message-ID: <20161213172441.GA22610@dhcp22.suse.cz>
In-Reply-To: <CALCETrXq9a1E5M5qFFYTB4p7Ew682118bJNsWsiGQpNcFwD8Wg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4793100250859239152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 13-12-16 08:57:34, Andy Lutomirski wrote:
> On Tue, Dec 13, 2016 at 2:12 AM, Michal Hocko <mhocko@kernel.org> wrote:
> > [CC Andy]
> >
> > I've noticed the same
> > http://lkml.kernel.org/r/20161209142820.GA4334(a)dhcp22.suse.cz
> > and also concluded same as you
> >
> > On Mon 12-12-16 17:46:21, Andrey Ryabinin wrote:
> >> DEBUG_PREEMPT complains about using this_cpu_ptr() in preemptible:
> >>       BUG: using smp_processor_id() in preemptible [00000000] code: ip=
erf-300s-cs-l/277
> >>       caller is debug_smp_processor_id+0x17/0x19
> >>       CPU: 1 PID: 277 Comm: iperf-300s-cs-l Not tainted 4.9.0-rc8-0014=
0-gcc639db #2
> >>        ffffc900003f3cf0 ffffffff8123ae6f 0000000000000001 ffffffff8181=
81da
> >>        ffffc900003f3d20 ffffffff81252f41 0000000000012de0 00000000ffff=
fdff
> >>        ffff880009328f40 ffff88000592c400 ffffc900003f3d30 ffffffff8125=
2f6a
> >>       Call Trace:
> >>        [<ffffffff8123ae6f>] dump_stack+0x9a/0xd0
> >>        [<ffffffff81252f41>] check_preemption_disabled+0xdd/0xef
> >>        [<ffffffff81252f6a>] debug_smp_processor_id+0x17/0x19
> >>        [<ffffffff811796df>] __vfree_deferred+0x16/0x4c
> >>        [<ffffffff8117b584>] vfree_atomic+0x22/0x24
> >>        [<ffffffff81094f5d>] free_thread_stack+0xc2/0x106
> >>        [<ffffffff810951be>] put_task_stack+0x4c/0x62
> >>        [<ffffffff81095f81>] copy_process+0x7e0/0x16e8
> >>        [<ffffffff8109702d>] _do_fork+0xbb/0x2d3
> >>        [<ffffffff810465e8>] ? __do_page_fault+0x2e1/0x384
> >>        [<ffffffff8112633f>] ? trace_hardirqs_off_caller+0x12/0x24
> >>        [<ffffffff810972cb>] SyS_clone+0x19/0x1b
> >>        [<ffffffff81003800>] do_syscall_64+0x143/0x173
> >>        [<ffffffff81507289>] entry_SYSCALL64_slow_path+0x25/0x25
> >>
> >> Use raw_cpu_ptr() instead of this_cpu_ptr() to hide this warning.
> >> It's fine because llist_add() implementation is lock-less, so it works=
 even
> >> if we adding to the list of some other cpu. schedule_work() is also pr=
eempt-safe.
> >>
> >> Reported-by: kernel test robot <ying.huang@linux.intel.com>
> >> Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> >
> > Acked-by: Michal Hocko <mhocko@suse.com>
> =

> But not quite acked by me.  What happened to the vfree code that
> causes vfree_deferred to be called in a preemptable context?  That
> sounds like a bug.

Not sure I understand but the above stack points to a preemptible
context (copy_process). My stack was different and it looks preemptible as =
well.
free_thread_stack calls vfree_atomic unconditionally. So I am not sure
why do you think this is a bug?

> (This code doesn't exist in Linus' tree.  What tree does this apply to.)

Anyway, now that I am looking at Andrew's tree I can see [1] which
doesn't have this_cpu_ptr. So I am not sure where this this_cpu_ptr came
from. Maybe the previous version of the patch which has shown up in the
linux-next and Andrew has picked up [2] in the meantime. /me confused

[1] http://www.ozlabs.org/~akpm/mmotm/broken-out/mm-add-vfree_atomic.patch
[2] http://lkml.kernel.org/r/1481553981-3856-1-git-send-email-aryabinin(a)v=
irtuozzo.com
 =

> >
> >> ---
> >>  mm/vmalloc.c | 9 ++++++++-
> >>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >> index 43f0608..d8813963 100644
> >> --- a/mm/vmalloc.c
> >> +++ b/mm/vmalloc.c
> >> @@ -1498,7 +1498,14 @@ static void __vunmap(const void *addr, int deal=
locate_pages)
> >>
> >>  static inline void __vfree_deferred(const void *addr)
> >>  {
> >> -     struct vfree_deferred *p =3D this_cpu_ptr(&vfree_deferred);
> >> +     /*
> >> +      * Use raw_cpu_ptr() because this can be called from preemptible
> >> +      * context. Preemption is absolutely fine here, because llist_ad=
d()
> >> +      * implementation is lockless, so it works even if we adding to =
list
> >> +      * of the other cpu.
> >> +      * schedule_work() should be fine with this too.
> >> +      */
> >> +     struct vfree_deferred *p =3D raw_cpu_ptr(&vfree_deferred);
> >>
> >>       if (llist_add((struct llist_node *)addr, &p->list))
> >>               schedule_work(&p->wq);
> >> --
> >> 2.7.3
> >
> > --
> > Michal Hocko
> > SUSE Labs
> =

> =

> =

> -- =

> Andy Lutomirski
> AMA Capital Management, LLC

-- =

Michal Hocko
SUSE Labs

--===============4793100250859239152==--

