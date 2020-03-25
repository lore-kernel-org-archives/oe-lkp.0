Content-Type: multipart/mixed; boundary="===============1711519332146096919=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] b1b4705d54: filebench.sum_bytes_mb/s -20.2% regression
Date: Wed, 25 Mar 2020 13:50:09 +0800
Message-ID: <49a59199-53af-206f-d07c-5c8c45f498b3@linux.intel.com>
In-Reply-To: <7ec6b078-7b09-fb87-8ad2-a328e96c5bf9@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1711519332146096919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ping...
The issue still exists in v5.6-rc7.

On 3/4/2020 4:15 PM, Xing Zhengjun wrote:
> Hi Matthew,
> =

>  =C2=A0We test it in v5.6-rc4, the issue still exist, do you have time to =

> take a look at this? Thanks.
> =

> On 1/8/2020 10:31 AM, Rong Chen wrote:
>>
>>
>> On 1/8/20 1:28 AM, Jan Kara wrote:
>>> On Tue 07-01-20 11:57:08, Theodore Y. Ts'o wrote:
>>>> On Tue, Jan 07, 2020 at 02:41:06PM +0100, Jan Kara wrote:
>>>>> Hello,
>>>>>
>>>>> On Tue 24-12-19 08:59:15, kernel test robot wrote:
>>>>>> FYI, we noticed a -20.2% regression of filebench.sum_bytes_mb/s =

>>>>>> due to commit:
>>>>>>
>>>>>>
>>>>>> commit: b1b4705d54abedfd69dcdf42779c521aa1e0fbd3 ("ext4: introduce =

>>>>>> direct I/O read using iomap infrastructure")
>>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git =

>>>>>> master
>>>>>>
>>>>>> in testcase: filebench
>>>>>> on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz =

>>>>>> with 8G memory
>>>>>> with following parameters:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0fs: ext4
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0test: fivestreamreaddirect.f
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x27
>>>>> I was trying to reproduce this but I failed with my test VM. I had =

>>>>> SATA SSD
>>>>> as a backing store though so maybe that's what makes a difference. =

>>>>> Maybe
>>>>> the new code results in somewhat more seeks because the five =

>>>>> threads which
>>>>> compete in submitting sequential IO end up being more interleaved?
>>>> A "-20.2% regression" should be read as a "20.2% performance
>>>> improvement" is zero-day kernel speak.
>>> Are you sure? I can see:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 58.30 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0 -20.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46.53=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 filebench.sum_bytes_mb/s
>>>
>>> which implies to me previously the throughput was 58 MB/s and after the
>>> commit it was 46 MB/s?
>>>
>>> Anyway, in my testing that commit made no difference in that benchmark
>>> whasoever (getting around 97 MB/s for each thread before and after the
>>> commit).
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Honza
>>
>> We're sorry for the misunderstanding, "-20.2%" means the change of =

>> filebench.sum_bytes_mb/s,
>> "regression" means the explanation of this change from LKP.
>>
>> Best Regards,
>> Rong Chen
>> _______________________________________________
>> LKP mailing list -- lkp(a)lists.01.org
>> To unsubscribe send an email to lkp-leave(a)lists.01.org
> =


-- =

Zhengjun Xing
--===============1711519332146096919==--

