Content-Type: multipart/mixed; boundary="===============0651965237983064254=="
MIME-Version: 1.0
From: Christian Brauner <brauner@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fs] e1bbcd277a: xfstests.generic.633.fail
Date: Thu, 09 Jun 2022 10:39:45 +0200
Message-ID: <20220609083945.c2ezz7ldvqofunpm@wittgenstein>
In-Reply-To: <20220609081742.GA17678@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0651965237983064254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 04:17:42PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: e1bbcd277a53e08d619ffeec56c5c9287f2bf42f ("fs: hold writers when =
changing mount's idmapping")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: xfstests
> version: xfstests-x86_64-64f2596-1_20220518
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: generic-group-31
> 	ucode: 0xec
> =

> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 3=
2G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> generic/633	- output mismatch (see /lkp/benchmarks/xfstests/results//gene=
ric/633.out.bad)
>     --- tests/generic/633.out	2022-05-18 12:17:48.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//generic/633.out.bad	2022-06-07 =
15:37:21.117002738 +0000
>     @@ -1,2 +1,10 @@
>      QA output created by 633
>      Silence is golden
>     +idmapped-mounts.c: 8692: idmapped_mount_create_cb - Device or resour=
ce busy - failure: sys_mount_setattr
>     +idmapped-mounts.c: 8692: idmapped_mount_create_cb - Device or resour=
ce busy - failure: sys_mount_setattr
>     +idmapped-mounts.c: 8692: idmapped_mount_create_cb - Device or resour=
ce busy - failure: sys_mount_setattr
>     +idmapped-mounts.c: 8692: idmapped_mount_create_cb - Device or resour=
ce busy - failure: sys_mount_setattr
>     +idmapped-mounts.c: 8692: idmapped_mount_create_cb - Device or resour=
ce busy - failure: sys_mount_setattr
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/633.out /lkp/ben=
chmarks/xfstests/results//generic/633.out.bad'  to see the entire diff)

Since e1bbcd277a53 ("fs: hold writers when changing mount's idmapping")
this behavior is expected and is explained in detail in the pull request
that contained this patch.

Upstream xfstests has been updated in commit
781bb995a149 ("vfs/idmapped-mounts: remove invalid test")
and would not fail.

Thanks!
Christian
--===============0651965237983064254==--

