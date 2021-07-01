Content-Type: multipart/mixed; boundary="===============9221691395833005512=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [fs] 87f196bed3: xfstests.generic.157.fail
Date: Thu, 01 Jul 2021 11:48:13 +0200
Message-ID: <20210701094813.GV2610@twin.jikos.cz>
In-Reply-To: <20210701021928.GB21279@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============9221691395833005512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 01, 2021 at 10:19:28AM +0800, kernel test robot wrote:
> generic/156	[not run] xfs_io funshare  failed (old kernel/wrong fs?)
> generic/157	- output mismatch (see /lkp/benchmarks/xfstests/results//gene=
ric/157.out.bad)
>     --- tests/generic/157.out	2021-06-28 16:41:45.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//generic/157.out.bad	2021-12-01 =
20:44:35.949001218 +0000
>     @@ -14,7 +14,7 @@
>      Try to reflink a device
>      XFS_IOC_CLONE_RANGE: Invalid argument
>      Try to reflink to a dir
>     -TEST_DIR/test-157/dir1: Is a directory
>     +XFS_IOC_CLONE_RANGE: Is a directory

The sense of the error hasn't changed but the output is different so
it needs some filter again.

>      Try to reflink to a device
>      XFS_IOC_CLONE_RANGE: Invalid argument
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/157.out /lkp/ben=
chmarks/xfstests/results//generic/157.out.bad'  to see the entire diff)
> generic/158	- output mismatch (see /lkp/benchmarks/xfstests/results//gene=
ric/158.out.bad)
>     --- tests/generic/158.out	2021-06-28 16:41:45.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//generic/158.out.bad	2021-12-01 =
20:44:37.783001265 +0000
>     @@ -18,7 +18,7 @@
>      Try to dedupe a device
>      XFS_IOC_FILE_EXTENT_SAME: Invalid argument
>      Try to dedupe to a dir
>     -TEST_DIR/test-158/dir1: Is a directory
>     +XFS_IOC_FILE_EXTENT_SAME: Is a directory

Same.

>      Try to dedupe to a device
>      XFS_IOC_FILE_EXTENT_SAME: Invalid argument
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/158.out /lkp/ben=
chmarks/xfstests/results//generic/158.out.bad'  to see the entire diff)
--===============9221691395833005512==--

