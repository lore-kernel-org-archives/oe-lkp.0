Content-Type: multipart/mixed; boundary="===============5579069305476115734=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] c8eaeac7b7: aim7.jobs-per-min -11.7% regression
Date: Fri, 21 Jun 2019 08:48:03 +0800
Message-ID: <877e9fahmk.fsf@yhuang-dev.intel.com>
In-Reply-To: <87v9xdymdg.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5579069305476115734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Huang, Ying" <ying.huang@intel.com> writes:

> "Huang, Ying" <ying.huang@intel.com> writes:
>
>> Hi, Josef,
>>
>> kernel test robot <rong.a.chen@intel.com> writes:
>>
>>> Greeting,
>>>
>>> FYI, we noticed a -11.7% regression of aim7.jobs-per-min due to commit:
>>>
>>>
>>> commit: c8eaeac7b734347c3afba7008b7af62f37b9c140 ("btrfs: reserve
>>> delalloc metadata differently")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>> in testcase: aim7
>>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz w=
ith 384G memory
>>> with following parameters:
>>>
>>> 	disk: 4BRD_12G
>>> 	md: RAID0
>>> 	fs: btrfs
>>> 	test: disk_rr
>>> 	load: 1500
>>> 	cpufreq_governor: performance
>>>
>>> test-description: AIM7 is a traditional UNIX system level benchmark
>>> suite which is used to test and measure the performance of multiuser
>>> system.
>>> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
>>
>> Here's another regression, do you have time to take a look at this?
>
> Ping

Ping again ...

Best Regards,
Huang, Ying

--===============5579069305476115734==--

