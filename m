Content-Type: multipart/mixed; boundary="===============6518046842628664146=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/refcount] b631e535c6: WARNING:at_net/netlink/af_netlink.c:#netlink_sock_destruct
Date: Sun, 23 Jul 2017 20:52:53 -0700
Message-ID: <CAGXu5j+ijEOp1chiSE9fkzgUcQVYyDpxFRhDbP-RmfUd9_y2aQ@mail.gmail.com>
In-Reply-To: <20170724021314.GE32356@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6518046842628664146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Is 14afee4b6092f ("net: convert sock.sk_wmem_alloc from atomic_t to
refcount_t") correct? That looks like a statistics counter, not a
refcounter? I can't quite tell, though...

I think this WARN is from:

WARN_ON(refcount_read(&sk->sk_wmem_alloc));

-Kees

On Sun, Jul 23, 2017 at 7:13 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> commit: b631e535c61d7ddbb7ebac545f729ca9b3b6d70e ("x86/refcount: Implemen=
t fast refcount overflow protection")
> https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git kspp/fast-ref=
count/ud/v6
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------------------------+-----------=
-+------------+
> |                                                            | 561ee9566e=
 | b631e535c6 |
> +------------------------------------------------------------+-----------=
-+------------+
> | boot_successes                                             | 37        =
 | 0          |
> | boot_failures                                              | 0         =
 | 4          |
> | WARNING:at_net/netlink/af_netlink.c:#netlink_sock_destruct | 0         =
 | 4          |
> +------------------------------------------------------------+-----------=
-+------------+
>
>
>
> [   36.991339] WARNING: CPU: 0 PID: 280 at net/netlink/af_netlink.c:374 n=
etlink_sock_destruct+0x1ea/0x200
> [   36.994035] Modules linked in:
> [   36.994815] CPU: 0 PID: 280 Comm: sh Not tainted 4.13.0-rc1-00003-gb63=
1e53 #1
> [   36.996546] task: ffff88001448c180 task.stack: ffffc900004e0000
> [   36.998006] RIP: 0010:netlink_sock_destruct+0x1ea/0x200
> [   36.999290] RSP: 0018:ffffffff82433de0 EFLAGS: 00010206
> [   37.000591] RAX: ffff88001448c180 RBX: ffff880016a3d000 RCX: 000000000=
0000000
> [   37.002319] RDX: 0000000000000100 RSI: 0000000000000001 RDI: ffffffff8=
2796f48
> [   37.004061] RBP: ffffffff82433df0 R08: 0000000000000000 R09: 000000000=
0000000
> [   37.005780] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000001
> [   37.007528] R13: ffffffff81cd4a00 R14: 96e49674e09954cf R15: 000000000=
000001f
> [   37.009261] FS:  0000000000000000(0000) GS:ffffffff82430000(0000) knlG=
S:0000000000000000
> [   37.011233] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   37.012629] CR2: 00007f268a96e688 CR3: 00000000159ff000 CR4: 000000000=
00006b0
> [   37.014212] Call Trace:
> [   37.014745]  <IRQ>
> [   37.015201]  __sk_destruct+0x3a2/0x4c0
> [   37.015994]  sk_destruct+0x3f/0x70
> [   37.016747]  __sk_free+0x10d/0x160
> [   37.017479]  sk_free+0x4a/0x60
> [   37.018127]  deferred_put_nlk_sk+0xd9/0xf0
> [   37.018998]  rcu_process_callbacks+0x766/0x1cb0
> [   37.019944]  ? rcu_process_callbacks+0x643/0x1cb0
> [   37.020960]  __do_softirq+0x10c/0x6b2
> [   37.021749]  irq_exit+0x135/0x140
> [   37.022458]  smp_apic_timer_interrupt+0x3b/0x50
> [   37.023429]  apic_timer_interrupt+0x8e/0xa0
> [   37.024303] RIP: 0010:__sanitizer_cov_trace_pc+0x0/0x60
> [   37.025141] RSP: 0018:ffffc900004e3c10 EFLAGS: 00000246 ORIG_RAX: ffff=
ffffffffff10
> [   37.026605] RAX: ffff88001448c180 RBX: ffffffff82727288 RCX: 000000000=
0000000
> [   37.028340] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff8=
2727288
> [   37.030077] RBP: ffffc900004e3c60 R08: 0000000000000000 R09: 000000000=
0000000
> [   37.031796] R10: 0000000000000000 R11: 0000000000000001 R12: 000000000=
0000000
> [   37.033546] R13: 0000000000000000 R14: 0000000000000000 R15: 00007f268=
9f93000
> [   37.035262]  </IRQ>
> [   37.035814]  ? ftrace_likely_update+0x39/0x200
> [   37.036925]  ? vm_normal_page+0xd7/0x1a0
> [   37.037886]  unmap_page_range+0x775/0x14d0
> [   37.038658]  unmap_single_vma+0x158/0x180
> [   37.039403]  unmap_vmas+0x5b/0x80
> [   37.040202]  exit_mmap+0x118/0x220
> [   37.040900]  mmput+0xd5/0x240
> [   37.041479]  do_exit+0xdb6/0x16d0
> [   37.042183]  ? entry_SYSCALL_64_fastpath+0x5/0xbd
> [   37.043365]  do_group_exit+0x8a/0x160
> [   37.044282]  SyS_exit_group+0x1d/0x20
> [   37.045192]  entry_SYSCALL_64_fastpath+0x1f/0xbd
> [   37.046321] RIP: 0033:0x7f268a676408
> [   37.047221] RSP: 002b:00007ffcba052ea8 EFLAGS: 00000246 ORIG_RAX: 0000=
0000000000e7
> [   37.049042] RAX: ffffffffffffffda RBX: 000000000000007f RCX: 00007f268=
a676408
> [   37.050784] RDX: 000000000000007f RSI: 000000000000003c RDI: 000000000=
000007f
> [   37.052512] RBP: 00007f268a96e688 R08: 00000000000000e7 R09: fffffffff=
fffffa0
> [   37.054281] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f268=
a96ff40
> [   37.056004] R13: 0000000000000001 R14: 0000000000000000 R15: 00000000f=
fffffff
> [   37.057765] Code: e8 56 14 48 ff eb ca e8 b5 42 4f ff 0f ff 0f 1f 00 e=
b a7 e8 a9 42 4f ff 0f ff 0f 1f 80 00 00 00 00 e9 48 ff ff ff e8 96 42 4f f=
f <0f> ff 0f 1f 40 00 e9 e5 fe ff ff 90 66 2e 0f 1f 84 00 00 00 00
> [   37.062621] ---[ end trace db04ba531557bbda ]---
>
>
> To reproduce:
>
>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
>
>
>
> Thanks,
> Xiaolong



-- =

Kees Cook
Pixel Security

--===============6518046842628664146==--

