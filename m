Content-Type: multipart/mixed; boundary="===============7041201257763617806=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Tue, 25 May 2021 11:22:05 +0200
Message-ID: <20210525092205.GA4112@quack2.suse.cz>
In-Reply-To: <YKfi6Pv+qwduKxuT@mit.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============7041201257763617806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 21-05-21 12:42:16, Theodore Y. Ts'o wrote:
> On Fri, May 21, 2021 at 11:27:30AM +0200, Jan Kara wrote:
> > =

> > OK, thanks for testing. So the orphan code is indeed the likely cause of
> > this regression but I probably did not guess correctly what is the
> > contention point there. Then I guess I need to reproduce and do more
> > digging why the contention happens...
> =

> Hmm... what if we only recalculate the superblock checksum when we do
> a commit, via the callback function from the jbd2 layer to file
> system?

I actually have to check whether the regression is there because of the
additional locking of the buffer_head (because that's the only thing that
was added to that code in fact, adding some atomic instructions, bouncing
another cacheline) or because of the checksum computation that moved from
ext4_handle_dirty_super() closer to actual superblock update under those
locks.

If the problem is indeed just the checksum computation under all those
locks, we can move that to transaction commit time (using the t_frozen
trigger - ocfs2 uses that for all metadata checksumming). But then we have
to be very careful with unjournaled sb updates that can be running in
parallel with the journaled ones because once you drop buffer lock, sb can
get clobbered and checksum invalidated. Also there's the question what to
do with nojournal mode - probably we would have to keep separate set of
places recomputing checksums just for nojournal mode which is quite error
prone but if it's just for sb, I guess it's manageable.

								Honza

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============7041201257763617806==--

