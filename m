Content-Type: multipart/mixed; boundary="===============9123688511091097928=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [net] 4f347129ca: kernel_BUG_at_mm/slab_common.c
Date: Wed, 28 Jun 2017 20:58:58 -0700
Message-ID: <CAGXu5j+NBsiuXhMoETty+VHaD7mNVF1EyghtSb6PJHfPvOaknw@mail.gmail.com>
In-Reply-To: <20170629032654.GA46347@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9123688511091097928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2017 at 8:26 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> commit: 4f347129caa154c94addbac804879421514096bf ("net: define usercopy r=
egion in struct proto slab cache")
> https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git kspp/usercopy=
-whitelist/latest
>
> in testcase: trinity
> with following parameters:
>
>         runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu IvyBridge -m 420M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------+------------+------------+
> |                                          | 4feb522782 | 4f347129ca |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 4          | 0          |
> | boot_failures                            | 0          | 4          |
> | kernel_BUG_at_mm/slab_common.c           | 0          | 4          |
> | invalid_opcode:#[##]                     | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 4          |
> +------------------------------------------+------------+------------+
>
>
>
> [   15.661990] kernel BUG at mm/slab_common.c:469!
> [   15.677701] invalid opcode: 0000 [#1] SMP
> [   15.679177] Modules linked in: sctp(+) dccp_ipv4 dccp
> [   15.680867] CPU: 0 PID: 230 Comm: modprobe Not tainted 4.12.0-rc5-0002=
7-g4f34712 #1
> [   15.683615] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   15.686864] task: ffff880019d10000 task.stack: ffffc900003f8000
> [   15.688670] RIP: 0010:kmem_cache_create_usercopy+0x200/0x220
> [   15.690422] RSP: 0018:ffffc900003fbc40 EFLAGS: 00010217
> [   15.692128] RAX: 0000000000000000 RBX: 0000000000002000 RCX: 000000000=
0000000
> [   15.694148] RDX: ffff880019d10000 RSI: 00000000000000ee RDI: ffffffff8=
1ca30c8
> [   15.709164] RBP: ffffc900003fbc78 R08: 0000000000000494 R09: fffffffff=
ffffb7c
> [   15.711138] R10: ffff880009859700 R11: ffffc900003fbad8 R12: 000000000=
0000500
> [   15.712995] R13: ffffffffa0064438 R14: 0000000000000494 R15: fffffffff=
ffffb7c
> [   15.714791] FS:  0000000000000000(0000) GS:ffff88000be00000(0063) knlG=
S:00000000f7712144
> [   15.717308] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [   15.718862] CR2: 00000000f7677000 CR3: 0000000000a3a000 CR4: 000000000=
01406f0
> [   15.733766] Call Trace:
> [   15.734985]  proto_register+0x4e/0x240
> [   15.736278]  sctp_init+0x36b/0x4aa [sctp]

This was a typo in the sctp usersize. Fixed now, thanks!

-Kees

> [   15.737611]  ? 0xffffffffa0074000
> [   15.738798]  do_one_initcall+0x43/0x170
> [   15.740082]  ? __might_sleep+0x4a/0x80
> [   15.741347]  ? kmem_cache_alloc_trace+0x163/0x1b0
> [   15.742797]  do_init_module+0x5f/0x1f8
> [   15.744151]  load_module+0x1562/0x1c30
> [   15.745446]  SYSC_init_module+0x16f/0x180
> [   15.759765]  ? SYSC_init_module+0x16f/0x180
> [   15.761161]  SyS_init_module+0xe/0x10
> [   15.762562]  do_fast_syscall_32+0xa9/0x220
> [   15.763959]  entry_SYSENTER_compat+0x4c/0x5b
> [   15.765287] RIP: 0023:0xf767bdd9
> [   15.766513] RSP: 002b:00000000fff8189c EFLAGS: 00000282 ORIG_RAX: 0000=
000000000080
> [   15.782047] RAX: ffffffffffffffda RBX: 00000000f75fe010 RCX: 000000000=
0079330
> [   15.783879] RDX: 00000000080c1d40 RSI: 00000000080c1c70 RDI: 000000000=
80c1d50
> [   15.785708] RBP: 00000000080c1d50 R08: 0000000000000000 R09: 000000000=
0000000
> [   15.787541] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [   15.789333] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [   15.791239] Code: 45 d0 e8 c4 0a 7f 00 e8 8f 58 05 00 e8 da 3a 04 00 e=
8 05 8c eb ff 48 8b 45 d0 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 0f 0=
b <0f> 0b 48 8b 5d c8 41 bc f4 ff ff ff e9 4c ff ff ff 48 c7 c7 58
> [   15.796396] RIP: kmem_cache_create_usercopy+0x200/0x220 RSP: ffffc9000=
03fbc40
> [   15.798366] ---[ end trace 8e9ca2d40de489a3 ]---
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
> Kernel Test Robot



-- =

Kees Cook
Pixel Security

--===============9123688511091097928==--

