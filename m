Content-Type: multipart/mixed; boundary="===============5286866627445482707=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [mm/page] ab19939a6a: ltp.msync04.fail
Date: Mon, 13 Sep 2021 10:11:22 +0200
Message-ID: <YT8HqsXsHFeMdDxS@yuki>
In-Reply-To: <20210912123429.GA25450@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5286866627445482707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: ab19939a6a5010cba4e9cb04dd8bee03c72edcbd ("mm/page-writeback: Fix=
 performance when BDI's share of ratio is 0.")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20210907
> with following parameters:
> =

> 	disk: 1HDD
> 	fs: xfs
> 	test: syscalls-03
> 	ucode: 0xe2
> =

> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/

The msync04 test formats a device with a diffrent filesystems, for each
filesystem it maps a file, writes to the mapped page and the checks a
dirty bit in /proc/kpageflags before and after msync() on that page.

This seems to be broken after this patch for ntfs over FUSE and it looks
like the page does not have a dirty bit set right after it has been
written to.

Also I guess that we should increase the number of the pages we dirty or
attempt to retry since a single page may be flushed to the storage if we
are unlucky and the process is preempted between the write and the
initial check for the dirty bit.

-- =

Cyril Hrubis
chrubis(a)suse.cz
--===============5286866627445482707==--

