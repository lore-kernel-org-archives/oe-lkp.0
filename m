Content-Type: multipart/mixed; boundary="===============6013854604907954195=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hpet] a28b41ab00: RIP: 0010:[<ffffffff84884ef2>] [<ffffffff84884ef2>] __lock_acquire+0xce/0x649
Date: Fri, 15 Jul 2016 18:09:25 +0200
Message-ID: <20160715160925.GD16938@linutronix.de>
In-Reply-To: <20160714025320.GB16221@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6013854604907954195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* kernel test robot | 2016-07-14 10:53:20 [+0800]:

>FYI, we noticed the following commit:
>
>https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.smp/hotplug
>commit a28b41ab00dc93b9b16deda9d9b4b26601444f6d ("x86/hpet: Convert to hot=
plug state machine")

This is gone in the meantime. I have head
ecd8081f6fb9032c41e5c38885f06836da6ab455 of WIP.hotplug. The commit in
question is in as 48d7f6c71578 ("x86/hpet: Convert to hotplug state
machine").

>in testcase: boot
>
>on test machine: 2 threads qemu-system-x86_64 -enable-kvm -cpu Nehalem wit=
h 320M memory
>
>caused below changes:
=E2=80=A6

>[    1.659021] Unpacking initramfs...
>[    1.696928] workqueue: round-robin CPU selection forced, expect perform=
ance impact
>[    1.702995] general protection fault: 0000 [#1]
>[    1.704143] Modules linked in:
>[    1.704950] CPU: 0 PID: 1 Comm: swapper Not tainted 4.7.0-rc7-00193-ga2=
8b41a #1
>[    1.709158] task: ffff880012052000 ti: ffff880012054000 task.ti: ffff88=
0012054000
>[    1.713142] RIP: 0010:[<ffffffff84884ef2>]  [<ffffffff84884ef2>] __lock=
_acquire+0xce/0x649

The tree I mentioned boots, I get pass this point and am in
|[   64.481048] rcu-torture: Reader Pipe:  2 0 0 0 0 0 0 0 0 0 0

so you might have tested a stale version of the patch queue.

Sebastian

--===============6013854604907954195==--

