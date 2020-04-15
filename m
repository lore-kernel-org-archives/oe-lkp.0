Content-Type: multipart/mixed; boundary="===============6548902656721309957=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] b1b4705d54: filebench.sum_bytes_mb/s -20.2% regression
Date: Wed, 15 Apr 2020 15:55:09 +0800
Message-ID: <309baa89-9f69-0545-946e-4b3624f83e60@linux.intel.com>
In-Reply-To: <20200325143102.GJ28951@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6548902656721309957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/25/2020 10:31 PM, Jan Kara wrote:
> On Wed 25-03-20 13:50:09, Xing Zhengjun wrote:
>> ping...
>> The issue still exists in v5.6-rc7.
> =

> So I have tried again to reproduce this so that I can look into the
> regression. When observing what is actually happening in the system I have
> to say that this workfile (or actually its implementation in filebench) is
> pretty dubious. The problem is that filebench first creates the files by
> writing them through ordinary write(2). Then it immediately starts reading
> the files with direct IO read. So what happens is that by the time direct
> IO read is running, the system is still writing back the create files and
> depending on how read vs writes get scheduled, you get different results.
> Also direct IO read will first flush the range it is going to read from t=
he
> page cache so to some extent this is actually parallel small ranged
> fsync(2) benchmark. Finally differences in how we achieve integrity of
> direct IO reads with dirty page cache are going to impact this benchmark.
> =


Sounds reasonable!  Thanks for the clarification!

> So overall can now see why this commit makes a difference but the workload
> is IMHO largely irrelevant. What would make sense is to run filebench onc=
e,
> then unmount & mount the fs to force files to disk and clear page cache a=
nd
> then run it again. Filebench will reuse the files in this case and then
> parallel direct IO readers without page cache are a sensible workload. But
> I didn't see any difference in that (even with rotating disk) on my
> machines.
> =

We do a test per your suggestion, run "filebench" once during setup =

stage, then do a "sync",  after that run "filebench" again, from the =

attached test result "compare", "filebench.sum_bytes_mb/s" regression is =

disappeared.

> 								Honza
>>
>> On 3/4/2020 4:15 PM, Xing Zhengjun wrote:
>>> Hi Matthew,
>>>
>>>   =C2=A0We test it in v5.6-rc4, the issue still exist, do you have time=
 to
