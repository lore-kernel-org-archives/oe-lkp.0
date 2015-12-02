Content-Type: multipart/mixed; boundary="===============7966502029905172352=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Wed, 02 Dec 2015 15:15:29 +0100
Message-ID: <20151202141529.GG25284@dhcp22.suse.cz>
In-Reply-To: <20151202140845.GA19677@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7966502029905172352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 02-12-15 14:08:52, Mel Gorman wrote:
> On Wed, Dec 02, 2015 at 01:00:46PM +0100, Michal Hocko wrote:
> > On Wed 02-12-15 11:00:09, Mel Gorman wrote:
> > > On Mon, Nov 30, 2015 at 10:14:24AM +0800, Huang, Ying wrote:
> > > > > There is no reference to OOM possibility in the email that I can =
see. Can
> > > > > you give examples of the OOM messages that shows the problem site=
s? It was
> > > > > suspected that there may be some callers that were accidentally d=
epending
> > > > > on access to emergency reserves. If so, either they need to be fi=
xed (if
> > > > > the case is extremely rare) or a small reserve will have to be cr=
eated
> > > > > for callers that are not high priority but still cannot reclaim.
> > > > >
> > > > > Note that I'm travelling a lot over the next two weeks so I'll be=
 slow to
> > > > > respond but I will get to it.
> > > > =

> > > > Here is the kernel log,  the full dmesg is attached too.  The OOM
> > > > occurs during fsmark testing.
> > > > =

> > > > Best Regards,
> > > > Huang, Ying
> > > > =

> > > > [   31.453514] kworker/u4:0: page allocation failure: order:0, mode=
:0x2200000
> > > > [   31.463570] CPU: 0 PID: 6 Comm: kworker/u4:0 Not tainted 4.3.0-0=
8056-gd0164ad #1
> > > > [   31.466115] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS Debian-1.8.2-1 04/01/2014
> > > > [   31.477146] Workqueue: writeback wb_workfn (flush-253:0)
> > > > [   31.481450]  0000000000000000 ffff880035ac75e8 ffffffff8140a142 =
0000000002200000
> > > > [   31.492582]  ffff880035ac7670 ffffffff8117117b ffff880037586b28 =
ffff880000000040
> > > > [   31.507631]  ffff88003523b270 0000000000000040 ffff880035abc800 =
ffffffff00000000
> > > =

> > > This is an allocation failure and is not a triggering of the OOM kill=
er so
> > > the severity is reduced but it still looks like a bug in the driver. =
Looking
> > > at the history and the discussion, it appears to me that __GFP_HIGH w=
as
> > > cleared from the allocation site by accident. I strongly suspect that=
 Will
> > > Deacon thought __GFP_HIGH was related to highmem instead of being rel=
ated
> > > to high priority.  Will, can you review the following patch please? Y=
ing,
> > > can you test please?
> > =

> > I have posted basically the same patch
> > http://lkml.kernel.org/r/1448980369-27130-1-git-send-email-mhocko(a)ker=
nel.org
> > =

> =

> Sorry. I missed that while playing catch-up and I wasn't on the cc. I'll
> drop this patch now. Thanks for catching it.

My bad. I should have CCed you. But I considered this merely a cleanup
so I didn't want to swamp you with another email.

> > I didn't mention this allocation failure because I am not sure it is
> > really related.
> > =

> =

> I'm fairly sure it is. The failure is an allocation site that cannot
> sleep but did not specify __GFP_HIGH.

yeah but this was the case even before your patch. As the caller used
GFP_ATOMIC then it got __GFP_ATOMIC after your patch so it still
managed to do ALLOC_HARDER. I would agree if this was an explicit
GFP_NOWAIT. Unless I am missing something your patch hasn't changed the
behavior for this particular allocation.

> Such callers are normally expected
> to be able to recover gracefully and probably should specify _GFP_NOWARN.
> kswapd would have woken up as normal but the free pages were below the
> min watermark so there was a brief failure.

-- =

Michal Hocko
SUSE Labs

--===============7966502029905172352==--

