Content-Type: multipart/mixed; boundary="===============8639622308685414913=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 20:58:01 +0800
Message-ID: <20160815125801.GA21083@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+55aFwYcjXn7kpLFWQ=jF0sSrhEfZhqNsjR+6O89OOH9qRNOw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8639622308685414913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 11:03:33AM -0700, Linus Torvalds wrote:
>On Thu, Aug 11, 2016 at 8:56 PM, Dave Chinner <david@fromorbit.com> wrot=
e:
>> On Thu, Aug 11, 2016 at 07:27:52PM -0700, Linus Torvalds wrote:
>>>
>>> I don't recall having ever seen the mapping tree_lock as a contention
>>> point before, but it's not like I've tried that load either. So it
>>> might be a regression (going back long, I suspect), or just an unusual
>>> load that nobody has traditionally tested much.
>>>
>>> Single-threaded big file write one page at a time, was it?
>>
>> Yup. On a 4 node NUMA system.
>
>Ok, I can't see any real contention on my single-node workstation
>(running ext4 too, so there may be filesystem differences), but I
>guess that shouldn't surprise me. The cacheline bouncing just isn't
>expensive enough when it all stays on-die.
>
>I can see the tree_lock in my profiles (just not very high), and at
>least for ext4 the main caller ssems to be
>__set_page_dirty_nobuffers().
>
>And yes, looking at that, the biggest cost by _far_ inside the
>spinlock seems to be the accounting.
>
>Which doesn't even have to be inside the mapping lock, as far as I can
>tell, and as far as comments go.
>
>So a stupid patch to just move the dirty page accounting to outside
>the spinlock might help a lot.
>
>Does this attached patch help your contention numbers?

Hi Linus,

The 1BRD tests finished and there are no conclusive changes.

The overall aim7 jobs-per-min slightly decreases and
the overall fsmark files_per_sec slightly increases,
however both are small enough (less than 1%), which are kind of
expected numbers.

NUMA test results should be available tomorrow.

99091700659f4df9  1b5f2eb4a752e1fa7102f37545  testcase/testparams/testbox
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \
     71443                       71286        GEO-MEAN aim7.jobs-per-min
       972                         961        aim7/1BRD_48G-btrfs-creat-clo=
-4-performance/ivb44
     52205                       51525        aim7/1BRD_48G-btrfs-disk_cp-1=
500-performance/ivb44
   2184471 =C2=B1  4%        -6%    2051740 =C2=B1  3%  aim7/1BRD_48G-btrfs=
-disk_rd-9000-performance/ivb44
     47049                       46630 =C2=B1  3%  aim7/1BRD_48G-btrfs-disk=
_rr-1500-performance/ivb44
     24932              -4%      23812        aim7/1BRD_48G-btrfs-disk_rw-1=
500-performance/ivb44
      5884                        5856        aim7/1BRD_48G-btrfs-disk_src-=
500-performance/ivb44
     51430                       51286        aim7/1BRD_48G-btrfs-disk_wrt-=
1500-performance/ivb44
       218                         220        aim7/1BRD_48G-btrfs-sync_disk=
_rw-10-performance/ivb44
     22777                       23199        aim7/1BRD_48G-ext4-creat-clo-=
1000-performance/ivb44
    130085                      128991        aim7/1BRD_48G-ext4-disk_cp-30=
00-performance/ivb44
   2434088 =C2=B1  3%        -8%    2232211 =C2=B1  4%  aim7/1BRD_48G-ext4-=
disk_rd-9000-performance/ivb44
    130351                      128977        aim7/1BRD_48G-ext4-disk_rr-30=
00-performance/ivb44
     73280                       74044        aim7/1BRD_48G-ext4-disk_rw-30=
00-performance/ivb44
    277035              -3%     268057        aim7/1BRD_48G-ext4-disk_src-3=
000-performance/ivb44
    127584               4%     132639        aim7/1BRD_48G-ext4-disk_wrt-3=
000-performance/ivb44
     10571                       10659        aim7/1BRD_48G-ext4-sync_disk_=
rw-600-performance/ivb44
     36924 =C2=B1  7%                 36327        aim7/1BRD_48G-f2fs-creat=
-clo-1500-performance/ivb44
    117238                      119130        aim7/1BRD_48G-f2fs-disk_cp-30=
00-performance/ivb44
   2340512 =C2=B1  5%               2352619 =C2=B1 10%  aim7/1BRD_48G-f2fs-=
disk_rd-9000-performance/ivb44
    107506 =C2=B1  9%         7%     114869        aim7/1BRD_48G-f2fs-disk_=
rr-3000-performance/ivb44
    105642                      106835        aim7/1BRD_48G-f2fs-disk_rw-30=
