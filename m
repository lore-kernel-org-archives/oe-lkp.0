Content-Type: multipart/mixed; boundary="===============5212447739780597367=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ipv6] a94b9367e0: BUG:using_smp_processor_id()in_preemptible
Date: Tue, 10 Oct 2017 07:02:07 -0700
Message-ID: <CANn89iKW8KCbs0AgembDwdFjdtp=vHwBPkRbH3q-fqfLTKamRg@mail.gmail.com>
In-Reply-To: <20171010121325.GA5445@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5212447739780597367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 5:13 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-4.9):
>
> commit: a94b9367e044ba672c9f4105eb1516ff6ff4948a ("ipv6: grab rt->rt6i_re=
f before allocating pcpu rt")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +--------------------------------------------+------------+------------+
> |                                            | 2b760fcf5c | a94b9367e0 |
> +--------------------------------------------+------------+------------+
> | boot_successes                             | 8          | 4          |
> | boot_failures                              | 0          | 4          |
> | BUG:using_smp_processor_id()in_preemptible | 0          | 4          |
> +--------------------------------------------+------------+------------+
>
>
>
> [   28.927206] BUG: using smp_processor_id() in preemptible [00000000] co=
de: odhcpd/1011
> [   28.928424] caller is debug_smp_processor_id+0x17/0x19
> [   28.929085] CPU: 1 PID: 1011 Comm: odhcpd Not tainted 4.14.0-rc3-00908=
-ga94b936 #1
> [   28.930196] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   28.931421] Call Trace:
> [   28.931765]  dump_stack+0x85/0xbe
> [   28.932244]  check_preemption_disabled+0xdb/0xed
> [   28.932845]  debug_smp_processor_id+0x17/0x19
> [   28.933421]  ip6_pol_route+0x541/0x607
> [   28.933993]  ip6_pol_route_output+0x11/0x13
> [   28.934547]  fib6_rule_action+0xbf/0x1ff
> [   28.935088]  ? ip6_pol_route_input+0x17/0x17
> [   28.935725]  fib_rules_lookup+0x18e/0x245
> [   28.936255]  ? fib_rules_lookup+0x18e/0x245
> [   28.936819]  ? ip6_pol_route_input+0x17/0x17
> [   28.937404]  fib6_rule_lookup+0x5a/0xe9
> [   28.937944]  ? ip6_pol_route_input+0x17/0x17
> [   28.938579]  ip6_route_output_flags+0xd0/0xdc
> [   28.939147]  ip6_dst_lookup_tail+0x57/0x1aa
> [   28.939748]  ip6_dst_lookup_flow+0x33/0x73
> [   28.940347]  ip6_datagram_dst_update+0x25b/0x4c2
> [   28.940947]  ? save_stack_trace+0x16/0x18
> [   28.941697]  __ip6_datagram_connect+0x218/0x2ba
> [   28.942286]  ? __ip6_datagram_connect+0x218/0x2ba
> [   28.942897]  ? __local_bh_enable_ip+0x87/0xa8
> [   28.943471]  ? lock_sock_nested+0x42/0x90
> [   28.944080]  ip6_datagram_connect+0x26/0x3a
> [   28.944634]  ip6_datagram_connect_v6_only+0x14/0x16
> [   28.945296]  inet_dgram_connect+0x4a/0x64
> [   28.945815]  SyS_connect+0x7e/0xbf
> [   28.946373]  ? __might_fault+0x79/0x7f
> [   28.946934]  compat_SyS_socketcall+0x113/0x219
> [   28.947797]  ? do_int80_syscall_32+0x22/0x1c1
> [   28.948438]  ? trace_hardirqs_on_caller+0x174/0x190
> [   28.949063]  do_int80_syscall_32+0x74/0x1c1
> [   28.949664]  entry_INT80_compat+0x32/0x50
> [   28.950269] RIP: 0023:0xf7ef2384
> [   28.950735] RSP: 002b:00000000ffa89318 EFLAGS: 00000296 ORIG_RAX: 0000=
000000000066
> [   28.951736] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000f=
fa89328
> [   28.952670] RDX: 00000000f7f38000 RSI: 00000000ffa89328 RDI: 00000000f=
fa89440
> [   28.953572] RBP: 00000000ffa89388 R08: 0000000000000000 R09: 000000000=
0000000
> [   28.954538] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [   28.955533] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
>
> Elapsed time: 30
>
> initrds=3D(
>         /osimage/openwrt/openwrt-i386-2016-03-16.cgz
>         /lkp/scheduled/vm-lkp-nex04-openwrt-ia32-27/boot-1-openwrt-i386-2=
016-03-16.cgz-a94b9367e044ba672c9f4105eb1516ff6ff4948a-20171009-12855-139pi=
yy-0.cgz
>         /lkp/lkp/lkp-i386.cgz
> )
>
> cat "${initrds[@]}" > /fs/sdb1/initrd-vm-lkp-nex04-openwrt-ia32-27
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -kernel /pkg/linux/x86_64-randconfig-h0-10091308/gcc-4.9/a94b9367=
e044ba672c9f4105eb1516ff6ff4948a/vmlinuz-4.14.0-rc3-00908-ga94b936
>         -initrd /fs/sdb1/initrd-vm-lkp-nex04-openwrt-ia32-27
>         -m 512
>         -smp 2
>         -device e1000,netdev=3Dnet0
>         -netdev user,id=3Dnet0,hostfwd=3Dtcp::23296-:22
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -watchdog-action debug
>         -rtc base=3Dlocaltime
>         -pidfile /dev/shm/kboot/pid-vm-lkp-nex04-openwrt-ia32-27
>         -serial file:/dev/shm/kboot/vm-lkp-nex04-openwrt-ia32-27/serial
>         -serial file:/dev/shm/kboot/vm-lkp-nex04-openwrt-ia32-27/kmsg
>         -daemonize
>         -display none
>         -monitor null
> )
>
> append=3D(
>         ip=3D::::vm-lkp-nex04-openwrt-ia32-27::dhcp
>         root=3D/dev/ram0
>         user=3Dlkp
>         job=3D/lkp/scheduled/vm-lkp-nex04-openwrt-ia32-27/boot-1-openwrt-=
i386-2016-03-16.cgz-a94b9367e044ba672c9f4105eb1516ff6ff4948a-20171009-12855=
-139piyy-0.yaml
>         ARCH=3Dx86_64
>         kconfig=3Dx86_64-randconfig-h0-10091308
>         branch=3Dlinux-devel/devel-spot-201710090350
>         commit=3Da94b9367e044ba672c9f4105eb1516ff6ff4948a
>         BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-h0-10091308/gcc-4.9/a94=
b9367e044ba672c9f4105eb1516ff6ff4948a/vmlinuz-4.14.0-rc3-00908-ga94b936
>         max_uptime=3D600
>         RESULT_ROOT=3D/result/boot/1/vm-lkp-nex04-openwrt-ia32/openwrt-i3=
86-2016-03-16.cgz/x86_64-randconfig-h0-10091308/gcc-4.9/a94b9367e044ba672c9=
f4105eb1516ff6ff4948a/0
>         LKP_SERVER=3Dinn
>         debug
>         apic=3Ddebug
>         sysrq_always_enabled
>         rcupdate.rcu_cpu_stall_timeout=3D100
>         net.ifnames=3D0
>         printk.devkmsg=3Don
>         panic=3D-1
>         softlockup_panic=3D1
>         nmi_watchdog=3Dpanic
>         oops=3Dpanic
>         load_ramdisk=3D2
>         prompt_ramdisk=3D0
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

Hi Xiaolong

We believe this was fixed in commit
951f788a80ff8b6339c5c1ab888b0d4b4352efd8 ipv6: fix a BUG in
rt6_get_pcpu_route()

--===============5212447739780597367==--

