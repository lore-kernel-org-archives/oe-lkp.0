Content-Type: multipart/mixed; boundary="===============8508746978037242051=="
MIME-Version: 1.0
From: Yujie Liu <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [vrf] 2ef23e860e: kernel-selftests.net.fcnal-test.sh.fail
Date: Mon, 22 Aug 2022 16:17:25 +0800
Message-ID: <730e3e31-509b-23d4-3f35-cf787118b005@intel.com>
In-Reply-To: <70e690da-df88-5d78-d25c-b01ce1f3f886@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8508746978037242051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/22/2022 16:09, Yujie Liu wrote:
> On 8/22/2022 15:15, Ammar Faizi wrote:
>> On 8/22/22 2:03 PM, kernel test robot wrote:
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> tbox_group/testcase/rootfs/kconfig/compiler/group/test/atomic_test/ucod=
e:
>>> =C2=A0=C2=A0 lkp-skl-d01/kernel-selftests/debian-12-x86_64-20220629.cgz=
/x86_64-rhel-8.3-kselftests/gcc-11/net/fcnal-test.sh/use_cases/0xf0
>>>
>>> commit:
>>> =C2=A0=C2=A0 cae90bd22cffb ("net: bridge: vlan: fix error return code i=
n __vlan_add()")
>>> =C2=A0=C2=A0 2ef23e860e765 ("vrf: packets with lladdr src needs dst at =
input with orig_iif when needs strict")
>>>
>>> cae90bd22cffb1e1 2ef23e860e765eb1dd287492206
>>> ---------------- ---------------------------
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproductio=
n=C2=A0=C2=A0=C2=A0 fail:runs
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :6=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6:6=C2=A0=C2=A0=C2=A0=C2=A0 k=
ernel-selftests.net.fcnal-test.sh.fail
>>>
>>>
>>> FYI, we noticed that this is a backport commit of upstream 205704c618af=
0ab2366015d2281a3b0814d918a0
>>> (merged by v5.10), so we also test this case on mainline, and this issu=
e doesn't exist.
>>
>> Can you test the latest linux-5.4.y branch and see whether the issue
>> exists on there?
>>
>> You can pull from:
>>
>> =C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x.git linux-5.4.y
>>
>> The HEAD commit is:
>>
>> =C2=A0=C2=A0=C2=A0 de0cd3ea700d1e8ed76705d02e33b524cbb84cf3 ("Linux 5.4.=
210")
>>
> =

> The issue doesn't exist on latest head of linux-5.4.y branch

Sorry, I made a mistake, the issue still exists on linux-5.4-y head.

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> atomic_test/compiler/group/kconfig/rootfs/tbox_group/test/testcase/ucode:
>  =C2=A0 use_cases/gcc-11/net/x86_64-rhel-8.3-kselftests/debian-12-x86_64-=
20220629.cgz/lkp-skl-d01/fcnal-test.sh/kernel-selftests/0xf0
> =

> commit:
>  =C2=A0 2ef23e860e765 ("vrf: packets with lladdr src needs dst at input w=
ith orig_iif when needs strict")
>  =C2=A0 cae90bd22cffb ("net: bridge: vlan: fix error return code in __vla=
n_add()")
>  =C2=A0 de0cd3ea700d1 ("Linux 5.4.210")
> =

> 2ef23e860e765eb1 cae90bd22cffb1e19a83a794ad5=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 v5.4.210
> ---------------- --------------------------- ---------------------------
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=C2=A0=
=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=C2=A0=C2=A0=C2=A0 fail:runs
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :6=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6:6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 :2=C2=A0=C2=A0=C2=A0=C2=A0 kernel-selftests.net=
.fcnal-test.sh.pass

for this stat, only cae90bd22cffb can pass the test, while 2ef23e860e765 an=
d v5.4.210
all failed.

> =

> =

> Do you suggest that if we find any issue on the branches like "for-5.*-lt=
s", we could also
> run a test on corresponding stable branch? We will consider this step in =
the future.
> =

> -- =

> Thanks,
> Yujie
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============8508746978037242051==--

