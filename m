Content-Type: multipart/mixed; boundary="===============4414666227955785727=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs/namei.c] e013ec23b8: WARNING:at_fs/dcache.c:#dentry_free
Date: Wed, 04 Sep 2019 14:52:40 +0800
Message-ID: <20190904065240.GQ22468@xsang-OptiPlex-9020>
In-Reply-To: <20190831154246.GY1131@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4414666227955785727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2019 at 04:42:46PM +0100, Al Viro wrote:
> On Sat, Aug 31, 2019 at 09:09:17PM +0800, kernel test robot wrote:
> =

> > [   13.886602] WARNING: CPU: 0 PID: 541 at fs/dcache.c:338 dentry_free+=
0x7f/0x90
> > [   13.889208] Modules linked in:
> > [   13.890276] CPU: 0 PID: 541 Comm: readlink Not tainted 5.3.0-rc1-000=
08-ge013ec23b8231 #1
> > [   13.892699] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.10.2-1 04/01/2014
> > [   13.895419] RIP: 0010:dentry_free+0x7f/0x90
> > [   13.896739] Code: f0 75 cb 48 8d be b0 00 00 00 48 83 c4 08 48 c7 c6=
 60 8d cd a5 e9 51 69 e4 ff 48 89 3c 24 48 c7 c7 f8 a9 cb a6 e8 7f 37 e3 ff=
 <0f> 0b 48 8b 34 24 eb 8f 66 0f 1f 84 00 00 00 00 00 66 66 66 66 90
> > [   13.901957] RSP: 0018:ffffb5524063fe38 EFLAGS: 00010282
> > [   13.903527] RAX: 0000000000000024 RBX: ffff9941878040c0 RCX: fffffff=
fa706aa08
> > [   13.905566] RDX: 0000000000000000 RSI: 0000000000000096 RDI: 0000000=
000000246
> > [   13.907612] RBP: 0000000000000000 R08: 0000000000000280 R09: 0000000=
000000033
> > [   13.909664] R10: 0000000000000000 R11: ffffb5524063fce8 R12: ffff994=
187804118
> > [   13.911711] R13: ffff99427a810000 R14: ffff994187d7c8f0 R15: ffff994=
27a810b80
> > [   13.913753] FS:  0000000000000000(0000) GS:ffff9942bfc00000(0000) kn=
lGS:0000000000000000
> > [   13.916187] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > [   13.917892] CR2: 000000000937458b CR3: 000000006800a000 CR4: 0000000=
0000006f0
> > [   13.919925] Call Trace:
> > [   13.920840]  __dentry_kill+0x13c/0x1a0
> > [   13.922076]  path_put+0x12/0x20
> > [   13.923148]  free_fs_struct+0x1b/0x30
> > [   13.924346]  do_exit+0x304/0xc40
> > [   13.925438]  ? __schedule+0x25d/0x670
> > [   13.926642]  do_group_exit+0x3a/0xa0
> > [   13.927817]  __ia32_sys_exit_group+0x14/0x20
> > [   13.929160]  do_fast_syscall_32+0xa9/0x340
> > [   13.930565]  entry_SYSENTER_compat+0x7f/0x91
> > [   13.931924] ---[ end trace 02c6706eb2c2ebf2 ]---
> > =

> > =

> > To reproduce:
> > =

> >         # build kernel
> > 	cd linux
> > 	cp config-5.3.0-rc1-00008-ge013ec23b8231 .config
> > 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare modu=
les_prepare bzImage
> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> =

> Can't reproduce here...

any detail failure by using this reproducer?

> =

> I see one potential problem in there, but I would expect it to have the
> opposite effect (I really don't believe that it's a ->d_count wraparound -
> that would've taken much longer than a minute, if nothing else).
> =

> How reliably is it reproduced on your setup and does the following have
> any impact, one way or another?

It is always reproduced. We noticed that your branch was rebased. If it's s=
till with problem, will let you know.

> =

> diff --git a/fs/namei.c b/fs/namei.c
> index 412479e4c258..671c3c1a3425 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -643,10 +643,8 @@ static bool legitimize_root(struct nameidata *nd)
>  {
>  	if (!nd->root.mnt || (nd->flags & LOOKUP_ROOT))
>  		return true;
> -	if (unlikely(!legitimize_path(nd, &nd->root, nd->root_seq)))
> -		return false;
>  	nd->flags |=3D LOOKUP_ROOT_GRABBED;
> -	return true;
> +	return legitimize_path(nd, &nd->root, nd->root_seq);
>  }
>  =

>  /*
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============4414666227955785727==--

