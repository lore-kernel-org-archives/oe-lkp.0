Content-Type: multipart/mixed; boundary="===============3503327549173972761=="
MIME-Version: 1.0
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: lkp@lists.01.org
Subject: Re: [vrf] 2ef23e860e: kernel-selftests.net.fcnal-test.sh.fail
Date: Mon, 22 Aug 2022 16:53:10 +0700
Message-ID: <c327e887-dcbf-5537-4fbf-69b30cf9ae36@gnuweeb.org>
In-Reply-To: <730e3e31-509b-23d4-3f35-cf787118b005@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3503327549173972761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


+ Adding stable and netdev people to the participants.

Full story here:

    https://lore.gnuweeb.org/gwml/532c4311-ada3-05c7-bc63-b5cb2d32ca1a(a)in=
tel.com

If you fix the issue, kindly add following tag
Reported-by: kernel test robot <yujie.liu@intel.com>

On 8/22/22 3:17 PM, Yujie Liu wrote:
> On 8/22/2022 16:09, Yujie Liu wrote:
>> On 8/22/2022 15:15, Ammar Faizi wrote:
>>> On 8/22/22 2:03 PM, kernel test robot wrote:
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> tbox_group/testcase/rootfs/kconfig/compiler/group/test/atomic_test/uco=
de:
>>>> =C2=A0=C2=A0 lkp-skl-d01/kernel-selftests/debian-12-x86_64-20220629.cg=
z/x86_64-rhel-8.3-kselftests/gcc-11/net/fcnal-test.sh/use_cases/0xf0
>>>>
>>>> commit:
>>>> =C2=A0=C2=A0 cae90bd22cffb ("net: bridge: vlan: fix error return code =
in __vlan_add()")
>>>> =C2=A0=C2=A0 2ef23e860e765 ("vrf: packets with lladdr src needs dst at=
 input with orig_iif when needs strict")
>>>>
>>>> cae90bd22cffb1e1 2ef23e860e765eb1dd287492206
>>>> ---------------- ---------------------------
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproducti=
on=C2=A0=C2=A0=C2=A0 fail:runs
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :6=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6:6=C2=A0=C2=A0=C2=A0=C2=A0 k=
ernel-selftests.net.fcnal-test.sh.fail
>>>>
>>>>
>>>> FYI, we noticed that this is a backport commit of upstream 205704c618a=
f0ab2366015d2281a3b0814d918a0
>>>> (merged by v5.10), so we also test this case on mainline, and this iss=
ue doesn't exist.
>>>
>>> Can you test the latest linux-5.4.y branch and see whether the issue
>>> exists on there?
>>>
>>> You can pull from:
>>>
>>> =C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/stable/lin=
ux.git linux-5.4.y
>>>
>>> The HEAD commit is:
>>>
>>> =C2=A0=C2=A0=C2=A0 de0cd3ea700d1e8ed76705d02e33b524cbb84cf3 ("Linux 5.4=
.210")
>>>
>>
>> The issue doesn't exist on latest head of linux-5.4.y branch
> =

> Sorry, I made a mistake, the issue still exists on linux-5.4-y head.

Thanks for testing, unfortunately, I am not the committer nor author of
the offending commit. This should have been reported to the netdev list.

I have added them to the CC list. Can you resend the reproducer and
detailed test output with them CC'ed?

>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> atomic_test/compiler/group/kconfig/rootfs/tbox_group/test/testcase/ucode:
>> =C2=A0=C2=A0 use_cases/gcc-11/net/x86_64-rhel-8.3-kselftests/debian-12-x=
86_64-20220629.cgz/lkp-skl-d01/fcnal-test.sh/kernel-selftests/0xf0
>>
>> commit:
>> =C2=A0=C2=A0 2ef23e860e765 ("vrf: packets with lladdr src needs dst at i=
nput with orig_iif when needs strict")
>> =C2=A0=C2=A0 cae90bd22cffb ("net: bridge: vlan: fix error return code in=
 __vlan_add()")
>> =C2=A0=C2=A0 de0cd3ea700d1 ("Linux 5.4.210")
>>
>> 2ef23e860e765eb1 cae90bd22cffb1e19a83a794ad5=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 v5.4.210
>> ---------------- --------------------------- ---------------------------
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=
=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=C2=A0=C2=A0=C2=A0 fail:runs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :6=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6:6=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :2=C2=A0=C2=A0=C2=A0=C2=A0 kernel-selftes=
ts.net.fcnal-test.sh.pass
> =

> for this stat, only cae90bd22cffb can pass the test, while 2ef23e860e765 =
and v5.4.210
> all failed.

FYI, I found a backported commit with a Fixes tag contains
205704c618af (commit upstream):

    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/?id=3De245ea3b524069e1a264bb50190dceedd59c36fb

But the 5.4.y HEAD that already includes that commit still fails
based on your report. Let's wait for netdev people' response on
this. As the mainline doesn't have this issue, maybe something
need to get backported?

Summary:

These commits only live in 5.4.x stable branch (backport from upstream):

(notice the "Upstream commit")

# Known good commit:

     commit cae90bd22cffb1e19a83a794ad5f57dafb3e76ad
     Author:     Zhang Changzhong <zhangchangzhong@huawei.com>
     AuthorDate: Fri Dec 4 16:48:56 2020 +0800
     Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
     CommitDate: Mon Dec 21 13:27:03 2020 +0100

     net: bridge: vlan: fix error return code in __vlan_add()
     =

     [ Upstream commit ee4f52a8de2c6f78b01f10b4c330867d88c1653a ]
     ...

# The next commit after that one fails (first bad commit):

     commit 2ef23e860e765eb1dd287492206d833f04eae9df
     Author:     Stephen Suryaputra <ssuryaextr@gmail.com>
     AuthorDate: Thu Dec 3 22:06:04 2020 -0500
     Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
     CommitDate: Mon Dec 21 13:27:03 2020 +0100

     vrf: packets with lladdr src needs dst at input with orig_iif when nee=
ds strict
     =

     [ Upstream commit 205704c618af0ab2366015d2281a3b0814d918a0 ]
     ...

# The HEAD of linux-5.4.x still fails:

     commit de0cd3ea700d1e8ed76705d02e33b524cbb84cf3
     Author:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
     AuthorDate: Thu Aug 11 12:57:53 2022 +0200
     Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
     CommitDate: Thu Aug 11 12:57:53 2022 +0200

     Linux 5.4.210
     ...

netdev folks, any comment on this?

-- =

Ammar Faizi
--===============3503327549173972761==--

