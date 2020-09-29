Content-Type: multipart/mixed; boundary="===============4236469784338624203=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lru] 5197ae4fa3: fio.read_iops -19.7% regression
Date: Tue, 29 Sep 2020 13:01:19 +0800
Message-ID: <238367b3-04f9-74c7-8d81-2c2b28616ddc@intel.com>
In-Reply-To: <b0e9fa63-67d0-e385-93f6-72193829c3dd@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4236469784338624203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 9/29/20 11:58 AM, Alex Shi wrote:
>
> =E5=9C=A8 2020/9/29 =E4=B8=8A=E5=8D=8811:22, kernel test robot =E5=86=99=
=E9=81=93:
>> Greeting,
>>
>> FYI, we noticed a -19.7% regression of fio.read_iops due to commit:
>>
>>
>> commit: 5197ae4fa35ed35a089576dd8da29421b5144ec4 ("mm/lru: replace pgdat=
 lru_lock with lruvec lock")
>> https://github.com/alexshi/linux.git lruv19.8
> Thanks a lot for testing! and the result is much valuable for me.
>
> But the lruv19.8 branch was deleted from my tree and replaced with lruv19=
, so
> guess if the testing could double the original tree before a time cost pe=
rformance testing.
> That could save some time. Is that right? :)
yes, you are right.

Best Regards,
Rong Chen

--===============4236469784338624203==--

