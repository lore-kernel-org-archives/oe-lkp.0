Content-Type: multipart/mixed; boundary="===============3232176220756546994=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/copy_user] adb402cd14: will-it-scale.per_process_ops -12.7% regression
Date: Mon, 14 Nov 2016 22:19:31 +0800
Message-ID: <20161114141931.GA27318@yexl-desktop>
In-Reply-To: <20161115100101.nzvhd5mlcb747n2h@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============3232176220756546994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/15, Borislav Petkov wrote:
>On Mon, Nov 14, 2016 at 10:37:11PM +0800, Ye Xiaolong wrote:
>> Below cmd should help on it:
>
>Right, before I go do this, can you please retest without
>
>CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>
>?

Sorry for the late, here is the comparison, disable
CONFIG_DEBUG_ATOMIC_SLEEP helps to restore the performance back
according to the result.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
commit/compiler/cpufreq_governor/rootfs/tbox_group/test/testcase:
  adb402cd1461eef6e1a21db4532a3b9e6a6be853/gcc-6/performance/debian-x86_64-=
2016-08-31.cgz/xps/poll1/will-it-scale

kconfig:
  x86_64-rhel-7.2
  x86_64-rhel-7.2-CONFIG_DEBUG_ATOMIC_SLEEP

 x86_64-rhel-7.2 x86_64-rhel-7.2-CONFIG_DEB
---------------- --------------------------
         %stddev     %change         %stddev
             \          |                \
   5899566 =C2=B1  2%     +28.5%    7583094 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   5121156 =C2=B1  0%     +21.1%    6203340 =C2=B1  0%  will-it-scale.per_t=
hread_ops
     49191 =C2=B1127%     -79.8%       9938 =C2=B1  3%  will-it-scale.time.=
involuntary_context_switches
    588.63 =C2=B1  0%      -4.1%     564.27 =C2=B1  0%  will-it-scale.time.=
system_time
    132.53 =C2=B1  0%     +18.7%     157.26 =C2=B1  0%  will-it-scale.time.=
user_time
     23063 =C2=B1  0%     -92.0%       1846 =C2=B1  0%  interrupts.CAL:Func=
tion_call_interrupts
     10336 =C2=B1 28%     -66.1%       3499 =C2=B1  5%  softirqs.NET_RX
    444.00 =C2=B1  0%     -24.3%     336.00 =C2=B1  0%  vmstat.memory.buff
     49191 =C2=B1127%     -79.8%       9938 =C2=B1  3%  time.involuntary_co=
ntext_switches
    132.53 =C2=B1  0%     +18.7%     157.26 =C2=B1  0%  time.user_time
      4823 =C2=B1  1%      -9.9%       4344 =C2=B1  0%  proc-vmstat.nr_mapp=
ed
      4994 =C2=B1  2%     -13.2%       4336 =C2=B1  0%  proc-vmstat.nr_shmem
      2265 =C2=B1  7%     -71.6%     642.67 =C2=B1  4%  proc-vmstat.pgactiv=
ate
     61.33 =C2=B1  0%      -1.6%      60.33 =C2=B1  0%  turbostat.%Busy
     12.34 =C2=B1  7%     -98.8%       0.15 =C2=B1 17%  turbostat.CPU%c3
      1.29 =C2=B1  6%   +1004.7%      14.22 =C2=B1  5%  turbostat.CPU%c6
    113064 =C2=B1  1%      -9.4%     102395 =C2=B1  2%  meminfo.Active
    196087 =C2=B1  0%     -16.4%     163999 =C2=B1  0%  meminfo.Committed_AS
     19288 =C2=B1  1%      -9.9%      17372 =C2=B1  0%  meminfo.Mapped
     19983 =C2=B1  2%     -13.2%      17348 =C2=B1  0%  meminfo.Shmem
     15975 =C2=B1 27%     -74.7%       4043 =C2=B1 10%  latency_stats.avg.m=
ax

Thanks,
Xiaolong

>
>Thanks.
>
>-- =

>Regards/Gruss,
>    Boris.
>
>Good mailing practices for 400: avoid top-posting and trim the reply.

--===============3232176220756546994==--

