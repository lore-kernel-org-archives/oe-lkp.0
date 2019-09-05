Content-Type: multipart/mixed; boundary="===============2712511906455611243=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs/namei.c] e013ec23b8: WARNING:at_fs/dcache.c:#dentry_free
Date: Thu, 05 Sep 2019 10:53:57 +0800
Message-ID: <20190905025357.GT22468@xsang-OptiPlex-9020>
In-Reply-To: <20190904065240.GQ22468@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2712511906455611243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 02:52:40PM +0800, Oliver Sang wrote:
> On Sat, Aug 31, 2019 at 04:42:46PM +0100, Al Viro wrote:
> > On Sat, Aug 31, 2019 at 09:09:17PM +0800, kernel test robot wrote:
> > =

> > > [   13.886602] WARNING: CPU: 0 PID: 541 at fs/dcache.c:338 dentry_fre=
e+0x7f/0x90
> > > [   13.889208] Modules linked in:
> > > [   13.890276] CPU: 0 PID: 541 Comm: readlink Not tainted 5.3.0-rc1-0=
0008-ge013ec23b8231 #1
> > > [   13.892699] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS 1.10.2-1 04/01/2014
> > > [   13.895419] RIP: 0010:dentry_free+0x7f/0x90
> > > [   13.896739] Code: f0 75 cb 48 8d be b0 00 00 00 48 83 c4 08 48 c7 =
c6 60 8d cd a5 e9 51 69 e4 ff 48 89 3c 24 48 c7 c7 f8 a9 cb a6 e8 7f 37 e3 =
ff <0f> 0b 48 8b 34 24 eb 8f 66 0f 1f 84 00 00 00 00 00 66 66 66 66 90
> > > [   13.901957] RSP: 0018:ffffb5524063fe38 EFLAGS: 00010282
> > > [   13.903527] RAX: 0000000000000024 RBX: ffff9941878040c0 RCX: fffff=
fffa706aa08
> > > [   13.905566] RDX: 0000000000000000 RSI: 0000000000000096 RDI: 00000=
00000000246
> > > [   13.907612] RBP: 0000000000000000 R08: 0000000000000280 R09: 00000=
00000000033
> > > [   13.909664] R10: 0000000000000000 R11: ffffb5524063fce8 R12: ffff9=
94187804118
> > > [   13.911711] R13: ffff99427a810000 R14: ffff994187d7c8f0 R15: ffff9=
9427a810b80
> > > [   13.913753] FS:  0000000000000000(0000) GS:ffff9942bfc00000(0000) =
knlGS:0000000000000000
> > > [   13.916187] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > > [   13.917892] CR2: 000000000937458b CR3: 000000006800a000 CR4: 00000=
000000006f0
> > > [   13.919925] Call Trace:
> > > [   13.920840]  __dentry_kill+0x13c/0x1a0
> > > [   13.922076]  path_put+0x12/0x20
> > > [   13.923148]  free_fs_struct+0x1b/0x30
> > > [   13.924346]  do_exit+0x304/0xc40
> > > [   13.925438]  ? __schedule+0x25d/0x670
> > > [   13.926642]  do_group_exit+0x3a/0xa0
> > > [   13.927817]  __ia32_sys_exit_group+0x14/0x20
> > > [   13.929160]  do_fast_syscall_32+0xa9/0x340
> > > [   13.930565]  entry_SYSENTER_compat+0x7f/0x91
> > > [   13.931924] ---[ end trace 02c6706eb2c2ebf2 ]---
> > > =

> > > =

> > > To reproduce:
> > > =

> > >         # build kernel
> > > 	cd linux
> > > 	cp config-5.3.0-rc1-00008-ge013ec23b8231 .config
> > > 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare mo=
dules_prepare bzImage
> > > =

> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         bin/lkp qemu -k <bzImage> job-script # job-script is attached=
 in this email
> > =

> > Can't reproduce here...
> =

> any detail failure by using this reproducer?
> =

> > =

> > I see one potential problem in there, but I would expect it to have the
> > opposite effect (I really don't believe that it's a ->d_count wraparoun=
d -
> > that would've taken much longer than a minute, if nothing else).
> > =

> > How reliably is it reproduced on your setup and does the following have
> > any impact, one way or another?
> =

> It is always reproduced. We noticed that your branch was rebased. If it's=
 still with problem, will let you know.

by testing the below HEAD commit of current branch, the issue gone

commit 46c46f8df9aa425cc4d6bc89d57a6fedf83dc797 (HEAD -> work.namei, origin=
/work.namei)
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Sat Jul 27 16:29:22 2019 -0400

> =

> > =

> > diff --git a/fs/namei.c b/fs/namei.c
> > index 412479e4c258..671c3c1a3425 100644
> > --- a/fs/namei.c
> > +++ b/fs/namei.c
> > @@ -643,10 +643,8 @@ static bool legitimize_root(struct nameidata *nd)
> >  {
> >  	if (!nd->root.mnt || (nd->flags & LOOKUP_ROOT))
> >  		return true;
> > -	if (unlikely(!legitimize_path(nd, &nd->root, nd->root_seq)))
> > -		return false;
> >  	nd->flags |=3D LOOKUP_ROOT_GRABBED;
> > -	return true;
> > +	return legitimize_path(nd, &nd->root, nd->root_seq);
> >  }
> >  =

> >  /*
> > _______________________________________________
> > LKP mailing list
> > LKP(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/lkp
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============2712511906455611243==--

