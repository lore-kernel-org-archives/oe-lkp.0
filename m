Content-Type: multipart/mixed; boundary="===============9223223517058242426=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 834ffca6f7e: WARNING: CPU: 3 PID: 23390 at fs/xfs/xfs_file.c:700 xfs_file_dio_aio_write+0x27c/0x2e0()
Date: Fri, 27 Mar 2015 22:11:45 +1100
Message-ID: <20150327111145.GH28129@dastard>
In-Reply-To: <1427416343.17170.58.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9223223517058242426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2015 at 08:32:23AM +0800, Huang Ying wrote:
> On Fri, 2015-03-27 at 08:22 +1100, Dave Chinner wrote:
> > On Thu, Mar 26, 2015 at 02:45:19PM +0800, Huang Ying wrote:
> > > FYI, we noticed the below changes on
> > > =

> > > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > > commit 834ffca6f7e345a79f6f2e2d131b0dfba8a4b67a ("xfs: don't zero par=
tial page cache pages during O_DIRECT writes")
> > =

> > Doing what test, exactly?
> =

> Sorry, should include that information.  We were running xfstests.
> =

> generic/068 generic/100 generic/117 generic/120 generic/125 generic/130
> generic/192 generic/209 generic/223 generic/225 generic/226 generic/230
> generic/247 generic/256 generic/275
  ^^^^^^^^^^^

$ ./lsqa.pl tests/generic/247
FS QA Test No. 247

Test for race between direct I/O and mmap

$

i.e. xfstests runs tests designed specifically to hit direct IO vs
mmap races like this, so warnings about DIO/mmap races like this are
to be expected....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============9223223517058242426==--

