Content-Type: multipart/mixed; boundary="===============4560855770554980613=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, memcg] b4536f0c82: kobject(#):tried_to_init_an_initialized_object, something_is_seriously_wrong
Date: Mon, 12 Jun 2017 09:44:28 +0200
Message-ID: <20170612074427.GB7476@dhcp22.suse.cz>
In-Reply-To: <20170612065945.GF21477@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4560855770554980613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 12-06-17 14:59:45, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: b4536f0c829c8586544c94735c343f9b5070bd01 ("mm, memcg: fix the act=
ive list aging for lowmem requests when memcg is enabled")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: boot

This is really strange. The commit is merged since 4.10-rc4 and this is
the first time I can see a report like this. Is there anything new in
your testing setup? The effect on the x86_64 without movable zones
should be pretty much a noop.

> [    4.442394] g_mass_storage usbip-vudc.0: failed to start g_mass_storag=
e: -22
> [    4.443795] usbip-vudc: probe of usbip-vudc.0 failed with error -22
> [    4.445075] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [    4.447707] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    4.448652] serio: i8042 KBD port at 0x60,0x64 irq 12
> [    4.449626] kobject (ffff902eda7d6d58): tried to init an initialized o=
bject, something is seriously wrong.

This sounds suspicious!

> [    4.451431] CPU: 0 PID: 1 Comm: swapper Not tainted 4.10.0-rc3-00070-g=
b4536f0c8 #1
> [    4.452774] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000008
> [    4.452784] IP: process_one_work+0x37/0x500
> [    4.452786] PGD 0 =

> [    4.452787] =

> [    4.452788] Oops: 0000 [#1]
> [    4.452792] CPU: 0 PID: 21 Comm: kworker/0:1 Not tainted 4.10.0-rc3-00=
070-gb4536f0c8 #1
> [    4.452793] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [    4.452801] task: ffff902edf6f6e00 task.stack: ffff902edf7a0000
> [    4.452804] RIP: 0010:process_one_work+0x37/0x500
> [    4.452805] RSP: 0000:ffff902edf7a3e58 EFLAGS: 00010046
> [    4.452807] RAX: ffff902edc3ae800 RBX: ffff902edf788930 RCX: ffff902ed=
fb13960
> [    4.452808] RDX: ffff902edc3ae800 RSI: ffff902edc3ad000 RDI: ffff902ed=
f788900
> [    4.452809] RBP: ffff902edf7a3e98 R08: ffff902edfb13040 R09: ffff902ed=
f62c651
> [    4.452811] R10: 0000000000000000 R11: 0000000000000800 R12: ffffffff9=
964bb80
> [    4.452812] R13: ffff902edf788900 R14: 0000000000000000 R15: ffff902ed=
c3ad000
> [    4.452815] FS:  0000000000000000(0000) GS:ffffffff99631000(0000) knlG=
S:0000000000000000
> [    4.452816] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.452817] CR2: 00000000000000a8 CR3: 000000001720e000 CR4: 000000000=
00006f0
> [    4.452823] Call Trace:
> [    4.452827]  worker_thread+0x2ae/0x680
> [    4.452832]  kthread+0x10b/0x140
> [    4.452834]  ? process_one_work+0x500/0x500
> [    4.452836]  ? __kthread_create_on_node+0x190/0x190

And this trace is nowhere close to the reclaim path. So is it possible
that this is just a fallout of some other earlier errors? How
reproducible is it?

-- =

Michal Hocko
SUSE Labs

--===============4560855770554980613==--

