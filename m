Content-Type: multipart/mixed; boundary="===============2778787528274625526=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] cc87317726f: WARNING: CPU: 0 PID: 1 atdrivers/iommu/io-pgtable-arm.c:413 __arm_lpae_unmap+0x341/0x380()
Date: Thu, 19 Mar 2015 09:57:02 +0800
Message-ID: <1426730222.5570.41.camel@intel.com>
In-Reply-To: <201503182045.DEC48482.OtSOQOLVFFHFJM@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============2778787528274625526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-03-18 at 20:45 +0900, Tetsuo Handa wrote:
> Huang Ying wrote:
> > On Tue, 2015-03-17 at 15:24 -0400, Johannes Weiner wrote:
> > > On Tue, Mar 17, 2015 at 10:15:29AM -0700, Linus Torvalds wrote:
> > > > Explicitly adding the emails of other people involved with that com=
mit
> > > > and the original oom thread to make sure people are aware, since th=
is
> > > > didn't get any response.
> > > > =

> > > > Commit cc87317726f8 fixed some behavior, but also seems to have tur=
ned
> > > > an oom situation into a complete hang. So presumably we shouldn't l=
oop
> > > > *forever*. Hmm?
> > > =

> > > It seems we are between a rock and a hard place here, as we reverted
> > > specifically to that endless looping on request of filesystem people.
> > > They said[1] they rely on these allocations never returning NULL, or
> > > they might fail inside a transactions and corrupt on-disk data.
> > > =

> > > Huang, against which kernels did you first run this test on this exact
> > > setup?  Is there a chance you could try to run a kernel without/before
> > > 9879de7373fc?  I want to make sure I'm not missing something, but all
> > > versions preceding this commit should also have the same hang.  There
> > > should only be a tiny window between 9879de7373fc and cc87317726f8 --
> > > v3.19 -- where these allocations are allowed to fail.
> > =

> > I checked the test result of v3.19-rc6.  It shows that boot will hang at
> > the same position.
> =

> OK. That's the expected result. We are discussing about how to safely
> allow small allocations to fail, including how to handle stalls caused by
> allocations without __GFP_FS.
> =

> > =

> > BTW: the test is run on 32 bit system.
> =

> That sounds like the cause of your problem. The system might be out of
> address space available for the kernel (only 1GB if x86_32). You should
> try running tests on 64 bit systems.

We run test on 32 bit and 64 bit systems.  Try to catch problems on both
platforms.  I think we still need to support 32 bit systems?

Best Regards,
Huang, Ying



--===============2778787528274625526==--

