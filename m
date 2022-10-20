Content-Type: multipart/mixed; boundary="===============2248973743742657334=="
MIME-Version: 1.0
From: Yujie Liu <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lib/cpumask] 6f9c07be9d: WARNING:at_include/linux/cpumask.h:#prefill_possible_map
Date: Fri, 21 Oct 2022 01:39:02 +0800
Message-ID: <Y1GHthWAyAq2Q+Yz@yujie-X299>
In-Reply-To: <Y1FzKVLlLPrhb47D@yury-laptop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2248973743742657334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 09:11:21AM -0700, Yury Norov wrote:
> On Thu, Oct 20, 2022 at 06:05:51PM +0800, kernel test robot wrote:
> > =

> > Hi Yury,
> > =

> > We noticed that below patch adds a FORCE_NR_CPUS config, and it is
> > expected to show a warning when this config is enabled and
> > CONFIG_NR_CPUS doesn't match the actual number of CPUs we have. But we
> > also noticed that it not only shows a warning but could also break boot
> > test in some cases. We are not sure if the break is actually related to
> > this patch or not, so we send this report FYI.
> > =

> > We noticed that a fix patch was posted at:
> > =

> > https://lore.kernel.org/all/20221019225939.1646349-1-yury.norov(a)gmail=
.com/
> > =

> > FORCE_NR_CPUS won't be enabled by allmodconfig or allyesconfig after
> > applying the fix, but looks it could still be enabled by randconfig. Not
> > sure if this is an expected behavior, but since our test robot runs many
> > randconfig tests, this warning could still be triggered frequently and
> > go to boot failure at last.
> > =

> > Please kindly help to give some advice on handling this config in our
> > testing. Thanks.
> > =

> > Please check below report for more details:
> > =

> > =

> > Greeting,
> =

> Hi guys,
> =

> Thanks for the report.
> =

> Indeed, if FORCE_NR_CPUS is enabled by randconfig, it may cause at least
> boot warning. I'm either not sure if the following alloc_pages is
> related to the config, but anyways...
> =

> The most logical solution would be disabling FORCE_NR_CPUS in
> randconfig before building the kernel. We can do it in a post-script,
> like:
> =

> make randconfig
> scripts/config -d FORCE_NR_CPUS
> scripts/config -e UNFORCE_NR_CPUS
> make

This seems to need extra work to run config script for each randconfig
build.

> =

> Or we can create a pre-configuration file, so that randconfig would do
> its work based on that. We already have such pre-configs for powerpc
> and risc:
>         arch/riscv/configs/32-bit.config
>         arch/powerpc/configs/32-bit.config
>         arch/powerpc/configs/64-bit.config
>         arch/riscv/configs/64-bit.config
> =

> Maybe it's time to create a generic config of this sort.

It would be nice to have a pre-config file to ensure this config won't
be enabled accidentally by randconfig if users are not aware of. This
would also be consistent with common build flow so no extra steps are
needed.

Best Regards,
Yujie

> =

> Please let me know if that sounds sane to you. I'm not very familiar
> to build system things, but I'll be happy to help implementing this,
> if needed.
> =

> Thanks,
> Yury
> =20
--===============2248973743742657334==--

