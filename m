Content-Type: multipart/mixed; boundary="===============5411445770015646830=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] cc87317726f: WARNING: CPU: 0 PID: 1 at drivers/iommu/io-pgtable-arm.c:413 __arm_lpae_unmap+0x341/0x380()
Date: Wed, 18 Mar 2015 09:53:54 +0800
Message-ID: <1426643634.5570.14.camel@intel.com>
In-Reply-To: <20150317192413.GA7772@phnom.home.cmpxchg.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5411445770015646830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-03-17 at 15:24 -0400, Johannes Weiner wrote:
> On Tue, Mar 17, 2015 at 10:15:29AM -0700, Linus Torvalds wrote:
> > Explicitly adding the emails of other people involved with that commit
> > and the original oom thread to make sure people are aware, since this
> > didn't get any response.
> > =

> > Commit cc87317726f8 fixed some behavior, but also seems to have turned
> > an oom situation into a complete hang. So presumably we shouldn't loop
> > *forever*. Hmm?
> =

> It seems we are between a rock and a hard place here, as we reverted
> specifically to that endless looping on request of filesystem people.
> They said[1] they rely on these allocations never returning NULL, or
> they might fail inside a transactions and corrupt on-disk data.
> =

> Huang, against which kernels did you first run this test on this exact
> setup?  Is there a chance you could try to run a kernel without/before
> 9879de7373fc?  I want to make sure I'm not missing something, but all
> versions preceding this commit should also have the same hang.  There
> should only be a tiny window between 9879de7373fc and cc87317726f8 --
> v3.19 -- where these allocations are allowed to fail.

I checked the test result of v3.19-rc6.  It shows that boot will hang at
the same position.

BTW: the test is run on 32 bit system.

Best Regards,
Huang, Ying



--===============5411445770015646830==--

