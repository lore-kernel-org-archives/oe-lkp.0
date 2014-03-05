Content-Type: multipart/mixed; boundary="===============9086153594428574484=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [ACPI / hotplug / PCI] 1b360f44d00: -80.9% vm-scalability.stddev
Date: Wed, 05 Mar 2014 16:23:36 +0800
Message-ID: <20140305082336.GD17109@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============9086153594428574484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

I don't know why but we are glad to find the below changes on commit

1b360f44d009059e446532f29c1a889951e72667 ("ACPI / hotplug / PCI: Fix bridge=
 removal race in handle_hotplug_event()")

test case: brickland2/micro/vm-scalability/300s-anon-r-rand-mt

d42f5da23400833  1b360f44d009059e446532f29  =

---------------  -------------------------  =

      3.54 ~164%     -80.9%       0.68 ~37% TOTAL vm-scalability.stddev
     14177 ~ 7%     -22.1%      11040 ~ 7%  TOTAL numa-meminfo.node0.SRecla=
imable
      3543 ~ 7%     -22.1%       2759 ~ 7%  TOTAL numa-vmstat.node0.nr_slab=
_reclaimable
    776196 ~ 6%     -10.0%     698893 ~ 5%  TOTAL numa-numastat.node2.local=
_node
    776196 ~ 6%     -10.0%     698894 ~ 5%  TOTAL numa-numastat.node2.numa_=
hit

The ~XX% numbers are stddev percent.
The [+-]XX% is change percent.

The below graph shows all samples collected during the bisect

[*] bisect-good
[O] bisect-bad ("bad" in the sense of bisect)

In which you can see the stableness of the change and bisect.

                               vm-scalability.stddev

   16 ++-------------------------------------------------------------------=
-+
      |                                                                 *  =
 |
   14 ++                                                                :  =
 |
   12 ++                                                                :  =
 |
      |                                                                 :: =
 |
   10 ++                                                                :: =
 |
      |                                                                 :: =
 |
    8 ++                                                                :: =
 |
      |                                                                : : =
 |
    6 ++                                                    *          : : =
 |
    4 ++           *      *                                 ::         :  :=
 |
      |           +:     : +                       *       : :         :  :=
 |
    2 ++*.   *. .*  :    :  *          .*.        + :      :  :   .*   :  :=
 |
      |+  * +  *    *. .* O  *.*.*. .**   O.**.O.* O: *.O.* O OO.*  +  :  *=
.|
    0 O+O-OO-O-O-O-OO-O-O---OO-O-O-O-OO-O---OO-*-O---OO-*-O------O-O-*-*---=
-*


Thanks,
Fengguang

--===============9086153594428574484==--

