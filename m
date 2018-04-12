Content-Type: multipart/mixed; boundary="===============2214846148644373580=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm/cma] 2b0f904a5a: fio.read_bw_MBps -16.1% regression
Date: Thu, 12 Apr 2018 09:12:35 +0800
Message-ID: <20180412011235.GH17893@yexl-desktop>
In-Reply-To: <CAAmzW4MHjvDrDdoeSf3imjRboCA+Z4yTaDF=WsS3vsjYUCiVUw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2214846148644373580==
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

Sorry for the late, below is the comparison of commit f6572f9cd248df2c, 2b0=
f904a5a,
and fix commit f11152b, seems it doesn't help to recover the performance.


$ compare -at f6572f9cd248df2cbcfc78088ff3b36f5a9c5bd6 2b0f904a5a f11152bc9=
1ec97cd3c3f710f9bd0b0bbedbef7b4 -g fio-basic
tests: 1
testcase/path_params/tbox_group/run: fio-basic/2pmem-ext4-200s-50%-tb-randr=
ead-2M-mmap-200G-performance/lkp-hsw-ep6

f6572f9cd248df2c  2b0f904a5a8781498417d67226  f11152bc91ec97cd3c3f710f9b  =

----------------  --------------------------  --------------------------  =

         %stddev      change         %stddev      change         %stddev
             \          |                \          |                \  =

     11462             -16%       9605             -18%       9371        f=
io.read_bw_MBps
      5731             -16%       4802             -18%       4685        f=
io.read_iops
      0.46 =C2=B1 22%       211%       1.45 =C2=B1  4%       207%       1.4=
3 =C2=B1  4%  fio.latency_50ms%
      0.04 =C2=B1 11%       111%       0.09 =C2=B1  8%       163%       0.1=
1 =C2=B1  9%  fio.latency_2ms%
      7.75 =C2=B1  4%       160%      20.15             161%      20.25    =
    fio.latency_20ms%
      0.29 =C2=B1  6%        41%       0.40 =C2=B1  3%        45%       0.4=
2 =C2=B1  8%  fio.latency_1000us%
     15720 =C2=B1  7%        44%      22592              43%      22464    =
    fio.read_clat_99%_us
     10544              33%      14048              34%      14112        f=
io.read_clat_95%_us
      9792              32%      12896              32%      12896        f=
io.read_clat_90%_us
   1811975              24%    2254706              27%    2304726        f=
io.time.maximum_resident_set_size
      4880              19%       5825              22%       5970        f=
io.read_clat_mean_us
      0.29 =C2=B1 14%        17%       0.33 =C2=B1  3%        20%       0.3=
4 =C2=B1  5%  fio.latency_500us%
     19.32 =C2=B1  4%       -24%      14.69 =C2=B1  3%        16%      22.3=
7 =C2=B1  4%  fio.latency_10ms%
     10723 =C2=B1  4%                 10867 =C2=B1  3%         9%      1173=
8 =C2=B1  4%  fio.read_clat_stddev
     24578              10%      26917               6%      26075        f=
io.time.voluntary_context_switches
       518             -17%        430              -5%        493        f=
io.time.user_time
 5.754e+08             -16%  4.806e+08             -18%  4.691e+08        f=
io.time.major_page_faults
 4.603e+09             -16%  3.845e+09             -18%  3.753e+09        f=
io.time.file_system_inputs
     70.42             -13%      61.36             -24%      53.64        f=
io.latency_4ms%
  54585366             -15%   46353339             -19%   44289507        i=
nterrupts.CAL:Function_call_interrupts
    318043             -12%     278980             -15%     269034        v=
mstat.system.in
  10914641             -17%    9111830             -18%    8913838        v=
mstat.io.bi
    349206 =C2=B1  3%        -9%     319016 =C2=B1  3%         8%     37745=
5 =C2=B1  6%  softirqs.RCU
   4263579                     4289700             -14%    3676822        s=
oftirqs.TIMER

Thanks,
Xiaolong


>
>Thanks.

--===============2214846148644373580==--

