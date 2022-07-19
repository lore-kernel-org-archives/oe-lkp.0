Content-Type: multipart/mixed; boundary="===============0963972543140245481=="
MIME-Version: 1.0
From: Ian Kent <raven@themaw.net>
To: lkp@lists.01.org
Subject: Re: [vfs] f756fe900f: canonical_address#:#[##]
Date: Tue, 19 Jul 2022 13:30:53 +0800
Message-ID: <d93e3eb6-38b9-6a70-af3d-ab10fa646c96@themaw.net>
In-Reply-To: <YtVvs06ZoG3BtMyf@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0963972543140245481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 18/7/22 22:35, kernel test robot wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: f756fe900f17af85c3f4bafc9b9e996bcc0fbeb1 ("[REPOST PATCH v2] vfs:=
 parse: deal with zero length string value")
> url: https://github.com/intel-lab-lkp/linux/commits/Ian-Kent/vfs-parse-de=
al-with-zero-length-string-value/20220708-094030
> base: https://git.kernel.org/cgit/linux/kernel/git/viro/vfs.git for-next
> patch link: https://lore.kernel.org/linux-fsdevel/165724435867.30814.6980=
005089665688371.stgit(a)donald.themaw.net
>
> in testcase: xfstests
> version: xfstests-x86_64-c1144bf-1_20220711
> with following parameters:
>
> 	disk: 4HDD
> 	fs: ext2
> 	test: ext4-group-02
> 	ucode: 0xec
>
> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>
>
> on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 3=
2G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [  380.748272][ T5965] EXT4-fs (sda4): mounting ext3 file system using th=
e ext4 subsystem
> [  380.856453][ T5993] EXT4-fs: journaled quota format not specified
> [  380.879248][ T5997] EXT4-fs (sda4): mounting ext3 file system using th=
e ext4 subsystem
> [  380.911204][ T6003] EXT4-fs: journaled quota format not specified
> [  380.924796][ T6007] EXT4-fs: journaled quota format not specified
> [  380.964372][ T6012] general protection fault, probably for non-canonic=
al address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
> [  380.975568][ T6012] KASAN: null-ptr-deref in range [0x0000000000000000=
-0x0000000000000007]
> [  380.983810][ T6012] CPU: 1 PID: 6012 Comm: mount Tainted: G S        I=
       5.19.0-rc2-00001-gf756fe900f17 #1
> [  380.993786][ T6012] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIO=
S 1.1.1 10/07/2015
> [ 381.001854][ T6012] RIP: 0010:ext4_parse_param (kbuild/src/consumer/fs/=
ext4/super.c:2109)

It has to be this:

@@ -2110,12 +2110,12 @@ static int ext4_parse_param(struct fs_context =

*fc, struct fs_parameter *param)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (token) {
 =C2=A0#ifdef CONFIG_QUOTA
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case Opt_usrjquota:
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (!*param->string)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (!param->string || !*param->string)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return u=
nnote_qf_name(fc, USRQUOTA);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 else
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return n=
ote_qf_name(fc, USRQUOTA, param);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case Opt_grpjquota:
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (!*param->string)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (!param->string || !*param->string)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return u=
nnote_qf_name(fc, GRPQUOTA);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 else
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return n=
ote_qf_name(fc, GRPQUOTA, param);

IMHO it's fragile without the additional check since the file system

has no control over how parameters come to it both in the old and new

systems.


Ian

--===============0963972543140245481==--

