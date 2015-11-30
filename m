Content-Type: multipart/mixed; boundary="===============4369838751748098915=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Mon, 30 Nov 2015 14:02:00 +0100
Message-ID: <20151130130200.GA21950@dhcp22.suse.cz>
In-Reply-To: <87h9k4kzcv.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4369838751748098915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[Let's CC Will - see the question at the end of the email please]

This seems to be a similar allocation failure reported
http://lkml.kernel.org/r/87oafjpnb1.fsf%40yhuang-dev.intel.com
where I failed to see the important point, more on that below.

On Mon 30-11-15 10:14:24, Huang, Ying wrote:
> Mel Gorman <mgorman@techsingularity.net> writes:
> =

> > On Fri, Nov 27, 2015 at 09:14:52AM +0800, Huang, Ying wrote:
> >> Hi, Mel,
> >> =

> >> Mel Gorman <mgorman@techsingularity.net> writes:
> >> =

> >> > On Thu, Nov 26, 2015 at 08:56:12AM +0800, kernel test robot wrote:
> >> >> FYI, we noticed the below changes on
> >> >> =

> >> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
> >> >> commit d0164adc89f6bb374d304ffcc375c6d2652fe67d ("mm, page_alloc:
> >> >> distinguish between being unable to sleep, unwilling to sleep and
> >> >> avoiding waking kswapd")
> >> >> =

> >> >> Note: the testing machine is a virtual machine with only 1G memory.
> >> >> =

> >> >
> >> > I'm not actually seeing any problem here. Is this a positive report =
or
> >> > am I missing something obvious?
> >> =

> >> Sorry the email subject is generated automatically and I forget to
> >> change it to some meaningful stuff before sending out.  From the testi=
ng
> >> result, we found the commit make the OOM possibility increased from 0%
> >> to 100% on this machine with small memory.  I also added proc-vmstat
> >> information data too to help diagnose it.
> >> =

> >
> > There is no reference to OOM possibility in the email that I can see. C=
an
> > you give examples of the OOM messages that shows the problem sites? It =
was
> > suspected that there may be some callers that were accidentally dependi=
ng
> > on access to emergency reserves. If so, either they need to be fixed (if
> > the case is extremely rare) or a small reserve will have to be created
> > for callers that are not high priority but still cannot reclaim.

__virtblk_add_req calls
virtqueue_add_sgs(vq, sgs, num_out, num_in, vbr, GFP_ATOMIC)
  alloc_indirect(gfp)
    gfp &=3D ~(__GFP_HIGHMEM | __GFP_HIGH)

So this is true __GFP_ATOMIC, we just drop __GFP_HIGH so it doesn't get
access to more reserves. It still does ALLOC_HARDER. So I think the real
issue is somewhere else when something should have triggered kswapd and
it doesn't do that anymore. I have tried to find that offender the last
time but didn't manage to find any.

Btw. I completely miss why b92b1b89a33c ("virtio: force vring
descriptors to be allocated from lowmem") had to clear __GFP_HIGH. Will
do you remember why you have dropped that flag as well?

Also I do not seem to find any user of alloc_indirect which would do
__GFP_HIGHMEM. All of them are either GFP_KERNEL or GFP_ATOMIC. So
either I am missing something or this is not really needed. Maybe the
situation was different back in 2012.
-- =

Michal Hocko
SUSE Labs

--===============4369838751748098915==--

