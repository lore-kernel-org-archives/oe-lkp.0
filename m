Content-Type: multipart/mixed; boundary="===============8974335518924803961=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [cpufreq/intel_pstate] 1abc4b20b85: +7.3% turbostat.Pkg_W
Date: Wed, 19 Feb 2014 22:06:29 +0800
Message-ID: <20140219140628.GA8097@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8974335518924803961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

FYI, we noticed the below changes on commit 1abc4b20b85b42e8573957e54b19338=
5cf48b0d6
("cpufreq / intel_pstate: remove idle time and duration from sample and cal=
culations"):

test case: snb-drag/sysbench/fileio/600s-100%-1HDD-btrfs-64G-1024-seqrd-sync

559f56c70fc90bd  1abc4b20b85b42e8573957e54  =

---------------  -------------------------  =

      1.61 ~ 0%     +32.2%       2.13 ~ 0%  TOTAL turbostat.GHz
      0.86 ~ 3%     +15.3%       0.99 ~ 1%  TOTAL turbostat.%pc3
     11.03 ~ 1%     -11.9%       9.72 ~ 1%  TOTAL turbostat.%c1
      5.36 ~ 0%     -21.8%       4.19 ~ 0%  TOTAL turbostat.%c0
      2.67 ~ 0%     +18.2%       3.15 ~ 0%  TOTAL turbostat.Cor_W
      6.66 ~ 0%      +7.3%       7.15 ~ 0%  TOTAL turbostat.Pkg_W
   1278688 ~ 4%     -16.6%    1066682 ~ 4%  TOTAL cpuidle.C1-SNB.usage
     70490 ~ 1%     -13.1%      61235 ~ 1%  TOTAL cpuidle.C3-SNB.usage
    472542 ~ 2%     -13.7%     408029 ~ 2%  TOTAL cpuidle.C1E-SNB.usage
 1.788e+08 ~ 5%     -15.4%  1.512e+08 ~ 5%  TOTAL cpuidle.C1-SNB.time
 3.777e+08 ~ 1%     -12.4%  3.311e+08 ~ 0%  TOTAL cpuidle.C1E-SNB.time
   2213808 ~ 1%     -14.6%    1890218 ~ 0%  TOTAL interrupts.RES
    920130 ~ 5%     -13.9%     791994 ~ 5%  TOTAL interrupts.LOC
     52713 ~ 0%     -14.9%      44878 ~ 0%  TOTAL softirqs.TIMER

test case: hackbench, netperf and dbench

559f56c70fc90bd  1abc4b20b85b42e8573957e54  =

---------------  -------------------------  =

    312046 ~ 1%     -47.3%     164399 ~ 0%  lkp-snb01/micro/hackbench/1600%=
-threads-pipe
    151815 ~ 0%      -0.8%     150593 ~ 0%  lkp-snb01/micro/hackbench/1600%=
-threads-socket
    463862 ~ 0%     -32.1%     314993 ~ 0%  TOTAL hackbench.throughput

559f56c70fc90bd  1abc4b20b85b42e8573957e54  =

---------------  -------------------------  =

      2761 ~ 0%      -1.8%       2713 ~ 0%  lkp-a04/micro/netperf/120s-200%=
-UDP_RR
      2761 ~ 0%      -1.8%       2713 ~ 0%  TOTAL netperf.Throughput_tps

559f56c70fc90bd  1abc4b20b85b42e8573957e54  =

---------------  -------------------------  =

      8276 ~ 0%      -0.3%       8247 ~ 0%  nhm8/micro/dbench/100%
      8276 ~ 0%      -0.3%       8247 ~ 0%  TOTAL dbench.throughput-MB/sec

Thanks,
Fengguang

--===============8974335518924803961==--

