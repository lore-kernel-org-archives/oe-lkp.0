Content-Type: multipart/mixed; boundary="===============7299979993763455243=="
MIME-Version: 1.0
From: Joonsoo Kim <js1304@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm/cma] 2b0f904a5a: fio.read_bw_MBps -16.1% regression
Date: Mon, 23 Apr 2018 15:39:08 +0900
Message-ID: <CAAmzW4OnpiBPWeKQtL4txbTU7PwYVEc=GAGTsiJRebTojY8uRQ@mail.gmail.com>
In-Reply-To: <20180413011805.GA28839@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7299979993763455243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2018-04-13 10:18 GMT+09:00 Ye Xiaolong <xiaolong.ye@intel.com>:
> On 04/12, Joonsoo Kim wrote:
>>
>>Really thanks for testing!
>>
>>Could you give me /proc/zoneinfo dumped before/after this test
>>for all these three commits?
>
> zoneinfo files for these three commits attached. Sample interval is 10s.

Really thanks for giving the info.

During last week, I studied hard on this problem and found a culprit.
Your report showed that there was some big changes on allocator's numa stat.
It seems that it's caused by classzone_idx.

Assume the following setup that is the same with your machine.
Assume that my patch is applied so there is a movable zone on Node1.

Node0
DMA
DMA32
Normal

Node1
Normal
Movable

classzone_idx of GFP_HIGHUSER_MOVABLE allocation happened on node0
will be 2 and classzone_idx of the same allocation happend on node1 will be=
 3.
So, different lowmem_reserve is applied to them and it causes bad numa
effects in allocator.

I can't think a perfect solution now but following patch that removes
lowmem_reserve
for ZONE_MOVABLE will remove bad numa effect to your machine setup.

I'm not sure whether performance will be restored or not by this patch, how=
ever,
at least, bad numa stat will be disappeared. (I observed in my test!!!)

Could you test it?

https://github.com/JoonsooKim/linux.git cma-fixup-thp-next-20180403

Related commits are:
2f54bc6 mm/page_alloc: workaround for node balance issue during allocation
f11152b mm/thp: don't count ZONE_MOVABLE as the target for freepage reservi=
ng
b2adb03 Revert "Revert "mm/cma: manage the memory of the CMA area by
using the ZONE_MOVABLE""
76148e2 Revert "Revert "mm/page_alloc: don't reserve ZONE_HIGHMEM for
ZONE_MOVABLE request""

Base commit is '76148e2' and this regression happens on 'b2adb03'.
Fix is commit 'f11152b' and '2f54bc6'.

Please also give me vmstat and zoneinfo. (before/after the test)


There is another regression report from mainline related to this patch since
this patch is merged to mainline.

http://lkml.kernel.org/r/<20180418010753.GA20825@yexl-desktop>
[lkp-robot] [mm/cma] a57a290bd3: vm-scalability.throughput -15.5% regression

If above fixes works, could you test above regression on the mainline
kernel with
'2f54bc6 mm/page_alloc: workaround for node balance issue during allocation=
'?
commit 'f11152b mm/thp: don't count ZONE_MOVABLE as the target for
freepage reserving'
is already merged into mainline so only commit 2f54bc6 will be needed.

Thanks.

--===============7299979993763455243==--

