Content-Type: multipart/mixed; boundary="===============6016974853998608978=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [dummy_stm_init] swapper/0: page allocation failure: order:9, mode:0x14040c0(GFP_KERNEL|__GFP_COMP), nodemask=(null)
Date: Sun, 22 Apr 2018 07:44:39 -0600
Message-ID: <20180422134439.GK17484@dhcp22.suse.cz>
In-Reply-To: <20180419102114.irntfpy6i77apfq5@node.shutemov.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============6016974853998608978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 19-04-18 13:21:14, Kirill A. Shutemov wrote:
> On Thu, Apr 19, 2018 at 08:51:11AM +0200, Michal Hocko wrote:
> > On Thu 19-04-18 10:36:39, Wu Fengguang wrote:
> > > Hi Alexander,
> > > =

> > > FYI this happens in mainline kernel 4.17.0-rc1.
> > > It dates back to at least v4.15.
> > > =

> > > It occurs in 4 out of 4 boots. Here KVM has 1G memory.
> > > =

> > > This high order allocation caused lots of noises in our boot testing.
> > > We could disable this device in our tests, but it would be great if
> > > there are better ways out.
> > > =

> > > [   75.039408]       Product name: fake-design-for-testing
> > > [   75.040995] fmc fake-design-for-testing-f001: Driver has no ID: ma=
tches all
> > > [   75.042509] fmc_trivial: probe of fake-design-for-testing-f001 fai=
led with error -95
> > > [   75.044323] fmc fake-design-for-testing-f001: Driver has no ID: ma=
tches all
> > > [   75.045644] fmc_chardev fake-design-for-testing-f001: Created misc=
 device "fake-design-for-testing-f001"
> > > [   75.061570] swapper/0: page allocation failure: order:9, mode:0x14=
040c0(GFP_KERNEL|__GFP_COMP), nodemask=3D(null)
> > =

> > Is there any reason why
> > > [   75.063338]  stm_register_device+0xf3/0x5c0:
> > > 						stm_register_device at drivers/hwtracing/stm/core.c:695
> > =

> > cannot use kvzalloc?
> =

> Michal, do you understand how allocating ~512kB leads to order-9 failure?
> Shouldn't it be order-8 at most? That's not clear to me.

How do you tell it is 512kB? The page allocator consumes order so maybe
something miscalculated the order when calling the allocator?
-- =

Michal Hocko
SUSE Labs

--===============6016974853998608978==--

