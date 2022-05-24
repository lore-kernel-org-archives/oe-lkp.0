Content-Type: multipart/mixed; boundary="===============6391310688144842146=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] db16e9b28b: kvm-unit-tests.pmu.fail
Date: Tue, 24 May 2022 21:36:05 +0800
Message-ID: <20220524133604.GA34870@xsang-OptiPlex-9020>
In-Reply-To: <d741a183-6180-1a49-fffb-b62d36286a04@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6391310688144842146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Like Xu,

On Sun, May 15, 2022 at 05:25:21PM +0800, Like Xu wrote:
> On 15/5/2022 5:22 pm, kernel test robot wrote:
> > patch link:https://lore.kernel.org/kvm/20220509102204.62389-2-likexu(a)=
tencent.com
> =

> Fixed by the V2 version. Please help try.

we tested the V2 version and could not reproduce pmu.fail on it:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/testcase/ucode:
  gcc-11/x86_64-rhel-8.3-func/debian-10.4-x86_64-20200603.cgz/lkp-hsw-d02/k=
vm-unit-tests/0x28

commit:
  bec9b596f911 ("KVM: x86/pmu: Ignore pmu->global_ctrl check if vPMU doesn'=
t support global_ctrl")
  db16e9b28b05 ("KVM: x86/pmu: Don't pre-set the pmu->global_ctrl when refr=
eshing")
  3fa1b82c692b ("KVM: x86/pmu: Don't pre-set the pmu->global_ctrl when refr=
eshing") v2

bec9b596f911252e db16e9b28b05f069d01b76886b6 3fa1b82c692b513878a23e07efc
---------------- --------------------------- ---------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |
           :6           50%           3:3            0%            :10    k=
vm-unit-tests.pmu.fail


--===============6391310688144842146==--

