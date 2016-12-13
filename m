Content-Type: multipart/mixed; boundary="===============0200941928072455774=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm-add-vfree_atomic-fix
Date: Tue, 13 Dec 2016 10:15:35 -0800
Message-ID: <CALCETrVmz5m6+yR-SsY=RTdRkF1UyN3qfRLjpjvor0U6Z=OM3w@mail.gmail.com>
In-Reply-To: <20161213172441.GA22610@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0200941928072455774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 9:24 AM, Michal Hocko <mhocko@kernel.org> wrote:
> On Tue 13-12-16 08:57:34, Andy Lutomirski wrote:
>> On Tue, Dec 13, 2016 at 2:12 AM, Michal Hocko <mhocko@kernel.org> wrot=
e:
>> > [CC Andy]
>> >
>> > I've noticed the same
>> > http://lkml.kernel.org/r/20161209142820.GA4334(a)dhcp22.suse.cz
>> > and also concluded same as you
>> >
>> > On Mon 12-12-16 17:46:21, Andrey Ryabinin wrote:
>> >> DEBUG_PREEMPT complains about using this_cpu_ptr() in preemptible:
>> >>       BUG: using smp_processor_id() in preemptible [00000000] code: i=
perf-300s-cs-l/277
>> >>       caller is debug_smp_processor_id+0x17/0x19
>> >>       CPU: 1 PID: 277 Comm: iperf-300s-cs-l Not tainted 4.9.0-rc8-001=
40-gcc639db #2
>> >>        ffffc900003f3cf0 ffffffff8123ae6f 0000000000000001 ffffffff818=
181da
>> >>        ffffc900003f3d20 ffffffff81252f41 0000000000012de0 00000000fff=
ffdff
>> >>        ffff880009328f40 ffff88000592c400 ffffc900003f3d30 ffffffff812=
52f6a
>> >>       Call Trace:
>> >>        [<ffffffff8123ae6f>] dump_stack+0x9a/0xd0
>> >>        [<ffffffff81252f41>] check_preemption_disabled+0xdd/0xef
>> >>        [<ffffffff81252f6a>] debug_smp_processor_id+0x17/0x19
>> >>        [<ffffffff811796df>] __vfree_deferred+0x16/0x4c
>> >>        [<ffffffff8117b584>] vfree_atomic+0x22/0x24
>> >>        [<ffffffff81094f5d>] free_thread_stack+0xc2/0x106
>> >>        [<ffffffff810951be>] put_task_stack+0x4c/0x62
>> >>        [<ffffffff81095f81>] copy_process+0x7e0/0x16e8
>> >>        [<ffffffff8109702d>] _do_fork+0xbb/0x2d3
>> >>        [<ffffffff810465e8>] ? __do_page_fault+0x2e1/0x384
>> >>        [<ffffffff8112633f>] ? trace_hardirqs_off_caller+0x12/0x24
>> >>        [<ffffffff810972cb>] SyS_clone+0x19/0x1b
>> >>        [<ffffffff81003800>] do_syscall_64+0x143/0x173
>> >>        [<ffffffff81507289>] entry_SYSCALL64_slow_path+0x25/0x25
>> >>
>> >> Use raw_cpu_ptr() instead of this_cpu_ptr() to hide this warning.
>> >> It's fine because llist_add() implementation is lock-less, so it work=
s even
>> >> if we adding to the list of some other cpu. schedule_work() is also p=
reempt-safe.
>> >>
>> >> Reported-by: kernel test robot <ying.huang@linux.intel.com>
>> >> Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
>> >
>> > Acked-by: Michal Hocko <mhocko@suse.com>
>>
>> But not quite acked by me.  What happened to the vfree code that
>> causes vfree_deferred to be called in a preemptable context?  That
>> sounds like a bug.
>
> Not sure I understand but the above stack points to a preemptible
> context (copy_process). My stack was different and it looks preemptible a=
s well.
> free_thread_stack calls vfree_atomic unconditionally. So I am not sure
> why do you think this is a bug?
>
>> (This code doesn't exist in Linus' tree.  What tree does this apply to.)
>
> Anyway, now that I am looking at Andrew's tree I can see [1] which
> doesn't have this_cpu_ptr. So I am not sure where this this_cpu_ptr came
> from. Maybe the previous version of the patch which has shown up in the
> linux-next and Andrew has picked up [2] in the meantime. /me confused
>
> [1] http://www.ozlabs.org/~akpm/mmotm/broken-out/mm-add-vfree_atomic.patch
> [2] http://lkml.kernel.org/r/1481553981-3856-1-git-send-email-aryabinin(a=
)virtuozzo.com

The underlying issue seems to be that we have this shiny new function
vfree_atomic() which doesn't work in *non-atomic* context and that we
have "kernel/fork: use vfree_atomic() to free thread stack" that calls
vfree_atomic() from non-atomic context.

I'm not sure what the motivation of the latter patch was, but ISTM we
should revert it.  TBH I'm not quite sure what the purpose of
splitting vfree() and vfree_atomic() was, but I'm not seeing any
reason that the common case of freeing stacks from non-atomic context
should defer the free instead of just doing it right away.

Andrey, Johannes, why should task stack freeing use vfree_atomic() in
the first place?

--===============0200941928072455774==--

