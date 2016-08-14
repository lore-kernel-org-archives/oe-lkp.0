Content-Type: multipart/mixed; boundary="===============3135581988180532917=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sun, 14 Aug 2016 18:17:24 +0200
Message-ID: <20160814161724.GA20274@lst.de>
In-Reply-To: <20160814145053.GA17428@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3135581988180532917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Snipping the long contest:

I think there are three observations here:

 (1) removing the mark_page_accessed (which is the only significant
     change in the parent commit)  hurts the
     aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44 test.
     I'd still rather stick to the filemap version and let the
     VM people sort it out.  How do the numbers for this test
     look for XFS vs say ext4 and btrfs?
 (2) lots of additional spinlock contention in the new case.  A quick
     check shows that I fat-fingered my rewrite so that we do
     the xfs_inode_set_eofblocks_tag call now for the pure lookup
     case, and pretty much all new cycles come from that.
 (3) Boy, are those xfs_inode_set_eofblocks_tag calls expensive, and
     we're already doing way to many even without my little bug above.

So I've force pushed a new version of the iomap-fixes branch with
(2) fixed, and also a little patch to xfs_inode_set_eofblocks_tag a
lot less expensive slotted in before that.  Would be good to see
the numbers with that.

--===============3135581988180532917==--

