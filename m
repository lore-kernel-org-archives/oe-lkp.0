Content-Type: multipart/mixed; boundary="===============5216500711777994549=="
MIME-Version: 1.0
From: Amir Goldstein <amir73il@gmail.com>
To: lkp@lists.01.org
Subject: Re: [vfs] 0b398f980a: ltp.copy_file_range01.fail
Date: Wed, 15 Jun 2022 13:20:44 +0300
Message-ID: <CAOQ4uxgHPgFTWBOF34=UDtaCOk0EA6f=66szS-Ox62YNPx1b=A@mail.gmail.com>
In-Reply-To: <20220615081212.GF36441@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5216500711777994549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 11:12 AM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 0b398f980a75ee5e5d7317a9d0e5860e4c79e9b8 ("vfs: fix copy_file_ran=
ge() regression in cross-fs copies")
> https://github.com/amir73il/linux copy-file-range-fixes
>
> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20220614
> with following parameters:
>
>         disk: 1HDD
>         fs: ext4
>         test: syscalls-03
>         ucode: 0xec
>
> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
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
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> <<<test_start>>>
> tag=3Dcopy_file_range01 stime=3D1655248189
> cmdline=3D"copy_file_range01"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> tst_test.c:1526: TINFO: Timeout per run is 0h 02m 30s
> tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
> tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
> tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
> tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
> tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
> tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
> tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
> tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
> tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
> tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
> tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
> tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
> tst_test.c:1599: TINFO: Testing on ext2
> tst_test.c:1064: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra o=
pts=3D''
> mke2fs 1.46.2 (28-Feb-2021)
> copy_file_range.h:36: TINFO: Testing libc copy_file_range()
> copy_file_range01.c:133: TFAIL: copy_file_range() failed: EOPNOTSUPP (95)
> copy_file_range01.c:133: TFAIL: copy_file_range() failed: EOPNOTSUPP (95)
>
> ...
>
> copy_file_range01.c:133: TFAIL: copy_file_range() failed: EOPNOTSUPP (95)
> copy_file_range01.c:133: TFAIL: copy_file_range() failed: EOPNOTSUPP (95)
> copy_file_range01.c:210: TFAIL: non cross-device copy_file_range failed 1=
44 of 144 copy jobs.


First of all, good catch! and thanks for testing my github branches :)
I should not have changed the behavior for non cross-device copy.

Second, the history of cross-device copy is hazy - old kernels do not suppo=
rt
it then v5.3 does support it and now we want to un-support it again,
so it's nice
to see that the work that Petr did on this test to work correctly by first
testing verify_cross_fs_copy_support() works as expected and the test passes
with my fixed patch.

Will post v15 soon...

Thanks,
Amir.
--===============5216500711777994549==--

