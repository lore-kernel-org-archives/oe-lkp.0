Content-Type: multipart/mixed; boundary="===============8955809380922953237=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm] cc87317726f: WARNING: CPU: 0 PID:1atdrivers/iommu/io-pgtable-arm.c:413 __arm_lpae_unmap+0x341/0x380()
Date: Fri, 20 Mar 2015 15:34:10 +0100
Message-ID: <20150320143410.GD4821@dhcp22.suse.cz>
In-Reply-To: <201503202302.EDF82384.OtFVHMFOLSJOFQ@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============8955809380922953237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 20-03-15 23:02:09, Tetsuo Handa wrote:
> Michal Hocko wrote:
> > On Fri 20-03-15 22:34:21, Tetsuo Handa wrote:
> > > Huang Ying wrote:
> > > > > > BTW: the test is run on 32 bit system.
> > > > > =

> > > > > That sounds like the cause of your problem. The system might be o=
ut of
> > > > > address space available for the kernel (only 1GB if x86_32). You =
should
> > > > > try running tests on 64 bit systems.
> > > > =

> > > > We run test on 32 bit and 64 bit systems.  Try to catch problems on=
 both
> > > > platforms.  I think we still need to support 32 bit systems?
> > > =

> > > Yes, testing on both platforms is good. But please read
> > > http://lwn.net/Articles/627419/ , http://lwn.net/Articles/635354/ and
> > > http://lwn.net/Articles/636017/ . Then please add __GFP_NORETRY to me=
mory
> > > allocations in btrfs code if it is appropriate.
> > =

> > I guess you meant __GFP_NOFAIL?
> > =

> No. btrfs's selftest (which is not using __GFP_NOFAIL) is already looping
> forever. If we want to avoid btrfs's selftest from looping forever, btrfs
> needs __GFP_NORETRY than __GFP_NOFAIL (until we establish a way to safely
> allow small allocations to fail).

Sigh. If the code is using GFP_NOFS allocation (which seem to be the
case because it worked with the 9879de7373fc) and the proper fix for
this IMO is to simply not retry endlessly for these allocations.  We
have to sort some other issues before we can make NOFS allocations fail
but let's not pile more workarounds on top in the meantime. But if btrfs
people really think __GFP_NORETRY then I do not really care much.
-- =

Michal Hocko
SUSE Labs

--===============8955809380922953237==--

