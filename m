Content-Type: multipart/mixed; boundary="===============2707173979622722088=="
MIME-Version: 1.0
From: Christian Brauner <brauner@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fs/exec] 80bd5afdd8: xfstests.generic.633.fail
Date: Mon, 31 Jan 2022 16:08:19 +0100
Message-ID: <20220131150819.iuqlz3rz6q7cheap@wittgenstein>
In-Reply-To: <20220131144352.GE16385@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2707173979622722088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 10:43:52PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 80bd5afdd8568e41fc3a75c695bb179e0d9eee4d ("[PATCH v3] fs/exec: re=
quire argv[0] presence in do_execveat_common()")
> url: https://github.com/0day-ci/linux/commits/Ariadne-Conill/fs-exec-requ=
ire-argv-0-presence-in-do_execveat_common/20220127-080829
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 2c2=
71fe77d52a0555161926c232cd5bc07178b39
> patch link: https://lore.kernel.org/lkml/20220127000724.15106-1-ariadne(a=
)dereferenced.org
> =

> in testcase: xfstests
> version: xfstests-x86_64-972d710-1_20220127
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: f2fs
> 	test: generic-group-31
> 	ucode: 0xe2
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

> =

> user  :warn  : [  208.077271] run fstests generic/633 at 2022-01-30 04:50=
:49
> kern  :warn  : [  208.529090] Attempted to run process '/dev/fd/5/file1' =
with NULL argv
> user  :notice: [  208.806756] generic/633       [failed, exit status 1]- =
output mismatch (see /lkp/benchmarks/xfstests/results//generic/633.out.bad)
> =

> user  :notice: [  208.826454]     --- tests/generic/633.out     2022-01-2=
7 11:54:16.000000000 +0000
> =

> user  :notice: [  208.842458]     +++ /lkp/benchmarks/xfstests/results//g=
eneric/633.out.bad     2022-01-30 04:50:49.769538285 +0000
> =

> user  :notice: [  208.859622]     @@ -1,2 +1,4 @@
> =

> user  :warn  : [  208.860623] run fstests generic/634 at 2022-01-30 04:50=
:49
> user  :notice: [  208.866037]      QA output created by 633
> =

> user  :notice: [  208.889262]      Silence is golden
> =

> user  :notice: [  208.901240]     +idmapped-mounts.c: 3608: setid_binarie=
s - Invalid argument - failure: sys_execveat

This is from the generic part of the vfs testsuite.
It verifies that set*id binaries are executed with the right e{g,u}id.
Part of that test calls execveat() as:

static char *argv[] =3D {
	NULL,
};

static char *envp[] =3D {
	"EXPECTED_EUID=3D5000",
	"EXPECTED_EGID=3D5000",
	NULL,
};

syscall(__NR_execveat, fd, some_path, argv, envp, 0);

I can fix this rather simply in our upstream fstests with:

static char *argv[] =3D {
	"",
};

I guess.

But doesn't

static char *argv[] =3D {
	NULL,
};

seem something that should work especially with execveat()?

Christian
--===============2707173979622722088==--

