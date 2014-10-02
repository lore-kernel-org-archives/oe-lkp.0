Content-Type: multipart/mixed; boundary="===============8243808767714748266=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 13:09:27 +0200
Message-ID: <20141002110927.GE2849@worktop.programming.kicks-ass.net>
In-Reply-To: <20140930080228.GD9561@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8243808767714748266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 04:02:28PM +0800, Fengguang Wu wrote:
> Hi Peter,
> =

> We possibly find a rfcomm bug (maintainers CCed) exposed by your debug pa=
tch
> =

> [    1.861895] NET: Registered protocol family 5
> [    1.862978] Bluetooth: RFCOMM TTY layer initialized
> [    1.863099] ------------[ cut here ]------------
> [    1.863105] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __migh=
t_sleep+0x17d/0x1a1()
> [    1.863112] do not call blocking ops when !TASK_RUNNING; state=3D1 set=
 at [<c14dc381>] rfcomm_run+0xdf/0x130e
> [    1.863591]  [<c1058b73>] ? kthread_stop+0x53/0x53
> [    1.864906]  [<c155a411>] dump_stack+0x48/0x60
> [    1.866298]  [<c14dc381>] ? rfcomm_run+0xdf/0x130e

Ha yes, rfcomm_run is a complete buggy mess indeed. Lemme go see what I
can make of it.

--===============8243808767714748266==--

