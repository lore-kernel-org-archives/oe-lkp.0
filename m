Content-Type: multipart/mixed; boundary="===============6210843936319546048=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/entry/64/compat] d47479d034: BUG: kernel boot hang
Date: Thu, 17 Sep 2015 16:39:32 -0700
Message-ID: <CALCETrX6uCMndNB5JkN3DtfMuPHas7C2Z_0EMs0+Mi9sMzOnxg@mail.gmail.com>
In-Reply-To: <878u85g1v2.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6210843936319546048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2015 at 8:29 PM, kernel test robot <ying.huang@intel.com>=
 wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry_=
compat
> commit d47479d0345d4031e660c59bfe92a2dd317c8eaf ("x86/entry/64/compat: Mi=
grate the body of the syscall entry to C")
>

That was a cute bug.  I reproduced it, fixed it, and updated my branch.  Th=
anks!

(Grr, assembly code.  On the bright side, the diffstat is even better
now, since I fixed it by deleting even more asm!)

--Andy

>
> +------------------------------------------------------+------------+----=
--------+
> |                                                      | 87475de25f | d47=
479d034 |
> +------------------------------------------------------+------------+----=
--------+
> | boot_successes                                       | 189        | 13 =
        |
> | boot_failures                                        | 11         | 210=
        |
> | BUG:kernel_test_crashed                              | 10         |    =
        |
> | WARNING:at_mm/page_alloc.c:#__alloc_pages_nodemask() | 1          |    =
        |
> | backtrace:packet_setsockopt                          | 1          |    =
        |
> | backtrace:compat_SyS_socketcall                      | 1          |    =
        |
> | kernel_BUG_at_arch/x86/kernel/traps.c                | 0          | 47 =
        |
> | invalid_opcode                                       | 0          | 47 =
        |
> | RIP:fixup_bad_iret                                   | 0          | 47 =
        |
> | Kernel_panic-not_syncing:Fatal_exception             | 0          | 47 =
        |
> | BUG:kernel_boot_hang                                 | 0          | 163=
        |
> +------------------------------------------------------+------------+----=
--------+
>
>
> [    3.456532] ------------[ cut here ]------------
> [    3.457007] kernel BUG at arch/x86/kernel/traps.c:568!
> [    3.457007] invalid opcode: 0000 [#1] SMP
> [    3.457007] Modules linked in:
> [    3.457007] CPU: 0 PID: 82 Comm: rcS Not tainted 4.2.0-rc7-00104-gd474=
79d #1
> [    3.457007] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    3.457007] task: ffff880013a1c000 ti: ffff880013a9c000 task.ti: ffff8=
80013a9c000
> [    3.457007] RIP: 0010:[<ffffffff810151de>]  [<ffffffff810151de>] fixup=
_bad_iret+0x5e/0x60
> [    3.457007] RSP: 0000:ffff880013a9fee8  EFLAGS: 00010046
> [    3.457007] RAX: ffff880013a9ff50 RBX: ffff880013a9ff50 RCX: ffffffff8=
1893957
> [    3.457007] RDX: 0000000000000008 RSI: ffff880013a9ff10 RDI: ffff88001=
3a9ff50
> [    3.457007] RBP: ffff880013a9ff00 R08: 0000000000000000 R09: 000000000=
0000000
> [    3.457007] R10: ffffffff81894f92 R11: ffffffff81894f92 R12: ffff88001=
3aa0000
> [    3.457007] R13: ffff880013a9ff10 R14: 0000000000000000 R15: 000000000=
0000000
> [    3.457007] FS:  0000000000000000(0000) GS:ffff880012200000(0000) knlG=
S:0000000000000000
> [    3.457007] CS:  0010 DS: 002b ES: 002b CR0: 000000008005003b
> [    3.457007] CR2: 00000000ffaeafa0 CR3: 0000000013aa4000 CR4: 000000000=
00006f0
> [    3.457007] Stack:
> [    3.457007]  0000000000000001 0000000000000000 0000000000000000 000000=
0000000000
> [    3.457007]  ffffffff81895219 ffffffff81894f92 0000000000000000 000000=
0000000000
> [    3.457007]  0000000000000000 0000000000000000 0000000000000000 000000=
0000000000
> [    3.457007] Call Trace:
> [    3.457007]  [<ffffffff81895219>] error_entry+0xa9/0xb0
> [    3.457007]  [<ffffffff81894f92>] ? general_protection+0x12/0x30
> [    3.457007]  [<ffffffff81894f92>] ? general_protection+0x12/0x30
> [    3.457007] Code: 88 00 00 00 e8 e4 ab 3e 00 ba 88 00 00 00 4c 89 ee 4=
8 89 df e8 d4 ab 3e 00 41 f6 44 24 e0 03 74 0a 48 89 d8 5b 41 5c 41 5d 5d c=
3 <0f> 0b 66 66 66 66 90 55 48 89 e5 eb 13 66 66 90 0f 0b bf 7d 00
> [    3.457007] RIP  [<ffffffff810151de>] fixup_bad_iret+0x5e/0x60
> [    3.457007]  RSP <ffff880013a9fee8>
> [    3.457007] ---[ end trace 7cb2870a2255142c ]---
> [    3.457007] Kernel panic - not syncing: Fatal exception
> [    3.457007] Kernel Offset: disabled
>
>
> Thanks,
> Ying Huang



-- =

Andy Lutomirski
AMA Capital Management, LLC

--===============6210843936319546048==--

