Content-Type: multipart/mixed; boundary="===============3266804738786930115=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: Fwd: [linux-next:master 12558/13205] drivers/thermal/intel/int340x_thermal/processor_thermal_rapl.c:96:50: sparse: sparse: cast removes address space '__iomem' of expression
Date: Mon, 14 Dec 2020 22:57:15 -0800
Message-ID: <ff9922f1ca72c62d31e138c6e876700de6da9be5.camel@linux.intel.com>
In-Reply-To: <20201215064421.GA25351@chenyu-office.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3266804738786930115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-12-15 at 14:44 +0800, Chen Yu wrote:
> Hi lkp experts,
> On Mon, Dec 14, 2020 at 11:02:11PM +0800, Zhang Rui wrote:
> > On Mon, 2020-12-14 at 15:44 +0800, Chen Yu wrote:
> > > On Sun, Dec 13, 2020 at 11:32:50PM -0800, Srinivas Pandruvada
> > > wrote:
> > > > On Mon, 2020-12-14 at 15:33 +0800, Chen Yu wrote:
> > > > > On Sun, Dec 13, 2020 at 02:28:03PM -0800, Srinivas Pandruvada
> > > > > wrote:
> > > > > > =

> > > > > > -------- Forwarded Message --------
> > > > > > From: kernel test robot <lkp@intel.com>
> > > > > > To: Srinivas Pandruvada <
> > > > > > srinivas.pandruvada(a)linux.intel.com>
> > > > > > =

> > > > > > "sparse warnings: (new ones prefixed by >>)"
> > > > > > > > drivers/thermal/intel/int340x_thermal/processor_thermal
> > > > > > > > _rap
> > > > > > > > l.c:
> > > > > > > > 96:5
> > > > > > > > 0: sparse: sparse: cast removes address space '__iomem'
> > > > > > > > of
> > > > > > > > expression
> > > > > > =

> > > > > > =C2=A0 =

> > > > > > =C2=A0=C2=A0 100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 rapl_mmio_priv.reg_unit =3D (u64)proc_priv-
> > > > > > > mmio_base
> > > > > > +
> > > > > > rapl_regs->reg_unit;
> > > > > > =

> > > > > =

> > > > > The reason for this warning is because proc_priv->mmio_base
> > > > > is of
> > > > > __iomem
> > > > > attribute that can be used by sparse to detect if there is
> > > > > ilegal
> > > > > access(only
> > > > > device memory region is legal). Removing this attribute would
> > > > > cause
> > > > > potential
> > > > > problems. A clean fix would be changing
> > > > > rapl_mmio_priv.reg_unit
> > > > > to
> > > > > void *__iomem
> > > > > and remove the (u64) cast, but that would also involve
> > > > > changes in
> > > > > struct rapl_if_priv
> > > > > and struct reg_action. What do you think, Rui?
> > > =

> > > And if within this code we know it is a safe cast, the following
> > > change
> > > might help to prevent parse from complaining:
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rapl_mmio_priv.reg_unit =
=3D (u64)proc_priv->mmio_base +
> > > rapl_regs->reg_unit;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rapl_mmio_priv.reg_unit =
=3D (u64 __force)proc_priv-
> > > >mmio_base +
> > > rapl_regs->reg_unit;
> > > =C2=A0
> > we can check with LKP team tomorrow.
> > =

> It looks like we could not reproduce this sparse issue locally, but
> it should be a valid report. May I know how we can verify in
> lkp that a fix works(suppose we propose a patch)?
With 0.6.3 version of sparse this issue can be reproduced.

Thanks,
Srinivas


> =

> thanks,
> Chenyu
> > thanks,
> > rui


--===============3266804738786930115==--

