Content-Type: multipart/mixed; boundary="===============8612273364865011987=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lru] 44c86dfabf: fio.read_iops -11.8% regression
Date: Fri, 25 Sep 2020 09:28:46 +0800
Message-ID: <24e85d18-6568-32b5-5c39-658e3b965fc7@intel.com>
In-Reply-To: <c006d875-73e6-cb87-4662-eeb56809eefe@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8612273364865011987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I have confirmed that set 'cgroup_disable=3Dmemory' can recover the =

performance.

Best Regards,
Rong Chen

On 9/24/2020 7:24 AM, Alex Shi wrote:
> Hi Rong,
> =

> Thanks a lot for testing!
> =

> What I found is the result could be recovered if disabled the memcg by cm=
dline 'cgroup_disable=3Dmemory' on the same commit/kernel
> Is this applicable in your side?
> =

> Thanks
> Alex
> =

> =E5=9C=A8 2020/9/23 =E4=B8=8B=E5=8D=885:15, kernel test robot =E5=86=99=
=E9=81=93:
>> Greeting,
>>
>> FYI, we noticed a -11.8% regression of fio.read_iops due to commit:
>>
>>
>> commit: 44c86dfabfbbb310b5135c0e8b66b193b9d7e896 ("mm/lru: replace pgdat=
 lru_lock with lruvec lock")
>> https://github.com/alexshi/linux.git lruv19.5
--===============8612273364865011987==--

