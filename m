Content-Type: multipart/mixed; boundary="===============6095890143229531827=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] 4bc0303aff: BUG: stack guard page was hit at ffffc900001bbff8
Date: Sun, 07 Aug 2016 08:43:02 -0500
Message-ID: <20160807134302.dllh76anaotll5lt@treble>
In-Reply-To: <CALCETrVN97hokdU-bpjBeDpbHNVnOkD4zc6t-JjnG4ySLg0zpA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6095890143229531827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 07, 2016 at 01:58:16AM -0700, Andy Lutomirski wrote:
> Hi Steven and Josh-
> =

> This test recursively faulted in is_ftrace_trampoline.  It's not
> immediately obvious to me what went wrong -- is_ftrace_trampoline
> doesn't seem to be dereferencing the provided address.

It seems to be faulting because one of the entries in the
ftrace_ops_list is corrupt.

00000000000013cc <is_ftrace_trampoline>:
    13cc:       55                      push   %rbp
    13cd:       65 ff 05 00 00 00 00    incl   %gs:0x0(%rip)        # 13d4 =
<is_ftrace_trampoline+0x8>
                        13d0: R_X86_64_PC32     __preempt_count-0x4
    13d4:       48 89 e5                mov    %rsp,%rbp
    13d7:       41 54                   push   %r12
    13d9:       49 89 fc                mov    %rdi,%r12
    13dc:       53                      push   %rbx
    13dd:       48 8b 1d 00 00 00 00    mov    0x0(%rip),%rbx        # 13e4=
 <is_ftrace_trampoline+0x18>
                        13e0: R_X86_64_PC32     .data..read_mostly+0x7c4
    13e4:       e8 00 00 00 00          callq  13e9 <is_ftrace_trampoline+0=
x1d>
                        13e5: R_X86_64_PC32     debug_lockdep_rcu_enabled-0=
x4

    13e9:       48 8b 83 98 01 00 00    mov    0x198(%rbx),%rax
    ^^^^ faults here because rbx (ops) is a bad pointer (RBX: 6b6b6b6b6b6b6=
b6b)

    13f0:       48 85 c0                test   %rax,%rax
    13f3:       74 19                   je     140e <is_ftrace_trampoline+0=
x42>
    13f5:       4c 39 e0                cmp    %r12,%rax
    13f8:       48 8b 93 a0 01 00 00    mov    0x1a0(%rbx),%rdx
    13ff:       77 0d                   ja     140e <is_ftrace_trampoline+0=
x42>
    1401:       48 85 d2                test   %rdx,%rdx
    1404:       74 08                   je     140e <is_ftrace_trampoline+0=
x42>
    1406:       48 01 d0                add    %rdx,%rax
    1409:       49 39 c4                cmp    %rax,%r12
    140c:       72 21                   jb     142f <is_ftrace_trampoline+0=
x63>
    140e:       48 8b 5b 08             mov    0x8(%rbx),%rbx
    1412:       e8 00 00 00 00          callq  1417 <is_ftrace_trampoline+0=
x4b>
                        1413: R_X86_64_PC32     debug_lockdep_rcu_enabled-0=
x4
    1417:       48 81 fb 00 00 00 00    cmp    $0x0,%rbx
                        141a: R_X86_64_32S      .data..read_mostly+0x800
    141e:       0f 95 c2                setne  %dl
    1421:       48 85 db                test   %rbx,%rbx
    1424:       0f 95 c0                setne  %al
    1427:       84 c2                   test   %al,%dl
    1429:       75 be                   jne    13e9 <is_ftrace_trampoline+0=
x1d>

Note that shortly before the recursive fault started, another ftrace
error occurred:

  [   59.235185] ftrace: Failed on adding breakpoints (124910):
  [   59.848448] ------------[ cut here ]------------
  [   59.853011] WARNING: CPU: 0 PID: 1625 at kernel/trace/ftrace.c:2006 ft=
race_bug+0x102/0x24a
  [   59.898634] Modules linked in:
  [   59.902617] CPU: 0 PID: 1625 Comm: trinity-main Not tainted 4.7.0-0644=
3-g4bc0303 #82
  [   59.909984] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
  [   59.926316]  0000000000000000 ffffc90004f9fbe0 ffffffff81780126 000000=
0000000000
  [   59.946998]  0000000000000000 ffffc90004f9fc20 ffffffff810e4fd9 000007=
d600000000
  [   59.955226]  ffff880031ebfee0 ffffffff8324c9a0 ffffffff85652b30 000000=
