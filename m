Content-Type: multipart/mixed; boundary="===============0310678013134264690=="
MIME-Version: 1.0
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fs] c43edc7bd9: BUG: unable to handle kernel BUG: unable to handle kernel NULL pointer dereferenceNULL pointer dereference at 00000470
Date: Thu, 23 Jun 2016 09:11:47 -0700
Message-ID: <CABeXuvqAxwSfPoKLyG61AfX6zA4powabExTeb5_WMhSuA=qnQA@mail.gmail.com>
In-Reply-To: <5767897a.uhvaWxBSFXhZeGyk%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0310678013134264690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 19, 2016 at 11:13 PM, kernel test robot
<fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux Deepa-Dinamani/Delete-CURRENT_TIME-and-C=
URRENT_TIME_SEC-macros/20160620-104147
>
> commit c43edc7bd9c06af9a7278101d462eb0ba0299605
> Author:     Deepa Dinamani <deepa.kernel@gmail.com>
> AuthorDate: Sun Jun 19 17:27:01 2016 -0700
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Mon Jun 20 10:41:55 2016 +0800
>
>     fs: Replace CURRENT_TIME with current_time() for inode timestamps
>
>     CURRENT_TIME macro is not appropriate for filesystems as it
>     doesn't use the right granularity for filesystem timestamps.
>     Use current_time() instead.
>
>     CURRENT_TIME is also not y2038 safe.
>
>     This is also in preparation for the patch that transitions
>     vfs timestamps to use 64 bit time and hence make them
>     y2038 safe. As part of the effort current_time() will be
>     extended to do range checks. Hence, it is necessary for all
>     file system timestamps to use current_time(). Also,
>     current_time() will be transitioned along with vfs to be
>     y2038 safe.
>
>     Note that whenever a single call to current_time() is used
>     to change timestamps in different inodes, it is because they
>     share the same time granularity.
>
>     Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
>     Acked-by: Felipe Balbi <balbi@kernel.org>
>     Acked-by: Steven Whitehouse <swhiteho@redhat.com>
>     Acked-by: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
>     Reviewed-by: David Sterba <dsterba@suse.com>
>
> +------------------------------------------+------------+------------+---=
---------+
> |                                          | 58b11bff28 | c43edc7bd9 | ac=
5a28d43c |
> +------------------------------------------+------------+------------+---=
---------+
> | boot_successes                           | 63         | 0          | 0 =
         |
> | boot_failures                            | 0          | 22         | 13=
         |
> | BUG:unable_to_handle_kernel              | 0          | 22         | 13=
         |
> | Oops                                     | 0          | 22         | 13=
         |
> | EIP_is_at_current_time                   | 0          | 22         | 13=
         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 22         | 13=
         |
> | backtrace:_do_fork                       | 0          | 22         | 13=
         |
