Content-Type: multipart/mixed; boundary="===============5988030026688554231=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [i2c-mux] 3489746df0: WARNING: CPU: 0 PID: 1 at drivers/base/devres.c:888 devm_kfree()
Date: Wed, 24 Feb 2016 12:16:09 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E66249142CF0F6@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <8e4cac423e4245a4b6a13590445e911d@EMAIL.axentia.se>
List-Id: <oe-lkp.lists.linux.dev>

--===============5988030026688554231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: LKP [mailto:lkp-bounces(a)lists.01.org] On Behalf Of Peter Rosin
> Sent: Wednesday, February 24, 2016 7:42 PM
> To: Wu, Fengguang <fengguang.wu@intel.com>
> Cc: LKP <lkp@01.org>
> Subject: Re: [LKP] [i2c-mux] 3489746df0: WARNING: CPU: 0 PID: 1 at
> drivers/base/devres.c:888 devm_kfree()
> =

> kernel test robot wrote:
> > Greetings,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > https://github.com/0day-ci/linux
> Peter-Rosin/i2c-mux-cleanup-and-locking-update/20160106-000205
> >
> > commit 3489746df00f2f18b1a6dc2ba4de263e980cfbb0
> > Author:     Peter Rosin <peda@axentia.se>
> > AuthorDate: Tue Jan 5 16:57:13 2016 +0100
> > Commit:     0day robot <fengguang.wu@intel.com>
> > CommitDate: Wed Jan 6 00:02:09 2016 +0800
> >
> >     i2c-mux: move the slave side adapter management to i2c_mux_core
> >
> >     All muxes have slave side adapters, many have some arbitrary number
> of
> >     them. Handle this in the mux core, so that drivers are simplified.
> >
> >     Add i2c_mux_reserve_adapter that can be used when it is known in
> advance
> >     how many child adapters that is to be added. This avoids reallocati=
ng
> >     memory.
> >
> >     Drop i2c_del_mux_adapter and replace it with i2c_del_mux_adapters,
> since
> >     no mux driver is dynamically deleting individual child adapters any=
way.
> >
> >     Signed-off-by: Peter Rosin <peda@axentia.se>
> =

> This is old. Fixed in v3 which was sent out 2016-01-08. What's going on?

Sorry, this is an old mail that was wrongly resent out today which was stuc=
k in 0day email system from Jan 5. Pls help ignore this.

> =

> Cheers,
> Peter
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============5988030026688554231==--

