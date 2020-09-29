Content-Type: multipart/mixed; boundary="===============9066609664642697891=="
MIME-Version: 1.0
From: Maxim Mikityanskiy <maximmi@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [net] d18d22ce8f: UBSAN:Undefined_behaviour_in_net/core/dev.c
Date: Tue, 29 Sep 2020 14:28:09 +0300
Message-ID: <75983df0-0367-147f-5a17-dd38fa898dc6@nvidia.com>
In-Reply-To: <20200927010756.GU28663@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============9066609664642697891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-09-27 04:07, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: d18d22ce8f62839365c984b1df474d3975ed4eb2 ("net: Fix packet reorde=
ring caused by GRO and listified RX cooperation")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git l=
inux-5.4.y
> =

> =

> in testcase: trinity
> version: trinity-i386-4d2343bd-1_20200320
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------+-----=
-------+------------+
> |                                                                  | 8bc3=
025206 | d18d22ce8f |
> +------------------------------------------------------------------+-----=
-------+------------+
> | boot_successes                                                   | 0   =
       | 0          |
> | boot_failures                                                    | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_arch/x86/kernel.c                   | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/tbprint.c       | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/tbutils.c       | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/tbdata.c        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/tbxface.c       | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_kernel/workqueue.c                  | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/nsaccess.c      | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_lib/string.c                        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_arch/x86/kernel/alternative.c       | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_arch/x86/realmode/init.c            | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_crypto/algapi.c                     | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_kernel/events/core.c                | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_kernel/exit.c                       | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_kernel/sched/cputime.c              | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_kernel/locking/lockdep.c            | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/tbxfload.c      | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/dsmthdat.c      | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/psargs.c        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/dsinit.c        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/evgpeinit.c     | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/evregion.c      | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/nsinit.c        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/utpredef.c      | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/sysfs.c                | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/rsutils.c       | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/rsaddr.c        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/rscalc.c        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/rsmisc.c        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/acpi/acpica/rsxface.c       | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_lib/zlib_inflate/inffast.c          | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_crypto/api.c                        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_drivers/base/devres.c               | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_include/linux/compiler.h            | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_include/uapi/linux/swab.h           | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_include/linux/unaligned/access_ok.h | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv4/af_inet.c                  | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_include/net/ip.h                    | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv4/ipconfig.c                 | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv4/ip_input.c                 | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv4/udp.c                      | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_kernel/signal.c                     | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_include/linux/skbuff.h              | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_kernel/cgroup/cgroup.c              | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv6/ip6_offload.c              | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv6/ip6_input.c                | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_include/net/ipv6.h                  | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv6/route.c                    | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv6/icmp.c                     | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_include/net/ip6_checksum.h          | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv6/ndisc.c                    | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv6/addrconf_core.c            | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv6/addrconf.c                 | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv6/ip6_fib.c                  | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_fs/readdir.c                        | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/unix/garbage.c                  | 4   =
       | 4          |
> | UBSAN:Undefined_behaviour_in_include/linux/etherdevice.h         | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv4/tcp_offload.c              | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv4/tcp_ipv4.c                 | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_include/linux/tcp.h                 | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_include/net/dsfield.h               | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv4/tcp_input.c                | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/ipv4/tcp_minisocks.c            | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_net/sunrpc/xprtsock.c               | 4   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_kernel/events/hw_breakpoint.c       | 4   =
       | 4          |
> | UBSAN:Undefined_behaviour_in_kernel/capability.c                 | 4   =
       | 4          |
> | UBSAN:Undefined_behaviour_in_kernel/time/time.c                  | 3   =
       |            |
> | UBSAN:Undefined_behaviour_in_kernel/sys.c                        | 4   =
       | 4          |
> | UBSAN:Undefined_behaviour_in_fs/utimes.c                         | 4   =
       | 4          |
> | UBSAN:Undefined_behaviour_in_kernel/futex.c                      | 4   =
       | 4          |
> | UBSAN:Undefined_behaviour_in_include/net/ndisc.h                 | 4   =
       | 4          |
> | UBSAN:Undefined_behaviour_in_net/ipv6/udp.c                      | 4   =
       | 4          |
> | UBSAN:Undefined_behaviour_in_include/linux/jhash.h               | 4   =
       | 4          |
> | UBSAN:Undefined_behaviour_in_include/net/neighbour.h             | 4   =
       | 4          |
> | EIP:check_poison_obj                                             | 1   =
       | 2          |
> | EIP:rcutorture_one_extend                                        | 1   =
       |            |
> | UBSAN:Undefined_behaviour_in_kernel/sched/core.c                 | 2   =
       | 4          |
> | EIP:arch_local_irq_enable                                        | 1   =
       |            |
> | EIP:delay_tsc                                                    | 2   =
       | 1          |
> | EIP:arch_local_irq_restore                                       | 2   =
       | 2          |
> | EIP:kmem_cache_alloc                                             | 1   =
       |            |
> | UBSAN:Undefined_behaviour_in_fs/proc/array.c                     | 1   =
       |            |
> | EIP:__copy_user_ll                                               | 1   =
       |            |
> | EIP:update_stack_state                                           | 0   =
       | 1          |
> | UBSAN:Undefined_behaviour_in_net/core/dev.c                      | 0   =
       | 6          |
> | UBSAN:Undefined_behaviour_in_fs/ioctl.c                          | 0   =
       | 2          |
> | EIP:copy_user_highpage                                           | 0   =
       | 1          |
> | EIP:do_fault                                                     | 0   =
       | 1          |
> | EIP:native_safe_halt                                             | 0   =
       | 2          |
> +------------------------------------------------------------------+-----=
-------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [  439.724028] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.724993] UBSAN: Undefined behaviour in net/core/dev.c:5144:2
> [  439.725784] member access within misaligned address ba36ed7e for type =
'struct sk_buff'
> [  439.726595] which requires 8 byte alignment
> [  439.727042] CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.15-00023-gd18d=
22ce8f628 #1
> [  439.727807] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  439.728754] Call Trace:
> [  439.729035]  <SOFTIRQ>
> [  439.729305]  dump_stack+0x16/0x18
> [  439.729673]  ubsan_epilogue+0x8/0x20
> [  439.730060]  ubsan_type_mismatch_common+0x9f/0xed
> [  439.730564]  __ubsan_handle_type_mismatch_v1+0x2c/0x32
> [  439.731118]  netif_receive_skb_list_internal+0xe9/0x3fe
> [  439.731677]  ? e1000_clean_rx_irq+0x758/0x94d
> [  439.732145]  gro_normal_list+0x43/0xbf
> [  439.732597]  napi_complete_done+0xbe/0x1c0
> [  439.733031]  ? e1000_clean_jumbo_rx_irq+0xd72/0xd72
> [  439.733563]  e1000_clean+0xf32/0x126e
> [  439.733952]  ? __lock_is_held+0x57/0x9e
> [  439.734361]  net_rx_action+0x15e/0x448
> [  439.734773]  __do_softirq+0x277/0x573
> [  439.735164]  ? __irqentry_text_end+0x7/0x7
> [  439.735599]  do_softirq_own_stack+0x33/0x3a
> [  439.736043]  </SOFTIRQ>
> [  439.736314]  irq_exit+0x68/0xf4
> [  439.736683]  do_IRQ+0xda/0xed
> [  439.737009]  common_interrupt+0x11b/0x120
> [  439.737435] EIP: native_safe_halt+0x12/0x13
> [  439.737932] Code: 10 ff 8b 03 a8 08 74 0a 81 25 40 1b df c2 ff ff ff 7=
f 58 5b 5e 5f 5d c3 a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 fb f4 <=
c3> a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 f4 c3 55 31 c0
> [  439.739875] EAX: 00000000 EBX: 00000000 ECX: 00989680 EDX: 00000006
> [  439.740568] ESI: c2dad280 EDI: c2dad280 EBP: c2d9df38 ESP: c2d9df34
> [  439.741226] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00200=
246
> [  439.741939]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.742381]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.742817]  ? native_safe_halt+0x12/0x13
> [  439.743246]  ? default_idle+0x2c/0x37
> [  439.743642]  arch_cpu_idle+0x9/0xb
> [  439.744007]  default_idle_call+0x1d/0x1f
> [  439.744430]  do_idle+0x10d/0x296
> [  439.744807]  ? schedule+0x14e/0x199
> [  439.745204]  cpu_startup_entry+0xd/0xf
> [  439.745631]  rest_init+0xd2/0xd5
> [  439.745995]  arch_call_rest_init+0x8/0xb
> [  439.746431]  start_kernel+0x3f4/0x3fc
> [  439.746859]  i386_start_kernel+0x42/0x44
> [  439.747277]  startup_32_smp+0x164/0x168
> [  439.747689] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.750463] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.751352] UBSAN: Undefined behaviour in net/core/dev.c:5144:2
> [  439.752186] member access within misaligned address ba36ed7e for type =
'struct sk_buff'
> [  439.753066] which requires 8 byte alignment
> [  439.753541] CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.15-00023-gd18d=
22ce8f628 #1
> [  439.754353] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  439.755198] Call Trace:
> [  439.755468]  <SOFTIRQ>
> [  439.755736]  dump_stack+0x16/0x18
> [  439.756110]  ubsan_epilogue+0x8/0x20
> [  439.756537]  ubsan_type_mismatch_common+0x9f/0xed
> [  439.757050]  __ubsan_handle_type_mismatch_v1+0x2c/0x32
> [  439.757603]  netif_receive_skb_list_internal+0x51/0x3fe
> [  439.758227]  ? e1000_clean_rx_irq+0x758/0x94d
> [  439.758691]  gro_normal_list+0x43/0xbf
> [  439.759097]  napi_complete_done+0xbe/0x1c0
> [  439.759530]  ? e1000_clean_jumbo_rx_irq+0xd72/0xd72
> [  439.760045]  e1000_clean+0xf32/0x126e
> [  439.760444]  ? __lock_is_held+0x57/0x9e
> [  439.760871]  net_rx_action+0x15e/0x448
> [  439.761259]  __do_softirq+0x277/0x573
> [  439.761648]  ? __irqentry_text_end+0x7/0x7
> [  439.762077]  do_softirq_own_stack+0x33/0x3a
> [  439.762516]  </SOFTIRQ>
> [  439.762787]  irq_exit+0x68/0xf4
> [  439.763124]  do_IRQ+0xda/0xed
> [  439.763441]  common_interrupt+0x11b/0x120
> [  439.763881] EIP: native_safe_halt+0x12/0x13
> [  439.764301] Code: 10 ff 8b 03 a8 08 74 0a 81 25 40 1b df c2 ff ff ff 7=
f 58 5b 5e 5f 5d c3 a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 fb f4 <=
c3> a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 f4 c3 55 31 c0
> [  439.766225] EAX: 00000000 EBX: 00000000 ECX: 00989680 EDX: 00000006
> [  439.766879] ESI: c2dad280 EDI: c2dad280 EBP: c2d9df38 ESP: c2d9df34
> [  439.767524] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00200=
246
> [  439.768297]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.768771]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.769212]  ? native_safe_halt+0x12/0x13
> [  439.769649]  ? default_idle+0x2c/0x37
> [  439.770043]  arch_cpu_idle+0x9/0xb
> [  439.770422]  default_idle_call+0x1d/0x1f
> [  439.770850]  do_idle+0x10d/0x296
> [  439.771200]  ? schedule+0x14e/0x199
> [  439.771571]  cpu_startup_entry+0xd/0xf
> [  439.771970]  rest_init+0xd2/0xd5
> [  439.772321]  arch_call_rest_init+0x8/0xb
> [  439.772763]  start_kernel+0x3f4/0x3fc
> [  439.773148]  i386_start_kernel+0x42/0x44
> [  439.773568]  startup_32_smp+0x164/0x168
> [  439.773984] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.774851] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.775731] UBSAN: Undefined behaviour in net/core/dev.c:5054:2
> [  439.776563] member access within misaligned address ba36ed7e for type =
'struct sk_buff'
> [  439.777424] which requires 8 byte alignment
> [  439.777924] CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.15-00023-gd18d=
22ce8f628 #1
> [  439.778704] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  439.779548] Call Trace:
> [  439.779833]  <SOFTIRQ>
> [  439.780098]  dump_stack+0x16/0x18
> [  439.780492]  ubsan_epilogue+0x8/0x20
> [  439.780897]  ubsan_type_mismatch_common+0x9f/0xed
> [  439.781389]  __ubsan_handle_type_mismatch_v1+0x2c/0x32
> [  439.781932]  netif_receive_skb_list_internal+0x39d/0x3fe
> [  439.782487]  gro_normal_list+0x43/0xbf
> [  439.782897]  napi_complete_done+0xbe/0x1c0
> [  439.783336]  ? e1000_clean_jumbo_rx_irq+0xd72/0xd72
> [  439.783853]  e1000_clean+0xf32/0x126e
> [  439.784249]  ? __lock_is_held+0x57/0x9e
> [  439.784705]  net_rx_action+0x15e/0x448
> [  439.785089]  __do_softirq+0x277/0x573
> [  439.785468]  ? __irqentry_text_end+0x7/0x7
> [  439.785886]  do_softirq_own_stack+0x33/0x3a
> [  439.786330]  </SOFTIRQ>
> [  439.786606]  irq_exit+0x68/0xf4
> [  439.786948]  do_IRQ+0xda/0xed
> [  439.787268]  common_interrupt+0x11b/0x120
> [  439.787698] EIP: native_safe_halt+0x12/0x13
> [  439.788194] Code: 10 ff 8b 03 a8 08 74 0a 81 25 40 1b df c2 ff ff ff 7=
f 58 5b 5e 5f 5d c3 a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 fb f4 <=
c3> a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 f4 c3 55 31 c0
> [  439.790264] EAX: 00000000 EBX: 00000000 ECX: 00989680 EDX: 00000006
> [  439.790910] ESI: c2dad280 EDI: c2dad280 EBP: c2d9df38 ESP: c2d9df34
> [  439.791554] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00200=
246
> [  439.792262]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.792718]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.793159]  ? native_safe_halt+0x12/0x13
> [  439.793585]  ? default_idle+0x2c/0x37
> [  439.793979]  arch_cpu_idle+0x9/0xb
> [  439.794345]  default_idle_call+0x1d/0x1f
> [  439.794763]  do_idle+0x10d/0x296
> [  439.795112]  ? schedule+0x14e/0x199
> [  439.795488]  cpu_startup_entry+0xd/0xf
> [  439.795884]  rest_init+0xd2/0xd5
> [  439.796236]  arch_call_rest_init+0x8/0xb
> [  439.796682]  start_kernel+0x3f4/0x3fc
> [  439.797074]  i386_start_kernel+0x42/0x44
> [  439.797487]  startup_32_smp+0x164/0x168
> [  439.797957] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.798825] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.799688] UBSAN: Undefined behaviour in net/core/dev.c:5054:2
> [  439.800526] member access within misaligned address ba36ed7e for type =
'struct sk_buff'
> [  439.801371] which requires 8 byte alignment
> [  439.801839] CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.15-00023-gd18d=
22ce8f628 #1
> [  439.802643] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  439.803535] Call Trace:
> [  439.803802]  <SOFTIRQ>
> [  439.804066]  dump_stack+0x16/0x18
> [  439.804422]  ubsan_epilogue+0x8/0x20
> [  439.804829]  ubsan_type_mismatch_common+0x9f/0xed
> [  439.805317]  __ubsan_handle_type_mismatch_v1+0x2c/0x32
> [  439.805851]  netif_receive_skb_list_internal+0x208/0x3fe
> [  439.806405]  gro_normal_list+0x43/0xbf
> [  439.806804]  napi_complete_done+0xbe/0x1c0
> [  439.807253]  ? e1000_clean_jumbo_rx_irq+0xd72/0xd72
> [  439.807782]  e1000_clean+0xf32/0x126e
> [  439.808244]  ? __lock_is_held+0x57/0x9e
> [  439.808702]  net_rx_action+0x15e/0x448
> [  439.809125]  __do_softirq+0x277/0x573
> [  439.809513]  ? __irqentry_text_end+0x7/0x7
> [  439.809944]  do_softirq_own_stack+0x33/0x3a
> [  439.810387]  </SOFTIRQ>
> [  439.810656]  irq_exit+0x68/0xf4
> [  439.810998]  do_IRQ+0xda/0xed
> [  439.811322]  common_interrupt+0x11b/0x120
> [  439.811747] EIP: native_safe_halt+0x12/0x13
> [  439.812189] Code: 10 ff 8b 03 a8 08 74 0a 81 25 40 1b df c2 ff ff ff 7=
f 58 5b 5e 5f 5d c3 a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 fb f4 <=
c3> a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 f4 c3 55 31 c0
> [  439.814134] EAX: 00000000 EBX: 00000000 ECX: 00989680 EDX: 00000006
> [  439.814799] ESI: c2dad280 EDI: c2dad280 EBP: c2d9df38 ESP: c2d9df34
> [  439.815463] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00200=
246
> [  439.816222]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.816679]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.817226]  ? native_safe_halt+0x12/0x13
> [  439.817677]  ? default_idle+0x2c/0x37
> [  439.818149]  arch_cpu_idle+0x9/0xb
> [  439.818521]  default_idle_call+0x1d/0x1f
> [  439.818938]  do_idle+0x10d/0x296
> [  439.819282]  ? schedule+0x14e/0x199
> [  439.819648]  cpu_startup_entry+0xd/0xf
> [  439.820050]  rest_init+0xd2/0xd5
> [  439.820409]  arch_call_rest_init+0x8/0xb
> [  439.820853]  start_kernel+0x3f4/0x3fc
> [  439.821250]  i386_start_kernel+0x42/0x44
> [  439.821663]  startup_32_smp+0x164/0x168
> [  439.822067] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.822933] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.823800] UBSAN: Undefined behaviour in net/core/dev.c:5000:2
> [  439.824624] member access within misaligned address ba36ed7e for type =
'struct sk_buff'
> [  439.825443] which requires 8 byte alignment
> [  439.825891] CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.15-00023-gd18d=
22ce8f628 #1
> [  439.826650] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  439.827527] Call Trace:
> [  439.827800]  <SOFTIRQ>
> [  439.828116]  dump_stack+0x16/0x18
> [  439.828520]  ubsan_epilogue+0x8/0x20
> [  439.828904]  ubsan_type_mismatch_common+0x9f/0xed
> [  439.829397]  __ubsan_handle_type_mismatch_v1+0x2c/0x32
> [  439.829943]  __netif_receive_skb_list_core+0x135/0x154
> [  439.830492]  netif_receive_skb_list_internal+0x3e3/0x3fe
> [  439.831044]  gro_normal_list+0x43/0xbf
> [  439.831440]  napi_complete_done+0xbe/0x1c0
> [  439.831901]  ? e1000_clean_jumbo_rx_irq+0xd72/0xd72
> [  439.832427]  e1000_clean+0xf32/0x126e
> [  439.832892]  ? __lock_is_held+0x57/0x9e
> [  439.833324]  net_rx_action+0x15e/0x448
> [  439.833726]  __do_softirq+0x277/0x573
> [  439.834118]  ? __irqentry_text_end+0x7/0x7
> [  439.834553]  do_softirq_own_stack+0x33/0x3a
> [  439.834996]  </SOFTIRQ>
> [  439.835282]  irq_exit+0x68/0xf4
> [  439.835622]  do_IRQ+0xda/0xed
> [  439.835964]  common_interrupt+0x11b/0x120
> [  439.836395] EIP: native_safe_halt+0x12/0x13
> [  439.837047] Code: 10 ff 8b 03 a8 08 74 0a 81 25 40 1b df c2 ff ff ff 7=
f 58 5b 5e 5f 5d c3 a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 fb f4 <=
c3> a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 f4 c3 55 31 c0
> [  439.839039] EAX: 00000000 EBX: 00000000 ECX: 00989680 EDX: 00000006
> [  439.839708] ESI: c2dad280 EDI: c2dad280 EBP: c2d9df38 ESP: c2d9df34
> [  439.840369] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00200=
246
> [  439.841078]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.841489]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.841894]  ? native_safe_halt+0x12/0x13
> [  439.842306]  ? default_idle+0x2c/0x37
> [  439.842678]  arch_cpu_idle+0x9/0xb
> [  439.843028]  default_idle_call+0x1d/0x1f
> [  439.843458]  do_idle+0x10d/0x296
> [  439.843812]  ? schedule+0x14e/0x199
> [  439.844176]  cpu_startup_entry+0xd/0xf
> [  439.844605]  rest_init+0xd2/0xd5
> [  439.844965]  arch_call_rest_init+0x8/0xb
> [  439.845387]  start_kernel+0x3f4/0x3fc
> [  439.845789]  i386_start_kernel+0x42/0x44
> [  439.846203]  startup_32_smp+0x164/0x168
> [  439.846610] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.847484] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  439.848401] UBSAN: Undefined behaviour in net/core/dev.c:5000:2
> [  439.849226] member access within misaligned address ba36ed7e for type =
'struct sk_buff'
> [  439.850048] which requires 8 byte alignment
> [  439.850488] CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.15-00023-gd18d=
22ce8f628 #1
> [  439.851283] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  439.852106] Call Trace:
> [  439.852364]  <SOFTIRQ>
> [  439.852688]  dump_stack+0x16/0x18
> [  439.853045]  ubsan_epilogue+0x8/0x20
> [  439.853427]  ubsan_type_mismatch_common+0x9f/0xed
> [  439.853937]  __ubsan_handle_type_mismatch_v1+0x2c/0x32
> [  439.854479]  __netif_receive_skb_list_core+0x69/0x154
> [  439.855021]  netif_receive_skb_list_internal+0x3e3/0x3fe
> [  439.855574]  gro_normal_list+0x43/0xbf
> [  439.855976]  napi_complete_done+0xbe/0x1c0
> [  439.856413]  ? e1000_clean_jumbo_rx_irq+0xd72/0xd72
> [  439.856956]  e1000_clean+0xf32/0x126e
> [  439.857345]  ? __lock_is_held+0x57/0x9e
> [  439.857752]  net_rx_action+0x15e/0x448
> [  439.858215]  __do_softirq+0x277/0x573
> [  439.858615]  ? __irqentry_text_end+0x7/0x7
> [  439.859046]  do_softirq_own_stack+0x33/0x3a
> [  439.859485]  </SOFTIRQ>
> [  439.859755]  irq_exit+0x68/0xf4
> [  439.860095]  do_IRQ+0xda/0xed
> [  439.860415]  common_interrupt+0x11b/0x120
> [  439.860882] EIP: native_safe_halt+0x12/0x13
> [  439.861340] Code: 10 ff 8b 03 a8 08 74 0a 81 25 40 1b df c2 ff ff ff 7=
f 58 5b 5e 5f 5d c3 a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 fb f4 <=
c3> a1 58 44 d6 c3 85 c0 7e 07 0f 00 2d 5c f9 5f c2 f4 c3 55 31 c0
> [  439.863238] EAX: 00000000 EBX: 00000000 ECX: 00989680 EDX: 00000006
> [  439.863888] ESI: c2dad280 EDI: c2dad280 EBP: c2d9df38 ESP: c2d9df34
> [  439.864589] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00200=
246
> [  439.865335]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.865760]  ? rwsem_mark_wake+0x2a9/0x4c2
> [  439.866134]  ? native_safe_halt+0x12/0x13
> [  439.866540]  ? default_idle+0x2c/0x37
> [  439.866910]  arch_cpu_idle+0x9/0xb
> [  439.867259]  default_idle_call+0x1d/0x1f
> [  439.867660]  do_idle+0x10d/0x296
> [  439.868064]  ? schedule+0x14e/0x199
> [  439.868447]  cpu_startup_entry+0xd/0xf
> [  439.868878]  rest_init+0xd2/0xd5
> [  439.869230]  arch_call_rest_init+0x8/0xb
> [  439.869645]  start_kernel+0x3f4/0x3fc
> [  439.870020]  i386_start_kernel+0x42/0x44
> [  439.870409]  startup_32_smp+0x164/0x168
> [  439.870802] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  442.758767] sysrq: Emergency Sync
> [  442.759580] sysrq: Resetting
> =

