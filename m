Content-Type: multipart/mixed; boundary="===============5245816151197410934=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [block] 4c95131e3c: kernel_BUG_at_block/bio.c
Date: Wed, 31 Mar 2021 08:55:55 -0600
Message-ID: <8540963a-a408-64e8-cebe-095e4835e7b8@kernel.dk>
In-Reply-To: <20210331081330.GB32402@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5245816151197410934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/31/21 2:13 AM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 4c95131e3cb8bbb08c3b370b4ae3611874b48be0 ("block: enable use of b=
io allocation cache")
> https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git io_uri=
ng-bio-cache
> =

> =

> in testcase: ocfs2test
> version: ocfs2test-x86_64-d802bf7-1_20210329
> with following parameters:
> =

> 	disk: 1HDD
> 	test: test-reserve_space
> 	ucode: 0x21
> =

> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz with =
16G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   47.859997] kernel BUG at block/bio.c:628!
> [   47.860086] invalid opcode: 0000 [#1] SMP PTI
> [   47.860167] CPU: 5 PID: 5042 Comm: mkfs.ocfs2 Not tainted 5.12.0-rc5-0=
0060-g4c95131e3cb8 #1
> [   47.860317] Hardware name:  /DZ77BH-55K, BIOS BHZ7710H.86A.0097.2012.1=
228.1346 12/28/2012
> [   47.860445] RIP: 0010:__bio_put (kbuild/src/consumer/block/bio.c:628 k=
build/src/consumer/block/bio.c:623) =

> [ 47.860514] Code: 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 f6 47 14 =
40 74 0f 8b 47 64 85 c0 74 0e f0 ff 4f 64 0f 94 c0 c3 b8 01 00 00 00 c3 <0f=
> 0b 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
>    7:	00 00 00 =

>    a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>    f:	f6 47 14 40          	testb  $0x40,0x14(%rdi)
>   13:	74 0f                	je     0x24
>   15:	8b 47 64             	mov    0x64(%rdi),%eax
>   18:	85 c0                	test   %eax,%eax
>   1a:	74 0e                	je     0x2a
>   1c:	f0 ff 4f 64          	lock decl 0x64(%rdi)
>   20:	0f 94 c0             	sete   %al
>   23:	c3                   	retq   =

>   24:	b8 01 00 00 00       	mov    $0x1,%eax
>   29:	c3                   	retq   =

>   2a:*	0f 0b                	ud2    		<-- trapping instruction
>   2c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
>   33:	00 00 00 00 =

>   37:	66                   	data16
>   38:	66                   	data16
>   39:	2e                   	cs
>   3a:	0f                   	.byte 0xf
>   3b:	1f                   	(bad)  =

>   3c:	84 00                	test   %al,(%rax)
> 	...
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	0f 0b                	ud2    =

>    2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
>    9:	00 00 00 00 =

>    d:	66                   	data16
>    e:	66                   	data16
>    f:	2e                   	cs
>   10:	0f                   	.byte 0xf
>   11:	1f                   	(bad)  =

>   12:	84 00                	test   %al,(%rax)
> 	...
> [   47.860801] RSP: 0018:ffffc9000d42fc88 EFLAGS: 00010246
> [   47.860885] RAX: 0000000000000000 RBX: ffffc9000d42fe80 RCX: 000000000=
0000002
> [   47.860998] RDX: ffff88841a9a4f00 RSI: ffff88841a9a4f00 RDI: ffff88841=
b721318
> [   47.861109] RBP: ffff88841b721318 R08: ffff88841b721318 R09: 000000000=
002ab30
> [   47.861221] R10: 00000000000002c8 R11: ffff88841f36a144 R12: ffff88841=
b721318
> [   47.861352] R13: ffffffff81395875 R14: 00000000ffffffff R15: ffff88841=
a9a4f00
> [   47.861464] FS:  00007f5c66517280(0000) GS:ffff88841f340000(0000) knlG=
S:0000000000000000
> [   47.861590] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   47.861681] CR2: 000055d13280c000 CR3: 0000000414e82006 CR4: 000000000=
01706e0
> [   47.861793] Call Trace:
> [   47.861836] bio_put (kbuild/src/consumer/block/bio.c:646) =

> [   47.861888] __blkdev_direct_IO (kbuild/src/consumer/fs/block_dev.c:508=
) =

> [   47.861959] generic_file_direct_write (kbuild/src/consumer/mm/filemap.=
c:3473) =

> [   47.862037] __generic_file_write_iter (kbuild/src/consumer/mm/filemap.=
c:3661) =

> [   47.862113] blkdev_write_iter (kbuild/src/consumer/fs/block_dev.c:1719=
 kbuild/src/consumer/fs/block_dev.c:1693) =

> [   47.862181] new_sync_write (kbuild/src/consumer/fs/read_write.c:519 (d=
iscriminator 1)) =

> [   47.862265] vfs_write (kbuild/src/consumer/fs/read_write.c:605) =

> [   47.862322] ksys_pwrite64 (kbuild/src/consumer/include/linux/file.h:45=
 kbuild/src/consumer/fs/read_write.c:713) =

> [   47.862381] do_syscall_64 (kbuild/src/consumer/arch/x86/entry/common.c=
:46) =

> [   47.862443] entry_SYSCALL_64_after_hwframe (kbuild/src/consumer/arch/x=
86/entry/entry_64.S:112) =

> [   47.862526] RIP: 0033:0x7f5c66692a37
> [ 47.862586] Code: ff ff eb b6 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 =
00 48 8d 05 c9 7c 0d 00 49 89 ca 8b 00 85 c0 75 10 b8 12 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 59 c3 41 55 49 89 cd 41 54 49 89 d4 55 48 89

Thanks for the report, I've fixed this up in the current branch and
pushed a new one out.

-- =

Jens Axboe

--===============5245816151197410934==--

