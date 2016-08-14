Content-Type: multipart/mixed; boundary="===============8700055613153442471=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 09:46:58 +1000
Message-ID: <20160814234657.GV19025@dastard>
In-Reply-To: <20160814161724.GA20274@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8700055613153442471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2016 at 06:17:24PM +0200, Christoph Hellwig wrote:
> Snipping the long contest:
> =

> I think there are three observations here:
> =

>  (1) removing the mark_page_accessed (which is the only significant
>      change in the parent commit)  hurts the
>      aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44 test.
>      I'd still rather stick to the filemap version and let the
>      VM people sort it out.  How do the numbers for this test
>      look for XFS vs say ext4 and btrfs?
>  (2) lots of additional spinlock contention in the new case.  A quick
>      check shows that I fat-fingered my rewrite so that we do
>      the xfs_inode_set_eofblocks_tag call now for the pure lookup
>      case, and pretty much all new cycles come from that.
>  (3) Boy, are those xfs_inode_set_eofblocks_tag calls expensive, and
>      we're already doing way to many even without my little bug above.
> =

> So I've force pushed a new version of the iomap-fixes branch with
> (2) fixed, and also a little patch to xfs_inode_set_eofblocks_tag a
> lot less expensive slotted in before that.  Would be good to see
> the numbers with that.

With this new set of fixes, the 1byte write test runs ~30% faster on
my test machine (130k writes/s vs 100k writes/s), and the 1k write
on the pmem device runs about 10% faster (660MB/s vs 590MB/s).
dbench numbers on the pmem device also go through the roof (they
didn't show any regression to begin with) - 50% faster at 16 clients
on a 16AG filesystem (5700MB/s vs 3800MB/s).

The 10Mx4k file create fsmark workload I run (on the sparse 500TB
XFS filesystem backed by a pair of SSDs)  is giving the highest
throughput *and* the lowest std dev I've ever recorded
(55014.8+/-1.3e+04 files/s) and that shows in the runtime which also
drops from 3m57s to 3m22s.

So regardless of what aim7 results we get from these changes, I'll
be merging them pending review and further testing...

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============8700055613153442471==--

