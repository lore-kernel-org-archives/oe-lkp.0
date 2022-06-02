Content-Type: multipart/mixed; boundary="===============6861044666056866795=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [printk] 8e27473211: hwsim.ap_ft_pmf_bip_cmac_128.fail
Date: Thu, 02 Jun 2022 15:10:33 +0800
Message-ID: <20220602071033.GA27190@xsang-OptiPlex-9020>
In-Reply-To: <874k15n2jt.fsf@jogness.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6861044666056866795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi John Ogness,

On Tue, May 31, 2022 at 05:35:26PM +0206, John Ogness wrote:
> Hi Oliver,
> =

> I am having great difficulties trying to reproduce this test. It seems I
> need to setup real hardware with multiple access points. Can you point
> me to some detailed documentation about preparing this test? Thanks.

we got this test suite from https://github.com/bcopeland/wmediumd. there is
a detail README there, hope it would be helpful to you.

_but_, since you mentioned it's difficult to reproduce, we did more tests,
and found this could be platform specific.

first, we queued more jobs to platform from which the original report was m=
ade,

model: Skylake
nr_cpu: 4
memory: 32G
brand: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz

and confirmed the parent is still clean, and tests still failed on 8e274732=
11

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase/ucode:
  gcc-11/x86_64-rhel-8.3-func/debian-10.4-x86_64-20200603.cgz/lkp-skl-d03/g=
roup-18/hwsim/0xec

09c5ba0aa2fcfdad 8e274732115f63c1d0913628443
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :10         190%          19:20    hwsim.ap_ft_eap_cui.fail
         10:10         -90%           1:20    hwsim.ap_ft_eap_cui.pass  <--=
 just saw one pass for 8e27473211  which seems random
           :10         200%          20:20    hwsim.ap_ft_many.fail
         10:10        -100%            :20    hwsim.ap_ft_many.pass
           :10         200%          20:20    hwsim.ap_ft_pmf_bip_cmac_128.=
fail
         10:10        -100%            :20    hwsim.ap_ft_pmf_bip_cmac_128.=
pass


secondly, we tested on another very similar Skylake desktop platform, confi=
rmed
similar results:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase/ucode:
  gcc-11/x86_64-rhel-8.3-func/debian-10.4-x86_64-20200603.cgz/lkp-skl-d05/g=
roup-18/hwsim/0xec

09c5ba0aa2fcfdad 8e274732115f63c1d0913628443
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :3          100%           3:3     hwsim.ap_ft_eap_cui.fail
          3:3         -100%            :3     hwsim.ap_ft_eap_cui.pass
           :3          100%           3:3     hwsim.ap_ft_many.fail
          3:3         -100%            :3     hwsim.ap_ft_many.pass
           :3          100%           3:3     hwsim.ap_ft_pmf_bip_cmac_128.=
fail
          3:3         -100%            :3     hwsim.ap_ft_pmf_bip_cmac_128.=
pass


_but_, when we tested on one Ivy Bridge desktop platform:

model: Ivy Bridge
nr_node: 1
nr_cpu: 4
memory: 8G
brand: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz

we found ap_ft_eap_cui/ap_ft_many/ap_ft_pmf_bip_cmac_128 can pass on both
8e27473211 and its parent:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase/ucode:
  gcc-11/x86_64-rhel-8.3-func/debian-10.4-x86_64-20200603.cgz/lkp-ivb-d02/g=
roup-18/hwsim/0x21

09c5ba0aa2fcfdad 8e274732115f63c1d0913628443
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          3:3            0%           3:3     hwsim.ap_ft_eap_cui.pass
           :3           33%           1:3     hwsim.ap_ft_many.fail  <-- he=
re is a fail, but maybe random
          3:3          -33%           2:3     hwsim.ap_ft_many.pass
          3:3            0%           3:3     hwsim.ap_ft_pmf_bip_cmac_128.=
pass


from above, the issue could be reproduced persistently on Skylake desktop
platform, but not surely for others.

hope these information could give you some hints and please request us for
further tests if you have some ideas or doubts. Thanks a lot!

> =

> John Ogness
> =

> On 2022-05-31, kernel test robot <oliver.sang@intel.com> wrote:
> > (please be noted we reported
> > "[printk]  8e27473211: hwsim.ap_ft_pmf_bip_gmac_256.fail"
> > on
> > https://lore.kernel.org/all/20220430143056.GA27004(a)xsang-OptiPlex-902=
0/
> > when this commit is on linux-next/master
> > now we noticed there are other hwsim tests failures while
> > ap_ft_pmf_bip_gmac_256 problem is still existing, after this commit is =
on
> > mainline now.
> > FYI)
--===============6861044666056866795==--

