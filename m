Content-Type: multipart/mixed; boundary="===============3998338456281785792=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] c0aaf9b7a1: ltp: stuck at diotest4
Date: Thu, 03 Sep 2020 11:11:23 +0200
Message-ID: <20200903091123.GO28318@suse.cz>
In-Reply-To: <20200903062837.GA3654@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3998338456281785792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 02:28:37PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: c0aaf9b7a114f6b75e0da97be7d99c102347a751 ("btrfs: switch to iomap=
_dio_rw() for dio")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

That's probably the O_DIRECT + O_(D)SYNC deadlock that was found
recently. One of the cases in diotest4 does

	open(filename, O_DIRECT | O_RDWR | O_SYNC)

Fix is work in progress, thanks for the report.
--===============3998338456281785792==--

