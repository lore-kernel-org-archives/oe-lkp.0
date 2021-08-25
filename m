Content-Type: multipart/mixed; boundary="===============2202658557824836520=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fs] f7e33bdbd6: ltp.ftruncate04_64.fail
Date: Wed, 25 Aug 2021 06:32:38 -0400
Message-ID: <cf358b73cbda90fd6c023f3a59a8df94698cf0bc.camel@kernel.org>
In-Reply-To: <20210825051710.GA5358@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2202658557824836520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-08-25 at 13:17 +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: f7e33bdbd6d1bdf9c3df8bba5abcf3399f957ac3 ("fs: remove mandatory f=
ile locking support")
> https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git locks-next
> =

> =

> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20210821
> with following parameters:
> =

> 	disk: 1HDD
> 	fs: ext4
> 	test: syscalls-07
> 	ucode: 0xe2
> =

> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
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


[...]

> <<<test_start>>>
> tag=3Dftruncate04_64 stime=3D1629792639
> cmdline=3D"ftruncate04_64"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> tst_test.c:916: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra op=
ts=3D''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1348: TINFO: Timeout per run is 0h 25m 00s
> ftruncate04.c:116: TINFO: Child locks file
> ftruncate04.c:49: TFAIL: ftruncate() offset before lock succeeded unexpec=
tedly
> ftruncate04.c:49: TFAIL: ftruncate() offset in lock succeeded unexpectedly
> ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded
> ftruncate04.c:127: TINFO: Child unlocks file
> ftruncate04.c:84: TPASS: ftruncate() offset in lock succeded
> ftruncate04.c:84: TPASS: ftruncate() offset before lock succeded
> ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded
> =

> Summary:
> passed   4
> failed   2
> broken   0
> skipped  0
> warnings 0

I think this failed because of the above, which is expected now that we
ignore the "mand" mount option (and mandatory locking support is gone).

Oliver, you may need to update the expected test output for this test.

Thanks,
-- =

Jeff Layton <jlayton@kernel.org>

--===============2202658557824836520==--

