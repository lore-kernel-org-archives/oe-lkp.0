Content-Type: multipart/mixed; boundary="===============7491862968772160860=="
MIME-Version: 1.0
From: Will Deacon <will.deacon@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Tue, 01 Dec 2015 12:23:41 +0000
Message-ID: <20151201122340.GC2853@arm.com>
In-Reply-To: <20151130130200.GA21950@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7491862968772160860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Mon, Nov 30, 2015 at 02:02:00PM +0100, Michal Hocko wrote:
> [Let's CC Will - see the question at the end of the email please]

[...]

> > > There is no reference to OOM possibility in the email that I can see.=
 Can
> > > you give examples of the OOM messages that shows the problem sites? I=
t was
> > > suspected that there may be some callers that were accidentally depen=
ding
> > > on access to emergency reserves. If so, either they need to be fixed =
(if
> > > the case is extremely rare) or a small reserve will have to be created
> > > for callers that are not high priority but still cannot reclaim.
> =

> __virtblk_add_req calls
> virtqueue_add_sgs(vq, sgs, num_out, num_in, vbr, GFP_ATOMIC)
>   alloc_indirect(gfp)
>     gfp &=3D ~(__GFP_HIGHMEM | __GFP_HIGH)
> =

> So this is true __GFP_ATOMIC, we just drop __GFP_HIGH so it doesn't get
> access to more reserves. It still does ALLOC_HARDER. So I think the real
> issue is somewhere else when something should have triggered kswapd and
> it doesn't do that anymore. I have tried to find that offender the last
> time but didn't manage to find any.
> =

> Btw. I completely miss why b92b1b89a33c ("virtio: force vring
> descriptors to be allocated from lowmem") had to clear __GFP_HIGH. Will
> do you remember why you have dropped that flag as well?

Right, that looks unnecessary, but it could be that we were masking a
bug somewhere else.

> Also I do not seem to find any user of alloc_indirect which would do
> __GFP_HIGHMEM. All of them are either GFP_KERNEL or GFP_ATOMIC. So
> either I am missing something or this is not really needed. Maybe the
> situation was different back in 2012.

I tried to revisit the thread leading to that patch, but it doesn't make
a whole lot of sense:

  https://lkml.org/lkml/2012/10/17/143

I certainly remember debugging the failure (i.e. it wasn't theoretical),
and we were ending up with highmem addresses being passed in the virtio
ring (due to the zero-copy stuff in 9p) and also for the descriptors
themselves. The discussion at the time makes it sound like GFP_ATOMIC
was giving us those...

Will

--===============7491862968772160860==--

