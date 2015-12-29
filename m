Content-Type: multipart/mixed; boundary="===============1023484002033049468=="
MIME-Version: 1.0
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: lkp@lists.01.org
Subject: Re: [ses] 3417c1b5cb: WARNING: CPU: 2 PID: 2013 at fs/xfs/xfs_file.c:772 xfs_file_dio_aio_write+0x2a2/0x320()
Date: Mon, 28 Dec 2015 18:11:42 -0800
Message-ID: <1451355102.2331.11.camel@HansenPartnership.com>
In-Reply-To: <87bn9b0zjh.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1023484002033049468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-12-28 at 16:04 +0800, Huang, Ying wrote:
> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
> =

> > [cc to linux-scsi added]
> > On Mon, 2015-12-28 at 09:43 +0800, kernel test robot wrote:
> > > FYI, we noticed the below changes on
> > > =

> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi
> > > t ma
> > > ster
> > > commit 3417c1b5cb1fdc10261dbed42b05cc93166a78fd ("ses: Fix
> > > problems
> > > with simple enclosures")
> > > =

> > > This may be the intended behavior, we found after your commit,
> > > the
> > > following new message appears in kernel log:
> > > =

> > > [   40.804515] scsi 8:0:12:0: Wrong diagnostic page; asked for 7
> > > got
> > > 0
> > > =

> > > To reproduce:
> > > =

> > >         git clone
> > > git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> > >         cd lkp-tests
> > >         bin/lkp install job.yaml  # job file is attached in this
> > > email
> > >         bin/lkp run     job.yaml
> > =

> > OK, so what is the enclosure device at host 8?  And what happens
> > when
> > you use sg_ses to ask for page 7?
> =

> We run xfstests on the test machine.  You can check the dmesg
> (kmsg.xz)
> attached in the original reporting email for information about scsi
> host
> 8.

It's not a test failure, it's a problem with your hardware, which looks
to be a Promise SAS expander with enclosure services. =


can you run sg_ses <dev> on it followed by sg_ses --page=3D7 --hex <dev>?
 To get the sg device run sg_map -i and it should tell you what the
mappings are.

Thanks,

James
 =



--===============1023484002033049468==--

