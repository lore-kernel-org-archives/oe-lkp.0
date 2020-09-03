Content-Type: multipart/mixed; boundary="===============3489253298633751337=="
MIME-Version: 1.0
From: Sang, Oliver <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] c0aaf9b7a1: ltp: stuck at diotest4
Date: Thu, 03 Sep 2020 13:29:57 +0000
Message-ID: <06668b52b9ac4d4e81f945e06223d9b7@intel.com>
In-Reply-To: <20200903091123.GO28318@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3489253298633751337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: David Sterba <dsterba@suse.cz>
> Sent: Thursday, September 3, 2020 5:11 PM
> To: Sang, Oliver <oliver.sang@intel.com>
> Cc: Goldwyn Rodrigues <rgoldwyn@suse.com>; David Sterba
> <dsterba@suse.com>; LKML <linux-kernel@vger.kernel.org>; lkp(a)lists.=
01.org;
> lkp <lkp@intel.com>; ltp(a)lists.linux.it; linux-btrfs(a)vger.kernel.org
> Subject: Re: [btrfs] c0aaf9b7a1: ltp: stuck at diotest4
> =

> On Thu, Sep 03, 2020 at 02:28:37PM +0800, kernel test robot wrote:
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: c0aaf9b7a114f6b75e0da97be7d99c102347a751 ("btrfs: switch to
> > iomap_dio_rw() for dio")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
> > master
> =

> That's probably the O_DIRECT + O_(D)SYNC deadlock that was found recently.
> One of the cases in diotest4 does
> =

> 	open(filename, O_DIRECT | O_RDWR | O_SYNC)
> =

> Fix is work in progress, thanks for the report.

Thanks a lot for information!
--===============3489253298633751337==--

