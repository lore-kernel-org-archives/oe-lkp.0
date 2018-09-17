Content-Type: multipart/mixed; boundary="===============0458876305229932254=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [linux] c208f0c9ab: general_protection_fault:#[##]
Date: Mon, 17 Sep 2018 15:53:12 -0700
Message-ID: <20180917155312.4ffbbff6c706e289f0e51499@linux-foundation.org>
In-Reply-To: <20180917003636.GK7632@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0458876305229932254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Sep 2018 08:36:36 +0800 kernel test robot <rong.a.chen@intel.c=
om> wrote:

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: c208f0c9ab89eaec7514bc1342998f52e9cc8eca ("linux-next")
> git://git.cmpxchg.org/linux-mmotm.git master
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

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =


Thanks.  I assume this was caused by dhowell's changes in
linux-next.patch.


> +------------------------------------------+------------+------------+
> |                                          | e345c3f4a9 | c208f0c9ab |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 4          | 2          |
> | boot_failures                            | 0          | 4          |
> | general_protection_fault:#[##]           | 0          | 3          |
> | RIP:mqueue_get_tree                      | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 4          |
> | BUG:unable_to_handle_kernel              | 0          | 1          |
> | Oops:#[##]                               | 0          | 1          |
> +------------------------------------------+------------+------------+
> =

> =

> =

> [   48.158126] NET: Registered protocol family 29
> [   48.170916] can: raw protocol (rev 20170425)
> [   48.184368] can: broadcast manager protocol (rev 20170425 t)
> [   49.622182] VFS: Warning: trinity-c7 using old stat() call. Recompile =
your binary.
> [   50.655501] NET: Registered protocol family 36
> [   50.822937] general protection fault: 0000 [#1] SMP PTI
> [   50.827387] CPU: 1 PID: 650 Comm: trinity-c5 Not tainted 4.19.0-rc3-mm=
1-00141-gc208f0c #1
> [   50.833112] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   50.838927] RIP: 0010:mqueue_get_tree+0x2c/0xb0
> [   50.857416] Code: 44 00 00 41 54 55 53 4c 8b 67 30 48 89 fb 48 c7 c7 2=
0 75 0f 83 e8 f4 bd 63 00 49 8b 04 24 48 8b 80 f0 02 00 00 48 85 c0 74 25 <=
48> 8b 40 08 48 8b 68 68 48 85 ed 74 09 48 8d 7d 58 e8 0e 6f 0b 00
> [   50.869315] RSP: 0018:ffffc90000d57df0 EFLAGS: 00010206
> [   50.872215] RAX: 646e655f73726f74 RBX: ffff88007b65f3c0 RCX: 000000000=
0000000
> [   50.875838] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffffffff8=
30f7520
> [   50.879374] RBP: ffff88007b69d400 R08: ffff88013fd26020 R09: ffff88012=
f003980
> [   50.882872] R10: 000000000000002c R11: ffff88012f120700 R12: ffff88007=
e246a98
> [   50.886479] R13: 0000000000000000 R14: ffff88012e463498 R15: 000000000=
0000000
> [   50.890044] FS:  00007f6e21554b40(0000) GS:ffff88013fd00000(0000) knlG=
S:0000000000000000
> [   50.895152] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   50.898235] CR2: 000055e96b9e3148 CR3: 000000007ad28006 CR4: 000000000=
01606e0
> [   50.901641] DR0: 00007f6e1f90b000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   50.905148] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 000000000=
0000600
> [   50.908730] Call Trace:
> [   50.910948]  vfs_get_tree+0x61/0x160
> [   50.913429]  mq_create_mount+0x5b/0xb0
> [   50.916000]  mq_init_ns+0x37/0x50
> [   50.918365]  copy_ipcs+0xc0/0x150
> [   50.920864]  create_new_namespaces+0xac/0x1b0
> [   50.923458]  unshare_nsproxy_namespaces+0x59/0xb0
> [   50.926181]  ksys_unshare+0x1c6/0x370
> [   50.928669]  __x64_sys_unshare+0xe/0x20
> [   50.931462]  do_syscall_64+0x5b/0x180
> [   50.933906]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   50.936730] RIP: 0033:0x7f6e20e77229
> [   50.939114] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3f 4c 2b 00 f7 d8 64 89 01 48
> [   50.948513] RSP: 002b:00007ffcd4c48db8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000110
> [   50.953192] RAX: ffffffffffffffda RBX: 0000000000000110 RCX: 00007f6e2=
0e77229
> [   50.956549] RDX: 001c41a5115d9cbf RSI: 0000000038383838 RDI: 000000003=
8010d00
> [   50.960039] RBP: 00007ffcd4c48e60 R08: 000000000000008d R09: 00000000d=
7d7d7d7
> [   50.963626] R10: fffffffffffffff8 R11: 0000000000000246 R12: 000000000=
0000002
> [   50.967221] R13: 00007f6e2152a058 R14: 00007f6e21554ad8 R15: 00007f6e2=
152a000
> [   50.970819] Modules linked in: ieee802154_socket ieee802154 can_bcm ca=
n_raw can pptp gre l2tp_ppp l2tp_netlink l2tp_core ip6_udp_tunnel udp_tunne=
l pppoe pppox ppp_generic slhc crypto_user nfnetlink scsi_transport_iscsi d=
ccp_ipv6 atm sctp dccp_ipv4 dccp sr_mod cdrom sb_edac crct10dif_pclmul crc3=
2_pclmul sg crc32c_intel ghash_clmulni_intel pcbc ppdev snd_pcm snd_timer s=
nd aesni_intel crypto_simd soundcore cryptd ata_generic pata_acpi glue_help=
er pcspkr serio_raw i2c_piix4 ata_piix libata parport_pc floppy parport ip_=
tables
> [   51.063378] ---[ end trace a6e2fb1789cf8edd ]---
> [   51.076176] RIP: 0010:mqueue_get_tree+0x2c/0xb0
> [   51.087033] Code: 44 00 00 41 54 55 53 4c 8b 67 30 48 89 fb 48 c7 c7 2=
0 75 0f 83 e8 f4 bd 63 00 49 8b 04 24 48 8b 80 f0 02 00 00 48 85 c0 74 25 <=
48> 8b 40 08 48 8b 68 68 48 85 ed 74 09 48 8d 7d 58 e8 0e 6f 0b 00
> [   51.110957] RSP: 0018:ffffc90000d57df0 EFLAGS: 00010206
> [   51.115903] NET: Registered protocol family 15
> [   51.135909] RAX: 646e655f73726f74 RBX: ffff88007b65f3c0 RCX: 000000000=
0000000
> [   51.154868] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffffffff8=
30f7520
> [   51.158406] RBP: ffff88007b69d400 R08: ffff88013fd26020 R09: ffff88012=
f003980
> [   51.162023] R10: 000000000000002c R11: ffff88012f120700 R12: ffff88007=
e246a98
> [   51.165679] R13: 0000000000000000 R14: ffff88012e463498 R15: 000000000=
0000000
> [   51.169407] FS:  00007f6e21554b40(0000) GS:ffff88013fd00000(0000) knlG=
S:0000000000000000
> [   51.183887] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   51.187257] CR2: 000055e96b9e3148 CR3: 000000007ad28006 CR4: 000000000=
01606e0
> [   51.190776] DR0: 00007f6e1f90b000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   51.214714] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 000000000=
0000600
> [   51.234960] Kernel panic - not syncing: Fatal exception
> [   51.238175] Kernel Offset: disabled
> =

> Elapsed time: 70
> =

> #!/bin/bash
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> lkp

--===============0458876305229932254==--

