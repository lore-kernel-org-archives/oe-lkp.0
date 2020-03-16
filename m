Content-Type: multipart/mixed; boundary="===============3411918496160723159=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lru] b8e7130188: WARNING:at_lib/list_debug.c:#__list_del_entry_valid
Date: Mon, 16 Mar 2020 09:51:03 +0800
Message-ID: <e475cf4f-ef35-d271-78bc-21ae27ff27ea@intel.com>
In-Reply-To: <1cc7f3fc-071a-479c-1818-5a3c318f0740@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3411918496160723159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Unfortunately the problem still exists.

rongc(a)inn =E2=9E=9C=C2=A0 ~ grep list_del_entry_valid =

/result/pm-qa/thermal-ucode=3D0x27/lkp-hsw-d02/debian-x86_64-20191114.cgz/x=
86_64-rhel-7.6/gcc-7/e2426e392c2bc6b04c2f34692ac89cd6db73246c/0/stats.json
 =C2=A0 "dmesg.WARNING:at_lib/list_debug.c:#__list_del_entry_valid": 1,
 =C2=A0 "dmesg.RIP:__list_del_entry_valid": 1,
"dmesg.timestamp:WARNING:at_lib/list_debug.c:#__list_del_entry_valid": =

47.272766,
 =C2=A0 "dmesg.timestamp:RIP:__list_del_entry_valid": 47.357776,

Best Regards,
Rong Chen

On 3/13/20 3:23 PM, Alex Shi wrote:
> hi Rong,
>
> I found a bug in much more early commit: mm/memcg: fold lock_page_lru int=
o commit_charge
>
> Now it was fixed on https://github.com/alexshi/linux.git lrunext
> Hope all testing fine for this bug!
>
> Thanks
> Alex
>
> =E5=9C=A8 2020/3/12 =E4=B8=8B=E5=8D=884:15, Rong Chen =E5=86=99=E9=81=93:
>> On 3/11/20 2:43 PM, Alex Shi wrote:
>>> =E5=9C=A8 2020/3/11 =E4=B8=8B=E5=8D=8812:54, Rong Chen =E5=86=99=E9=81=
=93:
>>>> Hi Alex,
>>>>
>>>> The head commit build failed:
>>>>
>>>> commit: d7e47ad94d8637480dde9caee0e7f97ab7b13c8f
>>>> status: FAIL: build error
>>>> build_errors: | 1
>>>>  =C2=A0=C2=A0 mm/mlock.c:325:35: error: 'struct pglist_data' has no me=
mber named 'lru_lock'
>>> Ops, the problem resolved in new lrunext-nothpnarrow, which just after =
bug found half of hour.
>>>
>>> Guess, 0day just sync tree in that narrow slot. :)
>>>
>>> it should be fine.
>> Hi Alex,
>>
>> The problem is still exist in the head of lrunext-nothpnarrow.
>>
>> rongc(a)inn =E2=9E=9C=C2=A0 ~ grep list_del_entry_valid /result/pm-qa/th=
ermal-ucode=3D0x27/lkp-hsw-d02/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/g=
cc-7/6960537717b924acbc580b31a0162a33f528dfa1/0/stats.json
>>  =C2=A0 "dmesg.WARNING:at_lib/list_debug.c:#__list_del_entry_valid": 1,
>>  =C2=A0 "dmesg.RIP:__list_del_entry_valid": 1,
>> "dmesg.timestamp:WARNING:at_lib/list_debug.c:#__list_del_entry_valid": 1=
45.358488,
>>  =C2=A0 "dmesg.timestamp:RIP:__list_del_entry_valid": 145.443816,
>>
>> Best Regards,
>> Rong Chen

--===============3411918496160723159==--

