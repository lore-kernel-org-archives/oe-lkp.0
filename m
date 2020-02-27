Content-Type: multipart/mixed; boundary="===============0164947045001911363=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] f6183ef98b: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Thu, 27 Feb 2020 13:25:27 +0800
Message-ID: <f3353fb7-381f-0c8a-b4cf-87d039debe2c@intel.com>
In-Reply-To: <20200226083327.GC3818@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0164947045001911363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/26/20 4:33 PM, Mel Gorman wrote:
> On Wed, Feb 26, 2020 at 09:03:26AM +0100, Vincent Guittot wrote:
>> Hi Rong,
>>
>> On Wed, 26 Feb 2020 at 02:33, kernel test robot <rong.a.chen@intel.com=
> wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -25.0% regression of phoronix-test-suite.aom-av1.0.fr=
ames_per_second due to commit:
>>>
>>>
>>> commit: f6183ef98bba39a5de563d4ab4bc889ff2b600d7 ("sched/numa: replace =
runnable_load_avg by load_avg")
>>> https://git.kernel.org/cgit/linux/kernel/git/mel/linux.git sched-lbnuma=
-rewrite-v2r6
>> The following patches in the branch recover the perf regression. Do
>> you see regression on the whole branch ?
>>
> If not, include "sched/fair: fix statistics for find_idlest_group" on top,
> particularly if the workload is configured to use threads >=3D nr_cpus.
>

Hi Gorman,

The regression is still exist on commit "sched/fair: fix statistics for =

find_idlest_group".

$ git log --oneline -2 db79824c2038adc60526970552242420386ed5e2
db79824c2038a sched/fair: fix statistics for find_idlest_group()
b92430cf87ebb sched/numa: Stop an exhastive search if a reasonable swap =

candidate or idle CPU is found

/result/phoronix-test-suite/performance-aom-av1-1.2.0-ucode=3D0x1d/lkp-nhm-=
2ep1/debian-x86_64-phoronix/x86_64-rhel-7.6/gcc-7/db79824c2038adc6052697055=
2242420386ed5e2/0/stats.json: =

"phoronix-test-suite.aom-av1.0.frames_per_second": 0.03,
/result/phoronix-test-suite/performance-aom-av1-1.2.0-ucode=3D0x1d/lkp-nhm-=
2ep1/debian-x86_64-phoronix/x86_64-rhel-7.6/gcc-7/db79824c2038adc6052697055=
2242420386ed5e2/1/stats.json: =

"phoronix-test-suite.aom-av1.0.frames_per_second": 0.03,
/result/phoronix-test-suite/performance-aom-av1-1.2.0-ucode=3D0x1d/lkp-nhm-=
2ep1/debian-x86_64-phoronix/x86_64-rhel-7.6/gcc-7/db79824c2038adc6052697055=
2242420386ed5e2/2/stats.json: =

"phoronix-test-suite.aom-av1.0.frames_per_second": 0.03,

Best Regards,
Rong Chen
--===============0164947045001911363==--