> Kboot worker: lkp-worker48
> Elapsed time: 480
> =

> kvm=3D(
> 	qemu-system-i386
> 	-enable-kvm
> 	-cpu SandyBridge
> 	-kernel $kernel
> 	-initrd initrd-vm-snb-i386-8.cgz
> 	-m 8192
> 	-smp 2
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0,hostfwd=3Dtcp::32032-:22
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	ip=3D::::vm-snb-i386-8::dhcp
> 	root=3D/dev/ram0
> 	user=3Dlkp
> 	job=3D/job-script
> 	ARCH=3Di386
> 	kconfig=3Di386-randconfig-a015-20200923
> 	branch=3Dlinux-stable-rc/linux-5.4.y
> 	commit=3Dd18d22ce8f62839365c984b1df474d3975ed4eb2
> 	BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a015-20200923/gcc-9/d18d22ce8f62=
839365c984b1df474d3975ed4eb2/vmlinuz-5.4.15-00023-gd18d22ce8f628
> 	max_uptime=3D3600
> 	RESULT_ROOT=3D/result/trinity/300s/vm-snb-i386/debian-i386-20191205.cgz/=
i386-randconfig-a015-20200923/gcc-9/d18d22ce8f62839365c984b1df474d3975ed4eb=
2/3
> 	result_service=3Dtmpfs
> 	selinux=3D0
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	net.ifnames=3D0
> 	printk.devkmsg=3Don
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	drbd.minor_count=3D8
> 	systemd.log_level=3Derr
> 	ignore_loglevel
> =

> =

> To reproduce:
> =

>          # build kernel
> 	cd linux
> 	cp config-5.4.15-00023-gd18d22ce8f628 .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email

Dear kernel test robot / Rong Chen,

The steps to reproduce don't seem to work for me:

result_root: =

.../.lkp//result/trinity/300s/vm-snb-i386/debian-i386-20191205.cgz/i386-ran=
dconfig-a015-20200923/gcc-9/d18d22ce8f62839365c984b1df474d3975ed4eb2/1
downloading initrds ...
/usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

https://download.01.org/0day-ci/lkp-qemu/osimage/debian/debian-i386-2019120=
5.cgz =

-N -P .../.lkp/cache/osimage/debian
550160 blocks
/usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 =

https://download.01.org/0day-ci/lkp-qemu/osimage/pkg/debian-i386-20191205.c=
gz/trinity-i386-4d2343bd-1_20200320.cgz =

-N -P .../.lkp/cache/osimage/pkg/debian-i386-20191205.cgz
Failed to download =

osimage/pkg/debian-i386-20191205.cgz/trinity-i386-4d2343bd-1_20200320.cgz

The file the last command tries to download doesn't exist on your =

server. Any ideas how to run the repro?

Second, are you sure that my commit introduces a regression? From what I =

see in the stack traces, there is some unaligned pointer to an SKB, but =

my code doesn't touch any pointers to SKBs. All it does is put existing =

SKBs to an intermediate list, however, it doesn't allocate or move the =

SKB structs itself, so I don't see anything that could unalign an =

aligned pointer, which makes me think such pointers were passed from =

external code, and my patch doesn't look related.

Thanks,
Max

> =

> =

> Thanks,
> Rong Chen
>=20

--===============9066609664642697891==--

