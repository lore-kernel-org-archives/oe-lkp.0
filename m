Content-Type: multipart/mixed; boundary="===============8229055411594706056=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 11:32:23 +1000
Message-ID: <20160811013223.GU16044@dastard>
In-Reply-To: <20160811011612.GT16044@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============8229055411594706056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 11:16:12AM +1000, Dave Chinner wrote:
> I need to see these events:
> =

> 	xfs_file*
> 	xfs_iomap*
> 	xfs_get_block*
> =

> For both kernels. An example trace from 4.8-rc1 running the command
> `xfs_io -f -c 'pwrite 0 512k -b 128k' /mnt/scratch/fooey doing an
> overwrite and extend of the existing file ends up looking like:
> =

> $ sudo trace-cmd start -e xfs_iomap\* -e xfs_file\* -e xfs_get_blocks\*
> $ sudo cat /sys/kernel/tracing/trace_pipe
>            <...>-2946  [001] .... 253971.750304: xfs_file_ioctl: dev 253:=
32 ino 0x84
>           xfs_io-2946  [001] .... 253971.750938: xfs_file_buffered_write:=
 dev 253:32 ino 0x84 size 0x40000 offset 0x0 count 0x20000
>           xfs_io-2946  [001] .... 253971.750961: xfs_iomap_found: dev 253=
:32 ino 0x84 size 0x40000 offset 0x0 count 131072 type invalid startoff 0x0=
 startblock 24 blockcount 0x60
>           xfs_io-2946  [001] .... 253971.751114: xfs_file_buffered_write:=
 dev 253:32 ino 0x84 size 0x40000 offset 0x20000 count 0x20000
>           xfs_io-2946  [001] .... 253971.751128: xfs_iomap_found: dev 253=
:32 ino 0x84 size 0x40000 offset 0x20000 count 131072 type invalid startoff=
 0x0 startblock 24 blockcount 0x60
>           xfs_io-2946  [001] .... 253971.751234: xfs_file_buffered_write:=
 dev 253:32 ino 0x84 size 0x40000 offset 0x40000 count 0x20000
>           xfs_io-2946  [001] .... 253971.751236: xfs_iomap_found: dev 253=
:32 ino 0x84 size 0x40000 offset 0x40000 count 131072 type invalid startoff=
 0x0 startblock 24 blockcount 0x60
>           xfs_io-2946  [001] .... 253971.751381: xfs_file_buffered_write:=
 dev 253:32 ino 0x84 size 0x40000 offset 0x60000 count 0x20000
>           xfs_io-2946  [001] .... 253971.751415: xfs_iomap_prealloc_size:=
 dev 253:32 ino 0x84 prealloc blocks 128 shift 0 m_writeio_blocks 16
>           xfs_io-2946  [001] .... 253971.751425: xfs_iomap_alloc: dev 253=
:32 ino 0x84 size 0x40000 offset 0x60000 count 131072 type invalid startoff=
 0x60 startblock -1 blockcount 0x90
> =

> That's the output I need for the complete test - you'll need to use
> a better recording mechanism that this (e.g. trace-cmd record,
> trace-cmd report) because it will generate a lot of events. Compress
> the two report files (they'll be large) and send them to me offlist.

Can you also send me the output of xfs_info on the filesystem you
are testing?

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============8229055411594706056==--

