Content-Type: multipart/mixed; boundary="===============1164987676615326318=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 21:25:39 +0800
Message-ID: <20160816132539.GA2078@wfg-t540p.sh.intel.com>
In-Reply-To: <20160814161724.GA20274@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1164987676615326318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2016 at 06:17:24PM +0200, Christoph Hellwig wrote:
>Snipping the long contest:
>
>I think there are three observations here:
>
> (1) removing the mark_page_accessed (which is the only significant
>     change in the parent commit)  hurts the
>     aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44 test.
>     I'd still rather stick to the filemap version and let the
>     VM people sort it out.  How do the numbers for this test
>     look for XFS vs say ext4 and btrfs?

Here is a basic comparison of the 3 filesystems based on 99091700 ("
Merge tag 'nfs-for-4.8-2' of git://git.linux-nfs.org/projects/trondmy/linux=
-nfs").

% compare -a -g 99091700659f4df965e138b38b4fa26a29b7eade -d fs xfs ext4 btr=
fs

             xfs                        ext4                       btrfs  t=
estcase/testparams/testbox
----------------  --------------------------  --------------------------  -=
--------------------------
         %stddev      change         %stddev      change         %stddev
             \          |                \          |                \
    193335             -27%     141400            -100%          8        G=
EO-MEAN aim7.jobs-per-min
    267649 =C2=B1  3%       -51%     130085                                =
    aim7/1BRD_48G-disk_cp-3000-performance/ivb44
    485217 =C2=B1  3%       402%    2434088 =C2=B1  3%       350%    218447=
1 =C2=B1  4%  aim7/1BRD_48G-disk_rd-9000-performance/ivb44
    360286             -64%     130351                                    a=
im7/1BRD_48G-disk_rr-3000-performance/ivb44
    338114             -78%      73280                                    a=
im7/1BRD_48G-disk_rw-3000-performance/ivb44
     60130 =C2=B1  5%       361%     277035                                =
    aim7/1BRD_48G-disk_src-3000-performance/ivb44
    403144             -68%     127584                                    a=
im7/1BRD_48G-disk_wrt-3000-performance/ivb44
     26327             -60%      10571                                    a=
im7/1BRD_48G-sync_disk_rw-600-performance/ivb44

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
      2652             -96%        118             -82%        468        G=
EO-MEAN fsmark.files_per_sec
       393 =C2=B1  4%        -6%        368 =C2=B1  3%        10%        43=
3 =C2=B1  5%  fsmark/1x-1t-1BRD_48G-4M-40G-NoSync-performance/ivb44
       200              -4%        191              -7%        185 =C2=B1  =
6%  fsmark/1x-1t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
      1583 =C2=B1  3%       -29%       1130             -31%       1088    =
    fsmark/1x-64t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
     21363              59%      33958                                    f=
smark/8-1SSD-16-9B-48G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
     11033                                         -17%       9117        f=
smark/8-1SSD-4-8K-24G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
     11833                                          12%      13234        f=
smark/8-1SSD-4-9B-16G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
   2381976            -100%       6598             -96%     100973        G=
EO-MEAN fsmark.app_overhead
    564520 =C2=B1  7%        21%     681192 =C2=B1  3%        63%     91936=
4 =C2=B1  3%  fsmark/1x-64t-1BRD_48G-4M-40G-NoSync-performance/ivb44
    860074 =C2=B1  5%       112%    1820590 =C2=B1 14%        47%    126244=
3 =C2=B1  3%  fsmark/1x-64t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/iv=
b44
  12232633             -18%   10085199                                    f=
smark/8-1SSD-16-9B-48G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
   3143334                                         -11%    2784178        f=
smark/8-1SSD-4-8K-24G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
   4107347                                         -21%    3248210        f=
smark/8-1SSD-4-9B-16G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4

Thanks,
Fengguang
---

Some less important numbers.

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
      1314             222%       4225            -100%          2        G=
EO-MEAN aim7.time.system_time
      1491 =C2=B1  6%       302%       6004                                =
    aim7/1BRD_48G-disk_cp-3000-performance/ivb44
      4786 =C2=B1  3%       -89%        502 =C2=B1  7%       -87%        63=
2 =C2=B1  7%  aim7/1BRD_48G-disk_rd-9000-performance/ivb44
       756             689%       5971                                    a=
im7/1BRD_48G-disk_rr-3000-performance/ivb44
       891            1146%      11108                                    a=
im7/1BRD_48G-disk_rw-3000-performance/ivb44
       940 =C2=B1  5%        70%       1598                                =
    aim7/1BRD_48G-disk_src-3000-performance/ivb44
       599             925%       6148                                    a=
im7/1BRD_48G-disk_wrt-3000-performance/ivb44
      2496             390%      12225                                    a=
im7/1BRD_48G-sync_disk_rw-600-performance/ivb44

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
    154597             185%     440025                                    G=
EO-MEAN aim7.time.minor_page_faults
    156203             144%     381038                                    a=
im7/1BRD_48G-disk_cp-3000-performance/ivb44
    155952             132%     362294 =C2=B1  3%                          =
    aim7/1BRD_48G-disk_rr-3000-performance/ivb44
    157550             266%     577044                                    a=
im7/1BRD_48G-disk_rw-3000-performance/ivb44
    153880             152%     387212                                    a=
im7/1BRD_48G-disk_wrt-3000-performance/ivb44
    149531 =C2=B1  5%       258%     534809 =C2=B1  4%                     =
         aim7/1BRD_48G-sync_disk_rw-600-performance/ivb44

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
     86.94              37%     119.10             -98%       1.59        G=
EO-MEAN aim7.time.elapsed_time
     67.56 =C2=B1  3%       105%     138.61                                =
    aim7/1BRD_48G-disk_cp-3000-performance/ivb44
    112.15 =C2=B1  3%       -80%      22.93 =C2=B1  3%       -77%      25.4=
8 =C2=B1  4%  aim7/1BRD_48G-disk_rd-9000-performance/ivb44
     50.19             176%     138.32                                    a=
im7/1BRD_48G-disk_rr-3000-performance/ivb44
     53.46             360%     245.91                                    a=
im7/1BRD_48G-disk_rw-3000-performance/ivb44
    300.63 =C2=B1  5%       -78%      65.30                                =
    aim7/1BRD_48G-disk_src-3000-performance/ivb44
     44.88             215%     141.35                                    a=
im7/1BRD_48G-disk_wrt-3000-performance/ivb44
    136.82             149%     340.59                                    a=
im7/1BRD_48G-sync_disk_rw-600-performance/ivb44

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
     22.55              27%      28.54                                    G=
EO-MEAN aim7.time.user_time
     18.74              46%      27.27                                    a=
im7/1BRD_48G-disk_cp-3000-performance/ivb44
     28.71              28%      36.88                                    a=
im7/1BRD_48G-disk_rr-3000-performance/ivb44
     29.59              38%      40.74                                    a=
im7/1BRD_48G-disk_rw-3000-performance/ivb44
     41.42 =C2=B1  4%       -50%      20.90                                =
    aim7/1BRD_48G-disk_src-3000-performance/ivb44
     10.93              61%      17.61                                    a=
im7/1BRD_48G-disk_wrt-3000-performance/ivb44
     18.26              96%      35.85                                    a=
im7/1BRD_48G-sync_disk_rw-600-performance/ivb44

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
   1171009             -44%     660859            -100%          4        G=
EO-MEAN aim7.time.voluntary_context_switches
    325355              -7%     303228                                    a=
im7/1BRD_48G-disk_cp-3000-performance/ivb44
     58321 =C2=B1  8%       -48%      30407             -44%      32487 =C2=
=B1  3%  aim7/1BRD_48G-disk_rd-9000-performance/ivb44
    437880             -37%     275709                                    a=
im7/1BRD_48G-disk_rr-3000-performance/ivb44
    395047              31%     518201                                    a=
im7/1BRD_48G-disk_rw-3000-performance/ivb44
  31067301             -93%    2034955 =C2=B1  5%                          =
    aim7/1BRD_48G-disk_src-3000-performance/ivb44
    506749             -38%     315597                                    a=
im7/1BRD_48G-disk_wrt-3000-performance/ivb44
  58429810              11%   65070475                                    a=
im7/1BRD_48G-sync_disk_rw-600-performance/ivb44

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
     41445             658%     314065            -100%          4        G=
EO-MEAN aim7.time.involuntary_context_switches
     21627 =C2=B1  5%      3118%     695989                                =
    aim7/1BRD_48G-disk_cp-3000-performance/ivb44
    594383 =C2=B1  5%       -96%      25928 =C2=B1  7%       -94%      3808=
2 =C2=B1 11%  aim7/1BRD_48G-disk_rd-9000-performance/ivb44
     12980            5128%     678629                                    a=
im7/1BRD_48G-disk_rr-3000-performance/ivb44
     14729           10572%    1571856                                    a=
im7/1BRD_48G-disk_rw-3000-performance/ivb44
      5894 =C2=B1  3%       249%      20595 =C2=B1  8%                     =
         aim7/1BRD_48G-disk_src-3000-performance/ivb44
      8950            7842%     710852                                    a=
im7/1BRD_48G-disk_wrt-3000-performance/ivb44
   1620035             -34%    1069492                                    a=
im7/1BRD_48G-sync_disk_rw-600-performance/ivb44

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
    132117            -100%        216             -99%        990        G=
EO-MEAN fsmark.time.involuntary_context_switches
     14651             -99%         86 =C2=B1  3%       -99%        120 =C2=
=B1  9%  fsmark/1x-1t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
       553             413%       2840 =C2=B1  3%      8078%      45278 =C2=
=B1 31%  fsmark/1x-64t-1BRD_48G-4M-40G-NoSync-performance/ivb44
     19895 =C2=B1  3%       -33%      13242             487%     116776 =C2=
=B1  3%  fsmark/1x-64t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
   6206551             -99%      31906                                    f=
smark/8-1SSD-16-9B-48G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
   1992225                                        -100%       1236 =C2=B1  =
5%  fsmark/8-1SSD-4-8K-24G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-=
ep4
   2664982                                        -100%       1202 =C2=B1 1=
0%  fsmark/8-1SSD-4-9B-16G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-=
ep4

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
   1755485            -100%       3248             -93%     120902        G=
EO-MEAN fsmark.time.voluntary_context_switches
    542900             -98%      10270             -98%      10291        f=
smark/1x-1t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
     36634 =C2=B1  6%       -17%      30317            3893%    1462650 =C2=
=B1  9%  fsmark/1x-64t-1BRD_48G-4M-40G-NoSync-performance/ivb44
    162300 =C2=B1 15%       -55%      72808              89%     306208    =
    fsmark/1x-64t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
  58499255             -11%   51789210                                    f=
smark/8-1SSD-16-9B-48G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
  10792062                                         168%   28969245        f=
smark/8-1SSD-4-8K-24G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
  14361647                                          63%   23390858        f=
smark/8-1SSD-4-9B-16G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
       391             -98%          7             -88%         47        G=
EO-MEAN fsmark.time.elapsed_time
       591             -37%        371                                    f=
smark/8-1SSD-16-9B-48G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
       285                                          21%        345        f=
smark/8-1SSD-4-8K-24G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
       354                                         -11%        317        f=
smark/8-1SSD-4-9B-16G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
    294.98             -88%      36.23             -51%     145.31        G=
EO-MEAN fsmark.time.system_time
     45.16 =C2=B1  5%       157%     116.15             820%     415.73 =C2=
=B1  7%  fsmark/1x-64t-1BRD_48G-4M-40G-NoSync-performance/ivb44
    262.79 =C2=B1  4%        29%     338.49              21%     316.76 =C2=
=B1  4%  fsmark/1x-64t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
   1419.35              12%    1587.76                                    f=
smark/8-1SSD-16-9B-48G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
    320.95                                         124%     719.99        f=
smark/8-1SSD-4-8K-24G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
    413.11                                          65%     683.20        f=
smark/8-1SSD-4-9B-16G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
       222             -68%         70             -27%        161        G=
EO-MEAN fsmark.time.percent_of_cpu_this_job_got
        91 =C2=B1  4%         9%         99               7%         97    =
    fsmark/1x-1t-1BRD_48G-4M-40G-NoSync-performance/ivb44
        95               3%         98               3%         98        f=
smark/1x-1t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
       214 =C2=B1  3%       152%        540             807%       1940 =C2=
=B1  9%  fsmark/1x-64t-1BRD_48G-4M-40G-NoSync-performance/ivb44
      3938              -7%       3668             -17%       3286        f=
smark/1x-64t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
       253              75%        443                                    f=
smark/8-1SSD-16-9B-48G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
       118                                          80%        213        f=
smark/8-1SSD-4-8K-24G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
       123                                          80%        221        f=
smark/8-1SSD-4-9B-16G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
     15893             -96%        649              46%      23186        G=
EO-MEAN fsmark.time.minor_page_faults
     10532              34%      14137             125%      23697 =C2=B1  =
5%  fsmark/1x-64t-1BRD_48G-4M-40G-NoSync-performance/ivb44
     17053              14%      19388               9%      18557        f=
smark/1x-64t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
     22352 =C2=B1 34%                                    27%      28346 =C2=
=B1 28%  fsmark/8-1SSD-4-8K-24G-fsyncBeforeClose-16d-256fpd-performance/lkp=
-hsw-ep4

             xfs                        ext4                       btrfs
----------------  --------------------------  --------------------------
  30857819            -100%       5089             405%  1.559e+08        G=
EO-MEAN fsmark.time.file_system_outputs
   6400000 =C2=B1 50%        25%    8000000            2051%  1.377e+08    =
    fsmark/1x-1t-1BRD_32G-4K-4G-fsyncBeforeClose-1fpd-performance/ivb43
  83886080                    83886080                    85633962        f=
smark/1x-1t-1BRD_48G-4M-40G-fsyncBeforeClose-performance/ivb44
  50331648                                         352%  2.277e+08        f=
smark/8-1SSD-4-8K-24G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4
  33554432                                         555%  2.199e+08        f=
smark/8-1SSD-4-9B-16G-fsyncBeforeClose-16d-256fpd-performance/lkp-hsw-ep4

--===============1164987676615326318==--

