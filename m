Content-Type: multipart/mixed; boundary="===============2108357779974484384=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [dummy_stm_init] swapper/0: page allocation failure: order:9, mode:0x14040c0(GFP_KERNEL|__GFP_COMP), nodemask=(null)
Date: Thu, 19 Apr 2018 08:51:11 +0200
Message-ID: <20180419065111.GM17484@dhcp22.suse.cz>
In-Reply-To: <20180419023639.cddsueaq47mohfma@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2108357779974484384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 19-04-18 10:36:39, Wu Fengguang wrote:
> Hi Alexander,
> =

> FYI this happens in mainline kernel 4.17.0-rc1.
> It dates back to at least v4.15.
> =

> It occurs in 4 out of 4 boots. Here KVM has 1G memory.
> =

> This high order allocation caused lots of noises in our boot testing.
> We could disable this device in our tests, but it would be great if
> there are better ways out.
> =

> [   75.039408]       Product name: fake-design-for-testing
> [   75.040995] fmc fake-design-for-testing-f001: Driver has no ID: matche=
s all
> [   75.042509] fmc_trivial: probe of fake-design-for-testing-f001 failed =
with error -95
> [   75.044323] fmc fake-design-for-testing-f001: Driver has no ID: matche=
s all
> [   75.045644] fmc_chardev fake-design-for-testing-f001: Created misc dev=
ice "fake-design-for-testing-f001"
> [   75.061570] swapper/0: page allocation failure: order:9, mode:0x14040c=
0(GFP_KERNEL|__GFP_COMP), nodemask=3D(null)

Is there any reason why
> [   75.063338]  stm_register_device+0xf3/0x5c0:
> 						stm_register_device at drivers/hwtracing/stm/core.c:695

cannot use kvzalloc?
-- =

Michal Hocko
SUSE Labs

--===============2108357779974484384==--

