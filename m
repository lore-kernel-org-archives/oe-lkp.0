Content-Type: multipart/mixed; boundary="===============1763405821749526579=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Wed, 11 May 2022 11:40:57 +0800
Message-ID: <YnswSZQAfRAWr+z0@ziqianlu-desk1>
In-Reply-To: <37dac785a08e3a341bf05d9ee35f19718ce83d26.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1763405821749526579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 02:23:28PM +0800, ying.huang(a)intel.com wrote:
> On Tue, 2022-05-10 at 11:43 +0800, Aaron Lu wrote:
> > On 5/7/2022 3:44 PM, ying.huang(a)intel.com wrote:
> > > On Sat, 2022-05-07 at 15:31 +0800, Aaron Lu wrote:
> > =

> > ... ...
> > =

> > > > =

> > > > I thought the overhead of changing the cache line from "shared" to
> > > > "own"/"modify" is pretty cheap.
> > > =

> > > This is the read/write pattern of cache ping-pong.  Although it should
> > > be cheaper than the write/write pattern of cache ping-pong in theory,=
 we
> > > have gotten sevious regression for that before.
> > > =

> > =

> > Can you point me to the regression report? I would like to take a look,
> > thanks.
> =

> Sure.
> =

> https://lore.kernel.org/all/1425108604.10337.84.camel(a)linux.intel.com/
> =

> > > > Also, this is the same case as the Skylake desktop machine, why it =
is a
> > > > gain there but a loss here?=C2=A0
> > > =

> > > I guess the reason is the private cache size.  The size of the private
> > > L2 cache of SKL server is much larger than that of SKL client (1MB vs.
> > > 256KB).  So there's much more core-2-core traffic on SKL server.
> > > =

> > =

> > It could be. The 256KiB L2 in Skylake desktop can only store 8 order-3
> > pages and that means the allocator side may have a higher chance of
> > reusing a page that is evicted from the free cpu's L2 cache than the
> > server machine, whose L2 can store 40 order-3 pages.
> > =

> > I can do more tests using different high for the two machines:
> > 1) high=3D0, this is the case when page reuse is the extreme. core-2-co=
re
> > transfer should be the most. This is the behavior of this bisected comm=
it.
> > 2) high=3DL2_size, this is the case when page reuse is fewer compared to
> > the above case, core-2-core should still be the majority.
> > 3) high=3D2 times of L2_size and smaller than llc size, this is the case
> > when cache reuse is further reduced, and when the page is indeed reused,
> > it shouldn't cause core-2-core transfer but can benefit from llc.
> > 4) high>llc_size, this is the case when page reuse is the least and when
> > page is indeed reused, it is likely not in the entire cache hierarchy.
> > This is the behavior of this bisected commit's parent commit for the
> > Skylake desktop machine.
> > =

> > I expect case 3) should give us the best performance and 1) or 4) is the
> > worst for this testcase.
> > =

> > case 4) is difficult to test on the server machine due to the cap of
> > pcp->high which is affected by the low watermark of the zone. The server
> > machine has 128 cpus but only 128G memory, which makes the pcp->high
> > capped at 421, while llc size is 40MiB and that translates to a page
> > number of 12288.
> > > =

> =

> Sounds good to me.

I've run the tests on a 2 sockets Icelake server and a Skylake desktop.

On this 2 sockets Icelake server(1.25MiB L2 =3D 320 pages, 48MiB LLC =3D
12288 pages):

pcp->high      score
    0          100662 (bypass PCP, most page resue, most core-2-core transf=
er)
  320(L2)      117252
  640          133149
 6144(1/2 llc) 134674
12416(>llc)    103193 (least page reuse)

Setting pcp->high to 640(2 times L2 size) gives very good result, only
slightly lower than 6144(1/2 llc size). Bypassing PCP to get the most
cache reuse didn't deliver good performance, so I think Ying is right:
core-2-core really hurts.

On this 4core/8cpu Skylake desktop(256KiB L2 =3D 64 pages, 8MiB LLC =3D 2048
pages):

   0           86780 (bypass PCP, most page reuse, most core-2-core transfe=
r)
  64(L2)       85813
 128           85521
1024(1/2 llc)  85557
2176(> llc)    74458 (least page reuse)

Things are different on this small machine. Bypassing PCP gives the best
performance. I find it hard to explain this. Maybe the 256KiB is too
small that even bypassing PCP, the page still ends up being evicted from
L2 when allocator side reuses it? Or maybe core-2-core transfer is
fast on this small machine?

P.S. I've blindly setting pcp->high to the above value, ignoring zone's
low watermark cap for testing purpose.
--===============1763405821749526579==--

