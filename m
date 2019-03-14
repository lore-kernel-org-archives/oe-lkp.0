Content-Type: multipart/mixed; boundary="===============3027321607131844590=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] fde872682e: fsmark.files_per_sec -38.0% regression
Date: Thu, 14 Mar 2019 09:52:52 +0800
Message-ID: <87h8c66x3f.fsf@yhuang-dev.intel.com>
In-Reply-To: <20190313153056.GB672@mit.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============3027321607131844590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Theodore Ts'o <tytso@mit.edu> writes:

 > On Wed, Mar 13, 2019 at 03:26:39PM +0800, huang ying wrote:
>> >
>> >
>> > commit: fde872682e175743e0c3ef939c89e3c6008a1529 ("ext4: force inode w=
rites when nfsd calls commit_metadata()")
>> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> =

>> It appears that this is a performance regression caused by a
>> functionality fixing.  So we should ignore this?
>
> Yes, this is a correctness issue that we discovered while tracking
> down user data loss issue after a crash of the NFS server, so this is
> a change we have to keep.  When the NFS folks added the
> commit_metadata() hook, they didn't realize that the fallback path in
> nfsd/vfs.c using sync_inode_metadata() doesn't work on all file
> systems --- and in particular doesn't work for ext3 and ext4 because
> of how we do journalling.
>
> It only applies to NFS serving, not local ext4 use cases, so most ext4
> users won't be impacted on it; only those who export those file
> systems using NFS.
>
> I do have some plans on how to claw back the performance hit.  The
> good news is that it won't require an on-disk format change; the bad
> news is that it's a non-trivial change to how journalling works, and
> it's not something we can backport to the stable kernel series.  It's
> something we're going to have to leave to a distribution who is
> willing to do a lot of careful regression testing, once the change is
> available, maybe in 3 months or so.
>
>      	 	      	  	      	  - Ted
>
> P.S.  I *believe* all other file systems should be OK, and I didn't
> want to impose a performance tax on all other file systems (such as
> btrfs), so I fixed it in an ext4-specific way.  The more
> general/conservative change would be to fall back to using fsync in
> nfs/vfs.c:commit_metadata() unless the file system specifically set a
> superblock flag indicating that using sync_inode_metadata is safe.
> OTOH we lived with this flaw in ext3/ext4 for *years* without anyone
> noticing or complaining, so....

Got it!  Thanks for your detailed explanation!

Best Regards,
Huang, Ying

--===============3027321607131844590==--

