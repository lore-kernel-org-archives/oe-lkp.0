Content-Type: multipart/mixed; boundary="===============4006742149307725245=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm/64] e04a713254: double_fault:#[##]
Date: Sun, 12 Nov 2017 20:36:20 -0800
Message-ID: <CALCETrX07i2v+vVOXbjuyQ0Nb20j8RWtWmwpCrHvovv=uK7cKw@mail.gmail.com>
In-Reply-To: <20171113020847.GI22793@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4006742149307725245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2017 at 6:08 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-6):
>
> commit: e04a713254ef50629d1ae9558ddd4c118b7cb807 ("x86/asm/64: Use a perc=
pu trampoline stack for IDT entries")
> https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git x86/entry_sta=
ck.wip
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -m 512M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------+------------+------------+
> |                                          | c82ad40da1 | e04a713254 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 39         | 0          |
> | boot_failures                            | 0          | 8          |
> | double_fault:#[##]                       | 0          | 8          |
> | RIP:__do_page_fault                      | 0          | 8          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 8          |
> +------------------------------------------+------------+------------+
>
>
>
> [  187.211863] Freeing unused kernel memory: 1360K
> [  187.212799] Write protecting the kernel read-only data: 24576k
> [  187.226217] Freeing unused kernel memory: 1464K
> [  187.309521] Freeing unused kernel memory: 1556K
> [  187.310408] rodata_test: all tests were successful
> [  187.312781] double fault: 0000 [#1] PREEMPT KASAN
> [  187.313638] CPU: 0 PID: 1 Comm: init Not tainted 4.14.0-rc7-00070-ge04=
a713 #1
> [  187.318110] task: ffff88001a73d500 task.stack: ffff88001a740000
> [  187.319112] RIP: 0010:__do_page_fault+0x66/0x53d
> [  187.319874] RSP: 0000:ffffffffff575fe8 EFLAGS: 00010086
> [  187.320714] RAX: fffffbffffeaec05 RBX: ffffffffff5760f8 RCX: ffffffff8=
10c70b9
> [  187.321961] RDX: fffffbffffeaec3d RSI: 0000000000000003 RDI: ffff88001=
a73d720
> [  187.323105] RBP: 0000000000000003 R08: dffffc0000000000 R09: 000000000=
0000001
> [  187.324261] R10: ffffffffff576e10 R11: 0000000000000000 R12: fffffbfff=
feaec3d
> [  187.325481] R13: 0000000000000003 R14: fffffbffffeaec3d R15: ffff88001=
a73d500
> [  187.326656] FS:  0000000000000000(0000) GS:ffffffff82841000(0000) knlG=
S:0000000000000000
> [  187.327980] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  187.328993] CR2: ffffffffff575fd8 CR3: 000000001a41b000 CR4: 000000000=
00406b0
> [  187.330157] Call Trace:
> [  187.330582] Code: 41 48 c7 44 24 48 c1 41 5e 82 48 c7 44 24 50 00 67 0=
3 81 48 c1 e8 03 48 89 44 24 18 48 b8 00 00 00 00 00 fc ff df 48 03 44 24 1=
8 <c7> 00 f1 f1 f1 f1 c7 40 04 04 f4 f4 f4 65 48 8b 04 25 28 00 00
> [  187.346857] RIP: __do_page_fault+0x66/0x53d RSP: ffffffffff575fe8
> [  187.347874] ---[ end trace 3b2af22d0dac3392 ]---
> [  187.348663] Kernel panic - not syncing: Fatal exception
> [  187.349560] Kernel Offset: disabled

Wow, this email found at least three bugs :)  Two of them caused the
backtrace to be mostly worthless, and the third caused the crash in
the first place.

--Andy

--===============4006742149307725245==--

