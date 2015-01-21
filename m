Content-Type: multipart/mixed; boundary="===============2173495998541952879=="
MIME-Version: 1.0
From: Paul Moore <pmoore@redhat.com>
To: lkp@lists.01.org
Subject: Re: [fs] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(1, 0)
Date: Wed, 21 Jan 2015 09:29:27 -0500
Message-ID: <2014590.Q7f0SpfhCT@sifl>
In-Reply-To: <1421825538.6126.28.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2173495998541952879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wednesday, January 21, 2015 03:32:18 PM Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 5dc5218840e1268de639150a851978bb19c341df ("fs: create proper filen=
ame
> objects using getname_kernel()")
> =

> [   16.813397] 010f           65536 ram15  (driver?)
> [   16.815041] fc00       268435456 vda  driver: virtio_blk
> [   16.816777] fc10       268435456 vdb  driver: virtio_blk
> [   16.818544] Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(1,0) [   16.819520] CPU: 0 PID: 1 Comm: swapper/0 Not taint=
ed
> 3.19.0-rc5-next-20150120-g5d0eebb #799 [   16.819520] Hardware name: QEMU
> Standard PC (i440FX + PIIX, 1996), BIOS 1.7.5-20140531_083030-gandalf
> 04/01/2014 [   16.819520]  ffff8800076a0000 ffff880006f47db8
> ffffffff81b7a16b ffffffff810cf061 [   16.819520]  ffffffff81fd6ce5
> ffff880006f47e38 ffffffff81b749fd ffffffff822459b0 [   16.819520] =

> ffff880000000010 ffff880006f47e48 ffff880006f47de8 ffff003500626476 [  =

> 16.819520] Call Trace:
> [   16.819520]  [<ffffffff81b7a16b>] dump_stack+0x4c/0x65
> [   16.819520]  [<ffffffff810cf061>] ? console_unlock+0x398/0x3c7
> [   16.819520]  [<ffffffff81b749fd>] panic+0xc9/0x1f7
> [   16.819520]  [<ffffffff824e84aa>] mount_block_root+0x201/0x218
> [   16.819520]  [<ffffffff824e871f>] mount_root+0x13f/0x14a
> [   16.819520]  [<ffffffff824e92fc>] ? initrd_load+0x2d7/0x2e6
> [   16.819520]  [<ffffffff824e8897>] prepare_namespace+0x16d/0x1a6
> [   16.819520]  [<ffffffff824e815a>] kernel_init_freeable+0x268/0x278
> [   16.819520]  [<ffffffff81b6bb61>] ? rest_init+0xca/0xca
> [   16.819520]  [<ffffffff81b6bb6f>] kernel_init+0xe/0xda
> [   16.819520]  [<ffffffff81b881fc>] ret_from_fork+0x7c/0xb0
> [   16.819520]  [<ffffffff81b6bb61>] ? rest_init+0xca/0xca
> [   16.819520] Kernel Offset: 0x0 from 0xffffffff81000000 (relocation ran=
ge:
> 0xffffffff80000000-0xffffffff9fffffff)

Thanks for reporting the problem, we're currently working on a fix:

 * https://lkml.org/lkml/2015/1/20/710

-- =

paul moore
security @ redhat


--===============2173495998541952879==--

