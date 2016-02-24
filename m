Content-Type: multipart/mixed; boundary="===============2413338307556519004=="
MIME-Version: 1.0
From: Peter Rosin <peda@axentia.se>
To: lkp@lists.01.org
Subject: Re: [i2c-mux] 3489746df0: WARNING: CPU: 0 PID: 1 at drivers/base/devres.c:888 devm_kfree()
Date: Wed, 24 Feb 2016 11:42:18 +0000
Message-ID: <8e4cac423e4245a4b6a13590445e911d@EMAIL.axentia.se>
In-Reply-To: <568c28e6.91O206DGOHlCyrJ5%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2413338307556519004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux Peter-Rosin/i2c-mux-cleanup-and-locking-=
update/20160106-000205
> =

> commit 3489746df00f2f18b1a6dc2ba4de263e980cfbb0
> Author:     Peter Rosin <peda@axentia.se>
> AuthorDate: Tue Jan 5 16:57:13 2016 +0100
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Wed Jan 6 00:02:09 2016 +0800
> =

>     i2c-mux: move the slave side adapter management to i2c_mux_core
>     =

>     All muxes have slave side adapters, many have some arbitrary number of
>     them. Handle this in the mux core, so that drivers are simplified.
>     =

>     Add i2c_mux_reserve_adapter that can be used when it is known in adva=
nce
>     how many child adapters that is to be added. This avoids reallocating
>     memory.
>     =

>     Drop i2c_del_mux_adapter and replace it with i2c_del_mux_adapters, si=
nce
>     no mux driver is dynamically deleting individual child adapters anywa=
y.
>     =

>     Signed-off-by: Peter Rosin <peda@axentia.se>

This is old. Fixed in v3 which was sent out 2016-01-08. What's going on?

Cheers,
Peter

--===============2413338307556519004==--