0000000001
  [   59.976130] Call Trace:
  [   59.979819]  [<ffffffff81780126>] dump_stack+0x82/0xb8
  [   59.997638]  [<ffffffff810e4fd9>] __warn+0xc2/0xdd
  [   60.001832]  [<ffffffff810e50b0>] warn_slowpath_null+0x1d/0x1f
  [   60.006141]  [<ffffffff81187920>] ftrace_bug+0x102/0x24a
  [   60.023201]  [<ffffffff810979c6>] ftrace_replace_code+0x227/0x350
  [   60.027709]  [<ffffffff81188065>] ftrace_modify_all_code+0x41/0xc9
  [   60.032357]  [<ffffffff81097aff>] arch_ftrace_update_code+0x10/0x19
  [   60.049494]  [<ffffffff81186b6a>] ftrace_run_update_code+0x1e/0x3f
  [   60.054082]  [<ffffffff81186bbd>] ftrace_startup_enable+0x32/0x34
  [   60.070761]  [<ffffffff81186d54>] ftrace_startup+0x195/0x1a7
  [   60.075193]  [<ffffffff81186d8c>] register_ftrace_function+0x26/0x3c
  [   60.079704]  [<ffffffff811a1163>] perf_ftrace_event_register+0x42/0xe7
  [   60.114514]  [<ffffffff811a0fd6>] perf_trace_init+0x29d/0x2dc
  [   60.119309]  [<ffffffff811ad345>] perf_tp_event_init+0x29/0x3b
  [   60.124026]  [<ffffffff811ade86>] perf_try_init_event+0x46/0x76
  [   60.147114]  [<ffffffff811b0034>] perf_event_alloc+0x3c4/0x6ad
  [   60.169443]  [<ffffffff811b2e47>] SYSC_perf_event_open+0x490/0xb2c
  [   60.174482]  [<ffffffff811b6b7b>] SyS_perf_event_open+0x9/0xb
  [   60.197378]  [<ffffffff81003c42>] do_int80_syscall_32+0x65/0x74
  [   60.202211]  [<ffffffff82ee2598>] entry_INT80_compat+0x38/0x50
  [   60.221358] ---[ end trace e31eb279467a53f4 ]---
  [   60.604454] ftrace faulted on writing [<ffffffff8324c9a0>] lkdtm_rodat=
a_do_nothing+0x0/0x10
  [   60.612963] Setting ftrace call site to call ftrace function
  [   60.653362] ftrace record flags: 10000001
  [   60.658136]  (1)
   expected tramp: ffffffff82ee25d0

This seems to be an expected error caused by the test case (tracing an
rodata function).  But maybe there's something in the ftrace error path
which corrupts ftrace_ops_list somehow?  Or triggers a use-after-free?

> =

