Content-Type: multipart/mixed; boundary="===============6024598583721639161=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, mlock, vmscan] 9c4e6b1a70: stress-ng.hdd.ops_per_sec -7.9% regression
Date: Mon, 26 Feb 2018 10:57:28 +0800
Message-ID: <20180226025728.GA8942@yexl-desktop>
In-Reply-To: <CALvZod7=kgWDMPbrDUGXznoJgv47fq-PUa97onVhS8x73TR+6g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6024598583721639161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Shakeel =


On 02/25, Shakeel Butt wrote:
>On Sun, Feb 25, 2018 at 6:44 AM, kernel test robot
><xiaolong.ye@intel.com> wrote:
>>
>> Greeting,
>>
>> FYI, we noticed a -7.9% regression of stress-ng.hdd.ops_per_sec due to c=
ommit:
>>
>>
>> commit: 9c4e6b1a7027f102990c0395296015a812525f4d ("mm, mlock, vmscan: no=
 more skipping pagevecs")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: stress-ng
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 128G memory
>> with following parameters:
>>
>
>Hi Xiaolong,
>
>Is there a way I can get the output of "perf record -a -g" running in
>parallel to the actual test on this machine. As I have mentioned
>before I am not able to reproduce this issue. However I am trying to
>repro on a VM with 4 vcpus and 4 GiB memory and I don't see any
>difference. I am suspecting that it may repro on a larger machine but
>I don't have access to one.
>

perf.data attached. It was generated via `perf record -q -ag --realtime=3D1=
 -m 256`

Thanks,
Xiaolong

>thanks,
>Shakeel

--===============6024598583721639161==--

