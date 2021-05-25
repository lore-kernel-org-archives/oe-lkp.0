Content-Type: multipart/mixed; boundary="===============2460229414077660564=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Tue, 25 May 2021 13:15:10 -0400
Message-ID: <YK0wnsZGP8iYKRje@mit.edu>
In-Reply-To: <20210525092205.GA4112@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2460229414077660564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 11:22:05AM +0200, Jan Kara wrote:
> I actually have to check whether the regression is there because of the
> additional locking of the buffer_head (because that's the only thing that
> was added to that code in fact, adding some atomic instructions, bouncing
> another cacheline) or because of the checksum computation that moved from
> ext4_handle_dirty_super() closer to actual superblock update under those
> locks.

Hmm, yes.  So the other thing we could try doing might be to drop
s_orphan_lock mutex altogether and instead use the buffer_head lock to
protect the orphan list.  In actual practice the orphan list
modifications are the vast majority of the times when we need to
modify the superblock, so we could just take the buffer_head lock a
bit earlier (when we take the s_orphan_lock) and release it a bit
later and thus avoid the cacheline bounce.

What do you think?

> If the problem is indeed just the checksum computation under all those
> locks, we can move that to transaction commit time (using the t_frozen
> trigger - ocfs2 uses that for all metadata checksumming). But then we have
> to be very careful with unjournaled sb updates that can be running in
> parallel with the journaled ones because once you drop buffer lock, sb can
> get clobbered and checksum invalidated. Also there's the question what to
> do with nojournal mode - probably we would have to keep separate set of
> places recomputing checksums just for nojournal mode which is quite error
> prone but if it's just for sb, I guess it's manageable.

We lived without the orphan list in ext2 for a long time, and without
the journal, whether the orphan linked list in inode->d_time would be
anything approaching consistent is a major question in any case.  One
approach then might be to drop the orphan list in nojournal mode
altogether....

						- Ted
--===============2460229414077660564==--

