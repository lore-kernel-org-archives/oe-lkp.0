Content-Type: multipart/mixed; boundary="===============0403225035884234346=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm, kasan] 80a9201a59: RIP: 0010:[<ffffffff9890f590>] [<ffffffff9890f590>] __kernel_text_address
Date: Thu, 11 Aug 2016 13:35:03 -0700
Message-ID: <20160811133503.f0896f6781a41570f9eebb42@linux-foundation.org>
In-Reply-To: <57ac048b.Qkbm0ARWLAJq8zX6%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0403225035884234346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Aug 2016 12:52:27 +0800 kernel test robot <fengguang.wu@intel.=
com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 80a9201a5965f4715d5c09790862e0df84ce0614
> Author:     Alexander Potapenko <glider@google.com>
> AuthorDate: Thu Jul 28 15:49:07 2016 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Thu Jul 28 16:07:41 2016 -0700
> =

>     mm, kasan: switch SLUB to stackdepot, enable memory quarantine for SL=
UB
>     =

>     For KASAN builds:
>      - switch SLUB allocator to using stackdepot instead of storing the
>        allocation/deallocation stacks in the objects;
>      - change the freelist hook so that parts of the freelist can be put
>        into the quarantine.
>
> ...
>
> [   64.298576] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swa=
pper/0:1]
> [   64.300827] irq event stamp: 5606950
> [   64.301377] hardirqs last  enabled at (5606949): [<ffffffff98a4ef09>] =
T.2097+0x9a/0xbe
> [   64.302586] hardirqs last disabled at (5606950): [<ffffffff997347a9>] =
apic_timer_interrupt+0x89/0xa0
> [   64.303991] softirqs last  enabled at (5605564): [<ffffffff99735abe>] =
__do_softirq+0x23e/0x2bb
> [   64.305308] softirqs last disabled at (5605557): [<ffffffff988ee34f>] =
irq_exit+0x73/0x108
> [   64.306598] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.7.0-05999-g80a=
9201 #1
> [   64.307678] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   64.326233] task: ffff88000ea19ec0 task.stack: ffff88000ea20000
> [   64.327137] RIP: 0010:[<ffffffff9890f590>]  [<ffffffff9890f590>] __ker=
nel_text_address+0xb/0xa1
> [   64.328504] RSP: 0000:ffff88000ea27348  EFLAGS: 00000207
> [   64.329320] RAX: 0000000000000001 RBX: ffff88000ea275c0 RCX: 000000000=
0000001
> [   64.330426] RDX: ffff88000ea27ff8 RSI: 024080c099733d8f RDI: 024080c09=
9733d8f
> [   64.331496] RBP: ffff88000ea27348 R08: ffff88000ea27678 R09: 000000000=
0000000
> [   64.332567] R10: 0000000000021298 R11: ffffffff990f235c R12: ffff88000=
ea276c8
> [   64.333635] R13: ffffffff99805e20 R14: ffff88000ea19ec0 R15: 000000000=
0000000
> [   64.334706] FS:  0000000000000000(0000) GS:ffff88000ee00000(0000) knlG=
S:0000000000000000
> [   64.335916] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   64.336782] CR2: 0000000000000000 CR3: 000000000aa0a000 CR4: 000000000=
00406b0
> [   64.337846] Stack:
> [   64.338206]  ffff88000ea273a8 ffffffff9881f3dd 024080c099733d8f ffffff=
ffffff8000
> [   64.339410]  ffff88000ea27678 ffff88000ea276c8 000000020e81a4d8 ffff88=
000ea273f8
> [   64.340602]  ffffffff99805e20 ffff88000ea19ec0 ffff88000ea27438 ffff88=
000ee07fc0
> [   64.348993] Call Trace:
> [   64.349380]  [<ffffffff9881f3dd>] print_context_stack+0x68/0x13e
> [   64.350295]  [<ffffffff9881e4af>] dump_trace+0x3ab/0x3d6
> [   64.351102]  [<ffffffff9882f6e4>] save_stack_trace+0x31/0x5c
> [   64.351964]  [<ffffffff98a521db>] kasan_kmalloc+0x126/0x1f6
> [   64.365727]  [<ffffffff9882f6e4>] ? save_stack_trace+0x31/0x5c
> [   64.366675]  [<ffffffff98a521db>] ? kasan_kmalloc+0x126/0x1f6
> [   64.367560]  [<ffffffff9904a8eb>] ? acpi_ut_create_generic_state+0x43/=
0x5c
> =


At a guess I'd say that
arch/x86/kernel/dumpstack.c:print_context_stack() failed to terminate,
or took a super long time.  Is that a thing that is known to be possible?

--===============0403225035884234346==--

