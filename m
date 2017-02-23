Content-Type: multipart/mixed; boundary="===============6491872275480135618=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Thu, 23 Feb 2017 09:27:34 +0800
Message-ID: <20170223012734.GB31776@yexl-desktop>
In-Reply-To: <20170207144315.GS5065@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6491872275480135618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Michal

On 02/07, Michal Hocko wrote:
[snip]
>Could you retest with a single NUMA node? I am not familiar with the
>benchmark enough to judge it was set up properly for a NUMA machine.

I've retested the commit with a single NUMA node via "numactl -m 0 fs_mark =
xxx",
and it did help recover the performance back.

Here is the comparison:

commit/compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/md/nr_=
threads/rootfs/sync_method/tbox_group/test_size/testcase:
  5e56dfbd837421b7fa3c6c06018c6701e2704917/gcc-6/performance/3HDD/4M/btrfs/=
1/x86_64-rhel-7.2/RAID5/64/debian-x86_64-2016-08-31.cgz/NoSync/ivb44/130G/f=
smark
   =

(with a single NUMA node)	    (2 NUMA nodes)
-------------------------------------------------------------------- =

       fail:runs   %reproduction    fail:runs
           |              |             |    =

         %stddev      %change         %stddev
             \           |                \  =

     57.60 =C2=B1  0%      -11.1%      51.20 =C2=B1  0%  fsmark.files_per_s=
ec
    607.84 =C2=B1  0%       +9.0%     662.24 =C2=B1  1%  fsmark.time.elapse=
d_time
    607.84 =C2=B1  0%       +9.0%     662.24 =C2=B1  1%  fsmark.time.elapse=
d_time.max
     14317 =C2=B1  6%      -12.2%      12568 =C2=B1  7%  fsmark.time.involu=
ntary_context_switches
      1864 =C2=B1  0%       +0.5%       1873 =C2=B1  0%  fsmark.time.maximu=
m_resident_set_size
     12425 =C2=B1  0%      +23.3%      15320 =C2=B1  3%  fsmark.time.minor_=
page_faults
     33.00 =C2=B1  3%      -33.9%      21.80 =C2=B1  1%  fsmark.time.percen=
t_of_cpu_this_job_got
    203.49 =C2=B1  3%      -28.1%     146.31 =C2=B1  1%  fsmark.time.system=
_time
    605701 =C2=B1  0%       +3.6%     627486 =C2=B1  0%  fsmark.time.volunt=
ary_context_switches
    307106 =C2=B1  2%      +20.2%     368992 =C2=B1  9%  interrupts.CAL:Fun=
ction_call_interrupts
    183040 =C2=B1  0%      +23.2%     225559 =C2=B1  3%  softirqs.BLOCK
     12203 =C2=B1 57%     +236.4%      41056 =C2=B1103%  softirqs.NET_RX
    186118 =C2=B1  0%      +21.9%     226922 =C2=B1  2%  softirqs.TASKLET
     14317 =C2=B1  6%      -12.2%      12568 =C2=B1  7%  time.involuntary_c=
ontext_switches
     12425 =C2=B1  0%      +23.3%      15320 =C2=B1  3%  time.minor_page_fa=
ults
     33.00 =C2=B1  3%      -33.9%      21.80 =C2=B1  1%  time.percent_of_cp=
u_this_job_got
    203.49 =C2=B1  3%      -28.1%     146.31 =C2=B1  1%  time.system_time
      3.47 =C2=B1  3%      -13.0%       3.02 =C2=B1  1%  turbostat.%Busy
     99.60 =C2=B1  1%       -9.6%      90.00 =C2=B1  1%  turbostat.Avg_MHz
     78.69 =C2=B1  1%       +1.7%      80.01 =C2=B1  0%  turbostat.CorWatt
      3.56 =C2=B1 61%      -91.7%       0.30 =C2=B1 76%  turbostat.Pkg%pc2
    207790 =C2=B1  0%       -8.2%     190654 =C2=B1  1%  vmstat.io.bo
  30667691 =C2=B1  0%      +65.9%   50890669 =C2=B1  1%  vmstat.memory.cache
  34549892 =C2=B1  0%      -58.4%   14378939 =C2=B1  4%  vmstat.memory.free
      6768 =C2=B1  0%       -1.3%       6681 =C2=B1  1%  vmstat.system.cs
 1.089e+10 =C2=B1  2%      +13.4%  1.236e+10 =C2=B1  3%  cpuidle.C1E-IVT.ti=
me
  11475304 =C2=B1  2%      +13.4%   13007849 =C2=B1  3%  cpuidle.C1E-IVT.us=
age
   2.7e+09 =C2=B1  6%      +13.2%  3.057e+09 =C2=B1  3%  cpuidle.C3-IVT.time
   2954294 =C2=B1  6%      +14.3%    3375966 =C2=B1  3%  cpuidle.C3-IVT.usa=
ge
  96963295 =C2=B1 14%      +17.5%  1.139e+08 =C2=B1 12%  cpuidle.POLL.time
      8761 =C2=B1  7%      +17.6%      10299 =C2=B1  9%  cpuidle.POLL.usage
  30454483 =C2=B1  0%      +66.4%   50666102 =C2=B1  1%  meminfo.Cached

Do you see what's happening? Or is there anything we can do to improve fsma=
rk
benchmark setup to make it more reasonable?

Thanks,
Xiaolong

>-- =

>Michal Hocko
>SUSE Labs

--===============6491872275480135618==--

