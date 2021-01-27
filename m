Content-Type: multipart/mixed; boundary="===============8155635601469926026=="
MIME-Version: 1.0
From: John Ogness <john.ogness@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Thu, 28 Jan 2021 00:35:06 +0106
Message-ID: <878s8eari5.fsf@jogness.linutronix.de>
In-Reply-To: <87bldaaxcc.fsf@jogness.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8155635601469926026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-27, John Ogness <john.ogness@linutronix.de> wrote:
> I was finally able to trigger this by using my workstation

Well, I don't know how reliably I can trigger this. I think my time will
be better spent getting lkp to trigger, since that shows to be reliable.

It took me an hour to trigger this one and I have the feeling I got
lucky with it.

[ 1854.183816] INFO: rcu_tasks detected stalls on tasks:
[ 1854.184502] 0000000036ce200f: .. nvcsw: 0/0 holdout: 1 idle_cpu: -1/1
[ 1854.185234] task:dd              state:R  running task     stack:    0 p=
id:19891 ppid:   668 flags:0x00000000
[ 1854.185273] Call Trace:
[ 1854.185275]  __schedule+0xfa9/0x1056
[ 1854.185283]  ? firmware_map_remove+0x172/0x172
[ 1854.185300]  ? ksys_write+0x147/0x180
[ 1854.185304]  schedule+0x170/0x1e3
[ 1854.185307]  exit_to_user_mode_prepare+0x27/0xac
[ 1854.185312]  syscall_exit_to_user_mode+0x41/0x4f
[ 1854.185316]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1854.185321] RIP: 0033:0x7f99bf52fc00
[ 1854.185324] RSP: 002b:00007ffd75722bf8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000001
[ 1854.185328] RAX: 0000000000000001 RBX: 00007f99bfa1b690 RCX: 00007f99bf5=
2fc00
[ 1854.185331] RDX: 0000000000000001 RSI: 0000560056ce3010 RDI: 00000000000=
00001
[ 1854.185335] RBP: 0000000000000001 R08: 0000000000000000 R09: 00000000000=
00000
[ 1854.185338] R10: 00007ffd757229c0 R11: 0000000000000246 R12: 0000560056c=
e3010
[ 1854.185341] R13: 0000000000000001 R14: 0000560056ce3010 R15: 0000560056c=
e3010

To generate syscalls and interrupts, "dd" was doing:

    dd if=3D/dev/zero bs=3D1 count=3D100000000 | nc 10.0.2.2 12345

I'm not even sure how to go about debugging this. The only printk load I
can really see are the:

    "tasks-torture:torture_onoff task: online 0 failed: errno -5"

error messages. But they are only occurring at a rate of 40-50 per
second. They are coming from the pr_alert() in kernel/torture.c:174, so
it should still be hitting spinlocks (either from the console driver or
@console_owner_lock).

I will re-focus on reproducing this with lkp.

John Ogness
--===============8155635601469926026==--

