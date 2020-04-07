Content-Type: multipart/mixed; boundary="===============0730689508056264228=="
MIME-Version: 1.0
From: Shuah Khan <skhan@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [selftests] d3fd949abd: kernel-selftests.memfd.fuse_mnt.fail
Date: Tue, 07 Apr 2020 14:27:22 -0600
Message-ID: <63d3b756-69eb-c9ee-a833-598733ca7609@linuxfoundation.org>
In-Reply-To: <20200404132613.GN8179@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0730689508056264228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/4/20 7:26 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: d3fd949abd3e3005dab7ccb185c3c8bc0ad639f1 ("selftests: Fix memfd t=
o support relocatable build (O=3Dobjdir)")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: kernel-selftests
> with following parameters:
> =

> 	group: kselftests-02
> 	ucode: 0xd6
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 1=
6G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> # selftests: memfd: memfd_test
> # memfd: CREATE
> # memfd: BASIC
> # memfd: SEAL-WRITE
> # memfd: SEAL-FUTURE-WRITE
> # memfd: CREATE
> # memfd: BASIC
> # memfd: SEAL-WRITE
> # memfd: SEAL-FUTURE-WRITE
> # memfd: SEAL-SHRINK
> # memfd: SEAL-GROW
> # memfd: SEAL-RESIZE
> # memfd: SHARE-DUP
> # memfd: SHARE-MMAP
> # memfd: SHARE-OPEN
> # memfd: SHARE-FORK
> # memfd: SHARE-DUP (shared file-table)
> # memfd: SHARE-MMAP (shared file-table)
> # memfd: SHARE-OPEN (shared file-table)
> # memfd: SHARE-FORK (shared file-table)
> # memfd: DONE
> ok 1 selftests: memfd: memfd_test


> # selftests: memfd: fuse_test
> # Aborted
> not ok 2 selftests: memfd: fuse_test # exit=3D134
> # selftests: memfd: fuse_mnt
> # fuse: missing mountpoint parameter
> not ok 3 selftests: memfd: fuse_mnt # exit=3D1

Thanks for the reporting the problem. I will get a fix in soon.
It isn't indication of a problem. This commit caused regression
resulting in running tests without creating mnt point first.

The above failure are a result of that.

> # selftests: memfd: run_fuse_test.sh
> # opening: ./mnt/memfd
> # fuse: DONE
> ok 4 selftests: memfd: run_fuse_test.sh
> =


thanks,
-- Shuah
--===============0730689508056264228==--