> On Fri, Aug 5, 2016 at 7:07 AM, kernel test robot <xiaolong.ye@intel.co=
m> wrote:
> >
> > FYI, we noticed the following commit:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/vmap=
_stack
> > commit 4bc0303affaa75add8c5c2fbfd6d27d9b644fa0d ("x86/mm/64: Enable vma=
pped stacks")
> >
> > in testcase: boot
> >
> > on test machine: 1 threads qemu-system-x86_64 -enable-kvm -cpu Westmere=
 with 512M memory
> >
> > caused below changes:
> >
> >
> > +-------------------------------------------------------+------------+-=
-----------+
> > |                                                       | ee12d3b8b1 | =
4bc0303aff |
> > +-------------------------------------------------------+------------+-=
-----------+
> > | boot_successes                                        | 388        | =
398        |
> > | boot_failures                                         | 32         | =
39         |
> > | WARNING:at_kernel/trace/ftrace.c:#ftrace_bug          | 32         | =
39         |
> > | general_protection_fault:#[##]SMP                     | 32         | =
37         |
> > | RIP:is_ftrace_trampoline                              | 32         | =
37         |
> > | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 18         | =
8          |
> > | backtrace:perf_ftrace_event_register                  | 32         | =
39         |
> > | backtrace:perf_trace_init                             | 32         | =
39         |
> > | backtrace:perf_tp_event_init                          | 32         | =
39         |
> > | backtrace:perf_try_init_event                         | 32         | =
39         |
> > | backtrace:SYSC_perf_event_open                        | 31         | =
38         |
> > | backtrace:SyS_perf_event_open                         | 32         | =
39         |
> > | Kernel_panic-not_syncing:Fatal_exception              | 12         | =
13         |
> > | WARNING:at_include/linux/uaccess.h:#pagefault_enable  | 4          | =
           |
> > | RIP:#d:[<#>][<#>]is_ftrace_trampoline                 | 1          | =
           |
> > | BUG:kernel_test_hang                                  | 1          | =
16         |
> > | BUG:unable_to_handle_kernel                           | 1          | =
           |
> > | Oops                                                  | 1          | =
           |
> > | RIP:task_curr                                         | 1          | =
           |
> > | BUG:stack_guard_page_was_hit_at#(stack_is#..#)        | 0          | =
17         |
> > | RIP:fb_get_color_depth                                | 0          | =
3          |
> > | RIP:cfb_imageblit                                     | 0          | =
8          |
> > | RIP:fb_get_buffer_offset                              | 0          | =
4          |
> > | RIP:get_attribute                                     | 0          | =
1          |
> > | RIP:number                                            | 0          | =
1          |
> > +-------------------------------------------------------+------------+-=
-----------+
> >
> > [   68.243445] Call Trace:
> > [   68.244310] general protection fault: 0000 [#18] SMP
> > [   68.249171] BUG: stack guard page was hit at ffffc900001bbff8 (stack=
 is ffffc900001bc000..ffffc900001bffff)
> > [   68.249174] kernel stack overflow (double-fault): 0000 [#19] SMP
> > [   68.249175] Modules linked in:
> > [   68.249178] CPU: 0 PID: 6 Comm: kworker/u2:0 Tainted: G        W    =
   4.7.0-06443-g4bc0303 #82
> > [   68.249179] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS Debian-1.8.2-1 04/01/2014
> > [   68.249185] Workqueue: netns cleanup_net
> > [   68.249187] task: ffff8800314ec180 task.stack: ffffc900001bc000
> > [   68.249192] RIP: 0010:[<ffffffff817f31f0>]  [<ffffffff817f31f0>] fb_=
get_buffer_offset+0x18/0x8c
> > [   68.249193] RSP: 0000:ffffc900001bc000  EFLAGS: 00010002
> > [   68.249194] RAX: 0000000000000001 RBX: ffff88002deab000 RCX: 0000000=
000000001
> > [   68.249195] RDX: 0000000000000001 RSI: ffff88002deab320 RDI: ffff880=
02deab000
> > [   68.249197] RBP: ffffc900001bc018 R08: 0000000000000000 R09: 0000000=
000000048
> > [   68.249198] R10: 0000000000000000 R11: ffffffff83174d50 R12: ffff880=
02cb68000
> > [   68.249199] R13: 00000000ffffffff R14: 0000000000000010 R15: ffff880=
031c0d800
> > [   68.249202] FS:  0000000000000000(0000) GS:ffff880033200000(0000) kn=
lGS:0000000000000000
> > [   68.249203] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   68.249204] CR2: ffffc900001bbff8 CR3: 0000000004021000 CR4: 0000000=
0000006f0
> > [   68.249208] DR0: 0000000008c45968 DR1: 0000000000000000 DR2: 0000000=
000000000
> > [   68.249210] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000=
000000600
> > [   68.249210] Stack:
> > [   68.249211]
> >
> >
> > FYI, raw QEMU command line is:
> >
> >         qemu-system-x86_64 -enable-kvm -cpu Westmere -kernel /pkg/linux=
/x86_64-allyesdebian/gcc-6/4bc0303affaa75add8c5c2fbfd6d27d9b644fa0d/vmlinuz=
-4.7.0-06443-g4bc0303 -append 'ip=3D::::vm-kbuild-yocto-ia32-29::dhcp root=
=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-kbuild-yocto-ia32-29/boot-1=
-yocto-minimal-i386.cgz-4bc0303affaa75add8c5c2fbfd6d27d9b644fa0d-20160801-5=
4711-lk1j2k-228.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-allyesdebian branch=3Dl=
inux-devel/devel-catchup-201607300515 commit=3D4bc0303affaa75add8c5c2fbfd6d=
27d9b644fa0d BOOT_IMAGE=3D/pkg/linux/x86_64-allyesdebian/gcc-6/4bc0303affaa=
75add8c5c2fbfd6d27d9b644fa0d/vmlinuz-4.7.0-06443-g4bc0303 max_uptime=3D600 =
RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-ia32/yocto-minimal-i386.cgz/x8=
6_64-allyesdebian/gcc-6/4bc0303affaa75add8c5c2fbfd6d27d9b644fa0d/227 LKP_SE=
RVER=3Dinn debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_t=
imeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpa=
nic load_ramdisk=3D2 prompt_ramdisk=3D0 systemd.log_level=3Derr ignore_logl=
evel earlyprintk=3DttyS0,115200 console=3DttyS0,115200 console=3Dtty0 vga=
=3Dnormal rw drbd.minor_count=3D8'  -initrd /fs/sdh1/initrd-vm-kbuild-yocto=
-ia32-29 -m 832 -smp 1 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -=
boot order=3Dnc -no-reboot -watchdog i6300esb -watchdog-action debug -rtc b=
ase=3Dlocaltime -drive file=3D/fs/sdh1/disk0-vm-kbuild-yocto-ia32-29,media=
=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-kbuild-yocto-ia32-29 -se=
rial file:/dev/shm/kboot/serial-vm-kbuild-yocto-ia32-29 -daemonize -display=
 none -monitor null
> >
> >
> >
> >
> >
> > Thanks,
> > Xiaolong
> =

> =

> =

> -- =

> Andy Lutomirski
> AMA Capital Management, LLC




-- =

Josh

--===============6095890143229531827==--

