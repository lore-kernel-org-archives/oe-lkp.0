Content-Type: multipart/mixed; boundary="===============7871013749547133185=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lru] b8e7130188: WARNING:at_lib/list_debug.c:#__list_del_entry_valid
Date: Thu, 12 Mar 2020 16:15:04 +0800
Message-ID: <90227eeb-a0dc-6405-3b1e-96d91abe8d1d@intel.com>
In-Reply-To: <312e5796-ad8f-1d25-4e7d-d4ba314b72a8@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7871013749547133185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/11/20 2:43 PM, Alex Shi wrote:
>
> =E5=9C=A8 2020/3/11 =E4=B8=8B=E5=8D=8812:54, Rong Chen =E5=86=99=E9=81=93:
>> Hi Alex,
>>
>> The head commit build failed:
>>
>> commit: d7e47ad94d8637480dde9caee0e7f97ab7b13c8f
>> status: FAIL: build error
>> build_errors: | 1
>>  =C2=A0 mm/mlock.c:325:35: error: 'struct pglist_data' has no member nam=
ed 'lru_lock'
> Ops, the problem resolved in new lrunext-nothpnarrow, which just after bu=
g found half of hour.
>
> Guess, 0day just sync tree in that narrow slot. :)
>
> it should be fine.

Hi Alex,

The problem is still exist in the head of lrunext-nothpnarrow.

rongc(a)inn =E2=9E=9C=C2=A0 ~ grep list_del_entry_valid =

/result/pm-qa/thermal-ucode=3D0x27/lkp-hsw-d02/debian-x86_64-20191114.cgz/x=
86_64-rhel-7.6/gcc-7/6960537717b924acbc580b31a0162a33f528dfa1/0/stats.json
 =C2=A0 "dmesg.WARNING:at_lib/list_debug.c:#__list_del_entry_valid": 1,
 =C2=A0 "dmesg.RIP:__list_del_entry_valid": 1,
"dmesg.timestamp:WARNING:at_lib/list_debug.c:#__list_del_entry_valid": =

145.358488,
 =C2=A0 "dmesg.timestamp:RIP:__list_del_entry_valid": 145.443816,

Best Regards,
Rong Chen

--===============7871013749547133185==--

