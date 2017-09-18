Content-Type: multipart/mixed; boundary="===============7229661364561818021=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [lib] e4dace3615: kernel_BUG_at_arch/x86/mm/physaddr.c
Date: Sun, 17 Sep 2017 18:41:00 -0700
Message-ID: <e3ba428a-6d19-a375-2693-6e1b261f355b@gmail.com>
In-Reply-To: <20170918011203.GH22742@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7229661364561818021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Le 09/17/17 =C3=A0 18:12, kernel test robot a =C3=A9crit :
> =

> FYI, we noticed the following commit:
> =

> commit: e4dace3615526fd66c86dd535ee4bc9e8c706e37 ("lib: add test module f=
or CONFIG_DEBUG_VIRTUAL")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
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

> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

The module is doing what it should and makes the tests in
CONFIG_DEBUG_VIRTUAL be triggered, I would suggest not inserting that
module during your testing.

> =

> =

> +-------------------------------------------------------------+----------=
--+------------+
> |                                                             | 9888a588e=
a | e4dace3615 |
> +-------------------------------------------------------------+----------=
--+------------+
> | boot_successes                                              | 28       =
  | 0          |
> | boot_failures                                               | 22       =
  | 10         |
> | WARNING:at_arch/x86/mm/tlb.c:#initialize_tlbstate_and_flush | 8        =
  | 8          |
> | EIP:initialize_tlbstate_and_flush                           | 8        =
  | 8          |
> | INFO:rcu_sched_self-detected_stall_on_CPU                   | 14       =
  |            |
> | EIP:arch_local_irq_enable                                   | 14       =
  |            |
> | EIP:arch_local_irq_restore                                  | 14       =
  |            |
> | kernel_BUG_at_arch/x86/mm/physaddr.c                        | 0        =
  | 10         |
> | invalid_opcode:#[##]                                        | 0        =
  | 10         |
> | EIP:__phys_addr                                             | 0        =
  | 10         |
> | Kernel_panic-not_syncing:Fatal_exception                    | 0        =
  | 10         |
> +-------------------------------------------------------------+----------=
--+------------+
> =

> =

> =

> [   19.762380] kernel BUG at arch/x86/mm/physaddr.c:75!
> [   19.763384] invalid opcode: 0000 [#1] SMP
> [   19.763982] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.=
13.0-09302-ge4dace3 #1
> [   19.764094] task: d3094040 task.stack: d3096000
> [   19.764094] EIP: __phys_addr+0x2d/0x5a
> [   19.764094] EFLAGS: 00210202 CPU: 0
> [   19.764094] EAX: 00000001 EBX: d47de000 ECX: fffff000 EDX: ff7fe000
> [   19.764094] ESI: 147de000 EDI: c2661dc5 EBP: d3097f0c ESP: d3097f04
> [   19.764094]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [   19.764094] CR0: 80050033 CR2: 00000000 CR3: 02859000 CR4: 000006b0
> [   19.764094] Call Trace:
> [   19.764094]  test_debug_virtual_init+0x28/0xb1
> [   19.764094]  do_one_initcall+0xa4/0x1ac
> [   19.764094]  ? kernel_init_freeable+0xfd/0x1ff
> [   19.764094]  kernel_init_freeable+0x12c/0x1ff
> [   19.764094]  ? rest_init+0xae/0xae
> [   19.764094]  kernel_init+0xd/0xd0
> [   19.764094]  ret_from_fork+0x19/0x30
> [   19.764094] Code: e5 56 53 e8 b6 6c ff ff 8d b0 00 00 00 40 3d ff ff f=
f bf 77 02 0f 0b 89 c3 80 3d 08 b9 5d c2 00 74 0b e8 9b ff ff ff 84 c0 74 0=
2 <0f> 0b a1 28 45 1a c3 85 c0 74 1c 89 f2 c1 ea 0c 39 c2 76 02 0f
> [   19.764094] EIP: __phys_addr+0x2d/0x5a SS:ESP: 0068:d3097f04
> [   19.778781] ---[ end trace 35013a8e82407c24 ]---
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
> =

> =

> =

> Thanks,
> Xiaolong
> =



-- =

Florian

--===============7229661364561818021==--

