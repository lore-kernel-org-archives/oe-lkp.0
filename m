Content-Type: multipart/mixed; boundary="===============1000031747613082124=="
MIME-Version: 1.0
From: Joonsoo Kim <js1304@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm/cma] 2b0f904a5a: fio.read_bw_MBps -16.1% regression
Date: Thu, 12 Apr 2018 10:26:14 +0900
Message-ID: <CAAmzW4OuKz0t5iCNeqmUHkf41Jky+9J5UU-ra-4f2QFPMvWkOw@mail.gmail.com>
In-Reply-To: <20180412011235.GH17893@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1000031747613082124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2018-04-12 10:12 GMT+09:00 Ye Xiaolong <xiaolong.ye@intel.com>:
> On 04/09, Joonsoo Kim wrote:
>>2018-04-09 14:56 GMT+09:00 Ye Xiaolong <xiaolong.ye@intel.com>:
>>> On 04/05, Joonsoo Kim wrote:
>>>>I may find the reason of this regression. Could you test this patch on
>>>>top of this patchset?
>>>>
>>>>http://lkml.kernel.org/r/<1522913236-15776-1-git-send-email-iamjoonsoo.=
kim@lge.com>
>>>
>>> It'd be better if you can provide your repo for this fix patch, it's mo=
re
>>> convenient for 0day to verify it.
>>
>>Okay! Could you check following git tree and branch to fix the
>>reported regression?
>>
>>https://github.com/JoonsooKim/linux.git cma-fixup-thp-next-20180403
>>
>>Related commits are:
>>f11152b mm/thp: don't count ZONE_MOVABLE as the target for freepage reser=
ving
>>b2adb03 Revert "Revert "mm/cma: manage the memory of the CMA area by
>>using the ZONE_MOVABLE""
>>76148e2 Revert "Revert "mm/page_alloc: don't reserve ZONE_HIGHMEM for
>>ZONE_MOVABLE request""
>>
>>Base commit is '76148e2' and this regression happens on 'b2adb03'.
>>Fix is commit 'f11152b'.
>
> Sorry for the late, below is the comparison of commit f6572f9cd248df2c, 2=
b0f904a5a,
> and fix commit f11152b, seems it doesn't help to recover the performance.

Really thanks for testing!

Could you give me /proc/zoneinfo dumped before/after this test
for all these three commits?

Thanks.

--===============1000031747613082124==--