> +------------------------------------------+------------+------------+---=
---------+
>
> member access within null pointer of type 'struct super_block'
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.7.0-rc3-next-20160617-00002-g=
c43edc7 #1
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.7.0-rc3-next-20160617-00002-g=
c43edc7 #1
>  00000000 00000000 00000000 00000000 81badd80 81badd80 812d44fa 812d44fa =
00000001 00000001 81badda0 81badda0 2cb434b2 2cb434b2 81badd8c 81badd8c
>
>  8131d947 8131d947 81cab780 81cab780 81baddac 81baddac 8131dd3d 8131dd3d =
81b08fa2 81b08fa2 81b09277 81b09277 81cacd80 81cacd80 00200202 00200202
>
>  00000000 00000000 2cb434b2 2cb434b2 81baddcc 81baddcc 811b0dc6 811b0dc6 =
57677728 57677728 00000000 00000000 2cb434b2 2cb434b2 8f414008 8f414008
>
> Call Trace:
> Call Trace:
>  [<812d44fa>] dump_stack+0x57/0x79
>  [<812d44fa>] dump_stack+0x57/0x79
>  [<8131d947>] ubsan_epilogue+0xb/0x33
>  [<8131d947>] ubsan_epilogue+0xb/0x33
>  [<8131dd3d>] __ubsan_handle_type_mismatch+0x47/0xfb
>  [<8131dd3d>] __ubsan_handle_type_mismatch+0x47/0xfb
>  [<811b0dc6>] current_time+0x3c/0x53
>  [<811b0dc6>] current_time+0x3c/0x53
>  [<811e6982>] proc_alloc_inode+0x66/0x84
>  [<811e6982>] proc_alloc_inode+0x66/0x84
>  [<811ae68e>] alloc_inode+0x34/0x9f
>  [<811ae68e>] alloc_inode+0x34/0x9f
>  [<811af51a>] new_inode_pseudo+0xb/0x58
>  [<811af51a>] new_inode_pseudo+0xb/0x58
>  [<811e6c49>] proc_get_inode+0xd/0x10d
>  [<811e6c49>] proc_get_inode+0xd/0x10d
>  [<811e6d9c>] proc_fill_super+0x53/0x93
>  [<811e6d9c>] proc_fill_super+0x53/0x93
>  [<811e7006>] proc_mount+0xb3/0xee
>  [<811e7006>] proc_mount+0xb3/0xee
>  [<81196fb2>] mount_fs+0x48/0xcf
>  [<81196fb2>] mount_fs+0x48/0xcf
>  [<811b54f6>] vfs_kern_mount+0x4c/0x131
>  [<811b54f6>] vfs_kern_mount+0x4c/0x131
>  [<811b8609>] kern_mount_data+0x28/0x54
>  [<811b8609>] kern_mount_data+0x28/0x54
>  [<811e7160>] pid_ns_prepare_proc+0x13/0x35
>  [<811e7160>] pid_ns_prepare_proc+0x13/0x35
>  [<81069afc>] alloc_pid+0x358/0x4a2
>  [<81069afc>] alloc_pid+0x358/0x4a2
>  [<8104a72a>] copy_process+0x1297/0x1ba9
>  [<8104a72a>] copy_process+0x1297/0x1ba9
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<8104b253>] _do_fork+0xcf/0x4eb
>  [<8104b253>] _do_fork+0xcf/0x4eb
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<812ed0b6>] ? find_next_bit+0x12/0x1c
>  [<812ed0b6>] ? find_next_bit+0x12/0x1c
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<8104b68b>] kernel_thread+0x1c/0x21
>  [<8104b68b>] kernel_thread+0x1c/0x21
>  [<81847535>] rest_init+0x1a/0xa1
>  [<81847535>] rest_init+0x1a/0xa1
>  [<8209ee76>] start_kernel+0x3ca/0x3d2
>  [<8209ee76>] start_kernel+0x3ca/0x3d2
>  [<8209e2e4>] i386_start_kernel+0xab/0xaf
>  [<8209e2e4>] i386_start_kernel+0xab/0xaf
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> BUG: unable to handle kernel BUG: unable to handle kernel NULL pointer de=
referenceNULL pointer dereference at 00000470
>  at 00000470
> IP:IP: [<811b0dc6>] current_time+0x3c/0x53
>  [<811b0dc6>] current_time+0x3c/0x53
> *pde =3D 00000000 *pde =3D 00000000
>
> Oops: 0000 [#1] PREEMPT SMP
> Oops: 0000 [#1] PREEMPT SMP
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.7.0-rc3-next-20160617-00002-g=
c43edc7 #1
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.7.0-rc3-next-20160617-00002-g=
c43edc7 #1
> task: 81bb1c00 ti: 81bac000 task.ti: 81bac000
> task: 81bb1c00 ti: 81bac000 task.ti: 81bac000
> EIP: 0060:[<811b0dc6>] EFLAGS: 00210296 CPU: 0
> EIP: 0060:[<811b0dc6>] EFLAGS: 00210296 CPU: 0
> EIP is at current_time+0x3c/0x53
> EIP is at current_time+0x3c/0x53
> EAX: 81b08e52 EBX: 00000000 ECX: 2544e35b EDX: 331b7b49
> EAX: 81b08e52 EBX: 00000000 ECX: 2544e35b EDX: 331b7b49
> ESI: 2cb434b2 EDI: 57677728 EBP: 81baddcc ESP: 81baddb4
> ESI: 2cb434b2 EDI: 57677728 EBP: 81baddcc ESP: 81baddb4
>  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
>  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
> CR0: 80050033 CR2: 00000470 CR3: 02159000 CR4: 00040690
> CR0: 80050033 CR2: 00000470 CR3: 02159000 CR4: 00040690
> Stack:
> Stack:
>  57677728 57677728 00000000 00000000 2cb434b2 2cb434b2 8f414008 8f414008 =
8f414024 8f414024 8008e8a8 8008e8a8 81badddc 81badddc 811e6982 811e6982
>
>  81862240 81862240 8008e8a8 8008e8a8 81baddec 81baddec 811ae68e 811ae68e =
8008e8a8 8008e8a8 81ccbb80 81ccbb80 81bade00 81bade00 811af51a 811af51a
>
>  2544e35b 2544e35b 8008e8a8 8008e8a8 81ccbb80 81ccbb80 81bade14 81bade14 =
811e6c49 811e6c49 8008e8a8 8008e8a8 81bf5ca0 81bf5ca0 8008e8a8 8008e8a8
>
> Call Trace:
> Call Trace:
>  [<811e6982>] proc_alloc_inode+0x66/0x84
>  [<811e6982>] proc_alloc_inode+0x66/0x84
>  [<811ae68e>] alloc_inode+0x34/0x9f
>  [<811ae68e>] alloc_inode+0x34/0x9f
>  [<811af51a>] new_inode_pseudo+0xb/0x58
>  [<811af51a>] new_inode_pseudo+0xb/0x58
>  [<811e6c49>] proc_get_inode+0xd/0x10d
>  [<811e6c49>] proc_get_inode+0xd/0x10d
>  [<811e6d9c>] proc_fill_super+0x53/0x93
>  [<811e6d9c>] proc_fill_super+0x53/0x93
>  [<811e7006>] proc_mount+0xb3/0xee
>  [<811e7006>] proc_mount+0xb3/0xee
>  [<81196fb2>] mount_fs+0x48/0xcf
>  [<81196fb2>] mount_fs+0x48/0xcf
>  [<811b54f6>] vfs_kern_mount+0x4c/0x131
>  [<811b54f6>] vfs_kern_mount+0x4c/0x131
>  [<811b8609>] kern_mount_data+0x28/0x54
>  [<811b8609>] kern_mount_data+0x28/0x54
>  [<811e7160>] pid_ns_prepare_proc+0x13/0x35
>  [<811e7160>] pid_ns_prepare_proc+0x13/0x35
>  [<81069afc>] alloc_pid+0x358/0x4a2
>  [<81069afc>] alloc_pid+0x358/0x4a2
>  [<8104a72a>] copy_process+0x1297/0x1ba9
>  [<8104a72a>] copy_process+0x1297/0x1ba9
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<8104b253>] _do_fork+0xcf/0x4eb
>  [<8104b253>] _do_fork+0xcf/0x4eb
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<812ed0b6>] ? find_next_bit+0x12/0x1c
>  [<812ed0b6>] ? find_next_bit+0x12/0x1c
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<818475bc>] ? rest_init+0xa1/0xa1
>  [<8104b68b>] kernel_thread+0x1c/0x21
>  [<8104b68b>] kernel_thread+0x1c/0x21
>  [<81847535>] rest_init+0x1a/0xa1
>  [<81847535>] rest_init+0x1a/0xa1
>  [<8209ee76>] start_kernel+0x3ca/0x3d2
>  [<8209ee76>] start_kernel+0x3ca/0x3d2
>  [<8209e2e4>] i386_start_kernel+0xab/0xaf
>  [<8209e2e4>] i386_start_kernel+0xab/0xaf
> Code:Code: f1 f1 ff ff 8b 8b 75 75 f0 f0 8b 8b 7d 7d e8 e8 85 85 db db 75=
 75 0c 0c 31 31 d2 d2 b8 b8 98 98 b7 b7 ca ca 81 81 e8 e8 43 43 cf cf 16 16=
 00 00 8b 8b 5b 5b 1c 1c 85 85 db db 75 75 0c 0c 31 31 d2 d2 b8 b8 80 80 b7=
 b7 ca ca 81 81 e8 e8 30 30 cf cf 16 16 00 00 <8b> <8b> 8b 8b 70 70 04 04 0=
0 00 00 00 89 89 f8 f8 89 89 f2 f2 e8 e8 7c 7c ac ac f0 f0 ff ff 83 83 c4 c=
4 0c 0c 5b 5b 5e 5e 5f 5f
>
> EIP: [<811b0dc6>] EIP: [<811b0dc6>] current_time+0x3c/0x53current_time+0x=
3c/0x53 SS:ESP 0068:81baddb4
>  SS:ESP 0068:81baddb4
> CR2: 0000000000000470
> CR2: 0000000000000470
> ---[ end trace 4d5ff9f2f68c4233 ]---
> ---[ end trace 4d5ff9f2f68c4233 ]---

I missed this email earlier.

The problem is because the proc_alloc_inode() is using the super_block
field in the inode before inode_init_always() which actually
initializes this field.
There might be other filesystems that are doing the same thing.
I will fix this in v3.

-Deepa

--===============0310678013134264690==--

