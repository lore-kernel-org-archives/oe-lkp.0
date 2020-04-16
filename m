Content-Type: multipart/mixed; boundary="===============1352303242131104475=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] b1b4705d54: filebench.sum_bytes_mb/s -20.2% regression
Date: Thu, 16 Apr 2020 13:48:11 +0800
Message-ID: <3dbd1c40-00d5-5e3e-f864-cb9abe30a7fa@linux.intel.com>
In-Reply-To: <20200415083954.GD501@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1352303242131104475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/15/2020 4:39 PM, Jan Kara wrote:
> On Wed 15-04-20 15:55:09, Xing Zhengjun wrote:
>>
>>
>> On 3/25/2020 10:31 PM, Jan Kara wrote:
>>> On Wed 25-03-20 13:50:09, Xing Zhengjun wrote:
>>>> ping...
>>>> The issue still exists in v5.6-rc7.
>>>
>>> So I have tried again to reproduce this so that I can look into the
>>> regression. When observing what is actually happening in the system I h=
ave
>>> to say that this workfile (or actually its implementation in filebench)=
 is
>>> pretty dubious. The problem is that filebench first creates the files by
>>> writing them through ordinary write(2). Then it immediately starts read=
ing
>>> the files with direct IO read. So what happens is that by the time dire=
ct
>>> IO read is running, the system is still writing back the create files a=
nd
>>> depending on how read vs writes get scheduled, you get different result=
s.
>>> Also direct IO read will first flush the range it is going to read from=
 the
>>> page cache so to some extent this is actually parallel small ranged
>>> fsync(2) benchmark. Finally differences in how we achieve integrity of
>>> direct IO reads with dirty page cache are going to impact this benchmar=
k.
>>>
>>
>> Sounds reasonable!  Thanks for the clarification!
>>
>>> So overall can now see why this commit makes a difference but the workl=
oad
>>> is IMHO largely irrelevant. What would make sense is to run filebench o=
nce,
>>> then unmount & mount the fs to force files to disk and clear page cache=
 and
>>> then run it again. Filebench will reuse the files in this case and then
>>> parallel direct IO readers without page cache are a sensible workload. =
But
>>> I didn't see any difference in that (even with rotating disk) on my
>>> machines.
>>>
>> We do a test per your suggestion, run "filebench" once during setup stag=
e,
>> then do a "sync",  after that run "filebench" again, from the attached t=
est
>> result "compare", "filebench.sum_bytes_mb/s" regression is disappeared.
> =

> Cool. Thanks for improving the testcase! I'd just note that if you only do
> sync(2) between the setup and benchmark phase, you'll still have files
> cached in the page cache and so direct IO will go through the slow path
> when it has to evict pages from the page cache. The standard (and optimiz=
ed
> for) situation for direct IO is that there is no page cache for the files
> direct IO is performed to. That's why I suggested remounting the
> filesystem, not just calling sync(2)...
>

Thanks. We will keep improving the test case and try to make sure there =

is no page cache for the files direct IO is performed to.

> 								Honza
> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> tbox_group/testcase/rootfs/kconfig/compiler/debug-setup/disk/fs/test/cpu=
freq_governor/ucode:
>>    lkp-hsw-d01/filebench/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-=
7/test2/1HDD/ext4/fivestreamreaddirect.f/performance/0x27
>>
>> commit:
>>    b1b4705d54abedfd69dcdf42779c521aa1e0fbd3
>>    09edf4d381957b144440bac18a4769c53063b943
>>    v5.5
>>    v5.7-rc1
>>
>> b1b4705d54abedfd 09edf4d381957b144440bac18a4                        v5.5=
                    v5.7-rc1
>> ---------------- --------------------------- ---------------------------=
 ---------------------------
>>           %stddev     %change         %stddev     %change         %stdde=
v     %change         %stddev
>>               \          |                \          |                \ =
         |                \
>>       59.40            +0.0%      59.40            -0.8%      58.93     =
       -1.0%      58.80        filebench.sum_bytes_mb/s
>>        3570            +0.0%       3570            -0.8%       3541     =
       -1.0%       3533        filebench.sum_operations
>>       59.50            +0.0%      59.50            -0.8%      59.02     =
       -1.0%      58.89        filebench.sum_operations/s
>>       59.33            +0.0%      59.33            +0.0%      59.33     =
       -0.6%      59.00        filebench.sum_reads/s
>>       83.98            -1.5%      82.75            +0.8%      84.62     =
       +1.0%      84.84        filebench.sum_time_ms/op
> =


-- =

Zhengjun Xing
--===============1352303242131104475==--

