Content-Type: multipart/mixed; boundary="===============0387494353928264793=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm] cc87317726f: WARNING: CPU: 0 PID: 1atdrivers/iommu/io-pgtable-arm.c:413 __arm_lpae_unmap+0x341/0x380()
Date: Fri, 20 Mar 2015 14:38:20 +0100
Message-ID: <20150320133820.GB4821@dhcp22.suse.cz>
In-Reply-To: <201503202234.HIA00180.MQVLSFFtHOOFJO@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============0387494353928264793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 20-03-15 22:34:21, Tetsuo Handa wrote:
> Huang Ying wrote:
> > > > BTW: the test is run on 32 bit system.
> > > =

> > > That sounds like the cause of your problem. The system might be out of
> > > address space available for the kernel (only 1GB if x86_32). You shou=
ld
> > > try running tests on 64 bit systems.
> > =

> > We run test on 32 bit and 64 bit systems.  Try to catch problems on both
> > platforms.  I think we still need to support 32 bit systems?
> =

> Yes, testing on both platforms is good. But please read
> http://lwn.net/Articles/627419/ , http://lwn.net/Articles/635354/ and
> http://lwn.net/Articles/636017/ . Then please add __GFP_NORETRY to memory
> allocations in btrfs code if it is appropriate.

I guess you meant __GFP_NOFAIL?

-- =

Michal Hocko
SUSE Labs

--===============0387494353928264793==--

