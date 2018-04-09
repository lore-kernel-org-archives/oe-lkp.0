Content-Type: multipart/mixed; boundary="===============7478728233996083723=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm/cma] 2b0f904a5a: fio.read_bw_MBps -16.1% regression
Date: Mon, 09 Apr 2018 15:40:49 +0800
Message-ID: <20180409074049.GE27349@yexl-desktop>
In-Reply-To: <CAAmzW4MHjvDrDdoeSf3imjRboCA+Z4yTaDF=WsS3vsjYUCiVUw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7478728233996083723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/09, Joonsoo Kim wrote:
>2018-04-09 14:56 GMT+09:00 Ye Xiaolong <xiaolong.ye@intel.com>:
>> On 04/05, Joonsoo Kim wrote:
>>>I may find the reason of this regression. Could you test this patch on
>>>top of this patchset?
>>>
>>>http://lkml.kernel.org/r/<1522913236-15776-1-git-send-email-iamjoonsoo.k=
im@lge.com>
>>
>> It'd be better if you can provide your repo for this fix patch, it's more
>> convenient for 0day to verify it.
>
>Okay! Could you check following git tree and branch to fix the
>reported regression?
>
>https://github.com/JoonsooKim/linux.git cma-fixup-thp-next-20180403
>
>Related commits are:
>f11152b mm/thp: don't count ZONE_MOVABLE as the target for freepage reserv=
ing
>b2adb03 Revert "Revert "mm/cma: manage the memory of the CMA area by
>using the ZONE_MOVABLE""
>76148e2 Revert "Revert "mm/page_alloc: don't reserve ZONE_HIGHMEM for
>ZONE_MOVABLE request""
>
>Base commit is '76148e2' and this regression happens on 'b2adb03'.
>Fix is commit 'f11152b'.

Thanks for you feedback, we'll provide the test result later.

Thanks,
Xiaolong
>
>Thanks.

--===============7478728233996083723==--

