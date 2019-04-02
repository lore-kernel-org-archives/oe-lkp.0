Content-Type: multipart/mixed; boundary="===============5430767800861981709=="
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
To: lkp@lists.01.org
Subject: Re: [mt76] c1e0d2be0a: BUG:pagefault_on_kernel_address#in_non-whitelisted_uaccess
Date: Tue, 02 Apr 2019 05:20:15 +0200
Message-ID: <CAG48ez2hfQjCkHwvwZG-b1Xna4MTc50VRN78bLSt85ZL3qdBvQ@mail.gmail.com>
In-Reply-To: <20190402023044.GC20952@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5430767800861981709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2019 at 5:10 AM kernel test robot <rong.a.chen@intel.com> =
wrote:
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: c1e0d2be0acff5e99a59ddcc5af415e48abc6c5e ("mt76: mmio: introduce =
mt76x02_check_tx_hang watchdog")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
[...]
> [   10.383586] BUG: pagefault on kernel address 0xffff93d4b5cd8000 in non=
-whitelisted uaccess
> [   10.390934] BUG: unable to handle kernel paging request at ffff93d4b5c=
d8000
> [   10.390934] #PF error: [normal kernel read fault]
> [   10.390934] PGD 21e00067 P4D 21e00067 PUD 21e04067 PMD 78b57067 PTE 80=
0fffff8a327060
> [   10.390934] Oops: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
> [   10.390934] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G                T =
5.0.0-rc1-00033-gc1e0d2b #1
> [   10.390934] RIP: 0010:strncpy_from_user+0x87/0x10c
> [   10.390934] Code: 00 00 66 66 90 4c 39 c2 48 bb ff fe fe fe fe fe fe f=
e 49 ba 80 80 80 80 80 80 80 80 4c 0f 46 c2 31 c0 45 31 db eb 4c 44 89 d9 <=
4c> 8b 0c 06 85 c9 74 05 45 31 d2 eb 61 49 8d 0c 19 4c 89 0c 07 49
> [   10.390934] RSP: 0000:ffffbd8c00323bc0 EFLAGS: 00010206
> [   10.390934] RAX: 0000000000000028 RBX: fefefefefefefeff RCX: 000000000=
0000000
> [   10.390934] RDX: 0000000000000fe0 RSI: ffff93d4b5cd7fd6 RDI: ffff93d4a=
f5e3020
> [   10.390934] RBP: 00000000ffffff9c R08: 0000000000000fe0 R09: 8c93909d9=
2868cd1
> [   10.390934] R10: 8080808080808080 R11: 0000000000000000 R12: ffff93d4b=
5cd7fd6
> [   10.390934] R13: ffff93d4b5cd7fd6 R14: 0000000000000000 R15: 000000000=
0000000
> [   10.390934] FS:  0000000000000000(0000) GS:ffff93d4b6400000(0000) knlG=
S:0000000000000000
> [   10.390934] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.390934] CR2: ffff93d4b5cd8000 CR3: 0000000020c15000 CR4: 000000000=
00006e0
> [   10.390934] Call Trace:
> [   10.390934]  ? getname_flags+0x6f/0x199
> [   10.390934]  ? user_path_at_empty+0x18/0x2f
> [   10.390934]  ? vfs_statx+0x6d/0xb3
> [   10.390934]  ? clean_path+0x5c/0x102
> [   10.390934]  ? do_name+0xf4/0x40e
> [   10.390934]  ? write_buffer+0x52/0x8a
> [   10.390934]  ? flush_buffer+0xe7/0x140
> [   10.390934]  ? initrd_load+0xa8/0xa8
> [   10.390934]  ? __gunzip+0x53a/0x6b7
> [   10.390934]  ? bunzip2+0x76a/0x76a
> [   10.390934]  ? write_buffer+0x8a/0x8a
> [   10.390934]  ? gunzip+0x39/0x3d
> [   10.390934]  ? initrd_load+0xa8/0xa8
> [   10.390934]  ? unpack_to_rootfs+0x1c6/0x3c6
> [   10.390934]  ? initrd_load+0xa8/0xa8
> [   10.390934]  ? populate_rootfs+0x94/0x213
> [   10.390934]  ? clean_rootfs+0x23b/0x23b
> [   10.390934]  ? do_one_initcall+0x61/0x12a
> [   10.390934]  ? kernel_init_freeable+0x1a8/0x305
> [   10.390934]  ? rest_init+0x13a/0x13a
> [   10.390934]  ? kernel_init+0x5/0xeb
> [   10.390934]  ? ret_from_fork+0x35/0x40
> [   10.390934] Modules linked in:
> [   10.390934] CR2: ffff93d4b5cd8000
> [   10.390934] ---[ end trace 81b307b1a0dd06e6 ]---

This was dealt with in commit 53a41cb7ed381edee91029cdcabe9b3250f43f4d
('Revert "x86/fault: BUG() when uaccess helpers fault on kernel
addresses"').

--===============5430767800861981709==--

