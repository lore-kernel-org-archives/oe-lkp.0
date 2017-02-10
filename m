Content-Type: multipart/mixed; boundary="===============5504666950496848141=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [PM / QOS] 9820795796: kernel_BUG_at_mm/slab.c
Date: Fri, 10 Feb 2017 08:53:13 +0530
Message-ID: <20170210032313.GH14503@vireshk-i7>
In-Reply-To: <20170210022715.GE16630@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5504666950496848141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10-02-17, 10:27, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 9820795796278bc66baa3f41220f8524cbdda537 ("PM / QOS: Add 'perform=
ance' request")
> https://git.linaro.org/people/vireshk/linux opp/genpd-performance-state
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | 65e83681e6 | 9820795796 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 0          | 0          |
> | boot_failures                            | 6          | 6          |
> | Kernel_panic-not_syncing:Fatal_exception | 6          | 6          |
> | kernel_BUG_at_mm/slab.c                  | 0          | 6          |
> +------------------------------------------+------------+------------+
> =

> =

> =

> [   13.961126] kernel BUG at mm/slab.c:2815!
> [   13.962800] invalid opcode: 0000 [#1]
> [   13.963966] CPU: 0 PID: 1 Comm: swapper Not tainted 4.10.0-rc7-00115-g=
9820795 #1
> [   13.966194] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   13.969050] task: ffff88001f464040 task.stack: ffff88001f468000
> [   13.970725] RIP: 0010:___cache_free+0x157/0x2c9
> [   13.972083] RSP: 0000:ffff88001f46b640 EFLAGS: 00010002
> [   13.973598] RAX: 0000000000000400 RBX: ffff88001f400600 RCX: 000000000=
0000008
> [   13.975512] RDX: 000000000000024c RSI: ffff88001c37f000 RDI: ffff88001=
f400600
> [   13.977434] RBP: ffff88001f46b688 R08: ffff88001c37f400 R09: c1cff5f04=
a80d1ea
> [   13.979343] R10: 0000000000000000 R11: ffff88001f4647d8 R12: ffff88001=
c37f498
> [   13.981276] R13: ffff88001ffd2608 R14: ffff88001c366bb0 R15: ffff88001=
c37f000
> [   13.983208] FS:  0000000000000000(0000) GS:ffffffff8203b000(0000) knlG=
S:0000000000000000
> [   13.985600] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   13.987236] CR2: 0000000000000000 CR3: 0000000002017000 CR4: 000000000=
00006f0
> [   13.989170] Call Trace:
> [   13.990090]  ? dev_pm_qos_constraints_destroy+0x19d/0x1c8
> [   13.991656]  ? debug_check_no_locks_freed+0x114/0x147
> [   13.993132]  kfree+0x53/0x7d
> [   13.994140]  dev_pm_qos_constraints_destroy+0x19d/0x1c8

Fixed, thanks.

-- =

viresh

--===============5504666950496848141==--

