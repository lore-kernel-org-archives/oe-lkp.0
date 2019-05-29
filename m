Content-Type: multipart/mixed; boundary="===============3548051749919566928=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] 079f9927c7: ltp.mmap16.fail
Date: Tue, 28 May 2019 23:56:13 -0400
Message-ID: <20190529035613.GA6210@mit.edu>
In-Reply-To: <20190529025256.GB22325@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3548051749919566928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2019 at 10:52:56AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 079f9927c7bfa026d963db1455197159ebe5b534 ("ext4: gracefully handl=
e ext4_break_layouts() failure during truncate")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

Jan --- this is the old version of your patch, which I had dropped
before sending a push request to Linus.  However, I forgot to reset
the dev branch so it still had the old patch on it, and so it got
picked up in linux-next.  Apologies for the confusion.

I've reset the dev branch on ext4.git, and the new version of your
patch will show up there shortly, as I start reviewing patches for the
next merge window.

Cheers,

					- Ted

> <<<test_start>>>
> tag=3Dmmap16 stime=3D1559078706
> cmdline=3D"mmap16"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> mke2fs 1.43.4 (31-Jan-2017)
> mmap16      0  TINFO  :  Using test device LTP_DEV=3D'/dev/loop0'
> mmap16      0  TINFO  :  Formatting /dev/loop0 with ext4 opts=3D'-b 1024'=
 extra opts=3D'10240'
> mmap16      1  TFAIL  :  mmap16.c:85: Bug is reproduced!
> <<<execution_status>>>
> initiation_status=3D"ok"
> duration=3D8 termination_type=3Dexited termination_id=3D1 corefile=3Dno
> cutime=3D11 cstime=3D345
> <<<test_end>>>

--===============3548051749919566928==--

