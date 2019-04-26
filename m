Content-Type: multipart/mixed; boundary="===============9128566268610810629=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] 345c0dbf3a: xfstests.ext4.303.fail
Date: Fri, 26 Apr 2019 12:28:10 -0400
Message-ID: <20190426162810.GA9835@mit.edu>
In-Reply-To: <20190426094708.GA20480@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============9128566268610810629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 05:47:09PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 345c0dbf3a30872d9b204db96b5857cd00808cae ("ext4: protect journal =
inode's blocks using block_validity")
> https://git.kernel.org/cgit/linux/kernel/git/tytso/ext4.git dev
> =

> in testcase: xfstests
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: ext4
> 	test: ext4-run

Hi, I'm not able to reproduce this.

TESTRUNID: tytso-20190426093752
KERNEL:    kernel 5.1.0-rc3-xfstests-00007-g345c0dbf3a30 #921 SMP Fri Apr 2=
6 09:36:55 EDT 2019 x86_64
CMDLINE:   -c 4k -g auto
CPUS:      2
MEM:       7680

ext4/4k: 462 tests, 43 skipped, 4271 seconds
Totals: 419 tests, 43 skipped, 0 failures, 0 errors, 4249s

Ran: ext4/001 ext4/002 ext4/003 ext4/004 ext4/005 ext4/020 ext4/021 ext4/02=
2 ext4/023 ext4/024 ext4/025 ext4/026 ext4/027 ext4/028 ext4/029 ext4/030 e=
xt4/031 ext4/032 ext4/033 ext4/034 ext4/271 ext4/301 ext4/302 ext4/303 ext4=
/305 ext4/306 ext4/307 ext4/308 generic/001 generic/002 generic/003 ....

Given some of the failures, especially this one:

> ext4/307	- output mismatch (see /lkp/benchmarks/xfstests/results//ext4/30=
7.out.bad)
>     --- tests/ext4/307.out	2019-04-25 09:04:55.000000000 +0800
>     +++ /lkp/benchmarks/xfstests/results//ext4/307.out.bad	2019-04-26 13:=
15:02.522490198 +0800
>     @@ -1,6 +1,7 @@
>      QA output created by 307
>      =

>      Run fsstress
>     +./tests/ext4/307: line 34: gawk: command not found
>      Allocate donor file
>      Perform compacting
>      Check data
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/ext4/307.out /lkp/benchm=
arks/xfstests/results//ext4/307.out.bad'  to see the entire diff)

I'm very much wondering whether your VM has gotten corrupted or hasn't
been correctly set up?

					- Ted

--===============9128566268610810629==--

