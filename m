Content-Type: multipart/mixed; boundary="===============7516684290297677867=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [ubsan] f0996bc297: netperf.Throughput_total_tps -7.6% regression
Date: Wed, 22 May 2019 22:12:18 +0800
Message-ID: <20190522141218.GI19312@shao2-debian>
In-Reply-To: <4834add1-711e-b441-1956-1ab2b2d89353@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7516684290297677867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 12:50:30PM +0300, Andrey Ryabinin wrote:
> =

> =

> On 5/20/19 8:38 AM, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed a -7.6% regression of netperf.Throughput_total_tps due =
to commit:
> > =

> > =

> > commit: f0996bc2978e02d2ea898101462b960f6119b18f ("ubsan: Fix nasty -Wb=
uiltin-declaration-mismatch GCC-9 warnings")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> =

> This can't be right. First of all the commit makes changes only lib/ubsan=
.c which is compiled only when CONFIG_UBSAN=3Dy.
> In your config:
> # CONFIG_UBSAN is not set =

> =

> But even in the case of enabled UBSAN that commit doesn't change the gene=
rated machine code at all.

Hi,

Sorry for bringing you inconvenience. We retested the commit and
couldn't reproduce the regression, please ignore the invalid report.

Best Regards,
Rong Chen

--===============7516684290297677867==--

