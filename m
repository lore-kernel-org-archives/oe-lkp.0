Content-Type: multipart/mixed; boundary="===============1227713633657061086=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [spi] 2baed30cb3: BUG: scheduling while atomic: systemd-udevd/134/0x00000002
Date: Sat, 23 Jan 2016 12:09:47 +0530
Message-ID: <20160123063947.GA26921@sudip-pc>
In-Reply-To: <20160121060652.GA5697@sudip-pc>
List-Id: <oe-lkp.lists.linux.dev>

--===============1227713633657061086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Huang, Ying,
On Thu, Jan 21, 2016 at 11:36:52AM +0530, Sudip Mukherjee wrote:
> On Thu, Jan 21, 2016 at 01:47:10PM +0800, Huang, Ying wrote:
> > Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:
> > =

> > > On Wed, Jan 20, 2016 at 01:00:40PM +0800, Huang, Ying wrote:
> > >> Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:
> > >> =

> > >> > On Wed, Jan 20, 2016 at 08:44:37AM +0800, kernel test robot wrote:
> <snip>
> > >
> > > I am not able to reproduce this. Tested just with the kernel and
> > > yocto-minimal-i386.cgz filesystem and it booted properly.
> > >
> > > I guess I need atleast your job file to reproduce this.
> > =

> > This is a boot test so I did not attached the job file.  But the test
> > result may depends on specific root file system.  For example, the
> > process when BUG report is always systemd-udevd.  Maybe you need a
> > systemd based root file system.
> =

> So silly of me. Since you said 2baed30cb3, so i kept looking at that
> patch.
> Can you please test again after reverting:
> ebd43516d387 ("Staging: panel: usleep_range is preferred over udelay")
> =

> If it solves the problem then I will submit a formal patch.

Did you get a chance to test it?

regards
sudip

--===============1227713633657061086==--

