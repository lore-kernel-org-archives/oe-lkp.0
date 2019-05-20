Content-Type: multipart/mixed; boundary="===============3742542044478770273=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [ubsan] f0996bc297: netperf.Throughput_total_tps -7.6% regression
Date: Mon, 20 May 2019 12:50:30 +0300
Message-ID: <4834add1-711e-b441-1956-1ab2b2d89353@virtuozzo.com>
In-Reply-To: <20190520053851.GY31424@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3742542044478770273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/20/19 8:38 AM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -7.6% regression of netperf.Throughput_total_tps due to=
 commit:
> =

> =

> commit: f0996bc2978e02d2ea898101462b960f6119b18f ("ubsan: Fix nasty -Wbui=
ltin-declaration-mismatch GCC-9 warnings")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =


This can't be right. First of all the commit makes changes only lib/ubsan.c=
 which is compiled only when CONFIG_UBSAN=3Dy.
In your config:
# CONFIG_UBSAN is not set =


But even in the case of enabled UBSAN that commit doesn't change the genera=
ted machine code at all.

--===============3742542044478770273==--

