Content-Type: multipart/mixed; boundary="===============1630451785652138017=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 07:57:49 +0800
Message-ID: <20160814235749.GA28940@wfg-t540p.sh.intel.com>
In-Reply-To: <20160814161724.GA20274@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1630451785652138017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Sun, Aug 14, 2016 at 06:17:24PM +0200, Christoph Hellwig wrote:
>Snipping the long contest:
>
>I think there are three observations here:
>
> (1) removing the mark_page_accessed (which is the only significant
>     change in the parent commit)  hurts the
>     aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44 test.
>     I'd still rather stick to the filemap version and let the
>     VM people sort it out.  How do the numbers for this test
>     look for XFS vs say ext4 and btrfs?

We'll be able to compare between filesystems when the tests for Linus'
patch finish.

> (2) lots of additional spinlock contention in the new case.  A quick
>     check shows that I fat-fingered my rewrite so that we do
>     the xfs_inode_set_eofblocks_tag call now for the pure lookup
>     case, and pretty much all new cycles come from that.
> (3) Boy, are those xfs_inode_set_eofblocks_tag calls expensive, and
>     we're already doing way to many even without my little bug above.
>
>So I've force pushed a new version of the iomap-fixes branch with
>(2) fixed, and also a little patch to xfs_inode_set_eofblocks_tag a
>lot less expensive slotted in before that.  Would be good to see
>the numbers with that.

I just queued these jobs. The comment-out ones will be submitted as
the 2nd stage when the 1st-round quick tests finish.

queue=3D(
        queue
        -q vip
        --repeat-to 3
        fs=3Dxfs
        perf-profile.delay=3D1
        -b hch-vfs/iomap-fixes
        -k bf4dc6e4ecc2a3d042029319bc8cd4204c185610
        -k 74a242ad94d13436a1644c0b4586700e39871491
        -k 99091700659f4df965e138b38b4fa26a29b7eade
)

"${queue[@]}" -t ivb44 aim7-fs-1brd.yaml
"${queue[@]}" -t ivb44 fsmark-generic-1brd.yaml
"${queue[@]}" -t ivb43 fsmark-stress-journal-1brd.yaml
"${queue[@]}" -t lkp-hsx02 fsmark-generic-brd-raid.yaml
"${queue[@]}" -t lkp-hsw-ep4 fsmark-1ssd-nvme-small.yaml
#"${queue[@]}" -t ivb43 fsmark-stress-journal-1hdd.yaml
#"${queue[@]}" -t ivb44 dd-write-1hdd.yaml fsmark-generic-1hdd.yaml

Thanks,
Fengguang

--===============1630451785652138017==--