>>> take a look at this? Thanks.
>>>
>>> On 1/8/2020 10:31 AM, Rong Chen wrote:
>>>>
>>>>
>>>> On 1/8/20 1:28 AM, Jan Kara wrote:
>>>>> On Tue 07-01-20 11:57:08, Theodore Y. Ts'o wrote:
>>>>>> On Tue, Jan 07, 2020 at 02:41:06PM +0100, Jan Kara wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> On Tue 24-12-19 08:59:15, kernel test robot wrote:
>>>>>>>> FYI, we noticed a -20.2% regression of
>>>>>>>> filebench.sum_bytes_mb/s due to commit:
>>>>>>>>
>>>>>>>>
>>>>>>>> commit: b1b4705d54abedfd69dcdf42779c521aa1e0fbd3
>>>>>>>> ("ext4: introduce direct I/O read using iomap
>>>>>>>> infrastructure")
>>>>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
>>>>>>>> master
>>>>>>>>
>>>>>>>> in testcase: filebench
>>>>>>>> on test machine: 8 threads Intel(R) Core(TM) i7-4770
>>>>>>>> CPU @ 3.40GHz with 8G memory
>>>>>>>> with following parameters:
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0fs: ext4
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0test: fivestreamreaddirect.f
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x27
>>>>>>> I was trying to reproduce this but I failed with my test
>>>>>>> VM. I had SATA SSD
>>>>>>> as a backing store though so maybe that's what makes a
>>>>>>> difference. Maybe
>>>>>>> the new code results in somewhat more seeks because the
>>>>>>> five threads which
>>>>>>> compete in submitting sequential IO end up being more interleaved?
>>>>>> A "-20.2% regression" should be read as a "20.2% performance
>>>>>> improvement" is zero-day kernel speak.
>>>>> Are you sure? I can see:
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 58.30 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=
=A0=C2=A0 -20.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46.53=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 filebench.sum_bytes_mb/s
>>>>>
>>>>> which implies to me previously the throughput was 58 MB/s and after t=
he
>>>>> commit it was 46 MB/s?
>>>>>
>>>>> Anyway, in my testing that commit made no difference in that benchmark
>>>>> whasoever (getting around 97 MB/s for each thread before and after the
>>>>> commit).
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Honza
>>>>
>>>> We're sorry for the misunderstanding, "-20.2%" means the change of
>>>> filebench.sum_bytes_mb/s,
>>>> "regression" means the explanation of this change from LKP.
>>>>
>>>> Best Regards,
>>>> Rong Chen
>>>> _______________________________________________
>>>> LKP mailing list -- lkp(a)lists.01.org
>>>> To unsubscribe send an email to lkp-leave(a)lists.01.org
>>>
>>
>> -- =

>> Zhengjun Xing

-- =

Zhengjun Xing

--===============6548902656721309957==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="compare.ksh"

PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KdGJveF9ncm91cC90ZXN0Y2FzZS9yb290
ZnMva2NvbmZpZy9jb21waWxlci9kZWJ1Zy1zZXR1cC9kaXNrL2ZzL3Rlc3QvY3B1ZnJlcV9nb3Zl
cm5vci91Y29kZToKICBsa3AtaHN3LWQwMS9maWxlYmVuY2gvZGViaWFuLXg4Nl82NC0yMDE5MTEx
NC5jZ3oveDg2XzY0LXJoZWwtNy42L2djYy03L3Rlc3QyLzFIREQvZXh0NC9maXZlc3RyZWFtcmVh
ZGRpcmVjdC5mL3BlcmZvcm1hbmNlLzB4MjcKCmNvbW1pdDogCiAgYjFiNDcwNWQ1NGFiZWRmZDY5
ZGNkZjQyNzc5YzUyMWFhMWUwZmJkMwogIDA5ZWRmNGQzODE5NTdiMTQ0NDQwYmFjMThhNDc2OWM1
MzA2M2I5NDMKICB2NS41CiAgdjUuNy1yYzEKCmIxYjQ3MDVkNTRhYmVkZmQgMDllZGY0ZDM4MTk1
N2IxNDQ0NDBiYWMxOGE0ICAgICAgICAgICAgICAgICAgICAgICAgdjUuNSAgICAgICAgICAgICAg
ICAgICAgdjUuNy1yYzEgCi0tLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0gCiAgICAgICAgICVzdGRkZXYgICAgICVjaGFuZ2UgICAgICAgICAlc3RkZGV2ICAgICAlY2hh
bmdlICAgICAgICAgJXN0ZGRldiAgICAgJWNoYW5nZSAgICAgICAgICVzdGRkZXYKICAgICAgICAg
ICAgIFwgICAgICAgICAgfCAgICAgICAgICAgICAgICBcICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgXCAgICAgICAgICB8ICAgICAgICAgICAgICAgIFwgIAogICAgIDU5LjQwICAgICAgICAgICAg
KzAuMCUgICAgICA1OS40MCAgICAgICAgICAgIC0wLjglICAgICAgNTguOTMgICAgICAgICAgICAt
MS4wJSAgICAgIDU4LjgwICAgICAgICBmaWxlYmVuY2guc3VtX2J5dGVzX21iL3MKICAgICAgMzU3
MCAgICAgICAgICAgICswLjAlICAgICAgIDM1NzAgICAgICAgICAgICAtMC44JSAgICAgICAzNTQx
ICAgICAgICAgICAgLTEuMCUgICAgICAgMzUzMyAgICAgICAgZmlsZWJlbmNoLnN1bV9vcGVyYXRp
b25zCiAgICAgNTkuNTAgICAgICAgICAgICArMC4wJSAgICAgIDU5LjUwICAgICAgICAgICAgLTAu
OCUgICAgICA1OS4wMiAgICAgICAgICAgIC0xLjAlICAgICAgNTguODkgICAgICAgIGZpbGViZW5j
aC5zdW1fb3BlcmF0aW9ucy9zCiAgICAgNTkuMzMgICAgICAgICAgICArMC4wJSAgICAgIDU5LjMz
ICAgICAgICAgICAgKzAuMCUgICAgICA1OS4zMyAgICAgICAgICAgIC0wLjYlICAgICAgNTkuMDAg
ICAgICAgIGZpbGViZW5jaC5zdW1fcmVhZHMvcwogICAgIDgzLjk4ICAgICAgICAgICAgLTEuNSUg
ICAgICA4Mi43NSAgICAgICAgICAgICswLjglICAgICAgODQuNjIgICAgICAgICAgICArMS4wJSAg
ICAgIDg0Ljg0ICAgICAgICBmaWxlYmVuY2guc3VtX3RpbWVfbXMvb3AK

--===============6548902656721309957==--

