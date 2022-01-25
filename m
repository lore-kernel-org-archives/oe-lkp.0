Content-Type: multipart/mixed; boundary="===============4457677262321839421=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [mm/page] ab19939a6a: ltp.msync04.fail
Date: Tue, 25 Jan 2022 13:17:46 +0100
Message-ID: <20220125121746.wrs4254pfs2mwexb@quack3.lan>
In-Reply-To: <87o840xiel.fsf@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4457677262321839421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 25-01-22 09:27:30, Richard Palethorpe wrote:
> Hello,
> =

> Jan Kara <jack@suse.cz> writes:
> =

> > On Mon 13-09-21 10:11:22, Cyril Hrubis wrote:
> >> Hi!
> >> > FYI, we noticed the following commit (built with gcc-9):
> >> > =

> >> > commit: ab19939a6a5010cba4e9cb04dd8bee03c72edcbd ("mm/page-writeback=
: Fix performance when BDI's share of ratio is 0.")
> >> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mast=
er
> >> > =

> >> > =

> >> > in testcase: ltp
> >> > version: ltp-x86_64-14c1f76-1_20210907
> >> > with following parameters:
> >> > =

> >> > 	disk: 1HDD
> >> > 	fs: xfs
> >> > 	test: syscalls-03
> >> > 	ucode: 0xe2
> >> > =

> >> > test-description: The LTP testsuite contains a collection of tools f=
or testing the Linux kernel and related features.
> >> > test-url: http://linux-test-project.github.io/
> >> =

> >> The msync04 test formats a device with a diffrent filesystems, for each
> >> filesystem it maps a file, writes to the mapped page and the checks a
> >> dirty bit in /proc/kpageflags before and after msync() on that page.
> >> =

> >> This seems to be broken after this patch for ntfs over FUSE and it loo=
ks
> >> like the page does not have a dirty bit set right after it has been
> >> written to.
> >> =

> >> Also I guess that we should increase the number of the pages we dirty =
or
> >> attempt to retry since a single page may be flushed to the storage if =
we
> >> are unlucky and the process is preempted between the write and the
> >> initial check for the dirty bit.
> >
> > Yes, I agree. The most likely explanation I see for this is that the
> > identified commit results in waking flush worker earlier so it may now
> > succeed in cleaning the page before get_dirty_bit() in the LTP testcase
> > manages to see it. This is a principial race in this testcase, you can
> > perhaps make it less likely but not completely fix it AFAICT.
> =

> If the dirty bit is not set, then I guess dropping the pagecache will
> not write anything to the underlying storage?

Correct.

> So when we see no dirty bit is set, we can drop the pagecache then read
> the file to check the value was written correctly? If so then we can
> exit with TCONF saying msync couldn't be tested because the storage was
> written to too quickly.

Yes, that would work.

> Also I guess we can optimize the get_dirty_bit function. It's doing 3
> syscalls instead of 1 AFAICT.

And this could reduce the race window. So nice I guess.

But IMHO what would be a more sensible test is that msync is indeed persist=
ing
the data. So something like: mmap file, write to mmap, msync, abort fs,
mount fs again, check the data is there. We do have framework for stuff
like this in fstests (but we don't test msync AFAIK, only fsync), not sure
if LTP has something for this as well.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============4457677262321839421==--

