Content-Type: multipart/mixed; boundary="===============4442476713312457759=="
MIME-Version: 1.0
From: Mark Rutland <mark.rutland@arm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] 8343aae661 [ 72.812997] WARNING: CPU: 0 PID: 1449 at kernel/events/core.c:1929 perf_group_detach
Date: Thu, 15 Mar 2018 17:20:37 +0000
Message-ID: <20180315172037.fjyqid4udxjtbwft@lakrids.cambridge.arm.com>
In-Reply-To: <20180315014242.pkilssah67tyhc3h@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4442476713312457759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2018 at 09:42:43AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 8343aae66167df6708128a778e750d48dbe31302
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Mon Nov 13 14:28:33 2017 +0100
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Mon Mar 12 15:28:49 2018 +0100
> =

>     perf/core: Remove perf_event::group_entry

> [   72.843026] Call Trace:
> [   72.843414]  perf_remove_from_context+0x9a/0xc0
> [   72.844121]  perf_event_release_kernel+0x214/0x3e0
> [   72.844806]  ? _raw_spin_unlock+0x8/0x10
> [   72.845376]  ? locks_remove_file+0x219/0x230
> [   72.846093]  perf_release+0xe/0x20
> [   72.846592]  __fput+0x1b6/0x330
> [   72.847037]  ____fput+0x8/0x10
> [   72.847519]  task_work_run+0x97/0xc0
> [   72.848083]  do_exit+0x6c9/0x1220
> [   72.848590]  do_group_exit+0x96/0x110
> [   72.849143]  SyS_exit_group+0x11/0x20
> [   72.849665]  do_fast_syscall_32+0x24f/0x480
> [   72.850252]  entry_SYSENTER_32+0x53/0x86
> [   72.867675] EIP: 0xb7f6dc95
> [   72.868119] EFLAGS: 00000296 CPU: 0
> [   72.868658] EAX: ffffffda EBX: 00000000 ECX: 00000000 EDX: 00000000
> [   72.869611] ESI: fffffff9 EDI: 0000ffeb EBP: 00000020 ESP: bfef5ebc
> [   72.870549]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
> [   72.871287] Code: 1f 36 ce 0f 95 c3 89 4d e8 89 da 31 c9 e8 2a 41 fb f=
f 8b 14 9d fc ec 3f ce 8b 4d e8 39 4d ec 8d 42 01 89 04 9d fc ec 3f ce 74 1=
1 <0f> 0b eb 0d 90 90 90 90 90 90 90 90 90 90 90 90 90 31 c9 89 da
> [   72.874075] ---[ end trace 8506324d57bc7803 ]---
> [   72.874802] BUG: unable to handle kernel paging request at 6b6b6b6b

I *think* that it might be possible for this to happen were the group_leade=
r to
have a clear group_node at the time it's removed. Any sibling subsequently
removes would be a group leader, but its sibling list would be stale, point=
ing
at the (potentially freed) leader.

Previously, the sibling_list / group_entry split would have prevented this.

Does the below diff help?

Thanks,
Mark.

---->8----
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 9a07bbe66451..627814e1820d 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1917,12 +1917,12 @@ static void perf_group_detach(struct perf_event *ev=
ent)
        list_for_each_entry_safe(sibling, tmp, &event->sibling_list, siblin=
g_list) {
 =

                sibling->group_leader =3D sibling;
+               list_del_init(&sibling->sibling_list);
 =

                /* Inherit group flags from the previous leader */
                sibling->group_caps =3D event->group_caps;
 =

                if (!RB_EMPTY_NODE(&event->group_node)) {
-                       list_del_init(&sibling->sibling_list);
                        add_event_to_groups(sibling, event->ctx);
                }
 =



--===============4442476713312457759==--

