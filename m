Content-Type: multipart/mixed; boundary="===============8627813136978608627=="
MIME-Version: 1.0
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: lkp@lists.01.org
Subject: Re: [base] 9ea71534ad: kmsg.Diva:No_ISA, ISAPNP_or_PCI_card_found
Date: Mon, 25 Jan 2016 07:06:20 -0500
Message-ID: <56A60FBC.7050107@gmail.com>
In-Reply-To: <87r3h6bdhy.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8627813136978608627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/24/2016 09:26 PM, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux William-Breathitt-Gray/base-isa-Remove-X=
86_32-dependency/20160123-003152
> commit 9ea71534addd0753b37b884b5d8a5fa54bfd95ea ("base: isa: Remove X86_3=
2 dependency")
> =

> With your commit, there are new message as follow in kernel log.
> =

> [    5.405484] Diva: No ISA, ISAPNP or PCI card found
> [    5.405484] Diva: No ISA, ISAPNP or PCI card found
> =

> =

> Thanks,
> Ying Huang

This commit introduces a new dependency for CONFIG_ISA: CONFIG_ISA_BUS.  =

Without CONFIG_ISA_BUS set, CONFIG_ISA cannot be set -- and as a result =

CONFIG_ISAPNP cannot be set.

Since the config file used left CONFIG_ISA_BUS unset, ISA and ISAPNP     =

support was left out of the kernel, thus resulting in the new Diva       =

warnings.

William Breathitt Gray

--===============8627813136978608627==--

