Content-Type: multipart/mixed; boundary="===============3994598025792760976=="
MIME-Version: 1.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: lkp@lists.01.org
Subject: Re: [xfs] 1aa91d9c99: xfstests.generic.471.fail
Date: Sun, 04 Sep 2022 12:52:47 +0200
Message-ID: <c558a247-4d12-daf6-f475-526eaaf3e700@leemhuis.info>
In-Reply-To: <db909f88-3f5c-afc8-424c-ced3f371037f@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3994598025792760976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

As per recent general discussions with the 0-day folks, I'm dropping
below regression from the list of tracked issues, as this report didn't
gain any traction. That for example can happen if the developers
considered the regression of no practical relevance, as they assume it
only materializes in micro-benchmarks, is due to a broken test case, or
some fluke.

Not sure if that or something else is the reason why this particular
report  didn't gain any traction, but I lack the bandwidth to follow-up
on each and every regression some CI system found and reported. At the
same time I don't want to keep these reports in the list of tracked
issues forever, as that creates noise and makes it harder to spot the
important issues in regzbot's reports and lists. That's why I hereby
remove it:

#regzbot invalid: 0-day report that didn't get traction; might be of no
relevance

Ciao, Thorsten

On 23.08.22 03:39, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 1aa91d9c993397858a50c433933ea119903fdea2 ("xfs: Add async
> buffered write support")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: xfstests
> version: xfstests-x86_64-c1144bf-1_20220808
> with following parameters:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0disk: 4HDD
> =C2=A0=C2=A0=C2=A0=C2=A0fs: xfs
> =C2=A0=C2=A0=C2=A0=C2=A0test: generic-group-23
> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0xf0
> =

> test-description: xfstests is a regression test suite for xfs and other
> files ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz
> (Skylake) with 16G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> generic/471=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - output mismatch (see
> /lkp/benchmarks/xfstests/results//generic/471.out.bad)
> =C2=A0=C2=A0=C2=A0 --- tests/generic/471.out=C2=A0=C2=A0=C2=A0 2022-08-08=
 17:00:46.000000000 +0000
> =C2=A0=C2=A0=C2=A0 +++ /lkp/benchmarks/xfstests/results//generic/471.out.=
bad=C2=A0=C2=A0=C2=A0
> 2022-08-22 16:16:45.895663503 +0000
> =C2=A0=C2=A0=C2=A0 @@ -2,12 +2,10 @@
> =C2=A0=C2=A0=C2=A0=C2=A0 pwrite: Resource temporarily unavailable
> =C2=A0=C2=A0=C2=A0=C2=A0 wrote 8388608/8388608 bytes at offset 0
> =C2=A0=C2=A0=C2=A0=C2=A0 XXX Bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XX=
X ops/sec)
> =C2=A0=C2=A0=C2=A0 -RWF_NOWAIT time is within limits.
> =C2=A0=C2=A0=C2=A0 +pwrite: Resource temporarily unavailable
> =C2=A0=C2=A0=C2=A0 +(standard_in) 1: syntax error
> =C2=A0=C2=A0=C2=A0 +RWF_NOWAIT took=C2=A0 seconds
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/4=
71.out
> /lkp/benchmarks/xfstests/results//generic/471.out.bad'=C2=A0 to see the
> entire diff)
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/disk/fs/test/ucode:
> =C2=A0
> lkp-skl-d06/xfstests/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func=
/gcc-11/4HDD/xfs/generic-group-23/0xf0
> =

> commit:
> =C2=A0 9641506b2deed1 ("xfs: Specify lockmode when calling
> xfs_ilock_for_iomap()")
> =C2=A0 1aa91d9c993397 ("xfs: Add async buffered write support")
> =

> 9641506b2deed1bb 1aa91d9c993397858a50c433933
> ---------------- ---------------------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=C2=A0=
=C2=A0=C2=A0 fail:runs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :6=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2:2=C2=A0=C2=A0=C2=A0=C2=A0 xfst=
ests.generic.471.fail
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <yujie.liu@intel.com>
> =

> =

> To reproduce:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com/i=
ntel/lkp-tests.git
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp install job.yaml=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # job file is =
attached
> in this email
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --compatible=
 job.yaml # generate the yaml file
> for lkp run
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp run generated-yam=
l-file
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any failure t=
hat blocks the test,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.lkp and /lk=
p dir to run from a clean state.
> =

> =

> #regzbot introduced: 1aa91d9c99
>=20
--===============3994598025792760976==--

