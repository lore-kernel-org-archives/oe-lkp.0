Content-Type: multipart/mixed; boundary="===============7306155061139530679=="
MIME-Version: 1.0
From: Wei Wang <weiwan@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ipv6] 2b760fcf5c: WARNING:suspicious_RCU_usage
Date: Thu, 12 Oct 2017 22:09:13 -0700
Message-ID: <CAEA6p_DEoZ2nRVtxVB_gQ1KaXtrFyetxworMPmZsgjah+TS16A@mail.gmail.com>
In-Reply-To: <20171013020352.GZ26196@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7306155061139530679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 7:03 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-6):
>
> commit: 2b760fcf5cfb34e8610df56d83745b2b74ae1379 ("ipv6: hook up exceptio=
n table to store dst cache")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -m 420M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +-----------------------------------------------------------+------------=
+------------+
> |                                                           | 38fbeeeecc =
| 2b760fcf5c |
> +-----------------------------------------------------------+------------=
+------------+
> | boot_successes                                            | 6          =
| 2          |
> | boot_failures                                             | 2          =
| 32         |
> | BUG:kernel_hang_in_test_stage                             | 2          =
|            |
> | WARNING:suspicious_RCU_usage                              | 0          =
| 32         |
> | net/ipv6/route.c:#suspicious_rcu_dereference_check()usage | 0          =
| 32         |
> | WARNING:at_net/ipv6/route.c:#__rt6_find_exception_rcu     | 0          =
| 32         |
> +-----------------------------------------------------------+------------=
+------------+
>
>

This warning should be fixed by later commit 66f5d6ce53e6 ("ipv6:
replace rwlock with rcu and spinlock in fib6_table").
But by this commit, rcu is not yet used in ip6_pol_route(). (Sorry
that I missed this earlier.) Not sure what to do here to fix this
particular warning for this commit.

> [   19.842463] WARNING: suspicious RCU usage
> [   19.843540] 4.14.0-rc3-00907-g2b760fc #58 Not tainted
> [   19.844776] -----------------------------
> [   19.845854] net/ipv6/route.c:1355 suspicious rcu_dereference_check() u=
sage!
> [   19.847961]
> [   19.847961] other info that might help us debug this:
> [   19.847961]
> [   19.850409]
> [   19.850409] rcu_scheduler_active =3D 2, debug_locks =3D 1
> [   19.852220] 2 locks held by odhcpd/3695:
> [   19.853285]  #0:  (sk_lock-AF_INET6){+.+.}, at: [<ffffffff9ad44243>] i=
p6_datagram_connect+0x1d/0x3f
> [   19.855480]  #1:  (&tb->tb6_lock){++--}, at: [<ffffffff9ad267e6>] ip6_=
pol_route+0x51/0x80c
> [   19.857583]
> [   19.857583] stack backtrace:
> [   19.859115] CPU: 0 PID: 3695 Comm: odhcpd Not tainted 4.14.0-rc3-00907=
-g2b760fc #58
> [   19.861087] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   19.863123] Call Trace:
> [   19.863963]  dump_stack+0x86/0xc0
> [   19.864926]  lockdep_rcu_suspicious+0xea/0xf3
> [   19.866031]  rt6_find_cached_rt+0x51/0x84
> [   19.867173]  ip6_pol_route+0x21c/0x80c
> [   19.868199]  ip6_pol_route_output+0x16/0x18
> [   19.869287]  fib6_rule_lookup+0x1e/0x55
> [   19.870307]  ip6_route_output_flags+0xb6/0xc2
> [   19.871410]  ip6_dst_lookup_tail+0x4f/0x194
> [   19.872500]  ip6_dst_lookup_flow+0x38/0x78
> [   19.873562]  ip6_datagram_dst_update+0x254/0x482
> [   19.874690]  ? save_stack_trace+0x1b/0x1d
> [   19.875760]  __ip6_datagram_connect+0x20e/0x299
> [   19.876881]  ? __ip6_datagram_connect+0x20e/0x299
> [   19.878054]  ip6_datagram_connect+0x2b/0x3f
> [   19.879160]  ip6_datagram_connect_v6_only+0x14/0x1c
> [   19.880348]  inet_dgram_connect+0x49/0x68
> [   19.881424]  SyS_connect+0x74/0xa1
> [   19.882424]  ? __might_fault+0x7e/0x84
> [   19.883495]  ? _copy_from_user+0x61/0x82
> [   19.884531]  compat_SyS_socketcall+0xfb/0x1fd
> [   19.885644]  ? trace_hardirqs_on_caller+0x17b/0x197
> [   19.886868]  do_int80_syscall_32+0x66/0x15a
> [   19.887979]  entry_INT80_compat+0x32/0x50
> [   19.889037] RIP: 0023:0xf7f5e384
> [   19.889985] RSP: 002b:00000000ffc94db8 EFLAGS: 00000296 ORIG_RAX: 0000=
000000000066
> [   19.891958] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000f=
fc94dc8
> [   19.893475] RDX: 00000000f7fa4000 RSI: 00000000ffc94dc8 RDI: 00000000f=
fc94ee0
> [   19.894946] RBP: 00000000ffc94e28 R08: 0000000000000000 R09: 000000000=
0000000
> [   19.896454] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [   19.897968] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [   19.899594] ------------[ cut here ]------------
> [   19.900775] WARNING: CPU: 0 PID: 3695 at net/ipv6/route.c:1208 __rt6_f=
ind_exception_rcu+0x1b/0x7b
> [   19.903220] Modules linked in:
> [   19.904172] CPU: 0 PID: 3695 Comm: odhcpd Not tainted 4.14.0-rc3-00907=
-g2b760fc #58
> [   19.906147] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   19.908263] task: ffffa024549f0040 task.stack: ffffaee580810000
> [   19.909644] RIP: 0010:__rt6_find_exception_rcu+0x1b/0x7b
> [   19.910973] RSP: 0000:ffffaee580813af0 EFLAGS: 00010246
> [   19.912231] RAX: 0000000000000000 RBX: ffffaee580813cf0 RCX: 000000000=
0000001
> [   19.913783] RDX: 0000000000000000 RSI: ffffffff9b47f900 RDI: 000000000=
0000246
> [   19.915338] RBP: ffffaee580813b00 R08: 000000066508ab1f R09: 000000000=
0000001
> [   19.916847] R10: 0000000000000000 R11: ffffffff9c615d07 R12: ffffaee58=
0813b10
> [   19.918378] R13: ffffaee580813cc8 R14: ffffffff9b5b9c00 R15: 000000000=
0000001
> [   19.919927] FS:  0000000000000000(0000) GS:ffffa02459e00000(0063) knlG=
S:00000000f7fd8690
> [   19.922000] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [   19.923380] CR2: 0000000008072f50 CR3: 00000000155eb000 CR4: 000000000=
00006f0
> [   19.924900] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   19.926432] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   19.927984] Call Trace:
> [   19.928865]  rt6_find_cached_rt+0x61/0x84
> [   19.930039]  ip6_pol_route+0x21c/0x80c
> [   19.931092]  ip6_pol_route_output+0x16/0x18
> [   19.932201]  fib6_rule_lookup+0x1e/0x55
> [   19.933277]  ip6_route_output_flags+0xb6/0xc2
> [   19.934439]  ip6_dst_lookup_tail+0x4f/0x194
> [   19.935543]  ip6_dst_lookup_flow+0x38/0x78
> [   19.936617]  ip6_datagram_dst_update+0x254/0x482
> [   19.937799]  ? save_stack_trace+0x1b/0x1d
> [   19.938924]  __ip6_datagram_connect+0x20e/0x299
> [   19.940095]  ? __ip6_datagram_connect+0x20e/0x299
> [   19.941286]  ip6_datagram_connect+0x2b/0x3f
> [   19.942395]  ip6_datagram_connect_v6_only+0x14/0x1c
> [   19.943604]  inet_dgram_connect+0x49/0x68
> [   19.944673]  SyS_connect+0x74/0xa1
> [   19.945696]  ? __might_fault+0x7e/0x84
> [   19.946774]  ? _copy_from_user+0x61/0x82
> [   19.947851]  compat_SyS_socketcall+0xfb/0x1fd
> [   19.948968]  ? trace_hardirqs_on_caller+0x17b/0x197
> [   19.950155]  do_int80_syscall_32+0x66/0x15a
> [   19.951261]  entry_INT80_compat+0x32/0x50
> [   19.952327] RIP: 0023:0xf7f5e384
> [   19.953284] RSP: 002b:00000000ffc94db8 EFLAGS: 00000296 ORIG_RAX: 0000=
000000000066
> [   19.955272] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000f=
fc94dc8
> [   19.956794] RDX: 00000000f7fa4000 RSI: 00000000ffc94dc8 RDI: 00000000f=
fc94ee0
> [   19.958322] RBP: 00000000ffc94e28 R08: 0000000000000000 R09: 000000000=
0000000
> [   19.959821] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [   19.961360] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [   19.962902] Code: c9 08 5b 29 c8 5d 69 c0 47 86 c8 61 c1 e8 16 c3 0f 1=
f 44 00 00 55 48 89 e5 41 54 49 89 fc 53 48 89 f3 e8 47 76 3e ff 85 c0 75 0=
2 <0f> ff 49 83 3c 24 00 74 05 48 85 db 75 04 31 c0 eb 49 48 89 df
> [   19.967235] ---[ end trace 3bb578fee2b944dc ]---
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
>
>
>
> Thanks,
> Xiaolong

--===============7306155061139530679==--

