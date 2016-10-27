Content-Type: multipart/mixed; boundary="===============3955666186014057792=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/platform/UV] 71854cb812: will-it-scale.per_thread_ops -2.3% regression
Date: Thu, 27 Oct 2016 09:55:08 +0800
Message-ID: <20161027015508.GG21890@yexl-desktop>
In-Reply-To: <alpine.DEB.2.20.1610251251400.4990@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============3955666186014057792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/25, Thomas Gleixner wrote:
>On Tue, 25 Oct 2016, kernel test robot wrote:
>> FYI, we noticed a -2.3% regression of will-it-scale.per_thread_ops due t=
o commit:
>> =

>> commit 71854cb812ec23bfe5f63d52217e6b9e6cb901f5 ("x86/platform/UV: Fix s=
upport for EFI_OLD_MEMMAP after BIOS callback updates")
>> https://github.com/0day-ci/linux Alex-Thorlton/x86-platform-UV-Fix-suppo=
rt-for-EFI_OLD_MEMMAP-after-BIOS-callback-updates/20161020-095215
>> =

>> in testcase: will-it-scale
>> on test machine: 12 threads Intel(R) Core(TM) i7 CPU X 980 @ 3.33GHz wit=
h 6G memory
>
>This is completely bogus. That patch does not even affect anything outside
>of the SGI UV platform. And on your i7 system uv_bios_call() is definitely
>not invoked.

Yes, this is weird, the per_thread_ops change is small and should be run
to run variation, the actual significant change is will-it-scale.time.user_=
time
-27% decrease, but the patch seems not relevant, we can't interpret it. :(

We've tried to queue the jobs (4 times) for 71854cb812ec23bfe5f63d52217e6b9=
e6cb901f5 and v4.9-rc1
with new kconfig (added CONFIG_DEBUG_INFO_REDUCED), and result shows
user_time change is quite stable.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-6/performance/x86_64-rhel-7.2+CONFIG_DEBUG_INFO_REDUCED/debian-x86_64=
-2016-08-31.cgz/wsm/read2/will-it-scale

commit:
  v4.9-rc1
  71854cb812ec23bfe5f63d52217e6b9e6cb901f5

        v4.9-rc1 71854cb812ec23bfe5f63d5221
---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \
   1670068 =C2=B1  0%      -3.8%    1606650 =C2=B1  1%  will-it-scale.per_t=
hread_ops
      9749 =C2=B1  2%   +1328.0%     139222 =C2=B1105%  will-it-scale.time.=
involuntary_context_switches
    981.29 =C2=B1  0%      +2.2%       1002 =C2=B1  0%  will-it-scale.time.=
system_time
     81.78 =C2=B1  0%     -26.9%      59.74 =C2=B1  0%  will-it-scale.time.=
user_time
     32894 =C2=B1  0%      -3.1%      31863 =C2=B1  2%  vmstat.system.cs
      9749 =C2=B1  2%   +1328.0%     139222 =C2=B1105%  time.involuntary_co=
ntext_switches
    380917 =C2=B1  2%     -10.2%     341970 =C2=B1  3%  sched_debug.cpu.avg=
_idle.avg
     89166 =C2=B1 33%     -73.4%      23731 =C2=B1 29%  sched_debug.cpu.avg=
_idle.min
     16.38 =C2=B1 10%     -32.3%      11.08 =C2=B1 18%  sched_debug.cpu.nr_=
uninterruptible.max
      0.29 =C2=B1  1%     +32.6%       0.38 =C2=B1  1%  perf-stat.branch-mi=
ss-rate%
 2.897e+09 =C2=B1  1%     +33.5%  3.867e+09 =C2=B1  2%  perf-stat.branch-mi=
sses
  10084878 =C2=B1  0%      -3.2%    9761852 =C2=B1  2%  perf-stat.context-s=
witches
      0.00 =C2=B1  7%      -9.3%       0.00 =C2=B1  1%  perf-stat.dTLB-stor=
e-miss-rate%
  33489012 =C2=B1  7%      -9.2%   30416429 =C2=B1  1%  perf-stat.dTLB-stor=
e-misses

Thanks,
Xiaolong
>
>I appreciate your effort, but posting such obviously bogus results does not
>make people more confident in your testing efforts.
>
>Thanks,
>
>	tglx

--===============3955666186014057792==--

