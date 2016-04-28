Content-Type: multipart/mixed; boundary="===============4154716986525877519=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, oom] faad2185f4: vm-scalability.throughput -11.8% regression
Date: Thu, 28 Apr 2016 13:21:35 +0200
Message-ID: <20160428112135.GD31489@dhcp22.suse.cz>
In-Reply-To: <e7bfca34-2f7b-290f-0638-4ab1794b9fbd@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4154716986525877519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 28-04-16 17:45:23, Aaron Lu wrote:
> On 04/28/2016 04:57 PM, Michal Hocko wrote:
> > On Thu 28-04-16 13:17:08, Aaron Lu wrote:
[...]
> >> I have the same doubt too, but the results look really stable(only for
> >> commit 0da9597ac9c0, see below for more explanation).
> > =

> > I cannot seem to find this sha1. Where does it come from? linux-next?
> =

> Neither can I...
> The commit should come from 0day Kbuild service I suppose, which is a
> robot to do automatic fetch/building etc.
> Could it be that the commit appeared in linux-next some day and then
> gone?

This wouldn't be unusual because mmotm part of the linux next is
constantly rebased.

[...]
> > OK, so we have 96G for consumers with 32G RAM and 96G of swap space,
> > right?  That would suggest they should fit in although the swapout could
> > be large (2/3 of the faulted memory) and the random pattern can cause
> > some trashing. Does the system bahave the same way with the stream anon
> > load? Anyway I think we should be able to handle such load, although it
> =

> By stream anon load, do you mean continuous write, without read?

Yes

> > is quite untypical from my experience because it can be pain with a slow
> > swap but ramdisk swap should be as fast as it can get so the swap in/out
> > should be basically noop. =

> > =

> >> So I guess the question here is, after the OOM rework, is the OOM
> >> expected for such a case? If so, then we can ignore this report.
> > =

> > Could you post the OOM reports please? I will try to emulate a similar
> > load here as well.
> =

> I attached the dmesg from one of the runs.
[...]
> [   77.434044] slabinfo invoked oom-killer: gfp_mask=3D0x26040c0(GFP_KERN=
EL|__GFP_COMP|__GFP_NOTRACK), order=3D2, oom_score_adj=3D0
[...]
> [  138.090480] kthreadd invoked oom-killer: gfp_mask=3D0x27000c0(GFP_KERN=
EL_ACCOUNT|__GFP_NOTRACK), order=3D2, oom_score_adj=3D0
[...]
> [  141.823925] lkp-setup-rootf invoked oom-killer: gfp_mask=3D0x27000c0(G=
FP_KERNEL_ACCOUNT|__GFP_NOTRACK), order=3D2, oom_score_adj=3D0

All of them are order-2 and this was a known problem for "mm, oom:
rework oom detection" commit and later should make it much more
resistant to failures for higher (!costly) orders. So I would definitely
encourage you to retest with the current _complete_ mmotm tree.
-- =

Michal Hocko
SUSE Labs

--===============4154716986525877519==--

