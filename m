Content-Type: multipart/mixed; boundary="===============4623887077866211682=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/wait] 02ae2b22bd: WARNING: CPU: 0 PID: 958 at kernel/sched/core.c:7610 __might_sleep+0x6e/0x90
Date: Thu, 08 Sep 2016 14:03:00 +0200
Message-ID: <20160908120300.GA11135@redhat.com>
In-Reply-To: <57d0ed74./RdHPAg3uO0deEfh%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4623887077866211682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/08, kernel test robot wrote:
>
> FYI, we noticed the following commit:
>
> https://github.com/0day-ci/linux Oleg-Nesterov/sched-wait-fix-and-then-ki=
ll-abort_exclusive_wait/20160907-145024
> commit 02ae2b22bd2a42c4e4054563b139a541ba67a43e ("sched/wait: avoid abort=
_exclusive_wait() in ___wait_event()")

Thanks!


> [   30.775242] kill 958 cat /proc/kmsg
> [   30.775242] wait for background monitors: 959 962 oom-killer nfs-hang
> [   32.078512] ------------[ cut here ]------------
> [   32.080657] WARNING: CPU: 0 PID: 958 at kernel/sched/core.c:7610 __mig=
ht_sleep+0x6e/0x90
> [   32.084787] do not call blocking ops when !TASK_RUNNING; state=3D1 set=
 at [<ffffffff81107e0d>] prepare_to_wait_event+0xad/0x120

Because I am stupid. With my change prepare_to_wait_event() does
set_current_state(state) even on failure.

Thanks a lot, I'll send V2.

Oleg.


--===============4623887077866211682==--

