Content-Type: multipart/mixed; boundary="===============7995451010336844858=="
MIME-Version: 1.0
From: Mark Rutland <mark.rutland@arm.com>
To: lkp@lists.01.org
Subject: Re: 94d3a25408: kernel_BUG_at_kernel/fork.c
Date: Mon, 12 Mar 2018 13:46:22 +0000
Message-ID: <20180312134621.xao4map7gw3ts6nv@lakrids.cambridge.arm.com>
In-Reply-To: <20180309211139.24vegrzjmiptdqp5@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============7995451010336844858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 10, 2018 at 05:11:39AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 94d3a254089a7cd4f11b7071b4323afd98eea0a6 ("Detect early free of a=
 live mm")
> url: https://github.com/0day-ci/linux/commits/Mark-Rutland/Detect-early-f=
ree-of-a-live-mm/20180303-144149

> [   47.208935] kernel BUG at kernel/fork.c:599!
> [   47.210365] invalid opcode: 0000 [#1] SMP PTI
> [   47.211336] Modules linked in:
> [   47.212145] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.16.0-rc3-00001=
-g94d3a25 #1
> [   47.213966] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   47.215869] RIP: 0010:__mmdrop+0x136/0x170
> [   47.216866] RSP: 0018:ffffffff82803dd8 EFLAGS: 00010293
> [   47.218160] RAX: ffffffff82818500 RBX: ffff880115770000 RCX: ffffffff8=
10ae876
> [   47.219758] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88011=
5770000
> [   47.221306] RBP: ffffffff82803e00 R08: 0000000000000001 R09: 000000000=
0000000
> [   47.223268] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8=
2818500
> [   47.224961] R13: ffffffff82a8ce20 R14: ffff88013ff534c0 R15: 000000000=
00003e7
> [   47.226716] FS:  0000000000000000(0000) GS:ffff88013b200000(0000) knlG=
S:0000000000000000
> [   47.228550] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   47.229884] CR2: 00007fbfc2cc0190 CR3: 0000000002812000 CR4: 000000000=
00006f0
> [   47.231580] Call Trace:
> [   47.232144]  idle_task_exit+0x53/0x60

Luckily this is a spurious warning. In idle_task_exit(), we switch to
the init_mm, but leave active_mm stale before calling mmdrop().

In addition to the WARN_ON[_ONCE] changes, I'll drop the following in:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e7c535eee0a6..0ef844abc2da 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5506,6 +5506,7 @@ void idle_task_exit(void)
 =

        if (mm !=3D &init_mm) {
                switch_mm(mm, &init_mm, current);
+               current->active_mm =3D &init_mm;
                finish_arch_post_lock_switch();
        }
        mmdrop(mm);

Thanks,
Mark.

--===============7995451010336844858==--

