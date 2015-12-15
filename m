Content-Type: multipart/mixed; boundary="===============4797295801491671084=="
MIME-Version: 1.0
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: lkp@lists.01.org
Subject: Re: [mtd] e0460264db: BUG: unable to handle kernel NULL pointer dereference at 000005c4
Date: Tue, 15 Dec 2015 08:44:54 +0100
Message-ID: <20151215084454.41b40eac@bbrezillon>
In-Reply-To: <877fkgv8cr.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4797295801491671084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Dec 2015 08:55:16 +0800
kernel test robot <ying.huang@linux.intel.com> wrote:

> FYI, we noticed the below changes on
> =

> https://github.com/bbrezillon/linux-0day nand/ecclayout-squashed
> commit e0460264db239f81a05a0f116efc84b9c650e0df ("mtd: use mtd_eccpos() a=
nd mtd_oobfree() where appropriate")

Should be fixed now. Sorry for the inconvenience.

Best Regards,

Boris

-- =

Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--===============4797295801491671084==--

