Content-Type: multipart/mixed; boundary="===============7874224740512908006=="
MIME-Version: 1.0
From: Reshetova, Elena <elena.reshetova@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs, nfsd] 7f2431938f: WARNING:at_lib/refcount.c:#refcount_inc
Date: Wed, 01 Mar 2017 07:50:17 +0000
Message-ID: <2236FBA76BA1254E88B949DDB74E612B41C52391@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <20170228170935.GA61715@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7874224740512908006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Ye, Xiaolong
> Sent: Tuesday, February 28, 2017 7:10 PM
> To: Reshetova, Elena <elena.reshetova@intel.com>
> Cc: lkp(a)01.org
> Subject: [fs, nfsd] 7f2431938f: WARNING:at_lib/refcount.c:#refcount_inc
> =

> =

> FYI, we noticed the following commit:
> =

> commit: 7f2431938fb94c5eedb00edb16867f8c14579dd8 ("fs, nfsd: convert
> nfs4_stateowner.so_count from atomic_t to refcount_t")
> https://github.com/ereshetova/linux-stable.git refcount_t_fs
> =

> in testcase: boot

Thank you very much! These are exactly the things we are trying to catch!

Best Regards,
Elena.

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> +-------------------------------------------------+------------+---------=
---+
> |                                                 | 13b2b2cc87 | 7f243193=
8f |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 12         | 1       =
   |
> | boot_failures                                   | 0          | 13      =
   |
> | WARNING:at_lib/refcount.c:#refcount_inc         | 0          | 13      =
   |
> | WARNING:at_lib/refcount.c:#refcount_dec_not_one | 0          | 13      =
   |
> +-------------------------------------------------+------------+---------=
---+
> =

> =

> =

> [   86.231888] WARNING: CPU: 1 PID: 2185 at lib/refcount.c:114
> refcount_inc+0x25/0x27
> [   86.236090] refcount_t: increment on 0; use-after-free.
> [   86.238408] Modules linked in: acpi_cpufreq
> [   86.243644] CPU: 1 PID: 2185 Comm: post-run Not tainted 4.10.0-next-
> 20170228-00003-g7f24319 #1
> [   86.247614] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.9.3-20161025_171302-gandalf 04/01/2014
> [   86.247614] Call Trace:
> [   86.247614]  dump_stack+0x86/0xc0
> [   86.247614]  __warn+0xc2/0xdd
> [   86.247614]  warn_slowpath_fmt+0x4b/0x53
> [   86.247614]  refcount_inc+0x25/0x27
> [   86.247614]  nfs4_get_state_owner+0x8a/0x390
> [   86.247614]  ? generic_hash_cred+0x35/0x5b
> [   86.247614]  nfs4_do_open+0x89/0x662
> [   86.247614]  ? kmem_cache_alloc_trace+0x47/0x173
> [   86.247614]  nfs4_atomic_open+0xe/0x1c
> [   86.247614]  nfs_atomic_open+0x23c/0x4a9
> [   86.247614]  path_openat+0x56e/0xc62
> [   86.247614]  do_filp_open+0x4d/0xa3
> [   86.247614]  ? kmem_cache_alloc+0x43/0x180
> [   86.247614]  ? __might_sleep+0x77/0x7e
> [   86.247614]  ? kmem_cache_alloc+0x43/0x180
> [   86.247614]  ? __alloc_fd+0x96/0x155
> [   86.247614]  do_sys_open+0x140/0x1cf
> [   86.247614]  ? do_sys_open+0x140/0x1cf
> [   86.247614]  ? filp_close+0x67/0x71
> [   86.247614]  SyS_open+0x1e/0x20
> [   86.247614]  entry_SYSCALL_64_fastpath+0x1f/0xbd
> [   86.247614] RIP: 0033:0x7f594e476e40
> [   86.247614] RSP: 002b:00007ffda2cdcc68 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000002
> [   86.247614] RAX: ffffffffffffffda RBX: 00007ffda2cdcb80 RCX:
> 00007f594e476e40
> [   86.247614] RDX: 00000000000001b6 RSI: 0000000000000241 RDI:
> 000055e938682418
> [   86.247614] RBP: 0000000000000001 R08: 000055e937ed2c32 R09:
> 0000000000000041
> [   86.247614] R10: 0000000000000002 R11: 0000000000000246 R12:
> 000055e93867ba78
> [   86.247614] R13: 000055e93867bb00 R14: 0000000000000001 R15:
> 000055e938676d60
> [   86.350502] ---[ end trace 9297aead69ddd2ac ]---
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
> =

> =

> =

> Thanks,
> Kernel Test Robot

--===============7874224740512908006==--

