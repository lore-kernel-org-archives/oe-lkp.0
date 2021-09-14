Content-Type: multipart/mixed; boundary="===============0979366453382151427=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [PATCH] bootconfig: Fix to check the xbc_node is used before free it
Date: Tue, 14 Sep 2021 18:08:06 +0200
Message-ID: <61ab2d0c-3313-aaab-514c-e15b7aa054a0@suse.cz>
In-Reply-To: <163149460533.291098.7342418455457691240.stgit@devnote2>
List-Id: <oe-lkp.lists.linux.dev>

--===============0979366453382151427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 9/13/21 02:56, Masami Hiramatsu wrote:
> Fix to check the xbc_node is used before calling memblock_free()
> because passing NULL to phys_addr() will cause a panic.
> This will happen if user doesn't pass any bootconfig to the
> kernel, because kernel will call xbc_destroy_all() after
> booting.
> =

> Fixes: 40caa127f3c7 ("init: bootconfig: Remove all bootconfig data when t=
he init memory is removed")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>

FTR, I got a different issue with 5.15-rc1, bisected to 40caa127f3c7 and
this patch fixed it for me, so:

Tested-by: Vlastimil Babka <vbabka@suse.cz>

The panic I was getting:

 general protection fault, probably for non-canonical address 0x343479726f6=
d657d: 0000 [#1] SMP NOPTI
 CPU: 10 PID: 446 Comm: udevadm Tainted: G            E     5.15.0-rc1-1.g8=
787773-default+ #43 openSUSE Tumbleweed (unreleased) d96e60462206b52b95b55e=
a8102fc1a7d9e8ae9a
 Hardware name: Gigabyte Technology Co., Ltd. X470 AORUS ULTRA GAMING/X470 =
AORUS ULTRA GAMING-CF, BIOS F60h 02/04/2021
 RIP: 0010:rb_next+0x14/0x50
 Code: 89 c1 89 c6 89 c7 41 89 c0 c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 48=
 8b 17 48 39 d7 74 43 48 8b 47 08 48 85 c0 74 23 49 89 c0 <48> 8b 40 10 48 =
85 c0 75 f4 4c 89 c0 31 d2 89 d7 41 89 d0 c3 48 3b
 RSP: 0018:ffffa63741053e00 EFLAGS: 00010202
 RAX: 343479726f6d656d RBX: ffffa63741053e90 RCX: 0000000000000000
 RDX: ffff94fd4eb37f18 RSI: 0000000000000000 RDI: ffff94fd4ebf7e18
 RBP: 0000000000000000 R08: 343479726f6d656d R09: 0000000000000000
 R10: ffffffff89f58b50 R11: 0000000000000000 R12: ffff94f64a7c3f00
 R13: ffff94f640e3b300 R14: ffff94fd4ebf7e00 R15: 0000000000000007
 FS:  00007fd358530180(0000) GS:ffff94fd4ea80000(0000) knlGS:00000000000000=
00
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000564bfee24028 CR3: 000000013055c000 CR4: 00000000003506e0
 Call Trace:
  kernfs_fop_readdir+0x12d/0x260
  iterate_dir+0x196/0x1e0
  __x64_sys_getdents64+0x80/0x120
  ? compat_fillonedir+0x160/0x160
  ? syscall_exit_to_user_mode+0x18/0x40
  do_syscall_64+0x5c/0x90
  ? syscall_exit_to_user_mode+0x18/0x40
  ? syscall_exit_to_user_mode+0x18/0x40
  ? do_syscall_64+0x69/0x90
  entry_SYSCALL_64_after_hwframe+0x44/0xae
 RIP: 0033:0x7fd358f04947
 Code: 00 00 0f 05 eb b7 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa=
 b8 ff ff ff 7f 48 39 c2 48 0f 47 d0 b8 d9 00 00 00 0f 05 <48> 3d 00 f0 ff =
ff 77 01 c3 48 8b 15 f9 a4 0f 00 f7 d8 64 89 02 48
 RSP: 002b:00007fffc0b3ba78 EFLAGS: 00000293 ORIG_RAX: 00000000000000d9
 RAX: ffffffffffffffda RBX: 0000564bfedac480 RCX: 00007fd358f04947
 RDX: 0000000000008000 RSI: 0000564bfedac4b0 RDI: 0000000000000004
 RBP: 0000564bfedac4b0 R08: 0000000000000030 R09: 00007fd358fffa60
 R10: 0000564bfedb44b0 R11: 0000000000000293 R12: fffffffffffffeb0
 R13: 0000564bfedac484 R14: 0000000000000000 R15: 00007fffc0b3bb70
 Modules linked in: btrfs(E) blake2b_generic(E) libcrc32c(E) crc32c_intel(E=
) xor(E) raid6_pq(E) sg(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_d=
h_emc(E) scsi_dh_alua(E) msr(E) efivarfs(E)
 ---[ end trace 011b3d281b92632a ]---
--===============0979366453382151427==--

