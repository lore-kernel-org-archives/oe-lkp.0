Content-Type: multipart/mixed; boundary="===============0754197451968064246=="
MIME-Version: 1.0
From: Yujie Liu <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [vrf] 2ef23e860e: kernel-selftests.net.fcnal-test.sh.fail
Date: Mon, 22 Aug 2022 16:09:47 +0800
Message-ID: <70e690da-df88-5d78-d25c-b01ce1f3f886@intel.com>
In-Reply-To: <c9451365-e582-3bb0-0180-462d0a4069ed@gnuweeb.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0754197451968064246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/22/2022 15:15, Ammar Faizi wrote:
> On 8/22/22 2:03 PM, kernel test robot wrote:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> tbox_group/testcase/rootfs/kconfig/compiler/group/test/atomic_test/ucode:
>> =C2=A0=C2=A0 lkp-skl-d01/kernel-selftests/debian-12-x86_64-20220629.cgz/=
x86_64-rhel-8.3-kselftests/gcc-11/net/fcnal-test.sh/use_cases/0xf0
>>
>> commit:
>> =C2=A0=C2=A0 cae90bd22cffb ("net: bridge: vlan: fix error return code in=
 __vlan_add()")
>> =C2=A0=C2=A0 2ef23e860e765 ("vrf: packets with lladdr src needs dst at i=
nput with orig_iif when needs strict")
>>
>> cae90bd22cffb1e1 2ef23e860e765eb1dd287492206
>> ---------------- ---------------------------
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=
=C2=A0=C2=A0=C2=A0 fail:runs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :6=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6:6=C2=A0=C2=A0=C2=A0=C2=A0 kern=
el-selftests.net.fcnal-test.sh.fail
>>
>>
>> FYI, we noticed that this is a backport commit of upstream 205704c618af0=
ab2366015d2281a3b0814d918a0
>> (merged by v5.10), so we also test this case on mainline, and this issue=
 doesn't exist.
> =

> Can you test the latest linux-5.4.y branch and see whether the issue
> exists on there?
> =

> You can pull from:
> =

>  =C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git =
linux-5.4.y
> =

> The HEAD commit is:
> =

>  =C2=A0=C2=A0 de0cd3ea700d1e8ed76705d02e33b524cbb84cf3 ("Linux 5.4.210")
> =


The issue doesn't exist on latest head of linux-5.4.y branch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
atomic_test/compiler/group/kconfig/rootfs/tbox_group/test/testcase/ucode:
   use_cases/gcc-11/net/x86_64-rhel-8.3-kselftests/debian-12-x86_64-2022062=
9.cgz/lkp-skl-d01/fcnal-test.sh/kernel-selftests/0xf0

commit:
   2ef23e860e765 ("vrf: packets with lladdr src needs dst at input with ori=
g_iif when needs strict")
   cae90bd22cffb ("net: bridge: vlan: fix error return code in __vlan_add()=
")
   de0cd3ea700d1 ("Linux 5.4.210")

2ef23e860e765eb1 cae90bd22cffb1e19a83a794ad5                    v5.4.210
---------------- --------------------------- ---------------------------
        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
            |             |             |             |             |
            :6          100%           6:6            0%            :2     =
kernel-selftests.net.fcnal-test.sh.pass


Do you suggest that if we find any issue on the branches like "for-5.*-lts"=
, we could also
run a test on corresponding stable branch? We will consider this step in th=
e future.

--
Thanks,
Yujie
--===============0754197451968064246==--

