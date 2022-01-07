Content-Type: multipart/mixed; boundary="===============2925550614812725517=="
MIME-Version: 1.0
From: Eric Biggers <ebiggers@kernel.org>
To: lkp@lists.01.org
Subject: Re: [LTP] [f2fs] a1e09b03e6: ltp.ADSP024.fail
Date: Fri, 07 Jan 2022 14:49:02 -0800
Message-ID: <YdjDXiXYjQMJnr/c@sol.localdomain>
In-Reply-To: <20211226132851.GC34518@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2925550614812725517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 26, 2021 at 09:28:52PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: a1e09b03e6f5c1d713c88259909137c0fd264ede ("f2fs: use iomap for di=
rect I/O")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20211221
> with following parameters:
> =

> 	disk: 1HDD
> 	fs: f2fs
> 	test: ltp-aiodio.part2
> 	ucode: 0x21
> =


This is caused by an f2fs bug where it exposes DIO-allocated blocks to users
before they have been initialized.  This test actually fails both before and
after my commit "f2fs: use iomap for direct I/O".  It is nondeterministic, =
which
is why it may have appeared to be a regression.

I'll start a separate discussion on linux-f2fs-devel about this, since this
thread has too many irrelevant mailing lists and this has been discussed be=
fore.

- Eric
--===============2925550614812725517==--

