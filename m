Content-Type: multipart/mixed; boundary="===============0550174164258625802=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [ACPI / hotplug / PCI] 1b360f44d00: -80.9% vm-scalability.stddev
Date: Wed, 05 Mar 2014 20:49:13 +0800
Message-ID: <20140305124913.GA9649@localhost>
In-Reply-To: <1530281.asBBpMI1MW@vostro.rjw.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============0550174164258625802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2014 at 01:58:54PM +0100, Rafael J. Wysocki wrote:
> On Wednesday, March 05, 2014 04:23:36 PM Fengguang Wu wrote:
> > Hi Rafael,
> =

> Hi,
> =

> > I don't know why but we are glad to find the below changes on commit
> =

> Do I understand correcty that you mean you're seeing improvement?

Yes - the random multi-thread malloc test's deviation is reduced noticeably=
. =


> Either way, if the test below doesn't involve hotplug or device removal v=
ia
> sysfs, I have no explanation ...

OK.

Thanks,
Fengguang

> > 1b360f44d009059e446532f29c1a889951e72667 ("ACPI / hotplug / PCI: Fix br=
idge removal race in handle_hotplug_event()")
> > =

> > test case: brickland2/micro/vm-scalability/300s-anon-r-rand-mt
> > =

> > d42f5da23400833  1b360f44d009059e446532f29  =

> > ---------------  -------------------------  =

> >       3.54 ~164%     -80.9%       0.68 ~37% TOTAL vm-scalability.stddev
> >      14177 ~ 7%     -22.1%      11040 ~ 7%  TOTAL numa-meminfo.node0.SR=
eclaimable
> >       3543 ~ 7%     -22.1%       2759 ~ 7%  TOTAL numa-vmstat.node0.nr_=
slab_reclaimable
> >     776196 ~ 6%     -10.0%     698893 ~ 5%  TOTAL numa-numastat.node2.l=
ocal_node
> >     776196 ~ 6%     -10.0%     698894 ~ 5%  TOTAL numa-numastat.node2.n=
uma_hit
> > =

> > The ~XX% numbers are stddev percent.
> > The [+-]XX% is change percent.
> > =

> > The below graph shows all samples collected during the bisect
> > =

> > [*] bisect-good
> > [O] bisect-bad ("bad" in the sense of bisect)
> > =

> > In which you can see the stableness of the change and bisect.
> > =

> >                                vm-scalability.stddev
> > =

> >    16 ++---------------------------------------------------------------=
-----+
> >       |                                                                =
 *   |
> >    14 ++                                                               =
 :   |
> >    12 ++                                                               =
 :   |
> >       |                                                                =
 ::  |
> >    10 ++                                                               =
 ::  |
> >       |                                                                =
 ::  |
> >     8 ++                                                               =
 ::  |
> >       |                                                                =
: :  |
> >     6 ++                                                    *          =
: :  |
> >     4 ++           *      *                                 ::         =
:  : |
> >       |           +:     : +                       *       : :         =
:  : |
> >     2 ++*.   *. .*  :    :  *          .*.        + :      :  :   .*   =
:  : |
> >       |+  * +  *    *. .* O  *.*.*. .**   O.**.O.* O: *.O.* O OO.*  +  =
:  *.|
> >     0 O+O-OO-O-O-O-OO-O-O---OO-O-O-O-OO-O---OO-*-O---OO-*-O------O-O-*-=
*----*
> > =

> > =

> > Thanks,
> > Fengguang
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
> > the body of a message to majordomo(a)vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/
> =

> -- =

> I speak only for myself.
> Rafael J. Wysocki, Intel Open Source Technology Center.

--===============0550174164258625802==--

