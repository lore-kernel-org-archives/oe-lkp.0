Content-Type: multipart/mixed; boundary="===============8593860860953279766=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [generic_file_read_iter()] 5ecda13711: BUG:KASAN:stack-out-of-bounds
Date: Mon, 08 May 2017 06:29:04 +0100
Message-ID: <20170508052903.GS29622@ZenIV.linux.org.uk>
In-Reply-To: <20170508012238.GG28430@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8593860860953279766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2017 at 09:22:38AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 5ecda13711b3bd4a750b5740897bf13d1720de7c ("generic_file_read_iter=
(): make use of iov_iter_revert()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: ocfs2test
> with following parameters:
> =

> 	disk: 1HDD
> 	test: test-backup_super
> =

> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Very interesting...  It looks like that has nothing to do with ocfs2 -
it seems to be O_DIRECT read on block device and I wonder how come that
nothing in LTP/xfstests has stepped into that...

<stares>

Bloody hell...  OK, this is absolutely insane; there's an obvious braino
in that sucker - it should be
	iov_iter_revert(iter, count - iov_iter_count(iter));
not
	iov_iter_revert(iter, iov_iter_count(iter) - count);
We want "how much has ->direct_IO() overconsumed", i.e. "how much should've
been left judging by the retval - how much is actually left".  How the
hell did avoid being caught by the very first O_DIRECT read that had lead
to overconsumption?

I'm half-asleep right now; the first thing tomorrow morning will be to
sort the thing out and find how the hell has it avoided being caught.

Looking at other callers, this seems to be the only victim of such
idiocy.  Ugh...

Among other things, I'm going to add WARN_ON(unroll > MAX_RW_COUNT); in
iov_iter_revert() - should've done that from the very beginning.

--===============8593860860953279766==--