00-performance/ivb44
     26900 =C2=B1  3%                 26442 =C2=B1  3%  aim7/1BRD_48G-f2fs-=
disk_src-3000-performance/ivb44
    117124 =C2=B1  3%                117678        aim7/1BRD_48G-f2fs-disk_=
wrt-3000-performance/ivb44
      3689                        3616        aim7/1BRD_48G-f2fs-sync_disk_=
rw-600-performance/ivb44
     70897                       72758        aim7/1BRD_48G-xfs-creat-clo-1=
500-performance/ivb44
    267649 =C2=B1  3%                270867        aim7/1BRD_48G-xfs-disk_c=
p-3000-performance/ivb44
    485217 =C2=B1  3%                489403        aim7/1BRD_48G-xfs-disk_r=
d-9000-performance/ivb44
    360451                      359042        aim7/1BRD_48G-xfs-disk_rr-300=
0-performance/ivb44
    338114                      336838        aim7/1BRD_48G-xfs-disk_rw-300=
0-performance/ivb44
     60130 =C2=B1  5%         4%      62663        aim7/1BRD_48G-xfs-disk_s=
rc-3000-performance/ivb44
    403144                      401476        aim7/1BRD_48G-xfs-disk_wrt-30=
00-performance/ivb44
     26327                       26513        aim7/1BRD_48G-xfs-sync_disk_r=
w-600-performance/ivb44

99091700659f4df9  1b5f2eb4a752e1fa7102f37545
----------------  --------------------------
      2117                        2138        GEO-MEAN fsmark.files_per_sec
      4325                        4379        fsmark/1x-1t-1BRD_32G-btrfs-4=
K-4G-fsyncBeforeClose-1fpd-performance/ivb43
      9466 =C2=B1  3%         4%       9804        fsmark/1x-1t-1BRD_32G-ex=
t4-4K-4G-fsyncBeforeClose-1fpd-performance/ivb43
       433 =C2=B1  5%                   424        fsmark/1x-1t-1BRD_48G-bt=
rfs-4M-40G-NoSync-performance/ivb44
       185 =C2=B1  6%         5%        194        fsmark/1x-1t-1BRD_48G-bt=
rfs-4M-40G-fsyncBeforeClose-performance/ivb44
       368 =C2=B1  3%        -4%        355 =C2=B1  6%  fsmark/1x-1t-1BRD_4=
8G-ext4-4M-40G-NoSync-performance/ivb44
       191                         191        fsmark/1x-1t-1BRD_48G-ext4-4M=
-40G-fsyncBeforeClose-performance/ivb44
       393 =C2=B1  4%                   397 =C2=B1  4%  fsmark/1x-1t-1BRD_4=
8G-xfs-4M-40G-NoSync-performance/ivb44
       200                         201        fsmark/1x-1t-1BRD_48G-xfs-4M-=
40G-fsyncBeforeClose-performance/ivb44
       924              -3%        896 =C2=B1  3%  fsmark/1x-1t-1HDD-xfs-4K=
-400M-fsyncBeforeClose-1fpd-performance/ivb43
       488 =C2=B1  3%         6%        516        fsmark/1x-64t-1BRD_48G-b=
trfs-4M-40G-NoSync-performance/ivb44
       559                         564        fsmark/1x-64t-1BRD_48G-ext4-4=
M-40G-NoSync-performance/ivb44
      1130                        1111        fsmark/1x-64t-1BRD_48G-ext4-4=
M-40G-fsyncBeforeClose-performance/ivb44
       526 =C2=B1  7%         6%        557        fsmark/1x-64t-1BRD_48G-x=
fs-4M-40G-NoSync-performance/ivb44
      1583 =C2=B1  3%                  1620        fsmark/1x-64t-1BRD_48G-x=
fs-4M-40G-fsyncBeforeClose-performance/ivb44
     33202                       33208        fsmark/8-1SSD-16-ext4-8K-75G-=
fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
     33889                       33784        fsmark/8-1SSD-16-ext4-9B-48G-=
fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
     25576                       25509        fsmark/8-1SSD-32-xfs-9B-30G-f=
syncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
      9117                        9079        fsmark/8-1SSD-4-btrfs-8K-24G-=
fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
     13288                       13261        fsmark/8-1SSD-4-btrfs-9B-16G-=
fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
     18851 =C2=B1 11%        11%      21013        fsmark/8-1SSD-4-f2fs-8K-=
72G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
     24343              -4%      23473 =C2=B1  4%  fsmark/8-1SSD-4-f2fs-9B-=
40G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4

Thanks,
Fengguang

--===============8639622308685414913==--

