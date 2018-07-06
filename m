Content-Type: multipart/mixed; boundary="===============6065865984299203812=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [shmem] a067b3644b: vm-scalability.throughput -73.2% regression
Date: Thu, 05 Jul 2018 19:59:05 -0700
Message-ID: <20180706025905.GA29008@bombadil.infradead.org>
In-Reply-To: <20180704062532.GC10005@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6065865984299203812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2018 at 02:25:32PM +0800, Ye Xiaolong wrote:
> Hi, Matthew
> =

> The issue should be fixed now, could you have a try?

This is weird.

The reason the throughput goes down by 75% is that the test runs four
copies of usemem before the patch, but only runs one copy after applying
the patch.  I can't figure out why.

Snippets from the logs.  Before:

[  296.668278] 2018-07-06 02:47:42  ./case-shm-pread-seq
[  296.719718] 2018-07-06 02:47:42  truncate /tmp/vm-scalability-tmp/sparse=
-shm-pread-seq -s 3109629952
[  296.732949] 2018-07-06 02:47:42  ./usemem --runtime 300 -n 4 -f /tmp/vm-=
scalability-tmp/sparse-shm-pread-seq --readonly 1554814976
[  303.181283] 1749166848 bytes / 6413550 usecs =3D 266337 KB/s
[  303.189929] 1749166848 bytes / 6408060 usecs =3D 266565 KB/s
[  303.198156] 1749166848 bytes / 6411154 usecs =3D 266437 KB/s
[  303.214077] 1749166848 bytes / 6407897 usecs =3D 266572 KB/s
[  303.219016] 54573 usecs to free memory
[  303.298229] 134967 usecs to free memory
[  303.300565] 133675 usecs to free memory
[  303.303657] 126904 usecs to free memory

After:

[  301.803901] 2018-07-06 02:56:16  ./case-shm-pread-seq
[  301.824971] 2018-07-06 02:56:16  truncate /tmp/vm-scalability-tmp/sparse=
-shm-pread-seq -s 3367575552
[  301.831988] 2018-07-06 02:56:16  ./usemem --runtime 300 -n 4 -f /tmp/vm-=
scalability-tmp/sparse-shm-pread-seq --readonly 1683787776
[  305.081653] 1894261248 bytes / 3249525 usecs =3D 569272 KB/s
[  305.111355] 29653 usecs to free memory

I've tried both the patches from 06-20 and the patches from today,
which are rather different from each other as I tried to fix what I
thought the problem was, and the same thing happens each time.

I'm going to have to dive into the test-suite and try to diagnose what's
going wrong.  Unless someone wants to do that for me ... ?  ;-)


--===============6065865984299203812==--

