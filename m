Content-Type: multipart/mixed; boundary="===============1796275490976479071=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] cc87317726f: WARNING: CPU: 0 PID: 1 at drivers/iommu/io-pgtable-arm.c:413 __arm_lpae_unmap+0x341/0x380()
Date: Tue, 17 Mar 2015 15:24:13 -0400
Message-ID: <20150317192413.GA7772@phnom.home.cmpxchg.org>
In-Reply-To: <CA+55aFxWTg_kCxGChLJGU=DFg0K_q842bkziktXu6B2fX=mXYQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1796275490976479071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 10:15:29AM -0700, Linus Torvalds wrote:
> Explicitly adding the emails of other people involved with that commit
> and the original oom thread to make sure people are aware, since this
> didn't get any response.
> =

> Commit cc87317726f8 fixed some behavior, but also seems to have turned
> an oom situation into a complete hang. So presumably we shouldn't loop
> *forever*. Hmm?

It seems we are between a rock and a hard place here, as we reverted
specifically to that endless looping on request of filesystem people.
They said[1] they rely on these allocations never returning NULL, or
they might fail inside a transactions and corrupt on-disk data.

Huang, against which kernels did you first run this test on this exact
setup?  Is there a chance you could try to run a kernel without/before
9879de7373fc?  I want to make sure I'm not missing something, but all
versions preceding this commit should also have the same hang.  There
should only be a tiny window between 9879de7373fc and cc87317726f8 --
v3.19 -- where these allocations are allowed to fail.

[1] https://www.marc.info/?l=3Dlinux-mm&m=3D142450545009301&w=3D3

--===============1796275490976479071==--

