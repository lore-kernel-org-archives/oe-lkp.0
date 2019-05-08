Content-Type: multipart/mixed; boundary="===============5547091740501601479=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 302167c50b: fio.write_bw_MBps -12.4% regression
Date: Wed, 08 May 2019 15:56:59 +0800
Message-ID: <87o94dl6pg.fsf@yhuang-dev.intel.com>
In-Reply-To: <87h8alqong.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5547091740501601479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Huang, Ying" <ying.huang@intel.com> writes:

> Hi, Josef,
>
> kernel test robot <rong.a.chen@intel.com> writes:
>
>> Greeting,
>>
>> FYI, we noticed a -12.4% regression of fio.write_bw_MBps due to commit:
>>
>>
>> commit: 302167c50b32e7fccc98994a91d40ddbbab04e52 ("btrfs: don't end the =
transaction for delayed refs in throttle")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git pending=
-fixes
>>
>> in testcase: fio-basic
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 64G memory
>> with following parameters:
>>
>> 	runtime: 300s
>> 	nr_task: 8t
>> 	disk: 1SSD
>> 	fs: btrfs
>> 	rw: randwrite
>> 	bs: 4k
>> 	ioengine: sync
>> 	test_size: 400g
>> 	cpufreq_governor: performance
>> 	ucode: 0xb00002e
>>
>> test-description: Fio is a tool that will spawn a number of threads or p=
rocesses doing a particular type of I/O action as specified by the user.
>> test-url: https://github.com/axboe/fio
>>
>>
>
> Do you have time to take a look at this regression?

Ping

Best Regards,
Huang, Ying

--===============5547091740501601479==--

