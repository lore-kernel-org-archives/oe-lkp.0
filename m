Content-Type: multipart/mixed; boundary="===============3034350389180127422=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [Btrfs] c9dc4c65785: +9.8% fsmark.files_per_sec
Date: Wed, 08 Jul 2015 10:16:40 +0800
Message-ID: <1436321800.5489.279.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3034350389180127422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit c9dc4c6578502c2085705347375b82089aad18d0 ("Btrfs: two stage dirty bl=
ock group writeout")

testcase/path_params/tbox_group: fsmark/performance-1x-1t-1HDD-btrfs-4M-60G=
-NoSync/ivb44

4c6d1d85ad89fd8e  c9dc4c6578502c208570534737
----------------  --------------------------
    462211 =C2=B1  1%     +16.8%     539707 =C2=B1  0%  fsmark.app_overhead
     35.27 =C2=B1  0%      +9.8%      38.74 =C2=B1  1%  fsmark.files_per_sec
         9 =C2=B1  0%     +17.8%         10 =C2=B1  4%  fsmark.time.percent=
_of_cpu_this_job_got
      9864 =C2=B1  2%    +156.9%      25345 =C2=B1  4%  fsmark.time.volunta=
ry_context_switches
       435 =C2=B1  0%      -9.0%        396 =C2=B1  1%  fsmark.time.elapsed=
_time
       435 =C2=B1  0%      -9.0%        396 =C2=B1  1%  fsmark.time.elapsed=
_time.max
     21057 =C2=B1  0%      -9.0%      19165 =C2=B1  1%  uptime.idle
     68983 =C2=B1  2%     +19.1%      82190 =C2=B1  4%  softirqs.RCU
    129619 =C2=B1  0%      +3.2%     133743 =C2=B1  0%  vmstat.io.bo
         1 =C2=B1  0%    +100.0%          2 =C2=B1  0%  vmstat.procs.b
     18873 =C2=B1  0%     +14.9%      21692 =C2=B1  1%  vmstat.system.cs
   1787510 =C2=B1  1%    +117.0%    3878984 =C2=B1  2%  meminfo.Dirty
   5585235 =C2=B1  0%     +25.5%    7011242 =C2=B1  0%  meminfo.Writeback
   8276795 =C2=B1 10%     +15.9%    9592682 =C2=B1  0%  numa-numastat.node0=
.local_node
   8287205 =C2=B1 10%     +16.0%    9611684 =C2=B1  0%  numa-numastat.node0=
.numa_hit
   2447873 =C2=B1 42%     -67.9%     785086 =C2=B1 33%  numa-numastat.node1=
.numa_hit
   2413662 =C2=B1 43%     -68.1%     771115 =C2=B1 31%  numa-numastat.node1=
.local_node
       435 =C2=B1  0%      -9.0%        396 =C2=B1  1%  time.elapsed_time
       435 =C2=B1  0%      -9.0%        396 =C2=B1  1%  time.elapsed_time.m=
ax
         9 =C2=B1  0%     +17.8%         10 =C2=B1  4%  time.percent_of_cpu=
_this_job_got
      0.41 =C2=B1  1%     +17.1%       0.48 =C2=B1  4%  time.user_time
      9864 =C2=B1  2%    +156.9%      25345 =C2=B1  4%  time.voluntary_cont=
ext_switches
 5.189e+08 =C2=B1  0%     +72.6%  8.956e+08 =C2=B1  1%  cpuidle.C1-IVT.time
   4626942 =C2=B1 19%     +49.6%    6924087 =C2=B1 22%  cpuidle.C1E-IVT.time
   2646692 =C2=B1  7%     +75.0%    4630890 =C2=B1 23%  cpuidle.C3-IVT.time
 2.028e+10 =C2=B1  0%     -11.1%  1.803e+10 =C2=B1  1%  cpuidle.C6-IVT.time
    268137 =C2=B1  0%     +12.2%     300911 =C2=B1  2%  cpuidle.C6-IVT.usage
       222 =C2=B1 11%     +47.0%        326 =C2=B1 25%  cpuidle.POLL.usage
      0.69 =C2=B1  2%      +7.2%       0.74 =C2=B1  3%  turbostat.%Busy

Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Ying Huang


--===============3034350389180127422==--

