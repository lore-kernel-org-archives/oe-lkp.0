Content-Type: multipart/mixed; boundary="===============6870466973221810182=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [mm/readahead] a0b99df1aa: xfstests.xfs.421.fail
Date: Tue, 22 Feb 2022 07:55:29 +1100
Message-ID: <20220221205529.GH59715@dread.disaster.area>
In-Reply-To: <YhOaJ4cZU/1MiNI2@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6870466973221810182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 01:56:55PM +0000, Matthew Wilcox wrote:
> On Mon, Feb 21, 2022 at 04:02:18PM +0800, kernel test robot wrote:
> > commit: a0b99df1aa37d714eb80be5fb54efd56c88a3336 ("mm/readahead: Add la=
rge folio readahead")
> =

> > xfs/420	- output mismatch (see /lkp/benchmarks/xfstests/results//xfs/42=
0.out.bad)
> >     --- tests/xfs/420.out	2022-02-17 11:55:00.000000000 +0000
> >     +++ /lkp/benchmarks/xfstests/results//xfs/420.out.bad	2022-02-20 20=
:34:22.430378506 +0000
> >     @@ -13,9 +13,7 @@
> >      Seek holes and data in file2
> >      Whence	Result
> >      DATA	0
> >     -HOLE	131072
> >     -DATA	196608
> >     -HOLE	262144
> >     +HOLE	524288
> =

> Confirm this test now fails.  I don't think it's actually a bug,
> though.  I think the test is now using larger pages to cache the
> file, and it fails to report that there's a hole in the file.
> Maybe there actually isn't a hole in the file any more; using
> larger pages to cache the file means we'll now write more data
> than we used to.
> =

> Adding XFS people for their thoughts.
> =

> Complete output:
> =

> $ diff -u ../ktest/tests/xfstests/tests/xfs/420.out ktest-out/xfstests/xf=
s/420.out.bad
> --- ../ktest/tests/xfstests/tests/xfs/420.out	2021-07-05 15:49:45.5398873=
05 -0400
> +++ ktest-out/xfstests/xfs/420.out.bad	2022-02-21 08:14:40.000000000 -0500
> @@ -13,9 +13,7 @@
>  Seek holes and data in file2
>  Whence	Result
>  DATA	0
> -HOLE	131072
> -DATA	196608
> -HOLE	262144
> +HOLE	524288
>  Compare files
>  c2803804acc9936eef8aab42c119bfac  SCRATCH_MNT/test-420/file1
>  017c08a9320aad844ce86aa9631afb98  SCRATCH_MNT/test-420/file2
> @@ -28,9 +26,7 @@
>  Seek holes and data in file2
>  Whence	Result
>  DATA	0
> -HOLE	131072
> -DATA	196608
> -HOLE	262144
> +HOLE	524288
>  Compare files
>  c2803804acc9936eef8aab42c119bfac  SCRATCH_MNT/test-420/file1
>  017c08a9320aad844ce86aa9631afb98  SCRATCH_MNT/test-420/file2
> =

> So the file checksums are right, which means I didn't break the COW
> functionality.  But we're no longer reporting a hole at 128k.

Can you post the contents of the 420.full output file so we can see
what the output of the various commands that are run are? e.g.
things like cowextsize that is configured, etc?

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============6870466973221810182==--

