Content-Type: multipart/mixed; boundary="===============8162901087194408600=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] dc6c9a35b66: +6.5% will-it-scale.per_thread_ops
Date: Thu, 26 Feb 2015 13:39:24 +0800
Message-ID: <1424929164.10337.26.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8162901087194408600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit dc6c9a35b66b520cf67e05d8ca60ebecad3b0479 ("mm: account pmd page tabl=
es to the process")


testbox/testcase/testparams: lkp-g5/will-it-scale/performance-mmap1

8aa76875dc15b2dd  dc6c9a35b66b520cf67e05d8ca  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

  17725177 =C2=B1  3%    +129.1%   40613141 =C2=B1  1%  will-it-scale.time.=
voluntary_context_switches
       340 =C2=B1  1%    +117.2%        740 =C2=B1  3%  will-it-scale.time.=
system_time
       350 =C2=B1  1%     +77.2%        621 =C2=B1  2%  will-it-scale.time.=
elapsed_time
       350 =C2=B1  1%     +77.2%        621 =C2=B1  2%  will-it-scale.time.=
elapsed_time.max
      6684 =C2=B1  2%     +64.8%      11013 =C2=B1  3%  will-it-scale.time.=
involuntary_context_switches
        97 =C2=B1  1%     +22.7%        120 =C2=B1  1%  will-it-scale.time.=
percent_of_cpu_this_job_got
     43526 =C2=B1  1%      +6.5%      46340 =C2=B1  0%  will-it-scale.per_t=
hread_ops
    121871 =C2=B1  0%      +3.2%     125800 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
     34951 =C2=B1 30%    +385.9%     169820 =C2=B1 20%  sched_debug.cpu#51.=
ttwu_count
     12297 =C2=B1 48%    +506.8%      74615 =C2=B1 26%  sched_debug.cpu#116=
.nr_switches
      8783 =C2=B1 28%    +541.0%      56306 =C2=B1 14%  sched_debug.cpu#93.=
ttwu_count
      8620 =C2=B1 34%    +476.6%      49703 =C2=B1 10%  sched_debug.cpu#93.=
sched_goidle
     17547 =C2=B1 33%    +469.5%      99940 =C2=B1 10%  sched_debug.cpu#93.=
nr_switches
     11261 =C2=B1 21%    +517.7%      69563 =C2=B1 14%  sched_debug.cpu#92.=
ttwu_count
     10952 =C2=B1 19%    +446.1%      59808 =C2=B1 26%  sched_debug.cpu#92.=
sched_goidle
     24364 =C2=B1 13%    +411.8%     124685 =C2=B1 25%  sched_debug.cpu#92.=
sched_count
     22237 =C2=B1 19%    +440.3%     120156 =C2=B1 26%  sched_debug.cpu#92.=
nr_switches
      2342 =C2=B1 11%    +356.6%      10697 =C2=B1 21%  sched_debug.cfs_rq[=
91]:/.exec_clock
      3862 =C2=B1 36%   +1607.9%      65963 =C2=B1  1%  sched_debug.cpu#127=
.ttwu_count
      4157 =C2=B1 44%   +1306.2%      58468 =C2=B1 16%  sched_debug.cpu#127=
.sched_goidle
     10370 =C2=B1 34%   +1091.7%     123580 =C2=B1 15%  sched_debug.cpu#127=
.sched_count
      8713 =C2=B1 40%   +1246.5%     117331 =C2=B1 16%  sched_debug.cpu#127=
.nr_switches
      3128 =C2=B1 42%   +1391.8%      46666 =C2=B1 12%  sched_debug.cpu#126=
.sched_goidle
      6767 =C2=B1 40%   +1359.7%      98788 =C2=B1 13%  sched_debug.cpu#126=
.sched_count
      6524 =C2=B1 40%   +1336.4%      93716 =C2=B1 12%  sched_debug.cpu#126=
.nr_switches
     10624 =C2=B1 37%    +596.4%      73984 =C2=B1  5%  sched_debug.cpu#90.=
ttwu_count
      8416 =C2=B1 41%    +427.1%      44359 =C2=B1 16%  sched_debug.cpu#90.=
sched_goidle
     17155 =C2=B1 40%    +420.4%      89270 =C2=B1 16%  sched_debug.cpu#90.=
nr_switches
      8155 =C2=B1 29%    +551.1%      53096 =C2=B1 13%  sched_debug.cpu#89.=
ttwu_count
      8586 =C2=B1 25%    +470.8%      49013 =C2=B1  1%  sched_debug.cpu#89.=
sched_goidle
     20173 =C2=B1 18%    +420.3%     104957 =C2=B1  0%  sched_debug.cpu#89.=
sched_count
     17693 =C2=B1 25%    +457.8%      98700 =C2=B1  1%  sched_debug.cpu#89.=
nr_switches
      4290 =C2=B1 37%    +725.8%      35433 =C2=B1  2%  sched_debug.cpu#125=
.ttwu_count
      4200 =C2=B1 44%    +646.6%      31358 =C2=B1 36%  sched_debug.cpu#125=
.sched_goidle
      8929 =C2=B1 43%    +648.8%      66860 =C2=B1 33%  sched_debug.cpu#125=
.sched_count
      7124 =C2=B1 46%    +694.7%      56624 =C2=B1 24%  sched_debug.cpu#114=
.ttwu_count
      8677 =C2=B1 43%    +629.2%      63276 =C2=B1 36%  sched_debug.cpu#125=
.nr_switches
     14694 =C2=B1 41%    +345.2%      65412 =C2=B1 43%  sched_debug.cpu#64.=
ttwu_count
     24701 =C2=B1 20%    +422.1%     128979 =C2=B1  9%  sched_debug.cpu#72.=
ttwu_count
     11306 =C2=B1 34%    +383.6%      54671 =C2=B1 16%  sched_debug.cpu#88.=
ttwu_count
     41193 =C2=B1 22%    +290.5%     160875 =C2=B1 40%  sched_debug.cpu#73.=
nr_switches
     20498 =C2=B1 22%    +291.6%      80275 =C2=B1 41%  sched_debug.cpu#73.=
sched_goidle
     20972 =C2=B1 28%    +488.0%     123308 =C2=B1  8%  sched_debug.cpu#73.=
ttwu_count
     13821 =C2=B1 30%    +291.0%      54040 =C2=B1 31%  sched_debug.cpu#87.=
ttwu_count
      6070 =C2=B1 49%    +498.4%      36324 =C2=B1 29%  sched_debug.cpu#116=
.sched_goidle
     46762 =C2=B1 20%    +348.2%     209600 =C2=B1  7%  sched_debug.cpu#77.=
nr_switches
      7112 =C2=B1 48%    +443.6%      38668 =C2=B1 42%  sched_debug.cpu#116=
.ttwu_count
     50659 =C2=B1 21%    +480.1%     293875 =C2=B1 19%  sched_debug.cpu#77.=
sched_count
     23298 =C2=B1 20%    +349.3%     104683 =C2=B1  7%  sched_debug.cpu#77.=
sched_goidle
     23174 =C2=B1 18%    +442.4%     125706 =C2=B1  2%  sched_debug.cpu#77.=
ttwu_count
      7599 =C2=B1 28%    +265.6%      27783 =C2=B1 27%  sched_debug.cfs_rq[=
5]:/.exec_clock
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#86.=
cpu_load[4]
         0 =C2=B1  0%      +Inf%          4 =C2=B1 25%  sched_debug.cpu#7.l=
oad
         0 =C2=B1  0%      +Inf%          4 =C2=B1 25%  sched_debug.cfs_rq[=
7]:/.load
         0 =C2=B1  0%      +Inf%          2 =C2=B1 50%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
         0 =C2=B1  0%      +Inf%          1 =C2=B1 33%  sched_debug.cpu#86.=
cpu_load[3]
         0 =C2=B1  0%      +Inf%          1 =C2=B1 33%  sched_debug.cpu#86.=
cpu_load[2]
         0 =C2=B1  0%      +Inf%          2 =C2=B1 50%  sched_debug.cpu#25.=
cpu_load[2]
     45619 =C2=B1 13%    +376.7%     217481 =C2=B1 21%  sched_debug.cpu#79.=
nr_switches
     49302 =C2=B1 16%    +395.2%     244169 =C2=B1 13%  sched_debug.cpu#79.=
sched_count
     14766 =C2=B1 18%    +357.2%      67516 =C2=B1 36%  sched_debug.cpu#85.=
ttwu_count
     22721 =C2=B1 13%    +378.0%     108614 =C2=B1 21%  sched_debug.cpu#79.=
sched_goidle
      4393 =C2=B1 39%    +664.6%      33590 =C2=B1 31%  sched_debug.cpu#122=
.ttwu_count
      3260 =C2=B1 42%    +715.4%      26586 =C2=B1 24%  sched_debug.cpu#122=
.sched_goidle
    136652 =C2=B1 42%    +312.4%     563559 =C2=B1 39%  sched_debug.cpu#10.=
sched_count
      7090 =C2=B1 41%    +696.1%      56444 =C2=B1 22%  sched_debug.cpu#122=
.sched_count
      6815 =C2=B1 41%    +687.5%      53668 =C2=B1 23%  sched_debug.cpu#122=
.nr_switches
     13124 =C2=B1 29%    +405.6%      66361 =C2=B1 35%  sched_debug.cpu#84.=
ttwu_count
     11712 =C2=B1 29%    +372.8%      55379 =C2=B1 30%  sched_debug.cpu#84.=
sched_goidle
         0 =C2=B1  0%      +Inf%          5 =C2=B1 20%  sched_debug.cpu#22.=
cpu_load[4]
         0 =C2=B1  0%      +Inf%          5 =C2=B1 40%  sched_debug.cpu#22.=
cpu_load[3]
     27939 =C2=B1 34%    +461.5%     156884 =C2=B1 29%  sched_debug.cpu#80.=
nr_switches
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#84.=
cpu_load[4]
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#84.=
cpu_load[3]
     13810 =C2=B1 35%    +466.4%      78220 =C2=B1 29%  sched_debug.cpu#80.=
sched_goidle
     15107 =C2=B1 29%    +465.4%      85416 =C2=B1 16%  sched_debug.cpu#80.=
ttwu_count
      5927 =C2=B1 43%    +701.5%      47511 =C2=B1 20%  sched_debug.cpu#121=
.ttwu_count
      6025 =C2=B1 36%    +650.3%      45214 =C2=B1  1%  sched_debug.cpu#121=
.sched_goidle
     40758 =C2=B1 31%    +406.5%     206442 =C2=B1 17%  sched_debug.cpu#60.=
nr_switches
     42308 =C2=B1 30%    +415.0%     217900 =C2=B1 18%  sched_debug.cpu#60.=
sched_count
      3481 =C2=B1 16%    +269.4%      12860 =C2=B1 46%  sched_debug.cfs_rq[=
80]:/.exec_clock
     20226 =C2=B1 31%    +409.3%     103016 =C2=B1 17%  sched_debug.cpu#60.=
sched_goidle
     13345 =C2=B1 43%    +613.4%      95208 =C2=B1  2%  sched_debug.cpu#121=
.sched_count
     25098 =C2=B1 38%    +343.6%     111324 =C2=B1 26%  sched_debug.cpu#60.=
ttwu_count
     23628 =C2=B1 29%    +372.4%     111622 =C2=B1 30%  sched_debug.cpu#84.=
nr_switches
     25175 =C2=B1 29%    +448.2%     138004 =C2=B1  1%  sched_debug.cpu#82.=
nr_switches
     12480 =C2=B1 29%    +451.5%      68833 =C2=B1  1%  sched_debug.cpu#82.=
sched_goidle
     12871 =C2=B1 41%    +606.1%      90889 =C2=B1  1%  sched_debug.cpu#121=
.nr_switches
     18664 =C2=B1 26%    +404.8%      94211 =C2=B1 29%  sched_debug.cpu#61.=
ttwu_count
     36520 =C2=B1 40%    +409.6%     186120 =C2=B1 12%  sched_debug.cpu#61.=
sched_count
     24441 =C2=B1  7%    +343.5%     108395 =C2=B1 18%  sched_debug.cpu#74.=
ttwu_count
     20136 =C2=B1 34%    +419.9%     104680 =C2=B1 11%  sched_debug.cpu#93.=
sched_count
     14370 =C2=B1 25%    +251.7%      50534 =C2=B1 41%  sched_debug.cpu#86.=
ttwu_count
         5 =C2=B1 35%    +281.8%         21 =C2=B1 38%  sched_debug.cpu#1.n=
r_uninterruptible
     14634 =C2=B1 31%    +420.4%      76160 =C2=B1  1%  sched_debug.cpu#81.=
ttwu_count
     15058 =C2=B1 28%    +373.7%      71335 =C2=B1 12%  sched_debug.cpu#81.=
sched_goidle
     30368 =C2=B1 28%    +371.1%     143077 =C2=B1 12%  sched_debug.cpu#81.=
nr_switches
     57671 =C2=B1 25%    +272.2%     214668 =C2=B1 24%  sched_debug.cpu#59.=
sched_count
     25078 =C2=B1 23%    +366.9%     117088 =C2=B1  5%  sched_debug.cpu#78.=
ttwu_count
     23377 =C2=B1  8%    +261.1%      84426 =C2=B1 35%  sched_debug.cpu#74.=
sched_goidle
     46903 =C2=B1  8%    +260.5%     169065 =C2=B1 34%  sched_debug.cpu#74.=
nr_switches
     64749 =C2=B1 35%    +259.8%     232982 =C2=B1  2%  sched_debug.cpu#56.=
sched_count
     13530 =C2=B1 47%    +376.6%      64480 =C2=B1 18%  sched_debug.cpu#64.=
sched_goidle
     26088 =C2=B1 30%    +284.1%     100196 =C2=B1 24%  sched_debug.cpu#59.=
sched_goidle
     53249 =C2=B1 32%    +277.3%     200891 =C2=B1 24%  sched_debug.cpu#59.=
nr_switches
     27325 =C2=B1 46%    +373.3%     129324 =C2=B1 18%  sched_debug.cpu#64.=
nr_switches
     27780 =C2=B1 13%    +307.8%     113287 =C2=B1 10%  sched_debug.cpu#79.=
ttwu_count
     30937 =C2=B1 35%    +255.6%     110010 =C2=B1  2%  sched_debug.cpu#56.=
sched_goidle
     62118 =C2=B1 35%    +254.7%     220323 =C2=B1  2%  sched_debug.cpu#56.=
nr_switches
     54240 =C2=B1 17%    +282.7%     207601 =C2=B1 16%  sched_debug.cpu#74.=
sched_count
     28472 =C2=B1 46%    +393.3%     140460 =C2=B1 13%  sched_debug.cpu#64.=
sched_count
     14250 =C2=B1  3%    +234.1%      47614 =C2=B1 37%  sched_debug.cfs_rq[=
117]:/.exec_clock
     50195 =C2=B1 30%    +370.2%     235998 =C2=B1 13%  sched_debug.cpu#75.=
sched_count
     13160 =C2=B1 26%    +285.7%      50753 =C2=B1 12%  sched_debug.cpu#86.=
sched_goidle
     17555 =C2=B1 41%    +368.6%      82265 =C2=B1  6%  sched_debug.cpu#61.=
sched_goidle
     26497 =C2=B1 25%    +284.2%     101809 =C2=B1 12%  sched_debug.cpu#86.=
nr_switches
     83564 =C2=B1 30%    +230.7%     276344 =C2=B1 22%  sched_debug.cpu#31.=
sched_count
     14244 =C2=B1 22%    +277.6%      53786 =C2=B1 16%  sched_debug.cpu#83.=
sched_goidle
     35362 =C2=B1 40%    +366.5%     164951 =C2=B1  6%  sched_debug.cpu#61.=
nr_switches
      3096 =C2=B1 32%    +239.2%      10504 =C2=B1 17%  sched_debug.cfs_rq[=
25]:/.exec_clock
     28710 =C2=B1 22%    +276.0%     107944 =C2=B1 16%  sched_debug.cpu#83.=
nr_switches
     46666 =C2=B1 28%    +383.3%     225530 =C2=B1  7%  sched_debug.cpu#73.=
sched_count
     32256 =C2=B1 46%    +245.3%     111395 =C2=B1 40%  sched_debug.cpu#25.=
ttwu_count
     33450 =C2=B1 18%    +243.7%     114960 =C2=B1 16%  sched_debug.cpu#32.=
sched_goidle
     67706 =C2=B1 19%    +240.2%     230335 =C2=B1 16%  sched_debug.cpu#32.=
nr_switches
    102763 =C2=B1 11%    +267.9%     378014 =C2=B1 14%  sched_debug.cfs_rq[=
122]:/.spread0
    106597 =C2=B1 22%    +248.9%     371928 =C2=B1 13%  sched_debug.cfs_rq[=
123]:/.spread0
    205539 =C2=B1  7%    +305.6%     833677 =C2=B1  6%  sched_debug.cfs_rq[=
85]:/.min_vruntime
    107737 =C2=B1 18%    +260.9%     388796 =C2=B1 13%  sched_debug.cfs_rq[=
125]:/.spread0
     21896 =C2=B1 37%    +335.3%      95305 =C2=B1 16%  sched_debug.cpu#90.=
sched_count
      2171 =C2=B1 11%    +334.1%       9428 =C2=B1  5%  sched_debug.cfs_rq[=
78]:/.exec_clock
     59451 =C2=B1 25%    +335.7%     259038 =C2=B1  9%  sched_debug.cpu#78.=
sched_count
     47693 =C2=B1 26%    +288.2%     185147 =C2=B1 19%  sched_debug.cpu#20.=
ttwu_count
     98085 =C2=B1 12%    +264.8%     357822 =C2=B1  5%  sched_debug.cfs_rq[=
120]:/.spread0
    209213 =C2=B1  8%    +294.7%     825681 =C2=B1  6%  sched_debug.cfs_rq[=
84]:/.min_vruntime
    275664 =C2=B1 37%    +200.6%     828579 =C2=B1 11%  sched_debug.cfs_rq[=
81]:/.min_vruntime
    167107 =C2=B1 25%    +196.8%     496001 =C2=B1 37%  sched_debug.cpu#42.=
sched_count
     48043 =C2=B1 19%    +305.8%     194968 =C2=B1  4%  sched_debug.cpu#18.=
ttwu_count
    253245 =C2=B1 49%    +215.4%     798792 =C2=B1  7%  sched_debug.cfs_rq[=
72]:/.min_vruntime
    108170 =C2=B1 18%    +239.7%     367496 =C2=B1 14%  sched_debug.cfs_rq[=
121]:/.spread0
    201677 =C2=B1 10%    +304.7%     816241 =C2=B1  3%  sched_debug.cfs_rq[=
78]:/.min_vruntime
     32126 =C2=B1 46%    +204.7%      97887 =C2=B1 32%  sched_debug.cpu#25.=
sched_goidle
    213998 =C2=B1 12%    +289.1%     832746 =C2=B1  6%  sched_debug.cfs_rq[=
88]:/.min_vruntime
     64566 =C2=B1 45%    +204.1%     196319 =C2=B1 32%  sched_debug.cpu#25.=
nr_switches
    500845 =C2=B1  6%    +259.6%    1800926 =C2=B1 13%  sched_debug.cfs_rq[=
10]:/.min_vruntime
    211841 =C2=B1  8%    +280.6%     806246 =C2=B1  7%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     26350 =C2=B1 21%    +307.8%     107462 =C2=B1  3%  sched_debug.cpu#78.=
sched_goidle
     10834 =C2=B1 24%    +327.3%      46291 =C2=B1  1%  sched_debug.cpu#91.=
ttwu_count
     12262 =C2=B1 30%    +315.8%      50986 =C2=B1  7%  sched_debug.cpu#87.=
sched_goidle
    208422 =C2=B1  7%    +289.2%     811155 =C2=B1  7%  sched_debug.cfs_rq[=
82]:/.min_vruntime
     27415 =C2=B1 26%    +279.6%     104070 =C2=B1 13%  sched_debug.cpu#75.=
ttwu_count
     52918 =C2=B1 20%    +306.6%     215140 =C2=B1  3%  sched_debug.cpu#78.=
nr_switches
    218905 =C2=B1  3%    +267.0%     803338 =C2=B1 10%  sched_debug.cfs_rq[=
80]:/.min_vruntime
     24718 =C2=B1 30%    +314.2%     102375 =C2=B1  7%  sched_debug.cpu#87.=
nr_switches
    206206 =C2=B1 12%    +284.7%     793215 =C2=B1  5%  sched_debug.cfs_rq[=
77]:/.min_vruntime
      2357 =C2=B1 24%    +273.6%       8809 =C2=B1  2%  sched_debug.cfs_rq[=
77]:/.exec_clock
    211134 =C2=B1  5%    +282.4%     807317 =C2=B1  4%  sched_debug.cfs_rq[=
76]:/.min_vruntime
    502525 =C2=B1  6%    +248.6%    1751911 =C2=B1 14%  sched_debug.cfs_rq[=
9]:/.min_vruntime
    128272 =C2=B1 41%    +208.9%     396169 =C2=B1 21%  sched_debug.cpu#14.=
sched_count
    211381 =C2=B1 10%    +284.1%     811996 =C2=B1  6%  sched_debug.cfs_rq[=
94]:/.min_vruntime
    215247 =C2=B1 11%    +277.6%     812779 =C2=B1  6%  sched_debug.cfs_rq[=
31]:/.min_vruntime
      2338 =C2=B1 18%    +274.5%       8758 =C2=B1 11%  sched_debug.cfs_rq[=
86]:/.exec_clock
    205236 =C2=B1 11%    +295.9%     812544 =C2=B1  2%  sched_debug.cfs_rq[=
73]:/.min_vruntime
    205899 =C2=B1 10%    +287.1%     797136 =C2=B1  3%  sched_debug.cfs_rq[=
86]:/.min_vruntime
 6.655e+09 =C2=B1  9%    +266.9%  2.441e+10 =C2=B1  5%  cpuidle.C1-NHM.time
    220725 =C2=B1 18%    +255.8%     785309 =C2=B1  6%  sched_debug.cfs_rq[=
28]:/.min_vruntime
    217232 =C2=B1 12%    +281.0%     827669 =C2=B1  3%  sched_debug.cfs_rq[=
25]:/.min_vruntime
    204915 =C2=B1 10%    +282.9%     784667 =C2=B1  2%  sched_debug.cfs_rq[=
79]:/.min_vruntime
     62893 =C2=B1 22%    +293.3%     247350 =C2=B1 12%  sched_debug.cpu#51.=
sched_count
    220288 =C2=B1 15%    +258.7%     790262 =C2=B1  4%  sched_debug.cfs_rq[=
29]:/.min_vruntime
     65407 =C2=B1 26%    +268.8%     241248 =C2=B1  1%  sched_debug.cpu#72.=
sched_count
    203905 =C2=B1 12%    +278.8%     772415 =C2=B1  3%  sched_debug.cfs_rq[=
75]:/.min_vruntime
    226729 =C2=B1 22%    +252.0%     798039 =C2=B1  4%  sched_debug.cfs_rq[=
26]:/.min_vruntime
    100423 =C2=B1 12%    +262.8%     364369 =C2=B1  4%  sched_debug.cfs_rq[=
126]:/.spread0
    211611 =C2=B1 13%    +274.5%     792462 =C2=B1  2%  sched_debug.cfs_rq[=
83]:/.min_vruntime
    212517 =C2=B1 11%    +278.9%     805162 =C2=B1  4%  sched_debug.cfs_rq[=
91]:/.min_vruntime
     23844 =C2=B1 25%    +274.9%      89399 =C2=B1  5%  sched_debug.cpu#27.=
sched_goidle
     30001 =C2=B1 22%    +283.6%     115100 =C2=B1 13%  sched_debug.cpu#51.=
sched_goidle
    218841 =C2=B1 12%    +258.1%     783633 =C2=B1  4%  sched_debug.cfs_rq[=
87]:/.min_vruntime
     60253 =C2=B1 22%    +282.7%     230597 =C2=B1 13%  sched_debug.cpu#51.=
nr_switches
     37505 =C2=B1 28%    +191.7%     109412 =C2=B1 41%  sched_debug.cpu#52.=
ttwu_count
     48009 =C2=B1 24%    +273.5%     179298 =C2=B1  4%  sched_debug.cpu#27.=
nr_switches
    214046 =C2=B1 12%    +289.7%     834104 =C2=B1  1%  sched_debug.cfs_rq[=
89]:/.min_vruntime
     13932 =C2=B1 17%    +281.0%      53077 =C2=B1  5%  sched_debug.cpu#82.=
ttwu_count
      9003 =C2=B1 47%    +128.3%      20552 =C2=B1 16%  sched_debug.cfs_rq[=
9]:/.exec_clock
        11 =C2=B1 43%     -66.2%          4 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.load
        11 =C2=B1 43%     -66.2%          4 =C2=B1  0%  sched_debug.cpu#41.=
load
      6983 =C2=B1  8%    +230.6%      23089 =C2=B1 15%  sched_debug.cfs_rq[=
3]:/.exec_clock
    204133 =C2=B1 11%    +287.1%     790162 =C2=B1  0%  sched_debug.cfs_rq[=
74]:/.min_vruntime
    521366 =C2=B1  9%    +237.7%    1760516 =C2=B1 12%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     55103 =C2=B1 11%    +258.2%     197355 =C2=B1  3%  sched_debug.cpu#72.=
nr_switches
     32255 =C2=B1 37%    +151.0%      80977 =C2=B1 48%  sched_debug.cpu#59.=
ttwu_count
    169058 =C2=B1 42%    +175.5%     465790 =C2=B1 33%  sched_debug.cpu#9.s=
ched_count
    217491 =C2=B1 14%    +266.6%     797403 =C2=B1  2%  sched_debug.cfs_rq[=
93]:/.min_vruntime
     33754 =C2=B1 29%    +206.4%     103426 =C2=B1 13%  sched_debug.cpu#56.=
ttwu_count
    224009 =C2=B1 14%    +260.9%     808482 =C2=B1  6%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     27471 =C2=B1 11%    +256.0%      97803 =C2=B1  2%  sched_debug.cpu#72.=
sched_goidle
     38028 =C2=B1 18%    +187.4%     109281 =C2=B1 20%  sched_debug.cpu#55.=
ttwu_count
      6899 =C2=B1  9%    +224.0%      22349 =C2=B1 15%  sched_debug.cfs_rq[=
7]:/.exec_clock
      5993 =C2=B1 12%    +213.5%      18787 =C2=B1 17%  sched_debug.cfs_rq[=
22]:/.exec_clock
     14502 =C2=B1 26%    +281.9%      55390 =C2=B1  5%  sched_debug.cpu#85.=
sched_goidle
     29204 =C2=B1 26%    +288.9%     113570 =C2=B1  3%  sched_debug.cpu#85.=
nr_switches
     42332 =C2=B1 22%    +225.4%     137742 =C2=B1 14%  sched_debug.cpu#20.=
sched_goidle
    114733 =C2=B1 31%    +224.1%     371895 =C2=B1 14%  sched_debug.cfs_rq[=
127]:/.spread0
    217535 =C2=B1 14%    +271.5%     808240 =C2=B1  3%  sched_debug.cfs_rq[=
90]:/.min_vruntime
     84969 =C2=B1 22%    +224.7%     275920 =C2=B1 14%  sched_debug.cpu#20.=
nr_switches
      9024 =C2=B1 42%    +297.9%      35904 =C2=B1  0%  sched_debug.cpu#94.=
ttwu_count
     39102 =C2=B1 49%    +352.3%     176871 =C2=B1 14%  sched_debug.cpu#58.=
sched_count
     38737 =C2=B1 39%    +267.5%     142361 =C2=B1  3%  sched_debug.cpu#49.=
ttwu_count
     37138 =C2=B1 45%    +181.9%     104699 =C2=B1 27%  sched_debug.cpu#26.=
ttwu_count
     34547 =C2=B1 26%    +239.8%     117385 =C2=B1  0%  sched_debug.cpu#31.=
ttwu_count
    307657 =C2=B1 47%    +166.2%     819036 =C2=B1  2%  sched_debug.cfs_rq[=
92]:/.min_vruntime
     89479 =C2=B1 22%    +224.8%     290588 =C2=B1 13%  sched_debug.cpu#20.=
sched_count
     79984 =C2=B1 25%    +165.8%     212589 =C2=B1 31%  sched_debug.cpu#42.=
sched_goidle
     23388 =C2=B1 30%    +305.3%      94791 =C2=B1  0%  sched_debug.cpu#75.=
sched_goidle
    160327 =C2=B1 25%    +165.5%     425697 =C2=B1 31%  sched_debug.cpu#42.=
nr_switches
     46947 =C2=B1 30%    +304.3%     189819 =C2=B1  0%  sched_debug.cpu#75.=
nr_switches
     36364 =C2=B1 37%    +237.4%     122710 =C2=B1  7%  sched_debug.cpu#63.=
sched_count
      2869 =C2=B1 35%    +223.1%       9272 =C2=B1  6%  sched_debug.cfs_rq[=
72]:/.exec_clock
    259541 =C2=B1 38%    +206.3%     795067 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.min_vruntime
    217787 =C2=B1 11%    +270.5%     806900 =C2=B1  2%  sched_debug.cfs_rq[=
95]:/.min_vruntime
        14 =C2=B1 43%     -72.1%          4 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.tg_load_contrib
     18521 =C2=B1 49%    +339.2%      81356 =C2=B1 13%  sched_debug.cpu#58.=
sched_goidle
     37314 =C2=B1 49%    +337.5%     163242 =C2=B1 13%  sched_debug.cpu#58.=
nr_switches
      2632 =C2=B1 22%    +199.8%       7891 =C2=B1 11%  sched_debug.cfs_rq[=
82]:/.exec_clock
       181 =C2=B1  9%    +145.7%        446 =C2=B1 38%  sched_debug.cpu#103=
.ttwu_local
     17366 =C2=B1 38%    +233.2%      57862 =C2=B1  6%  sched_debug.cpu#63.=
sched_goidle
     38251 =C2=B1 33%    +200.7%     115007 =C2=B1  7%  sched_debug.cpu#50.=
ttwu_count
     34975 =C2=B1 38%    +231.8%     116061 =C2=B1  6%  sched_debug.cpu#63.=
nr_switches
     71228 =C2=B1 29%    +248.0%     247889 =C2=B1  5%  sched_debug.cpu#49.=
sched_count
     65339 =C2=B1 43%    +181.3%     183799 =C2=B1 22%  sched_debug.cpu#45.=
ttwu_count
     33949 =C2=B1 26%    +204.6%     103416 =C2=B1  4%  sched_debug.cpu#54.=
ttwu_count
     29966 =C2=B1 36%    +212.1%      93525 =C2=B1  5%  sched_debug.cpu#54.=
sched_goidle
     62971 =C2=B1 36%    +213.3%     197292 =C2=B1  4%  sched_debug.cpu#54.=
sched_count
     58634 =C2=B1 24%    +168.6%     157495 =C2=B1 25%  sched_debug.cpu#16.=
sched_goidle
     60170 =C2=B1 36%    +211.4%     187366 =C2=B1  5%  sched_debug.cpu#54.=
nr_switches
    118044 =C2=B1 25%    +167.3%     315555 =C2=B1 25%  sched_debug.cpu#16.=
nr_switches
     28637 =C2=B1 23%    +210.4%      88877 =C2=B1 10%  sched_debug.cpu#27.=
ttwu_count
     34080 =C2=B1 29%    +244.9%     117557 =C2=B1  6%  sched_debug.cpu#49.=
sched_goidle
    124950 =C2=B1 30%    +166.8%     333329 =C2=B1 27%  sched_debug.cpu#3.t=
twu_count
     68423 =C2=B1 29%    +244.1%     235455 =C2=B1  6%  sched_debug.cpu#49.=
nr_switches
     76425 =C2=B1 31%    +178.2%     212634 =C2=B1  2%  sched_debug.cpu#50.=
sched_count
     58644 =C2=B1 25%    +222.4%     189066 =C2=B1  2%  sched_debug.cpu#76.=
sched_count
     47072 =C2=B1 18%    +193.7%     138242 =C2=B1  8%  sched_debug.cpu#23.=
ttwu_count
     10127 =C2=B1 14%    +168.5%      27194 =C2=B1 21%  sched_debug.cfs_rq[=
67]:/.exec_clock
     29770 =C2=B1 36%    +211.4%      92698 =C2=B1  4%  sched_debug.cpu#31.=
sched_goidle
     59821 =C2=B1 36%    +210.7%     185864 =C2=B1  4%  sched_debug.cpu#31.=
nr_switches
      9640 =C2=B1 25%    +261.2%      34824 =C2=B1  5%  sched_debug.cpu#91.=
sched_goidle
     40810 =C2=B1 28%    +237.4%     137704 =C2=B1  8%  sched_debug.cpu#53.=
ttwu_count
     27488 =C2=B1 26%    +168.6%      73835 =C2=B1 19%  sched_debug.cpu#76.=
sched_goidle
     11132 =C2=B1 45%    +124.8%      25021 =C2=B1 25%  sched_debug.cpu#95.=
ttwu_count
     40873 =C2=B1 26%    +183.4%     115822 =C2=B1 14%  sched_debug.cpu#32.=
ttwu_count
     36681 =C2=B1 31%    +173.7%     100397 =C2=B1  2%  sched_debug.cpu#50.=
sched_goidle
     73578 =C2=B1 31%    +173.4%     201142 =C2=B1  2%  sched_debug.cpu#50.=
nr_switches
     19674 =C2=B1 24%    +256.0%      70041 =C2=B1  5%  sched_debug.cpu#91.=
nr_switches
    136050 =C2=B1 37%    +184.1%     386577 =C2=B1 27%  sched_debug.cpu#45.=
sched_count
     55250 =C2=B1 38%    +172.6%     150609 =C2=B1 25%  sched_debug.cpu#10.=
ttwu_count
     22186 =C2=B1 15%    +230.3%      73282 =C2=B1  5%  sched_debug.cpu#91.=
sched_count
     65429 =C2=B1 37%    +181.4%     184141 =C2=B1 28%  sched_debug.cpu#45.=
sched_goidle
      2731 =C2=B1 28%    +209.8%       8461 =C2=B1 13%  sched_debug.cfs_rq[=
84]:/.exec_clock
    131197 =C2=B1 37%    +181.1%     368742 =C2=B1 28%  sched_debug.cpu#45.=
nr_switches
     64801 =C2=B1 16%    +191.4%     188801 =C2=B1  7%  sched_debug.cpu#41.=
sched_goidle
    130073 =C2=B1 16%    +190.7%     378085 =C2=B1  7%  sched_debug.cpu#41.=
nr_switches
    135264 =C2=B1 16%    +192.2%     395287 =C2=B1  7%  sched_debug.cpu#41.=
sched_count
      2635 =C2=B1 16%    +229.3%       8676 =C2=B1  1%  sched_debug.cfs_rq[=
79]:/.exec_clock
     40041 =C2=B1 32%    +257.0%     142936 =C2=B1  5%  sched_debug.cpu#53.=
sched_goidle
     80356 =C2=B1 32%    +256.1%     286174 =C2=B1  5%  sched_debug.cpu#53.=
nr_switches
     55485 =C2=B1 26%    +166.5%     147891 =C2=B1 19%  sched_debug.cpu#76.=
nr_switches
     95506 =C2=B1 45%    +257.4%     341374 =C2=B1  2%  sched_debug.cpu#1.t=
twu_count
        15 =C2=B1 34%     -61.3%          6 =C2=B1  0%  sched_debug.cpu#38.=
load
     69391 =C2=B1 19%    +172.5%     189061 =C2=B1 15%  sched_debug.cpu#41.=
ttwu_count
     29124 =C2=B1 39%    +181.9%      82087 =C2=B1 14%  sched_debug.cpu#88.=
sched_count
     45338 =C2=B1 21%    +215.8%     143197 =C2=B1  5%  sched_debug.cpu#17.=
ttwu_count
     89282 =C2=B1 38%    +236.8%     300699 =C2=B1 10%  sched_debug.cpu#25.=
sched_count
    504953 =C2=B1  7%    +211.2%    1571471 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     83217 =C2=B1 32%    +257.6%     297597 =C2=B1  4%  sched_debug.cpu#53.=
sched_count
     35727 =C2=B1 36%    +197.8%     106408 =C2=B1 11%  sched_debug.cpu#86.=
sched_count
     15057 =C2=B1 20%    +173.6%      41190 =C2=B1 16%  sched_debug.cpu#83.=
ttwu_count
      7307 =C2=B1  7%    +196.2%      21644 =C2=B1  9%  sched_debug.cfs_rq[=
6]:/.exec_clock
     92159 =C2=B1 21%    +188.3%     265654 =C2=B1  9%  sched_debug.cpu#18.=
sched_count
       188 =C2=B1  7%    +130.9%        434 =C2=B1 42%  sched_debug.cpu#117=
.ttwu_local
    505338 =C2=B1  8%    +200.7%    1519498 =C2=B1  1%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     74688 =C2=B1 23%    +158.9%     193380 =C2=B1 30%  sched_debug.cpu#42.=
ttwu_count
     42995 =C2=B1 24%    +192.2%     125649 =C2=B1  9%  sched_debug.cpu#18.=
sched_goidle
     86287 =C2=B1 24%    +191.7%     251720 =C2=B1  9%  sched_debug.cpu#18.=
nr_switches
     11092 =C2=B1 37%    +249.8%      38802 =C2=B1 13%  sched_debug.cpu#88.=
sched_goidle
    119999 =C2=B1 26%    +191.5%     349806 =C2=B1  5%  sched_debug.cpu#7.t=
twu_count
    513258 =C2=B1  8%    +208.8%    1584798 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     22593 =C2=B1 36%    +247.2%      78432 =C2=B1 13%  sched_debug.cpu#88.=
nr_switches
      1162 =C2=B1 21%    +137.0%       2756 =C2=B1 32%  sched_debug.cpu#14.=
ttwu_local
    522036 =C2=B1 10%    +200.3%    1567420 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     49032 =C2=B1 28%    +240.4%     166900 =C2=B1  1%  sched_debug.cpu#22.=
ttwu_count
      5870 =C2=B1 12%    +180.8%      16482 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.exec_clock
     58480 =C2=B1 32%    +139.7%     140165 =C2=B1 22%  sched_debug.cpu#15.=
ttwu_count
    505162 =C2=B1  7%    +198.4%    1507266 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.min_vruntime
    503104 =C2=B1  7%    +198.7%    1502711 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    507124 =C2=B1  7%    +203.3%    1537949 =C2=B1  3%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     43475 =C2=B1 14%    +195.2%     128330 =C2=B1 10%  sched_debug.cpu#23.=
sched_goidle
     43424 =C2=B1 23%    +204.1%     132044 =C2=B1 11%  sched_debug.cpu#22.=
sched_goidle
     87230 =C2=B1 14%    +194.7%     257098 =C2=B1 10%  sched_debug.cpu#23.=
nr_switches
     87159 =C2=B1 23%    +203.4%     264448 =C2=B1 11%  sched_debug.cpu#22.=
nr_switches
     43069 =C2=B1 21%    +138.9%     102914 =C2=B1 25%  sched_debug.cpu#21.=
sched_goidle
         2 =C2=B1 37%     -64.7%          1 =C2=B1  0%  sched_debug.cpu#104=
.cpu_load[0]
         3 =C2=B1 33%     -66.7%          1 =C2=B1  0%  sched_debug.cpu#110=
.cpu_load[4]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#107=
.cpu_load[2]
         2 =C2=B1 17%     -62.5%          1 =C2=B1  0%  sched_debug.cpu#105=
.cpu_load[4]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#107=
.cpu_load[3]
         2 =C2=B1 27%     -62.5%          1 =C2=B1  0%  sched_debug.cpu#107=
.cpu_load[1]
         2 =C2=B1 27%     -62.5%          1 =C2=B1  0%  sched_debug.cpu#107=
.cpu_load[0]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#105=
.cpu_load[0]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#107=
.cpu_load[4]
         2 =C2=B1 37%     -64.7%          1 =C2=B1  0%  sched_debug.cpu#108=
.cpu_load[0]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#111=
.cpu_load[0]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#111=
.cpu_load[3]
         2 =C2=B1 37%     -64.7%          1 =C2=B1  0%  sched_debug.cpu#104=
.load
         2 =C2=B1 17%     -62.5%          1 =C2=B1  0%  sched_debug.cfs_rq[=
105]:/.runnable_load_avg
         2 =C2=B1 17%     -62.5%          1 =C2=B1  0%  sched_debug.cpu#105=
.cpu_load[3]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#111=
.cpu_load[2]
         2 =C2=B1 37%     -64.7%          1 =C2=B1  0%  sched_debug.cpu#104=
.cpu_load[1]
         3 =C2=B1 47%     -66.7%          1 =C2=B1  0%  sched_debug.cpu#108=
.cpu_load[1]
         2 =C2=B1 24%     -64.7%          1 =C2=B1  0%  sched_debug.cpu#104=
.cpu_load[2]
         2 =C2=B1 13%     -64.7%          1 =C2=B1  0%  sched_debug.cpu#104=
.cpu_load[3]
         3 =C2=B1 47%     -66.7%          1 =C2=B1  0%  sched_debug.cpu#110=
.cpu_load[2]
         2 =C2=B1 37%     -64.7%          1 =C2=B1  0%  sched_debug.cpu#110=
.cpu_load[3]
         3 =C2=B1 47%     -66.7%          1 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.runnable_load_avg
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#105=
.cpu_load[2]
         3 =C2=B1 47%     -66.7%          1 =C2=B1  0%  sched_debug.cpu#110=
.cpu_load[1]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#105=
.cpu_load[1]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#111=
.cpu_load[4]
         2 =C2=B1 37%     -64.7%          1 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.runnable_load_avg
         2 =C2=B1 27%     -62.5%          1 =C2=B1  0%  sched_debug.cfs_rq[=
107]:/.runnable_load_avg
         3 =C2=B1 47%     -66.7%          1 =C2=B1  0%  sched_debug.cpu#110=
.cpu_load[0]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#105=
.load
         2 =C2=B1 37%     -64.7%          1 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.load
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#111=
.load
         3 =C2=B1 19%     -66.7%          1 =C2=B1  0%  sched_debug.cpu#104=
.cpu_load[4]
         2 =C2=B1 20%     -60.0%          1 =C2=B1  0%  sched_debug.cpu#111=
.cpu_load[1]
         2 =C2=B1 37%     -64.7%          1 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.runnable_load_avg
    503746 =C2=B1  7%    +202.4%    1523210 =C2=B1  2%  sched_debug.cfs_rq[=
18]:/.min_vruntime
      6005 =C2=B1  9%    +195.6%      17749 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.exec_clock
     86463 =C2=B1 21%    +138.6%     206305 =C2=B1 25%  sched_debug.cpu#21.=
nr_switches
    502605 =C2=B1  6%    +198.7%    1501059 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.min_vruntime
    503056 =C2=B1  7%    +199.9%    1508746 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.min_vruntime
       912 =C2=B1 23%    +117.0%       1980 =C2=B1 34%  sched_debug.cpu#23.=
ttwu_local
     74858 =C2=B1 31%    +178.9%     208804 =C2=B1 25%  sched_debug.cpu#52.=
sched_count
    512852 =C2=B1  8%    +196.6%    1521150 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    523315 =C2=B1  9%    +194.8%    1542615 =C2=B1  1%  sched_debug.cfs_rq[=
67]:/.min_vruntime
    501833 =C2=B1  6%    +201.1%    1510802 =C2=B1  2%  sched_debug.cfs_rq[=
23]:/.min_vruntime
     36060 =C2=B1 30%    +147.9%      89384 =C2=B1 32%  sched_debug.cpu#29.=
sched_goidle
      9447 =C2=B1 25%    +161.4%      24691 =C2=B1  2%  sched_debug.cfs_rq[=
66]:/.exec_clock
     72442 =C2=B1 29%    +147.4%     179228 =C2=B1 32%  sched_debug.cpu#29.=
nr_switches
    501194 =C2=B1  5%    +197.8%    1492313 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.min_vruntime
    509012 =C2=B1  6%    +203.4%    1544109 =C2=B1  0%  sched_debug.cfs_rq[=
66]:/.min_vruntime
     94431 =C2=B1 17%    +189.9%     273763 =C2=B1  9%  sched_debug.cpu#23.=
sched_count
     28531 =C2=B1  2%    +141.0%      68757 =C2=B1 23%  sched_debug.cfs_rq[=
61]:/.exec_clock
      8884 =C2=B1 33%    +175.5%      24475 =C2=B1  7%  sched_debug.cpu#94.=
sched_goidle
    518369 =C2=B1  9%    +195.4%    1531183 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.min_vruntime
    503985 =C2=B1  6%    +199.9%    1511445 =C2=B1  2%  sched_debug.cfs_rq[=
20]:/.min_vruntime
    512085 =C2=B1  5%    +195.8%    1514837 =C2=B1  2%  sched_debug.cfs_rq[=
70]:/.min_vruntime
    516567 =C2=B1  7%    +195.1%    1524531 =C2=B1  3%  sched_debug.cfs_rq[=
68]:/.min_vruntime
     36004 =C2=B1 32%    +173.9%      98610 =C2=B1 26%  sched_debug.cpu#52.=
sched_goidle
    501475 =C2=B1  6%    +197.4%    1491450 =C2=B1  1%  sched_debug.cfs_rq[=
22]:/.min_vruntime
    517735 =C2=B1  5%    +197.6%    1540902 =C2=B1  1%  sched_debug.cfs_rq[=
65]:/.min_vruntime
     72242 =C2=B1 32%    +173.5%     197547 =C2=B1 26%  sched_debug.cpu#52.=
nr_switches
     18067 =C2=B1 33%    +173.2%      49357 =C2=B1  7%  sched_debug.cpu#94.=
nr_switches
      8988 =C2=B1 40%    +164.5%      23778 =C2=B1  2%  sched_debug.cpu#95.=
sched_goidle
      8247 =C2=B1 33%    +135.5%      19421 =C2=B1  9%  sched_debug.cfs_rq[=
17]:/.exec_clock
      6891 =C2=B1 23%    +161.4%      18011 =C2=B1 11%  sched_debug.cfs_rq[=
24]:/.exec_clock
     94513 =C2=B1 26%    +198.2%     281832 =C2=B1 12%  sched_debug.cpu#22.=
sched_count
      6101 =C2=B1 10%    +182.0%      17207 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.exec_clock
    518009 =C2=B1  7%    +192.1%    1513222 =C2=B1  2%  sched_debug.cfs_rq[=
69]:/.min_vruntime
     18764 =C2=B1 44%    +156.4%      48104 =C2=B1  2%  sched_debug.cpu#95.=
nr_switches
    508462 =C2=B1  5%    +194.2%    1496106 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.min_vruntime
    510172 =C2=B1  8%    +188.2%    1470560 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     28750 =C2=B1 25%    +195.1%      84834 =C2=B1  6%  sched_debug.cpu#76.=
ttwu_count
     72790 =C2=B1 18%    +144.3%     177817 =C2=B1 31%  sched_debug.cpu#55.=
sched_count
    524326 =C2=B1  9%    +190.4%    1522454 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     48843 =C2=B1 28%    +145.3%     119795 =C2=B1 21%  sched_debug.cpu#14.=
sched_goidle
    510584 =C2=B1  6%    +197.9%    1520776 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    509905 =C2=B1  7%    +193.0%    1493810 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.min_vruntime
       310 =C2=B1 15%    +124.7%        698 =C2=B1 35%  sched_debug.cpu#122=
.ttwu_local
     98128 =C2=B1 28%    +144.9%     240291 =C2=B1 21%  sched_debug.cpu#14.=
nr_switches
      6152 =C2=B1  7%    +178.5%      17134 =C2=B1  6%  sched_debug.cfs_rq[=
13]:/.exec_clock
    505913 =C2=B1  7%    +193.1%    1483066 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.min_vruntime
  33291322 =C2=B1 42%     +97.5%   65761194 =C2=B1 21%  cpuidle.POLL.time
    141013 =C2=B1 29%    +209.4%     436307 =C2=B1  2%  sched_debug.cpu#47.=
sched_count
     55294 =C2=B1 28%    +151.6%     139130 =C2=B1  2%  sched_debug.cpu#15.=
sched_goidle
     91613 =C2=B1 20%    +138.7%     218655 =C2=B1 25%  sched_debug.cpu#21.=
sched_count
    102564 =C2=B1 17%    +159.5%     266182 =C2=B1 14%  numa-numastat.node4=
.numa_hit
      4286 =C2=B1 19%    +169.8%      11563 =C2=B1 12%  proc-vmstat.pgalloc=
_dma32
     53365 =C2=B1 25%    +183.1%     151101 =C2=B1  8%  sched_debug.cpu#24.=
ttwu_count
    110987 =C2=B1 28%    +151.2%     278801 =C2=B1  2%  sched_debug.cpu#15.=
nr_switches
      5805 =C2=B1  6%    +175.8%      16011 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.exec_clock
     66038 =C2=B1 33%    +140.3%     158660 =C2=B1 17%  sched_debug.cpu#48.=
ttwu_count
      6999 =C2=B1 13%    +171.7%      19015 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.exec_clock
     46512 =C2=B1 26%    +136.7%     110096 =C2=B1 18%  sched_debug.cpu#21.=
ttwu_count
     99838 =C2=B1 17%    +162.5%     262040 =C2=B1 14%  numa-numastat.node4=
.local_node
      7423 =C2=B1 10%    +161.1%      19381 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.exec_clock
     34765 =C2=B1 19%    +139.4%      83227 =C2=B1 30%  sched_debug.cpu#55.=
sched_goidle
     23246 =C2=B1 48%    +116.1%      50235 =C2=B1  2%  sched_debug.cpu#95.=
sched_count
     69764 =C2=B1 18%    +139.0%     166769 =C2=B1 30%  sched_debug.cpu#55.=
nr_switches
      2776 =C2=B1 29%    +186.2%       7945 =C2=B1  0%  sched_debug.cfs_rq[=
83]:/.exec_clock
       274 =C2=B1 11%    +112.8%        584 =C2=B1 34%  sched_debug.cpu#64.=
ttwu_local
    116288 =C2=B1 36%    +198.5%     347085 =C2=B1  4%  sched_debug.cpu#2.t=
twu_count
    131790 =C2=B1 29%    +161.0%     343946 =C2=B1 19%  sched_debug.cpu#48.=
sched_count
      6021 =C2=B1  8%    +162.4%      15800 =C2=B1  3%  sched_debug.cfs_rq[=
23]:/.exec_clock
     67540 =C2=B1 29%    +202.0%     204005 =C2=B1  2%  sched_debug.cpu#47.=
sched_goidle
    135447 =C2=B1 29%    +201.6%     408447 =C2=B1  2%  sched_debug.cpu#47.=
nr_switches
     32361 =C2=B1 41%    +227.6%     106032 =C2=B1  6%  sched_debug.cpu#30.=
sched_goidle
     65049 =C2=B1 41%    +226.7%     212488 =C2=B1  6%  sched_debug.cpu#30.=
nr_switches
     11420 =C2=B1 44%     +97.7%      22576 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.exec_clock
    681998 =C2=B1 19%    +197.7%    2030103 =C2=B1  1%  sched_debug.cfs_rq[=
124]:/.min_vruntime
    779766 =C2=B1  5%    +163.7%    2056173 =C2=B1  1%  sched_debug.cfs_rq[=
125]:/.min_vruntime
    135976 =C2=B1 25%    +188.3%     391981 =C2=B1  7%  sched_debug.cpu#44.=
sched_count
     63079 =C2=B1 29%    +156.2%     161632 =C2=B1 19%  sched_debug.cpu#48.=
sched_goidle
    126500 =C2=B1 29%    +155.9%     323727 =C2=B1 19%  sched_debug.cpu#48.=
nr_switches
    774778 =C2=B1  5%    +164.0%    2045383 =C2=B1  1%  sched_debug.cfs_rq[=
122]:/.min_vruntime
    102657 =C2=B1 27%    +167.3%     274397 =C2=B1  5%  sched_debug.cpu#24.=
sched_count
     47578 =C2=B1 24%    +173.5%     130142 =C2=B1  5%  sched_debug.cpu#24.=
sched_goidle
     65148 =C2=B1 25%    +183.6%     184729 =C2=B1  7%  sched_debug.cpu#44.=
sched_goidle
    130657 =C2=B1 25%    +183.1%     369928 =C2=B1  7%  sched_debug.cpu#44.=
nr_switches
     95597 =C2=B1 24%    +172.7%     260695 =C2=B1  5%  sched_debug.cpu#24.=
nr_switches
       142 =C2=B1  6%    +108.9%        297 =C2=B1 22%  sched_debug.cpu#106=
.ttwu_local
    786778 =C2=B1  3%    +159.2%    2039277 =C2=B1  1%  sched_debug.cfs_rq[=
127]:/.min_vruntime
     63577 =C2=B1 28%    +123.0%     141791 =C2=B1 35%  sched_debug.cpu#16.=
ttwu_count
     51017 =C2=B1 34%    +150.1%     127600 =C2=B1 25%  sched_debug.cpu#10.=
sched_goidle
    770091 =C2=B1  4%    +163.0%    2025186 =C2=B1  0%  sched_debug.cfs_rq[=
120]:/.min_vruntime
    102450 =C2=B1 34%    +149.8%     255915 =C2=B1 24%  sched_debug.cpu#10.=
nr_switches
    772458 =C2=B1  5%    +163.0%    2031748 =C2=B1  0%  sched_debug.cfs_rq[=
126]:/.min_vruntime
    113729 =C2=B1 23%    +128.6%     260017 =C2=B1 14%  sched_debug.cpu#7.s=
ched_goidle
    227723 =C2=B1 23%    +128.5%     520427 =C2=B1 14%  sched_debug.cpu#7.n=
r_switches
    103722 =C2=B1 34%    +100.3%     207794 =C2=B1 21%  sched_debug.cpu#11.=
nr_switches
     51469 =C2=B1 34%    +101.0%     103428 =C2=B1 21%  sched_debug.cpu#11.=
sched_goidle
    119439 =C2=B1 17%    +161.8%     312645 =C2=B1 13%  sched_debug.cpu#5.t=
twu_count
    138622 =C2=B1 17%    +129.4%     318009 =C2=B1 13%  sched_debug.cpu#6.t=
twu_count
      9217 =C2=B1 10%    +143.4%      22436 =C2=B1  2%  sched_debug.cfs_rq[=
120]:/.exec_clock
      6046 =C2=B1  8%    +150.6%      15150 =C2=B1  2%  sched_debug.cfs_rq[=
19]:/.exec_clock
     20257 =C2=B1 29%    +153.5%      51361 =C2=B1  5%  sched_debug.cpu#94.=
sched_count
     11028 =C2=B1 43%    +107.9%      22926 =C2=B1  3%  sched_debug.cfs_rq[=
126]:/.exec_clock
    778617 =C2=B1  5%    +161.9%    2039301 =C2=B1  1%  sched_debug.cfs_rq[=
123]:/.min_vruntime
    780182 =C2=B1  5%    +160.8%    2034861 =C2=B1  1%  sched_debug.cfs_rq[=
121]:/.min_vruntime
     75701 =C2=B1 21%     +96.8%     148993 =C2=B1 23%  numa-vmstat.node6.n=
uma_local
       375 =C2=B1 10%    +145.6%        922 =C2=B1  6%  cpuidle.POLL.usage
     60750 =C2=B1 20%    +142.4%     147285 =C2=B1 13%  sched_debug.cpu#12.=
ttwu_count
     30127 =C2=B1 27%    +123.1%      67227 =C2=B1 23%  sched_debug.cpu#28.=
sched_goidle
      3094 =C2=B1 20%    +143.0%       7517 =C2=B1 12%  sched_debug.cfs_rq[=
28]:/.exec_clock
    158007 =C2=B1 38%    +211.2%     491644 =C2=B1  1%  sched_debug.cpu#43.=
sched_count
     60615 =C2=B1 27%    +122.6%     134936 =C2=B1 23%  sched_debug.cpu#28.=
nr_switches
    121122 =C2=B1 36%    +169.0%     325876 =C2=B1  6%  sched_debug.cpu#8.t=
twu_count
    391754 =C2=B1  9%    +122.5%     871474 =C2=B1 13%  sched_debug.cpu#66.=
nr_switches
    195633 =C2=B1  9%    +122.5%     435273 =C2=B1 13%  sched_debug.cpu#66.=
sched_goidle
     53552 =C2=B1 24%    +134.8%     125760 =C2=B1 19%  sched_debug.cpu#14.=
ttwu_count
        13 =C2=B1 16%     -55.6%          6 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.load
         9 =C2=B1 24%     -57.9%          4 =C2=B1  0%  sched_debug.cpu#47.=
cpu_load[1]
         6 =C2=B1 41%     -75.0%          1 =C2=B1 33%  sched_debug.cfs_rq[=
64]:/.runnable_load_avg
         9 =C2=B1 24%     -57.9%          4 =C2=B1  0%  sched_debug.cpu#47.=
cpu_load[0]
         5 =C2=B1 43%     -71.0%          1 =C2=B1 33%  sched_debug.cpu#64.=
cpu_load[0]
         9 =C2=B1 23%     -57.1%          4 =C2=B1  0%  sched_debug.cpu#47.=
cpu_load[2]
        14 =C2=B1 35%     -59.1%          6 =C2=B1  0%  sched_debug.cpu#40.=
load
         5 =C2=B1 28%     -71.0%          1 =C2=B1 33%  sched_debug.cpu#64.=
cpu_load[3]
         5 =C2=B1 37%     -71.0%          1 =C2=B1 33%  sched_debug.cpu#64.=
cpu_load[2]
         5 =C2=B1 40%     -72.7%          1 =C2=B1 33%  sched_debug.cpu#64.=
cpu_load[1]
         4 =C2=B1 11%     -66.7%          1 =C2=B1 33%  sched_debug.cpu#58.=
cpu_load[0]
         4 =C2=B1 15%     -67.9%          1 =C2=B1 33%  sched_debug.cpu#64.=
cpu_load[4]
      9075 =C2=B1  5%    +144.6%      22193 =C2=B1  2%  sched_debug.cfs_rq[=
122]:/.exec_clock
      7431 =C2=B1 25%    +192.1%      21710 =C2=B1  0%  sched_debug.cfs_rq[=
124]:/.exec_clock
       341 =C2=B1 37%     +86.3%        637 =C2=B1 25%  sched_debug.cpu#58.=
ttwu_local
    671255 =C2=B1  5%    +148.3%    1666839 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     75719 =C2=B1 39%    +204.2%     230355 =C2=B1  1%  sched_debug.cpu#43.=
sched_goidle
    151761 =C2=B1 39%    +203.9%     461175 =C2=B1  1%  sched_debug.cpu#43.=
nr_switches
    202667 =C2=B1 29%    +111.7%     428980 =C2=B1 11%  sched_debug.cpu#100=
.ttwu_count
      9334 =C2=B1  8%    +139.2%      22332 =C2=B1  1%  sched_debug.cfs_rq[=
123]:/.exec_clock
     62082 =C2=B1 24%    +106.3%     128054 =C2=B1 15%  sched_debug.cpu#9.s=
ched_goidle
        42 =C2=B1 22%     -63.7%         15 =C2=B1 22%  sched_debug.cfs_rq[=
48]:/.blocked_load_avg
        26 =C2=B1 25%     -60.6%         10 =C2=B1 14%  sched_debug.cfs_rq[=
97]:/.load
    117130 =C2=B1 24%    +127.4%     266404 =C2=B1  9%  sched_debug.cpu#5.s=
ched_goidle
    234507 =C2=B1 24%    +127.5%     533416 =C2=B1  9%  sched_debug.cpu#5.n=
r_switches
    109567 =C2=B1 27%    +116.6%     237281 =C2=B1 20%  sched_debug.cpu#3.s=
ched_goidle
    219443 =C2=B1 27%    +116.6%     475334 =C2=B1 20%  sched_debug.cpu#3.n=
r_switches
    124773 =C2=B1 24%    +105.8%     256789 =C2=B1 15%  sched_debug.cpu#9.n=
r_switches
   1076077 =C2=B1  4%    +135.7%    2536701 =C2=B1  1%  sched_debug.cfs_rq[=
119]:/.min_vruntime
   1075807 =C2=B1  4%    +136.1%    2539853 =C2=B1  1%  sched_debug.cfs_rq[=
115]:/.min_vruntime
   1078983 =C2=B1  4%    +135.2%    2538208 =C2=B1  1%  sched_debug.cfs_rq[=
117]:/.min_vruntime
      1070 =C2=B1 29%     +78.0%       1905 =C2=B1 13%  sched_debug.cpu#11.=
ttwu_local
    132034 =C2=B1 25%    +160.8%     344361 =C2=B1  4%  sched_debug.cpu#4.t=
twu_count
   1080855 =C2=B1  4%    +134.6%    2535748 =C2=B1  1%  sched_debug.cfs_rq[=
118]:/.min_vruntime
   1035750 =C2=B1 10%    +143.6%    2523224 =C2=B1  0%  sched_debug.cfs_rq[=
113]:/.min_vruntime
    429478 =C2=B1 15%    +116.9%     931488 =C2=B1 11%  sched_debug.cpu#66.=
sched_count
  6.01e+08 =C2=B1 32%    +106.1%  1.239e+09 =C2=B1  1%  cpuidle.C3-NHM.time
     28938 =C2=B1 35%    +159.0%      74950 =C2=B1  5%  sched_debug.cpu#26.=
sched_goidle
     38379 =C2=B1 24%    +128.8%      87794 =C2=B1 13%  sched_debug.cpu#29.=
ttwu_count
    403824 =C2=B1  3%    +116.1%     872500 =C2=B1  6%  sched_debug.cfs_rq[=
115]:/.spread0
         7 =C2=B1 34%     -61.7%          3 =C2=B1  0%  sched_debug.cpu#56.=
cpu_load[4]
         7 =C2=B1 41%     -67.4%          2 =C2=B1 20%  sched_debug.cpu#56.=
cpu_load[3]
         7 =C2=B1 39%     -58.1%          3 =C2=B1  0%  sched_debug.cpu#53.=
cpu_load[4]
     58669 =C2=B1 33%    +156.3%     150393 =C2=B1  5%  sched_debug.cpu#26.=
nr_switches
  17725177 =C2=B1  3%    +129.1%   40613141 =C2=B1  1%  time.voluntary_cont=
ext_switches
     56934 =C2=B1 47%    +115.0%     122410 =C2=B1 11%  sched_debug.cpu#11.=
ttwu_count
    404076 =C2=B1  3%    +115.1%     869341 =C2=B1  7%  sched_debug.cfs_rq[=
119]:/.spread0
    406993 =C2=B1  3%    +114.0%     870852 =C2=B1  7%  sched_debug.cfs_rq[=
117]:/.spread0
     78976 =C2=B1 32%    +173.1%     215684 =C2=B1  0%  sched_debug.cpu#43.=
ttwu_count
    408859 =C2=B1  4%    +112.4%     868389 =C2=B1  6%  sched_debug.cfs_rq[=
118]:/.spread0
   1080955 =C2=B1  4%    +132.0%    2507569 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.min_vruntime
     80080 =C2=B1 21%    +122.2%     177939 =C2=B1 12%  sched_debug.cpu#46.=
ttwu_count
     39696 =C2=B1 44%    +143.4%      96627 =C2=B1  8%  sched_debug.cpu#30.=
ttwu_count
   1082265 =C2=B1  4%    +133.4%    2525785 =C2=B1  0%  sched_debug.cfs_rq[=
114]:/.min_vruntime
     14210 =C2=B1  5%    +119.8%      31233 =C2=B1  4%  sched_debug.cfs_rq[=
119]:/.exec_clock
   1086683 =C2=B1  4%    +132.5%    2527006 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.min_vruntime
      1282 =C2=B1 31%    +172.1%       3488 =C2=B1  2%  sched_debug.cpu#9.t=
twu_local
       340 =C2=B1  1%    +117.2%        740 =C2=B1  3%  time.system_time
         8 =C2=B1 25%     -52.0%          4 =C2=B1  0%  sched_debug.cpu#41.=
cpu_load[4]
         8 =C2=B1 23%     -54.7%          4 =C2=B1  0%  sched_debug.cpu#47.=
cpu_load[3]
        10 =C2=B1 47%     -62.5%          4 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
         9 =C2=B1 25%     -57.1%          4 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.runnable_load_avg
         3 =C2=B1 17%    +108.7%          8 =C2=B1 12%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
    363777 =C2=B1 23%    +135.3%     855878 =C2=B1  3%  sched_debug.cfs_rq[=
113]:/.spread0
     63459 =C2=B1 15%    +113.1%     135245 =C2=B1 10%  sched_debug.cpu#9.t=
twu_count
     13801 =C2=B1  9%    +126.0%      31197 =C2=B1  2%  sched_debug.cfs_rq[=
113]:/.exec_clock
      9451 =C2=B1  8%    +120.4%      20830 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.exec_clock
    295579 =C2=B1 23%    +100.3%     591897 =C2=B1  2%  sched_debug.cpu#5.s=
ched_count
    103489 =C2=B1 49%    +142.4%     250874 =C2=B1  1%  sched_debug.cpu#1.s=
ched_goidle
    207323 =C2=B1 49%    +142.2%     502199 =C2=B1  1%  sched_debug.cpu#1.n=
r_switches
      6594 =C2=B1 11%     -51.2%       3221 =C2=B1  1%  sched_debug.cfs_rq[=
121]:/.avg->runnable_avg_sum
    410288 =C2=B1  6%    +109.2%     858437 =C2=B1  3%  sched_debug.cfs_rq[=
114]:/.spread0
      4.31 =C2=B1  3%    +122.4%       9.58 =C2=B1  2%  time.user_time
    104221 =C2=B1 23%    +110.4%     219244 =C2=B1  0%  sched_debug.cpu#17.=
sched_count
     28830 =C2=B1  2%    +101.5%      58092 =C2=B1 11%  sched_debug.cfs_rq[=
57]:/.exec_clock
         4 =C2=B1 14%    +117.2%         10 =C2=B1  4%  sched_debug.cpu#51.=
cpu_load[0]
       141 =C2=B1 11%     -51.1%         69 =C2=B1  1%  sched_debug.cfs_rq[=
121]:/.tg_runnable_contrib
         5 =C2=B1 20%     +74.2%          9 =C2=B1 22%  sched_debug.cfs_rq[=
54]:/.load
     14372 =C2=B1  4%    +113.7%      30717 =C2=B1  1%  sched_debug.cfs_rq[=
118]:/.exec_clock
     14257 =C2=B1  5%    +115.1%      30674 =C2=B1  2%  sched_debug.cfs_rq[=
115]:/.exec_clock
    414728 =C2=B1  6%    +107.3%     859663 =C2=B1  2%  sched_debug.cfs_rq[=
112]:/.spread0
    408970 =C2=B1  4%    +105.4%     840215 =C2=B1  3%  sched_debug.cfs_rq[=
116]:/.spread0
   1396318 =C2=B1  3%    +114.9%    3001184 =C2=B1  0%  sched_debug.cfs_rq[=
106]:/.min_vruntime
   1397243 =C2=B1  3%    +114.0%    2989610 =C2=B1  1%  sched_debug.cfs_rq[=
105]:/.min_vruntime
   1397043 =C2=B1  3%    +114.3%    2993530 =C2=B1  1%  sched_debug.cfs_rq[=
107]:/.min_vruntime
   1396457 =C2=B1  3%    +114.0%    2988841 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.min_vruntime
   1396767 =C2=B1  3%    +113.8%    2986687 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.min_vruntime
     48761 =C2=B1 27%    +111.5%     103133 =C2=B1  0%  sched_debug.cpu#17.=
sched_goidle
   1395961 =C2=B1  3%    +114.2%    2990314 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.min_vruntime
     97983 =C2=B1 27%    +110.9%     206681 =C2=B1  0%  sched_debug.cpu#17.=
nr_switches
    272160 =C2=B1 15%     +88.1%     512033 =C2=B1 21%  sched_debug.cpu#3.s=
ched_count
     78229 =C2=B1 19%    +105.4%     160716 =C2=B1  7%  sched_debug.cpu#46.=
sched_goidle
   1401691 =C2=B1  3%    +113.5%    2992982 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.min_vruntime
    156814 =C2=B1 19%    +105.2%     321851 =C2=B1  7%  sched_debug.cpu#46.=
nr_switches
       177 =C2=B1  6%     +83.6%        325 =C2=B1 18%  sched_debug.cpu#114=
.ttwu_local
    110030 =C2=B1 38%    +119.2%     241160 =C2=B1 13%  sched_debug.cpu#2.s=
ched_goidle
    220554 =C2=B1 38%    +118.9%     482745 =C2=B1 13%  sched_debug.cpu#2.n=
r_switches
     14621 =C2=B1  5%    +115.5%      31514 =C2=B1  1%  sched_debug.cfs_rq[=
114]:/.exec_clock
    164064 =C2=B1 18%    +110.2%     344875 =C2=B1  7%  sched_debug.cpu#46.=
sched_count
   1347502 =C2=B1  7%    +120.6%    2972167 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.min_vruntime
     10116 =C2=B1 40%     +79.1%      18122 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.exec_clock
     14421 =C2=B1  4%    +110.4%      30337 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.exec_clock
       695 =C2=B1 35%     +39.9%        973 =C2=B1 17%  sched_debug.cpu#30.=
curr->pid
     67065 =C2=B1 22%    +127.6%     152670 =C2=B1  6%  sched_debug.cpu#44.=
ttwu_count
      2187 =C2=B1 16%     -49.8%       1098 =C2=B1  3%  sched_debug.cpu#123=
.curr->pid
     37682 =C2=B1 33%     +57.3%      59287 =C2=B1 12%  sched_debug.cfs_rq[=
58]:/.exec_clock
      6678 =C2=B1 12%     -50.9%       3277 =C2=B1  3%  sched_debug.cfs_rq[=
123]:/.avg->runnable_avg_sum
    132342 =C2=B1 23%     +82.4%     241335 =C2=B1 15%  sched_debug.cpu#6.s=
ched_goidle
    264983 =C2=B1 23%     +82.3%     483073 =C2=B1 15%  sched_debug.cpu#6.n=
r_switches
     61417 =C2=B1 25%    +113.0%     130808 =C2=B1  3%  sched_debug.cpu#13.=
ttwu_count
       637 =C2=B1 34%     +30.4%        832 =C2=B1 24%  sched_debug.cpu#85.=
curr->pid
      1105 =C2=B1 40%     +91.2%       2113 =C2=B1  6%  sched_debug.cpu#15.=
ttwu_local
       143 =C2=B1 11%     -50.9%         70 =C2=B1  4%  sched_debug.cfs_rq[=
123]:/.tg_runnable_contrib
     55238 =C2=B1 13%    +100.6%     110804 =C2=B1  6%  sched_debug.cpu#19.=
ttwu_count
     16027 =C2=B1 18%     +95.9%      31393 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.exec_clock
      1017 =C2=B1 27%    +102.2%       2058 =C2=B1  7%  sched_debug.cpu#10.=
ttwu_local
        51 =C2=B1 24%     -55.5%         23 =C2=B1 17%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
   1715587 =C2=B1  3%    +100.9%    3445941 =C2=B1  1%  sched_debug.cfs_rq[=
60]:/.min_vruntime
     67639 =C2=B1 24%    +120.7%     149278 =C2=B1  1%  sched_debug.cpu#47.=
ttwu_count
   1715840 =C2=B1  3%    +100.1%    3433316 =C2=B1  1%  sched_debug.cfs_rq[=
63]:/.min_vruntime
   1715364 =C2=B1  3%    +101.1%    3450425 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.min_vruntime
   1725821 =C2=B1  2%     +98.5%    3426275 =C2=B1  1%  sched_debug.cfs_rq[=
62]:/.min_vruntime
     10459 =C2=B1  9%     -48.7%       5364 =C2=B1  1%  sched_debug.cfs_rq[=
110]:/.avg->runnable_avg_sum
       225 =C2=B1  9%     -48.7%        115 =C2=B1  1%  sched_debug.cfs_rq[=
110]:/.tg_runnable_contrib
    182156 =C2=B1 23%     +78.8%     325704 =C2=B1 11%  sched_debug.cpu#99.=
ttwu_count
    118369 =C2=B1 31%    +120.4%     260830 =C2=B1  7%  sched_debug.cpu#8.s=
ched_goidle
    237031 =C2=B1 31%    +120.3%     522098 =C2=B1  7%  sched_debug.cpu#8.n=
r_switches
   1713727 =C2=B1  3%    +100.1%    3428943 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.min_vruntime
         4 =C2=B1 16%     -66.7%          1 =C2=B1 33%  sched_debug.cpu#58.=
cpu_load[1]
         2 =C2=B1 31%     -57.1%          1 =C2=B1  0%  sched_debug.cpu#117=
.cpu_load[1]
         7 =C2=B1 47%     -65.9%          2 =C2=B1 20%  sched_debug.cpu#56.=
cpu_load[2]
         5 =C2=B1 48%     -71.9%          1 =C2=B1 33%  sched_debug.cpu#58.=
load
         4 =C2=B1 16%     -55.6%          2 =C2=B1  0%  sched_debug.cpu#63.=
cpu_load[3]
         4 =C2=B1 10%     -53.8%          2 =C2=B1  0%  sched_debug.cpu#63.=
cpu_load[4]
         4 =C2=B1 23%     -57.1%          2 =C2=B1  0%  sched_debug.cpu#63.=
cpu_load[2]
         6 =C2=B1 44%     -62.5%          2 =C2=B1 20%  sched_debug.cpu#56.=
load
         4 =C2=B1 10%     -53.8%          2 =C2=B1  0%  sched_debug.cpu#58.=
cpu_load[2]
         4 =C2=B1  8%     -52.0%          2 =C2=B1  0%  sched_debug.cpu#58.=
cpu_load[4]
        13 =C2=B1 35%     -55.0%          6 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.load
         8 =C2=B1 20%     -50.0%          4 =C2=B1  0%  sched_debug.cpu#47.=
cpu_load[4]
         4 =C2=B1 10%     -65.4%          1 =C2=B1 33%  sched_debug.cfs_rq[=
58]:/.runnable_load_avg
         2 =C2=B1 17%     -53.8%          1 =C2=B1  0%  sched_debug.cpu#114=
.cpu_load[3]
         2 =C2=B1 17%     -53.8%          1 =C2=B1  0%  sched_debug.cpu#114=
.cpu_load[4]
       176 =C2=B1 12%     +87.0%        329 =C2=B1 12%  sched_debug.cpu#102=
.ttwu_local
         4 =C2=B1 25%     +75.0%          7 =C2=B1 14%  sched_debug.cpu#57.=
cpu_load[1]
         6 =C2=B1 44%     -62.5%          2 =C2=B1 20%  sched_debug.cfs_rq[=
56]:/.load
        12 =C2=B1 25%     -50.7%          6 =C2=B1  0%  sched_debug.cpu#37.=
load
         4 =C2=B1  8%     -52.0%          2 =C2=B1  0%  sched_debug.cpu#58.=
cpu_load[3]
     20575 =C2=B1  3%     +97.5%      40644 =C2=B1  1%  sched_debug.cfs_rq[=
106]:/.exec_clock
      9087 =C2=B1  7%     -47.5%       4775 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.avg->runnable_avg_sum
    548140 =C2=B1 16%     +95.9%    1074034 =C2=B1  7%  sched_debug.cpu#71.=
sched_count
       195 =C2=B1  7%     -47.3%        103 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.tg_runnable_contrib
     20556 =C2=B1  3%     +94.6%      40007 =C2=B1  1%  sched_debug.cfs_rq[=
108]:/.exec_clock
   1688102 =C2=B1  7%    +101.1%    3394811 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.min_vruntime
   1730808 =C2=B1  3%     +98.8%    3440864 =C2=B1  1%  sched_debug.cfs_rq[=
58]:/.min_vruntime
     63005 =C2=B1 22%     +89.6%     119439 =C2=B1  3%  sched_debug.cpu#12.=
sched_goidle
   1729954 =C2=B1  3%     +98.1%    3426881 =C2=B1  1%  sched_debug.cfs_rq[=
64]:/.min_vruntime
       142 =C2=B1  6%     -47.7%         74 =C2=B1  0%  sched_debug.cfs_rq[=
126]:/.tg_runnable_contrib
    126446 =C2=B1 22%     +89.5%     239657 =C2=B1  2%  sched_debug.cpu#12.=
nr_switches
     12409 =C2=B1 34%     +85.0%      22955 =C2=B1  2%  sched_debug.cfs_rq[=
127]:/.exec_clock
       209 =C2=B1 11%     +61.0%        337 =C2=B1 22%  sched_debug.cpu#40.=
ttwu_local
      1895 =C2=B1 26%     -55.2%        849 =C2=B1 12%  sched_debug.cpu#0.c=
urr->pid
      6609 =C2=B1  5%     -47.5%       3469 =C2=B1  0%  sched_debug.cfs_rq[=
126]:/.avg->runnable_avg_sum
       137 =C2=B1 11%     -46.9%         73 =C2=B1  1%  sched_debug.cfs_rq[=
122]:/.tg_runnable_contrib
     20216 =C2=B1  5%     +96.8%      39793 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.exec_clock
     16927 =C2=B1 19%     +53.3%      25946 =C2=B1 21%  numa-meminfo.node5.=
Active
       151 =C2=B1  6%     -50.5%         75 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
      6422 =C2=B1 11%     -46.8%       3420 =C2=B1  1%  sched_debug.cfs_rq[=
122]:/.avg->runnable_avg_sum
     10460 =C2=B1 10%     -47.5%       5487 =C2=B1  2%  sched_debug.cfs_rq[=
107]:/.avg->runnable_avg_sum
      7031 =C2=B1  6%     -50.3%       3496 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
       224 =C2=B1  9%     -47.7%        117 =C2=B1  2%  sched_debug.cfs_rq[=
107]:/.tg_runnable_contrib
       938 =C2=B1 33%     +77.9%       1669 =C2=B1 24%  sched_debug.cpu#71.=
ttwu_local
     20852 =C2=B1  2%     +92.4%      40123 =C2=B1  1%  sched_debug.cfs_rq[=
107]:/.exec_clock
   9033228 =C2=B1  7%     +94.6%   17576691 =C2=B1  1%  cpuidle.C1-NHM.usage
     20690 =C2=B1  2%     +93.5%      40029 =C2=B1  1%  sched_debug.cfs_rq[=
111]:/.exec_clock
    342818 =C2=B1 25%     +89.3%     648921 =C2=B1  3%  sched_debug.cpu#99.=
nr_switches
    171316 =C2=B1 25%     +89.3%     324285 =C2=B1  3%  sched_debug.cpu#99.=
sched_goidle
    350601 =C2=B1 24%     +91.5%     671509 =C2=B1  2%  sched_debug.cpu#99.=
sched_count
        24 =C2=B1 18%     -50.0%         12 =C2=B1  8%  sched_debug.cpu#96.=
load
        24 =C2=B1 18%     -50.0%         12 =C2=B1  8%  sched_debug.cfs_rq[=
96]:/.load
     12136 =C2=B1 35%     +73.5%      21051 =C2=B1  3%  sched_debug.cfs_rq[=
70]:/.exec_clock
      1103 =C2=B1 26%     +82.9%       2018 =C2=B1  1%  sched_debug.cpu#13.=
ttwu_local
     10566 =C2=B1 12%     -48.3%       5463 =C2=B1  2%  sched_debug.cfs_rq[=
108]:/.avg->runnable_avg_sum
       222 =C2=B1  9%     -47.2%        117 =C2=B1  3%  sched_debug.cfs_rq[=
111]:/.tg_runnable_contrib
     20795 =C2=B1  3%     +91.7%      39869 =C2=B1  2%  sched_debug.cfs_rq[=
105]:/.exec_clock
       228 =C2=B1 11%     -48.4%        118 =C2=B1  2%  sched_debug.cfs_rq[=
108]:/.tg_runnable_contrib
     20779 =C2=B1  3%     +92.3%      39965 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.exec_clock
        23 =C2=B1 22%     -54.7%         10 =C2=B1 14%  sched_debug.cpu#97.=
load
     20575 =C2=B1  2%     +92.3%      39562 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.exec_clock
   2004790 =C2=B1  2%     +89.3%    3794658 =C2=B1  1%  sched_debug.cfs_rq[=
53]:/.min_vruntime
     65576 =C2=B1 33%     +68.0%     110173 =C2=B1 17%  sched_debug.cpu#13.=
sched_goidle
       109 =C2=B1 14%     -49.7%         55 =C2=B1 14%  sched_debug.cfs_rq[=
67]:/.tg_runnable_contrib
       212 =C2=B1 14%     +76.1%        374 =C2=B1  6%  sched_debug.cpu#99.=
ttwu_local
    131555 =C2=B1 33%     +68.0%     221054 =C2=B1 17%  sched_debug.cpu#13.=
nr_switches
    514828 =C2=B1 15%     +87.7%     966441 =C2=B1  2%  sched_debug.cpu#71.=
nr_switches
    257287 =C2=B1 15%     +87.7%     482892 =C2=B1  2%  sched_debug.cpu#71.=
sched_goidle
   2005078 =C2=B1  2%     +89.1%    3792139 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.min_vruntime
      5080 =C2=B1 13%     -49.7%       2553 =C2=B1 14%  sched_debug.cfs_rq[=
67]:/.avg->runnable_avg_sum
   2003314 =C2=B1  2%     +89.3%    3792959 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.min_vruntime
   2004691 =C2=B1  2%     +89.7%    3803144 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.min_vruntime
   2007265 =C2=B1  2%     +88.5%    3783808 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.min_vruntime
     10360 =C2=B1  9%     -46.9%       5497 =C2=B1  4%  sched_debug.cfs_rq[=
111]:/.avg->runnable_avg_sum
    724406 =C2=B1  2%     +84.1%    1333858 =C2=B1  3%  sched_debug.cfs_rq[=
106]:/.spread0
     37916 =C2=B1  2%     +75.7%      66616 =C2=B1  7%  sched_debug.cfs_rq[=
55]:/.exec_clock
     17255 =C2=B1 12%     -47.0%       9139 =C2=B1  3%  sched_debug.cfs_rq[=
41]:/.avg->runnable_avg_sum
       223 =C2=B1  9%     -47.4%        117 =C2=B1  4%  sched_debug.cfs_rq[=
106]:/.tg_runnable_contrib
      5738 =C2=B1 22%     -42.4%       3305 =C2=B1  2%  sched_debug.cfs_rq[=
124]:/.avg->runnable_avg_sum
    725339 =C2=B1  2%     +82.3%    1322301 =C2=B1  3%  sched_debug.cfs_rq[=
105]:/.spread0
    724520 =C2=B1  2%     +82.4%    1321503 =C2=B1  3%  sched_debug.cfs_rq[=
110]:/.spread0
    725119 =C2=B1  2%     +82.9%    1326202 =C2=B1  3%  sched_debug.cfs_rq[=
107]:/.spread0
       372 =C2=B1 12%     -47.2%        197 =C2=B1  3%  sched_debug.cfs_rq[=
41]:/.tg_runnable_contrib
      9046 =C2=B1 10%     -44.9%       4981 =C2=B1  2%  sched_debug.cfs_rq[=
116]:/.avg->runnable_avg_sum
     10338 =C2=B1 10%     -47.2%       5460 =C2=B1  4%  sched_debug.cfs_rq[=
106]:/.avg->runnable_avg_sum
       712 =C2=B1 21%     +54.6%       1101 =C2=B1 15%  sched_debug.cpu#1.t=
twu_local
    729759 =C2=B1  2%     +81.7%    1325646 =C2=B1  2%  sched_debug.cfs_rq[=
109]:/.spread0
    724021 =C2=B1  2%     +82.7%    1322974 =C2=B1  2%  sched_debug.cfs_rq[=
111]:/.spread0
      3516 =C2=B1  7%     -46.0%       1897 =C2=B1  1%  sched_debug.cpu#58.=
curr->pid
       373 =C2=B1 21%     +46.0%        545 =C2=B1 23%  sched_debug.cpu#120=
.ttwu_local
   2007389 =C2=B1  2%     +88.1%    3775852 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.min_vruntime
       123 =C2=B1 22%     -41.9%         71 =C2=B1  2%  sched_debug.cfs_rq[=
124]:/.tg_runnable_contrib
      2800 =C2=B1 10%     -46.5%       1497 =C2=B1  3%  sched_debug.cpu#112=
.curr->pid
       194 =C2=B1 10%     -44.8%        107 =C2=B1  3%  sched_debug.cfs_rq[=
116]:/.tg_runnable_contrib
    724840 =C2=B1  2%     +82.0%    1319352 =C2=B1  3%  sched_debug.cfs_rq[=
108]:/.spread0
   2004201 =C2=B1  2%     +87.4%    3755433 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.min_vruntime
   2006704 =C2=B1  2%     +87.2%    3755691 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.min_vruntime
    111522 =C2=B1 28%     +78.4%     198926 =C2=B1 13%  sched_debug.cpu#37.=
ttwu_count
       225 =C2=B1  9%     -47.1%        119 =C2=B1  5%  sched_debug.cfs_rq[=
105]:/.tg_runnable_contrib
       150 =C2=B1  5%     -48.2%         78 =C2=B1  6%  sched_debug.cfs_rq[=
127]:/.tg_runnable_contrib
     28634 =C2=B1  2%     +82.1%      52143 =C2=B1  1%  sched_debug.cfs_rq[=
60]:/.exec_clock
      4862 =C2=B1  5%     -45.1%       2668 =C2=B1  0%  sched_debug.cpu#97.=
curr->pid
     10420 =C2=B1  9%     -46.8%       5547 =C2=B1  4%  sched_debug.cfs_rq[=
105]:/.avg->runnable_avg_sum
      2129 =C2=B1 12%     -46.8%       1133 =C2=B1  0%  sched_debug.cpu#126=
.curr->pid
      2051 =C2=B1 13%     -44.7%       1134 =C2=B1  0%  sched_debug.cpu#120=
.curr->pid
      2128 =C2=B1 16%     -48.8%       1090 =C2=B1  4%  sched_debug.cpu#121=
.curr->pid
    127651 =C2=B1 41%     +71.4%     218790 =C2=B1 22%  sched_debug.cpu#34.=
ttwu_count
      6998 =C2=B1  5%     -47.6%       3665 =C2=B1  5%  sched_debug.cfs_rq[=
127]:/.avg->runnable_avg_sum
    108446 =C2=B1 18%     +80.9%     196218 =C2=B1  2%  numa-numastat.node6=
.local_node
     17221 =C2=B1 12%     -43.6%       9712 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.avg->runnable_avg_sum
       135 =C2=B1  5%     +60.0%        216 =C2=B1 18%  sched_debug.cpu#110=
.ttwu_local
      3609 =C2=B1  9%     -47.4%       1898 =C2=B1  1%  sched_debug.cpu#64.=
curr->pid
        12 =C2=B1 42%     -50.7%          6 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
        10 =C2=B1 15%     -43.8%          6 =C2=B1  0%  sched_debug.cpu#37.=
cpu_load[3]
        10 =C2=B1 15%     -43.8%          6 =C2=B1  0%  sched_debug.cpu#37.=
cpu_load[2]
        10 =C2=B1 15%     -43.8%          6 =C2=B1  0%  sched_debug.cpu#37.=
cpu_load[1]
        10 =C2=B1 16%     -41.0%          6 =C2=B1  0%  sched_debug.cpu#37.=
cpu_load[0]
        10 =C2=B1 15%     -41.9%          6 =C2=B1  0%  sched_debug.cpu#37.=
cpu_load[4]
        10 =C2=B1 13%     -41.9%          6 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
        10 =C2=B1 17%     -42.9%          6 =C2=B1  0%  sched_debug.cpu#38.=
cpu_load[3]
        10 =C2=B1 15%     -42.9%          6 =C2=B1  0%  sched_debug.cpu#38.=
cpu_load[0]
        10 =C2=B1 17%     -42.9%          6 =C2=B1  0%  sched_debug.cpu#38.=
cpu_load[1]
        10 =C2=B1 17%     -42.9%          6 =C2=B1  0%  sched_debug.cpu#38.=
cpu_load[2]
        10 =C2=B1 18%     -41.9%          6 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
         6 =C2=B1 30%     +53.8%         10 =C2=B1 10%  sched_debug.cpu#51.=
cpu_load[1]
    675605 =C2=B1 16%     +93.1%    1304861 =C2=B1  1%  sched_debug.cfs_rq[=
104]:/.spread0
       324 =C2=B1 10%     -44.1%        181 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg_runnable_contrib
       371 =C2=B1 12%     -43.5%        210 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg_runnable_contrib
       324 =C2=B1 26%     +65.7%        537 =C2=B1  7%  sched_debug.cpu#125=
.ttwu_local
     12749 =C2=B1  7%     -48.8%       6528 =C2=B1  3%  sched_debug.cfs_rq[=
64]:/.avg->runnable_avg_sum
       254 =C2=B1  7%     +62.8%        414 =C2=B1 14%  sched_debug.cpu#49.=
ttwu_local
   2252984 =C2=B1  2%     +81.8%    4096367 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.min_vruntime
     15017 =C2=B1 10%     -44.0%       8414 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.avg->runnable_avg_sum
       350 =C2=B1  1%     +77.2%        621 =C2=B1  2%  time.elapsed_time.m=
ax
       350 =C2=B1  1%     +77.2%        621 =C2=B1  2%  time.elapsed_time
       325 =C2=B1  8%     -45.5%        177 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.tg_runnable_contrib
      3840 =C2=B1  9%     -44.0%       2151 =C2=B1  1%  sched_debug.cpu#56.=
curr->pid
    192317 =C2=B1 42%     +76.6%     339582 =C2=B1  1%  sched_debug.cpu#0.s=
ched_goidle
   2256643 =C2=B1  2%     +81.4%    4094321 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     95975 =C2=B1 39%     +80.4%     173134 =C2=B1 25%  sched_debug.cpu#38.=
ttwu_count
     19579 =C2=B1 12%     -44.8%      10802 =C2=B1  4%  sched_debug.cfs_rq[=
39]:/.avg->runnable_avg_sum
       274 =C2=B1  7%     -48.6%        141 =C2=B1  3%  sched_debug.cfs_rq[=
64]:/.tg_runnable_contrib
      4509 =C2=B1  8%     -44.2%       2516 =C2=B1  0%  sched_debug.cpu#38.=
curr->pid
    111248 =C2=B1 18%     +80.4%     200737 =C2=B1  2%  numa-numastat.node6=
.numa_hit
   2255090 =C2=B1  2%     +80.3%    4065872 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.min_vruntime
     15092 =C2=B1  8%     -45.3%       8251 =C2=B1  1%  sched_debug.cfs_rq[=
56]:/.avg->runnable_avg_sum
       226 =C2=B1  8%     -43.4%        128 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.tg_runnable_contrib
    390663 =C2=B1 41%     +75.4%     685139 =C2=B1  1%  sched_debug.cpu#0.n=
r_switches
     10511 =C2=B1  8%     -43.2%       5970 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.avg->runnable_avg_sum
       422 =C2=B1 12%     -44.6%        234 =C2=B1  4%  sched_debug.cfs_rq[=
39]:/.tg_runnable_contrib
       174 =C2=B1  6%     +58.3%        276 =C2=B1 14%  sched_debug.cpu#118=
.ttwu_local
   2253301 =C2=B1  2%     +80.2%    4060519 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.min_vruntime
      1038 =C2=B1 31%     +44.5%       1500 =C2=B1 25%  sched_debug.cpu#22.=
ttwu_local
      4477 =C2=B1  8%     -43.8%       2517 =C2=B1  0%  sched_debug.cpu#37.=
curr->pid
       427 =C2=B1 11%     -43.7%        240 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.tg_runnable_contrib
       222 =C2=B1  8%     -46.9%        118 =C2=B1  1%  sched_debug.cfs_rq[=
104]:/.tg_runnable_contrib
       323 =C2=B1  9%     -46.0%        174 =C2=B1  2%  sched_debug.cfs_rq[=
50]:/.tg_runnable_contrib
     10306 =C2=B1  8%     -46.5%       5510 =C2=B1  1%  sched_debug.cfs_rq[=
104]:/.avg->runnable_avg_sum
   2254734 =C2=B1  2%     +69.8%    3828609 =C2=B1  5%  sched_debug.cfs_rq[=
42]:/.min_vruntime
   2254962 =C2=B1  2%     +79.9%    4057357 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.min_vruntime
   2256907 =C2=B1  2%     +79.6%    4053271 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.min_vruntime
     17257 =C2=B1 10%     -43.6%       9726 =C2=B1  2%  sched_debug.cfs_rq[=
42]:/.avg->runnable_avg_sum
       372 =C2=B1 12%     -42.7%        213 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg_runnable_contrib
     17222 =C2=B1 12%     -42.6%       9879 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.avg->runnable_avg_sum
   2253538 =C2=B1  2%     +69.7%    3824584 =C2=B1  5%  sched_debug.cfs_rq[=
41]:/.min_vruntime
     19741 =C2=B1 10%     -43.3%      11184 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.avg->runnable_avg_sum
     14965 =C2=B1  9%     -45.6%       8140 =C2=B1  2%  sched_debug.cfs_rq[=
50]:/.avg->runnable_avg_sum
      9876 =C2=B1 19%     +82.7%      18042 =C2=B1  2%  sched_debug.cfs_rq[=
68]:/.exec_clock
       423 =C2=B1 11%     -41.7%        246 =C2=B1  1%  sched_debug.cfs_rq[=
40]:/.tg_runnable_contrib
       372 =C2=B1 11%     -43.5%        210 =C2=B1  2%  sched_debug.cfs_rq[=
42]:/.tg_runnable_contrib
        14 =C2=B1 15%     -36.5%          9 =C2=B1  0%  sched_debug.cpu#102=
.cpu_load[3]
        15 =C2=B1 21%     -44.0%          8 =C2=B1  5%  sched_debug.cpu#102=
.load
       427 =C2=B1 11%     -43.1%        243 =C2=B1  1%  sched_debug.cfs_rq[=
36]:/.tg_runnable_contrib
     19851 =C2=B1 11%     -42.2%      11466 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->runnable_avg_sum
       428 =C2=B1 10%     -42.1%        248 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_runnable_contrib
     19536 =C2=B1 11%     -41.7%      11390 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.avg->runnable_avg_sum
      1565 =C2=B1 19%     -41.5%        916 =C2=B1  1%  sched_debug.cpu#2.c=
urr->pid
    103489 =C2=B1 17%     +80.5%     186798 =C2=B1  6%  sched_debug.cpu#19.=
sched_count
      3014 =C2=B1 10%     -44.5%       1673 =C2=B1  2%  sched_debug.cpu#111=
.curr->pid
      4251 =C2=B1  8%     -50.0%       2124 =C2=B1  9%  sched_debug.cpu#41.=
curr->pid
      3098 =C2=B1 14%     -46.0%       1672 =C2=B1  2%  sched_debug.cpu#107=
.curr->pid
      3013 =C2=B1 10%     -44.5%       1672 =C2=B1  2%  sched_debug.cpu#105=
.curr->pid
      2952 =C2=B1  8%     -43.3%       1672 =C2=B1  2%  sched_debug.cpu#104=
.curr->pid
       373 =C2=B1 12%     -41.7%        217 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg_runnable_contrib
     19804 =C2=B1 11%     -43.0%      11284 =C2=B1  1%  sched_debug.cfs_rq[=
36]:/.avg->runnable_avg_sum
      8698 =C2=B1  7%     -45.0%       4783 =C2=B1  2%  sched_debug.cfs_rq[=
117]:/.avg->runnable_avg_sum
       262 =C2=B1  9%     +57.2%        412 =C2=B1 10%  sched_debug.cpu#51.=
ttwu_local
       187 =C2=B1  7%     -44.9%        103 =C2=B1  2%  sched_debug.cfs_rq[=
117]:/.tg_runnable_contrib
       193 =C2=B1  7%     -45.6%        105 =C2=B1  8%  sched_debug.cfs_rq[=
119]:/.tg_runnable_contrib
      2712 =C2=B1 10%     -44.2%       1514 =C2=B1  4%  sched_debug.cpu#115=
.curr->pid
   1043953 =C2=B1  2%     +70.4%    1778851 =C2=B1  3%  sched_debug.cfs_rq[=
60]:/.spread0
       427 =C2=B1 10%     -42.0%        248 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.tg_runnable_contrib
     28807 =C2=B1  2%     +76.5%      50841 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.exec_clock
    217040 =C2=B1 11%     +76.8%     383807 =C2=B1  5%  sched_debug.cpu#66.=
ttwu_count
     17263 =C2=B1 12%     -41.6%      10085 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.avg->runnable_avg_sum
     19757 =C2=B1 10%     -41.8%      11500 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.avg->runnable_avg_sum
     14953 =C2=B1 10%     -44.2%       8346 =C2=B1  4%  sched_debug.cfs_rq[=
52]:/.avg->runnable_avg_sum
     48720 =C2=B1 18%     +80.3%      87820 =C2=B1  6%  sched_debug.cpu#19.=
sched_goidle
     97724 =C2=B1 18%     +80.1%     176012 =C2=B1  6%  sched_debug.cpu#19.=
nr_switches
   2444831 =C2=B1  2%     +75.0%    4277292 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.min_vruntime
   2440721 =C2=B1  2%     +74.8%    4266681 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.min_vruntime
   2439877 =C2=B1  2%     +74.8%    4265054 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.min_vruntime
   1044192 =C2=B1  2%     +69.1%    1766221 =C2=B1  3%  sched_debug.cfs_rq[=
63]:/.spread0
      3477 =C2=B1  9%     -43.4%       1969 =C2=B1  2%  sched_debug.cpu#59.=
curr->pid
      2669 =C2=B1 13%     -42.7%       1530 =C2=B1  5%  sched_debug.cpu#113=
.curr->pid
         4 =C2=B1 21%     +56.0%          6 =C2=B1  7%  sched_debug.cpu#57.=
cpu_load[2]
       147 =C2=B1  7%     -45.9%         79 =C2=B1 10%  sched_debug.cfs_rq[=
125]:/.tg_runnable_contrib
        26 =C2=B1 29%     +55.6%         41 =C2=B1 18%  sched_debug.cfs_rq[=
51]:/.blocked_load_avg
        20 =C2=B1  1%     -42.4%         12 =C2=B1  0%  vmstat.procs.r
   2440544 =C2=B1  2%     +75.1%    4273452 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.min_vruntime
   2445273 =C2=B1  2%     +75.4%    4288345 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.min_vruntime
     92713 =C2=B1 47%     +60.5%     148780 =C2=B1 17%  sched_debug.cpu#36.=
ttwu_count
     37839 =C2=B1  2%     +69.8%      64253 =C2=B1  2%  sched_debug.cfs_rq[=
49]:/.exec_clock
       322 =C2=B1 10%     -44.0%        180 =C2=B1  4%  sched_debug.cfs_rq[=
52]:/.tg_runnable_contrib
    438467 =C2=B1 43%     +79.2%     785867 =C2=B1  0%  sched_debug.cpu#100=
.sched_count
       372 =C2=B1 12%     -41.1%        219 =C2=B1  2%  sched_debug.cfs_rq[=
46]:/.tg_runnable_contrib
   2439327 =C2=B1  2%     +74.5%    4255856 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.min_vruntime
       380 =C2=B1 13%     +71.8%        653 =C2=B1  6%  slabinfo.taskstats.=
active_objs
       380 =C2=B1 13%     +71.8%        653 =C2=B1  6%  slabinfo.taskstats.=
num_objs
      9028 =C2=B1  7%     -45.3%       4935 =C2=B1  8%  sched_debug.cfs_rq[=
119]:/.avg->runnable_avg_sum
    431760 =C2=B1 44%     +78.3%     769669 =C2=B1  0%  sched_debug.cpu#100=
.nr_switches
    215755 =C2=B1 44%     +78.3%     384668 =C2=B1  0%  sched_debug.cpu#100=
.sched_goidle
      6852 =C2=B1  7%     -45.5%       3735 =C2=B1 10%  sched_debug.cfs_rq[=
125]:/.avg->runnable_avg_sum
   2439743 =C2=B1  2%     +74.5%    4256990 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.min_vruntime
       373 =C2=B1 12%     -41.3%        219 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.tg_runnable_contrib
      4726 =C2=B1  8%     -42.3%       2725 =C2=B1  2%  sched_debug.cpu#98.=
curr->pid
    290580 =C2=B1 18%     +55.2%     450987 =C2=B1  5%  sched_debug.cpu#71.=
ttwu_count
   1043727 =C2=B1  2%     +70.9%    1783334 =C2=B1  1%  sched_debug.cfs_rq[=
61]:/.spread0
       275 =C2=B1  7%     -47.6%        144 =C2=B1  5%  sched_debug.cfs_rq[=
62]:/.tg_runnable_contrib
     17250 =C2=B1 12%     -41.2%      10152 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.avg->runnable_avg_sum
      4425 =C2=B1  9%     -43.1%       2517 =C2=B1  0%  sched_debug.cpu#40.=
curr->pid
     12781 =C2=B1  8%     -46.5%       6834 =C2=B1  4%  sched_debug.cfs_rq[=
58]:/.avg->runnable_avg_sum
      4587 =C2=B1  7%     -42.6%       2635 =C2=B1  1%  sched_debug.cpu#102=
.curr->pid
   1058301 =C2=B1  3%     +66.3%    1759781 =C2=B1  2%  sched_debug.cfs_rq[=
64]:/.spread0
       141 =C2=B1 10%     -43.6%         79 =C2=B1  9%  sched_debug.cfs_rq[=
120]:/.tg_runnable_contrib
       275 =C2=B1  9%     -46.2%        148 =C2=B1  4%  sched_debug.cfs_rq[=
58]:/.tg_runnable_contrib
     12758 =C2=B1  8%     -47.4%       6709 =C2=B1  6%  sched_debug.cfs_rq[=
62]:/.avg->runnable_avg_sum
   1478160 =C2=B1  1%     +70.3%    2516824 =C2=B1  1%  proc-vmstat.pgfault
   2439912 =C2=B1  2%     +64.2%    4007525 =C2=B1  6%  sched_debug.cfs_rq[=
39]:/.min_vruntime
       426 =C2=B1 11%     -42.0%        247 =C2=B1  2%  sched_debug.cfs_rq[=
38]:/.tg_runnable_contrib
      6567 =C2=B1  9%     -43.6%       3705 =C2=B1  9%  sched_debug.cfs_rq[=
120]:/.avg->runnable_avg_sum
     17223 =C2=B1 12%     -40.9%      10175 =C2=B1  2%  sched_debug.cfs_rq[=
46]:/.avg->runnable_avg_sum
     12407 =C2=B1 10%     -44.3%       6913 =C2=B1  2%  sched_debug.cfs_rq[=
59]:/.avg->runnable_avg_sum
     32801 =C2=B1 24%     +70.5%      55915 =C2=B1  5%  sched_debug.cpu#28.=
ttwu_count
    306245 =C2=B1  6%     +68.1%     514717 =C2=B1  4%  numa-numastat.node1=
.local_node
      5266 =C2=B1 11%     -45.3%       2883 =C2=B1 13%  sched_debug.cfs_rq[=
70]:/.avg->runnable_avg_sum
       266 =C2=B1 11%     -44.0%        149 =C2=B1  2%  sched_debug.cfs_rq[=
59]:/.tg_runnable_contrib
   1042105 =C2=B1  1%     +69.1%    1761862 =C2=B1  2%  sched_debug.cfs_rq[=
57]:/.spread0
    310360 =C2=B1  6%     +67.2%     518917 =C2=B1  4%  numa-numastat.node1=
.numa_hit
       274 =C2=B1  8%     -46.4%        147 =C2=B1  5%  sched_debug.cfs_rq[=
63]:/.tg_runnable_contrib
     12703 =C2=B1  8%     -46.2%       6836 =C2=B1  5%  sched_debug.cfs_rq[=
63]:/.avg->runnable_avg_sum
     19708 =C2=B1 10%     -41.7%      11497 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.avg->runnable_avg_sum
       113 =C2=B1 11%     -45.3%         62 =C2=B1 12%  sched_debug.cfs_rq[=
70]:/.tg_runnable_contrib
   2559224 =C2=B1  2%     +71.5%    4389526 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.min_vruntime
   2555114 =C2=B1  2%     +71.5%    4382602 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.min_vruntime
   1054176 =C2=B1  1%     +66.9%    1759183 =C2=B1  2%  sched_debug.cfs_rq[=
62]:/.spread0
       207 =C2=B1 24%     +57.8%        328 =C2=B1  5%  sched_debug.cpu#36.=
ttwu_local
       471 =C2=B1  9%     -40.7%        279 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.tg_runnable_contrib
   2560834 =C2=B1  2%     +71.0%    4379502 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.min_vruntime
     21800 =C2=B1  9%     -40.8%      12909 =C2=B1  1%  sched_debug.cfs_rq[=
103]:/.avg->runnable_avg_sum
   2551879 =C2=B1  2%     +71.1%    4365240 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.min_vruntime
   2550422 =C2=B1  2%     +71.2%    4367480 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.min_vruntime
   2557078 =C2=B1  2%     +70.7%    4364470 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.min_vruntime
     17310 =C2=B1 12%     -41.5%      10131 =C2=B1  4%  sched_debug.cfs_rq[=
43]:/.avg->runnable_avg_sum
    177097 =C2=B1 11%     +46.3%     259087 =C2=B1 12%  numa-numastat.node3=
.numa_hit
        16 =C2=B1  8%     -41.8%          9 =C2=B1  5%  sched_debug.cfs_rq[=
97]:/.runnable_load_avg
   2553874 =C2=B1  2%     +70.4%    4352993 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.min_vruntime
       374 =C2=B1 12%     -41.5%        219 =C2=B1  4%  sched_debug.cfs_rq[=
43]:/.tg_runnable_contrib
       186 =C2=B1  8%     -44.5%        103 =C2=B1  1%  sched_debug.cfs_rq[=
118]:/.tg_runnable_contrib
   1059179 =C2=B1  3%     +67.5%    1773782 =C2=B1  2%  sched_debug.cfs_rq[=
58]:/.spread0
       468 =C2=B1 10%     -40.6%        278 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.tg_runnable_contrib
       183 =C2=B1 19%     +50.7%        277 =C2=B1 12%  sched_debug.cpu#119=
.ttwu_local
     37870 =C2=B1  2%     +66.4%      63024 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.exec_clock
      6684 =C2=B1  2%     +64.8%      11013 =C2=B1  3%  time.involuntary_co=
ntext_switches
      8658 =C2=B1  8%     -44.3%       4822 =C2=B1  1%  sched_debug.cfs_rq[=
118]:/.avg->runnable_avg_sum
       471 =C2=B1  9%     -39.3%        286 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.tg_runnable_contrib
       433 =C2=B1 10%     -41.0%        255 =C2=B1  3%  sched_debug.cfs_rq[=
33]:/.tg_runnable_contrib
     20046 =C2=B1 10%     -41.1%      11802 =C2=B1  3%  sched_debug.cfs_rq[=
33]:/.avg->runnable_avg_sum
     21639 =C2=B1 10%     -40.4%      12894 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.avg->runnable_avg_sum
      4697 =C2=B1  6%     -41.7%       2737 =C2=B1  3%  sched_debug.cpu#96.=
curr->pid
    162343 =C2=B1 15%     +42.8%     231834 =C2=B1 21%  numa-vmstat.node2.n=
uma_local
       200 =C2=B1 14%     +66.4%        334 =C2=B1  0%  sched_debug.cpu#37.=
ttwu_local
    173609 =C2=B1 11%     +46.8%     254887 =C2=B1 13%  numa-numastat.node3=
.local_node
     21822 =C2=B1  9%     -37.5%      13640 =C2=B1  1%  sched_debug.cfs_rq[=
101]:/.avg->runnable_avg_sum
     21714 =C2=B1  9%     -39.1%      13217 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.avg->runnable_avg_sum
     12650 =C2=B1  8%     -45.3%       6915 =C2=B1  6%  sched_debug.cfs_rq[=
57]:/.avg->runnable_avg_sum
   2629429 =C2=B1  2%     +69.1%    4447634 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.min_vruntime
       443 =C2=B1 17%     +68.3%        746 =C2=B1  1%  sched_debug.cpu#97.=
ttwu_local
      8295 =C2=B1 10%     -42.1%       4800 =C2=B1  5%  sched_debug.cfs_rq[=
113]:/.avg->runnable_avg_sum
     37753 =C2=B1  2%     +67.1%      63079 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.exec_clock
    314676 =C2=B1 16%     +63.4%     514197 =C2=B1 12%  sched_debug.cpu#2.s=
ched_count
       322 =C2=B1 10%     -42.1%        186 =C2=B1  4%  sched_debug.cfs_rq[=
49]:/.tg_runnable_contrib
       472 =C2=B1  9%     -37.4%        295 =C2=B1  1%  sched_debug.cfs_rq[=
101]:/.tg_runnable_contrib
    140672 =C2=B1 32%     +71.1%     240631 =C2=B1  4%  sched_debug.cpu#4.s=
ched_goidle
    281636 =C2=B1 32%     +71.1%     481741 =C2=B1  4%  sched_debug.cpu#4.n=
r_switches
       318 =C2=B1 10%     -41.3%        187 =C2=B1  3%  sched_debug.cfs_rq[=
51]:/.tg_runnable_contrib
    177407 =C2=B1 34%     +67.8%     297698 =C2=B1 20%  sched_debug.cpu#38.=
sched_count
      1424 =C2=B1 13%     +41.8%       2020 =C2=B1 20%  sched_debug.cpu#10.=
curr->pid
    215935 =C2=B1 33%     +65.4%     357204 =C2=B1 16%  sched_debug.cpu#97.=
sched_goidle
     14924 =C2=B1 10%     -42.0%       8657 =C2=B1  5%  sched_debug.cfs_rq[=
49]:/.avg->runnable_avg_sum
       507 =C2=B1  8%     -40.5%        302 =C2=B1  1%  sched_debug.cfs_rq[=
96]:/.tg_runnable_contrib
    432264 =C2=B1 33%     +65.4%     715151 =C2=B1 16%  sched_debug.cpu#97.=
nr_switches
         5 =C2=B1 17%     -53.1%          2 =C2=B1 20%  sched_debug.cfs_rq[=
56]:/.runnable_load_avg
         5 =C2=B1 23%     -50.0%          2 =C2=B1 20%  sched_debug.cpu#62.=
cpu_load[3]
         5 =C2=B1 11%     -50.0%          2 =C2=B1 20%  sched_debug.cpu#54.=
cpu_load[0]
         6 =C2=B1 45%     -61.5%          2 =C2=B1 20%  sched_debug.cpu#56.=
cpu_load[1]
         4 =C2=B1 15%     -46.4%          2 =C2=B1 20%  sched_debug.cpu#62.=
cpu_load[4]
         5 =C2=B1  8%     -53.1%          2 =C2=B1 20%  sched_debug.cpu#50.=
cpu_load[2]
         5 =C2=B1 17%     -53.1%          2 =C2=B1 20%  sched_debug.cpu#56.=
cpu_load[0]
         5 =C2=B1  7%     -51.6%          2 =C2=B1 20%  sched_debug.cpu#50.=
cpu_load[4]
        15 =C2=B1 10%     -41.3%          9 =C2=B1  0%  sched_debug.cpu#97.=
cpu_load[1]
         5 =C2=B1  8%     -53.1%          2 =C2=B1 20%  sched_debug.cpu#50.=
cpu_load[1]
         5 =C2=B1  7%     -51.6%          2 =C2=B1 20%  sched_debug.cpu#50.=
cpu_load[3]
         5 =C2=B1 13%     -54.5%          2 =C2=B1 20%  sched_debug.cpu#50.=
cpu_load[0]
         5 =C2=B1 23%     -50.0%          2 =C2=B1 20%  sched_debug.cpu#62.=
cpu_load[2]
         5 =C2=B1 20%     -41.9%          3 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.runnable_load_avg
     14763 =C2=B1 10%     -41.3%       8660 =C2=B1  4%  sched_debug.cfs_rq[=
51]:/.avg->runnable_avg_sum
     12671 =C2=B1  8%     -43.1%       7208 =C2=B1  3%  sched_debug.cfs_rq[=
61]:/.avg->runnable_avg_sum
      4406 =C2=B1 14%     -45.0%       2423 =C2=B1 11%  sched_debug.cfs_rq[=
19]:/.avg->runnable_avg_sum
       319 =C2=B1 10%     -42.4%        184 =C2=B1  4%  sched_debug.cfs_rq[=
54]:/.tg_runnable_contrib
       273 =C2=B1  8%     -43.5%        154 =C2=B1  3%  sched_debug.cfs_rq[=
61]:/.tg_runnable_contrib
       272 =C2=B1  8%     -45.2%        149 =C2=B1  6%  sched_debug.cfs_rq[=
57]:/.tg_runnable_contrib
     14862 =C2=B1 10%     -42.5%       8550 =C2=B1  5%  sched_debug.cfs_rq[=
54]:/.avg->runnable_avg_sum
       181 =C2=B1  9%     +62.8%        295 =C2=B1  3%  sched_debug.cpu#115=
.ttwu_local
        94 =C2=B1 14%     -45.3%         51 =C2=B1 12%  sched_debug.cfs_rq[=
19]:/.tg_runnable_contrib
       473 =C2=B1  8%     -40.0%        284 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.tg_runnable_contrib
    440939 =C2=B1 33%     +65.6%     730397 =C2=B1 16%  sched_debug.cpu#97.=
sched_count
     23441 =C2=B1  8%     -40.4%      13979 =C2=B1  1%  sched_debug.cfs_rq[=
96]:/.avg->runnable_avg_sum
       178 =C2=B1  9%     -41.7%        104 =C2=B1  4%  sched_debug.cfs_rq[=
113]:/.tg_runnable_contrib
     40812 =C2=B1 15%     +54.9%      63205 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.exec_clock
     21836 =C2=B1  8%     -39.8%      13138 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.avg->runnable_avg_sum
     37951 =C2=B1  2%     +64.1%      62292 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.exec_clock
     37770 =C2=B1  2%     +64.0%      61955 =C2=B1  1%  sched_debug.cfs_rq[=
52]:/.exec_clock
      3025 =C2=B1 10%     -40.2%       1810 =C2=B1  4%  sched_debug.cpu#110=
.curr->pid
   1016472 =C2=B1 10%     +70.0%    1727726 =C2=B1  2%  sched_debug.cfs_rq[=
59]:/.spread0
      4374 =C2=B1 15%     -38.3%       2700 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
    226761 =C2=B1 11%     +51.0%     342454 =C2=B1  9%  numa-numastat.node2=
.local_node
      4368 =C2=B1  5%     -46.0%       2359 =C2=B1 18%  sched_debug.cpu#42.=
curr->pid
     37682 =C2=B1  2%     +64.3%      61895 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.exec_clock
      4216 =C2=B1  8%     -40.2%       2523 =C2=B1  7%  sched_debug.cpu#47.=
curr->pid
   1333195 =C2=B1  1%     +59.6%    2127589 =C2=B1  2%  sched_debug.cfs_rq[=
53]:/.spread0
        93 =C2=B1 16%     -38.0%         58 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
       321 =C2=B1 24%     +36.7%        439 =C2=B1 13%  sched_debug.cpu#60.=
ttwu_local
    230940 =C2=B1 11%     +50.1%     346654 =C2=B1  9%  numa-numastat.node2=
.numa_hit
    136849 =C2=B1 39%     +61.3%     220736 =C2=B1  2%  sched_debug.cpu#33.=
ttwu_count
       186 =C2=B1  7%     -42.6%        107 =C2=B1  3%  sched_debug.cfs_rq[=
114]:/.tg_runnable_contrib
   1333488 =C2=B1  1%     +59.4%    2125075 =C2=B1  2%  sched_debug.cfs_rq[=
51]:/.spread0
       479 =C2=B1  9%     -39.0%        292 =C2=B1  2%  sched_debug.cfs_rq[=
97]:/.tg_runnable_contrib
       317 =C2=B1 15%     +36.6%        434 =C2=B1  9%  sched_debug.cpu#123=
.ttwu_local
   1333082 =C2=B1  1%     +60.2%    2136073 =C2=B1  1%  sched_debug.cfs_rq[=
54]:/.spread0
     22144 =C2=B1  9%     -39.0%      13498 =C2=B1  2%  sched_debug.cfs_rq[=
97]:/.avg->runnable_avg_sum
     24514 =C2=B1  7%     -40.4%      14604 =C2=B1  4%  sched_debug.cfs_rq[=
123]:/.tg->runnable_avg
     24505 =C2=B1  7%     -40.4%      14596 =C2=B1  4%  sched_debug.cfs_rq[=
121]:/.tg->runnable_avg
     24519 =C2=B1  7%     -40.4%      14607 =C2=B1  4%  sched_debug.cfs_rq[=
124]:/.tg->runnable_avg
     24509 =C2=B1  7%     -40.4%      14601 =C2=B1  4%  sched_debug.cfs_rq[=
122]:/.tg->runnable_avg
     24532 =C2=B1  7%     -40.4%      14616 =C2=B1  4%  sched_debug.cfs_rq[=
126]:/.tg->runnable_avg
     24525 =C2=B1  7%     -40.4%      14611 =C2=B1  4%  sched_debug.cfs_rq[=
125]:/.tg->runnable_avg
     24499 =C2=B1  7%     -40.4%      14597 =C2=B1  4%  sched_debug.cfs_rq[=
120]:/.tg->runnable_avg
     24534 =C2=B1  7%     -40.4%      14617 =C2=B1  4%  sched_debug.cfs_rq[=
127]:/.tg->runnable_avg
     24495 =C2=B1  7%     -40.4%      14592 =C2=B1  4%  sched_debug.cfs_rq[=
119]:/.tg->runnable_avg
     24488 =C2=B1  7%     -40.4%      14587 =C2=B1  4%  sched_debug.cfs_rq[=
118]:/.tg->runnable_avg
     24484 =C2=B1  7%     -40.4%      14584 =C2=B1  4%  sched_debug.cfs_rq[=
117]:/.tg->runnable_avg
   1335646 =C2=B1  2%     +58.5%    2116730 =C2=B1  2%  sched_debug.cfs_rq[=
56]:/.spread0
     24479 =C2=B1  7%     -40.4%      14584 =C2=B1  4%  sched_debug.cfs_rq[=
116]:/.tg->runnable_avg
     24469 =C2=B1  7%     -40.4%      14578 =C2=B1  4%  sched_debug.cfs_rq[=
114]:/.tg->runnable_avg
     24474 =C2=B1  7%     -40.4%      14582 =C2=B1  4%  sched_debug.cfs_rq[=
115]:/.tg->runnable_avg
     24463 =C2=B1  7%     -40.4%      14573 =C2=B1  4%  sched_debug.cfs_rq[=
113]:/.tg->runnable_avg
     24456 =C2=B1  7%     -40.4%      14569 =C2=B1  4%  sched_debug.cfs_rq[=
112]:/.tg->runnable_avg
     23942 =C2=B1  7%     -40.2%      14309 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
     23949 =C2=B1  7%     -40.2%      14316 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
     24449 =C2=B1  7%     -40.4%      14563 =C2=B1  4%  sched_debug.cfs_rq[=
111]:/.tg->runnable_avg
     24444 =C2=B1  7%     -40.4%      14559 =C2=B1  4%  sched_debug.cfs_rq[=
110]:/.tg->runnable_avg
     23954 =C2=B1  7%     -40.2%      14323 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
     24438 =C2=B1  7%     -40.4%      14557 =C2=B1  4%  sched_debug.cfs_rq[=
109]:/.tg->runnable_avg
     24429 =C2=B1  7%     -40.4%      14549 =C2=B1  4%  sched_debug.cfs_rq[=
107]:/.tg->runnable_avg
     23937 =C2=B1  7%     -40.2%      14311 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
     24425 =C2=B1  7%     -40.4%      14550 =C2=B1  4%  sched_debug.cfs_rq[=
106]:/.tg->runnable_avg
     24433 =C2=B1  7%     -40.4%      14555 =C2=B1  4%  sched_debug.cfs_rq[=
108]:/.tg->runnable_avg
     23960 =C2=B1  7%     -40.2%      14328 =C2=B1  4%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
     24012 =C2=B1  7%     -40.2%      14365 =C2=B1  3%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
     23970 =C2=B1  7%     -40.2%      14335 =C2=B1  4%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
     24000 =C2=B1  7%     -40.2%      14359 =C2=B1  4%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
     24421 =C2=B1  7%     -40.4%      14545 =C2=B1  4%  sched_debug.cfs_rq[=
105]:/.tg->runnable_avg
     24017 =C2=B1  7%     -40.2%      14363 =C2=B1  4%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
     23975 =C2=B1  7%     -40.2%      14339 =C2=B1  4%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
     24007 =C2=B1  7%     -40.2%      14365 =C2=B1  4%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
     23995 =C2=B1  7%     -40.2%      14355 =C2=B1  4%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
     24007 =C2=B1  7%     -40.1%      14369 =C2=B1  3%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
     24127 =C2=B1  7%     -40.4%      14389 =C2=B1  4%  sched_debug.cfs_rq[=
56]:/.tg->runnable_avg
     24021 =C2=B1  7%     -40.2%      14367 =C2=B1  4%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
     23987 =C2=B1  7%     -40.2%      14352 =C2=B1  4%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
     24004 =C2=B1  7%     -40.2%      14366 =C2=B1  4%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
     23986 =C2=B1  7%     -40.2%      14350 =C2=B1  4%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
     24416 =C2=B1  7%     -40.4%      14544 =C2=B1  4%  sched_debug.cfs_rq[=
104]:/.tg->runnable_avg
     23982 =C2=B1  7%     -40.2%      14345 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
     24024 =C2=B1  7%     -40.2%      14365 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
     24122 =C2=B1  7%     -40.3%      14392 =C2=B1  4%  sched_debug.cfs_rq[=
55]:/.tg->runnable_avg
     24030 =C2=B1  7%     -40.2%      14365 =C2=B1  4%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
     24034 =C2=B1  7%     -40.2%      14366 =C2=B1  4%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
     24041 =C2=B1  7%     -40.2%      14368 =C2=B1  4%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
     24134 =C2=B1  7%     -40.4%      14392 =C2=B1  4%  sched_debug.cfs_rq[=
57]:/.tg->runnable_avg
     24140 =C2=B1  7%     -40.4%      14394 =C2=B1  4%  sched_debug.cfs_rq[=
58]:/.tg->runnable_avg
     24114 =C2=B1  7%     -40.3%      14390 =C2=B1  4%  sched_debug.cfs_rq[=
54]:/.tg->runnable_avg
     23935 =C2=B1  7%     -40.1%      14328 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
     24048 =C2=B1  7%     -40.2%      14375 =C2=B1  4%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
     23927 =C2=B1  7%     -40.1%      14329 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
     24058 =C2=B1  7%     -40.2%      14386 =C2=B1  4%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
     24053 =C2=B1  7%     -40.2%      14382 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
     24107 =C2=B1  7%     -40.3%      14387 =C2=B1  4%  sched_debug.cfs_rq[=
53]:/.tg->runnable_avg
     24402 =C2=B1  7%     -40.4%      14535 =C2=B1  4%  sched_debug.cfs_rq[=
102]:/.tg->runnable_avg
     24091 =C2=B1  7%     -40.3%      14377 =C2=B1  4%  sched_debug.cfs_rq[=
49]:/.tg->runnable_avg
     24090 =C2=B1  7%     -40.3%      14375 =C2=B1  4%  sched_debug.cfs_rq[=
48]:/.tg->runnable_avg
     24062 =C2=B1  7%     -40.2%      14386 =C2=B1  4%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
     24408 =C2=B1  7%     -40.4%      14540 =C2=B1  4%  sched_debug.cfs_rq[=
103]:/.tg->runnable_avg
     24397 =C2=B1  7%     -40.4%      14532 =C2=B1  4%  sched_debug.cfs_rq[=
101]:/.tg->runnable_avg
     24096 =C2=B1  7%     -40.3%      14380 =C2=B1  4%  sched_debug.cfs_rq[=
50]:/.tg->runnable_avg
     24085 =C2=B1  7%     -40.3%      14379 =C2=B1  4%  sched_debug.cfs_rq[=
47]:/.tg->runnable_avg
        22 =C2=B1 22%     -45.9%         12 =C2=B1  8%  sched_debug.cfs_rq[=
96]:/.runnable_load_avg
     24143 =C2=B1  7%     -40.4%      14398 =C2=B1  4%  sched_debug.cfs_rq[=
59]:/.tg->runnable_avg
     24099 =C2=B1  7%     -40.3%      14384 =C2=B1  4%  sched_debug.cfs_rq[=
51]:/.tg->runnable_avg
     24104 =C2=B1  7%     -40.3%      14387 =C2=B1  4%  sched_debug.cfs_rq[=
52]:/.tg->runnable_avg
     24066 =C2=B1  7%     -40.2%      14384 =C2=B1  4%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
     24388 =C2=B1  7%     -40.4%      14529 =C2=B1  4%  sched_debug.cfs_rq[=
100]:/.tg->runnable_avg
     24147 =C2=B1  7%     -40.4%      14401 =C2=B1  4%  sched_debug.cfs_rq[=
60]:/.tg->runnable_avg
     24072 =C2=B1  7%     -40.3%      14380 =C2=B1  4%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
     24153 =C2=B1  7%     -40.4%      14404 =C2=B1  4%  sched_debug.cfs_rq[=
61]:/.tg->runnable_avg
     24383 =C2=B1  7%     -40.4%      14523 =C2=B1  4%  sched_debug.cfs_rq[=
99]:/.tg->runnable_avg
     24078 =C2=B1  7%     -40.3%      14379 =C2=B1  4%  sched_debug.cfs_rq[=
46]:/.tg->runnable_avg
     24161 =C2=B1  7%     -40.4%      14411 =C2=B1  4%  sched_debug.cfs_rq[=
62]:/.tg->runnable_avg
     24378 =C2=B1  7%     -40.4%      14518 =C2=B1  4%  sched_debug.cfs_rq[=
98]:/.tg->runnable_avg
     24173 =C2=B1  7%     -40.3%      14420 =C2=B1  4%  sched_debug.cfs_rq[=
64]:/.tg->runnable_avg
     24165 =C2=B1  7%     -40.3%      14418 =C2=B1  4%  sched_debug.cfs_rq[=
63]:/.tg->runnable_avg
     24179 =C2=B1  7%     -40.3%      14426 =C2=B1  4%  sched_debug.cfs_rq[=
65]:/.tg->runnable_avg
     24372 =C2=B1  7%     -40.4%      14514 =C2=B1  4%  sched_debug.cfs_rq[=
97]:/.tg->runnable_avg
     24216 =C2=B1  7%     -40.4%      14442 =C2=B1  4%  sched_debug.cfs_rq[=
70]:/.tg->runnable_avg
     24208 =C2=B1  7%     -40.4%      14439 =C2=B1  4%  sched_debug.cfs_rq[=
69]:/.tg->runnable_avg
     24194 =C2=B1  7%     -40.3%      14433 =C2=B1  4%  sched_debug.cfs_rq[=
67]:/.tg->runnable_avg
     24204 =C2=B1  7%     -40.4%      14437 =C2=B1  4%  sched_debug.cfs_rq[=
68]:/.tg->runnable_avg
     24186 =C2=B1  7%     -40.3%      14430 =C2=B1  4%  sched_debug.cfs_rq[=
66]:/.tg->runnable_avg
     23922 =C2=B1  7%     -40.0%      14355 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     24364 =C2=B1  7%     -40.4%      14509 =C2=B1  4%  sched_debug.cfs_rq[=
96]:/.tg->runnable_avg
     24222 =C2=B1  7%     -40.4%      14448 =C2=B1  4%  sched_debug.cfs_rq[=
71]:/.tg->runnable_avg
     24358 =C2=B1  7%     -40.4%      14508 =C2=B1  4%  sched_debug.cfs_rq[=
95]:/.tg->runnable_avg
     24230 =C2=B1  7%     -40.3%      14455 =C2=B1  4%  sched_debug.cfs_rq[=
72]:/.tg->runnable_avg
     14919 =C2=B1 10%     -41.6%       8720 =C2=B1  6%  sched_debug.cfs_rq[=
55]:/.avg->runnable_avg_sum
     22280 =C2=B1  9%     -39.7%      13436 =C2=B1  1%  sched_debug.cfs_rq[=
98]:/.avg->runnable_avg_sum
     24235 =C2=B1  7%     -40.3%      14459 =C2=B1  4%  sched_debug.cfs_rq[=
73]:/.tg->runnable_avg
     24354 =C2=B1  7%     -40.5%      14502 =C2=B1  4%  sched_debug.cfs_rq[=
94]:/.tg->runnable_avg
     24241 =C2=B1  7%     -40.3%      14464 =C2=B1  4%  sched_debug.cfs_rq[=
74]:/.tg->runnable_avg
     24247 =C2=B1  7%     -40.3%      14465 =C2=B1  4%  sched_debug.cfs_rq[=
75]:/.tg->runnable_avg
     24251 =C2=B1  7%     -40.3%      14468 =C2=B1  4%  sched_debug.cfs_rq[=
76]:/.tg->runnable_avg
     24346 =C2=B1  7%     -40.4%      14499 =C2=B1  4%  sched_debug.cfs_rq[=
93]:/.tg->runnable_avg
     24342 =C2=B1  7%     -40.4%      14497 =C2=B1  4%  sched_debug.cfs_rq[=
92]:/.tg->runnable_avg
     24311 =C2=B1  7%     -40.4%      14482 =C2=B1  4%  sched_debug.cfs_rq[=
87]:/.tg->runnable_avg
     24318 =C2=B1  7%     -40.5%      14478 =C2=B1  4%  sched_debug.cfs_rq[=
88]:/.tg->runnable_avg
     24258 =C2=B1  7%     -40.3%      14472 =C2=B1  4%  sched_debug.cfs_rq[=
77]:/.tg->runnable_avg
     24268 =C2=B1  7%     -40.3%      14479 =C2=B1  4%  sched_debug.cfs_rq[=
79]:/.tg->runnable_avg
     24262 =C2=B1  7%     -40.3%      14475 =C2=B1  4%  sched_debug.cfs_rq[=
78]:/.tg->runnable_avg
     24298 =C2=B1  7%     -40.4%      14485 =C2=B1  4%  sched_debug.cfs_rq[=
85]:/.tg->runnable_avg
     24321 =C2=B1  7%     -40.4%      14484 =C2=B1  4%  sched_debug.cfs_rq[=
89]:/.tg->runnable_avg
       482 =C2=B1  9%     -39.8%        290 =C2=B1  1%  sched_debug.cfs_rq[=
98]:/.tg_runnable_contrib
     24271 =C2=B1  7%     -40.3%      14484 =C2=B1  4%  sched_debug.cfs_rq[=
80]:/.tg->runnable_avg
     24305 =C2=B1  7%     -40.4%      14482 =C2=B1  4%  sched_debug.cfs_rq[=
86]:/.tg->runnable_avg
     24334 =C2=B1  7%     -40.4%      14492 =C2=B1  4%  sched_debug.cfs_rq[=
91]:/.tg->runnable_avg
     24327 =C2=B1  7%     -40.5%      14487 =C2=B1  4%  sched_debug.cfs_rq[=
90]:/.tg->runnable_avg
     24292 =C2=B1  7%     -40.4%      14487 =C2=B1  4%  sched_debug.cfs_rq[=
84]:/.tg->runnable_avg
     24277 =C2=B1  7%     -40.3%      14486 =C2=B1  4%  sched_debug.cfs_rq[=
81]:/.tg->runnable_avg
     24281 =C2=B1  7%     -40.3%      14488 =C2=B1  4%  sched_debug.cfs_rq[=
82]:/.tg->runnable_avg
     24285 =C2=B1  7%     -40.3%      14489 =C2=B1  4%  sched_debug.cfs_rq[=
83]:/.tg->runnable_avg
      2781 =C2=B1  9%     -40.1%       1666 =C2=B1  7%  sched_debug.cpu#114=
.curr->pid
       322 =C2=B1 10%     -41.6%        188 =C2=B1  7%  sched_debug.cfs_rq[=
55]:/.tg_runnable_contrib
      8637 =C2=B1  7%     -42.2%       4988 =C2=B1  4%  sched_debug.cfs_rq[=
114]:/.avg->runnable_avg_sum
      4534 =C2=B1 11%     -41.0%       2676 =C2=B1 12%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     23920 =C2=B1  7%     -39.8%      14397 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
   1371598 =C2=B1  2%     +61.7%    2217765 =C2=B1  1%  proc-vmstat.numa_lo=
cal
     85047 =C2=B1 34%     +63.8%     139280 =C2=B1 20%  sched_debug.cpu#38.=
sched_goidle
    170267 =C2=B1 34%     +63.8%     278835 =C2=B1 19%  sched_debug.cpu#38.=
nr_switches
     23917 =C2=B1  7%     -39.7%      14419 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
   1331734 =C2=B1  1%     +59.6%    2125901 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.spread0
      1557 =C2=B1 10%     -47.5%        818 =C2=B1 16%  sched_debug.cpu#11.=
curr->pid
      5605 =C2=B1 36%     +65.4%       9274 =C2=B1 14%  sched_debug.cfs_rq[=
31]:/.exec_clock
        97 =C2=B1 11%     -40.9%         57 =C2=B1 13%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
       275 =C2=B1  8%     -44.2%        153 =C2=B1  7%  sched_debug.cfs_rq[=
60]:/.tg_runnable_contrib
         7 =C2=B1 13%     -36.2%          5 =C2=B1  0%  sched_debug.cpu#48.=
cpu_load[4]
       195 =C2=B1 13%     +51.2%        295 =C2=B1  4%  sched_debug.cpu#38.=
ttwu_local
     23914 =C2=B1  7%     -39.6%      14441 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
    619657 =C2=B1 24%     +46.8%     909461 =C2=B1  6%  sched_debug.cpu#69.=
sched_count
    484672 =C2=B1 28%     +46.9%     711968 =C2=B1 16%  sched_debug.cpu#65.=
sched_count
     23912 =C2=B1  7%     -39.5%      14462 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     12751 =C2=B1  8%     -43.7%       7176 =C2=B1  7%  sched_debug.cfs_rq[=
60]:/.avg->runnable_avg_sum
   1398938 =C2=B1  2%     +60.7%    2247512 =C2=B1  1%  proc-vmstat.numa_hit
    120361 =C2=B1 15%     +45.9%     175554 =C2=B1 14%  numa-numastat.node0=
.numa_hit
     48136 =C2=B1  2%     +58.1%      76088 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.exec_clock
     48255 =C2=B1  2%     +56.3%      75414 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.exec_clock
     23913 =C2=B1  7%     -39.4%      14501 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
   1335775 =C2=B1  1%     +57.9%    2108777 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.spread0
    117183 =C2=B1 15%     +46.2%     171366 =C2=B1 14%  numa-numastat.node0=
.local_node
    463034 =C2=B1 30%     +46.4%     677828 =C2=B1 18%  sched_debug.cpu#65.=
nr_switches
    231197 =C2=B1 30%     +46.3%     338335 =C2=B1 18%  sched_debug.cpu#65.=
sched_goidle
    912168 =C2=B1 11%     -38.1%     564649 =C2=B1  1%  sched_debug.cpu#51.=
avg_idle
   1332618 =C2=B1  1%     +56.7%    2088369 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.spread0
     48450 =C2=B1  2%     +57.7%      76385 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.exec_clock
     23912 =C2=B1  7%     -39.1%      14552 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
   1486265 =C2=B1  3%     +59.4%    2368549 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
   1335113 =C2=B1  1%     +56.4%    2088624 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.spread0
     62937 =C2=B1  2%     +55.4%      97796 =C2=B1  1%  uptime.idle
   1525528 =C2=B1  4%     +57.9%    2408345 =C2=B1  1%  proc-vmstat.pgfree
      3807 =C2=B1 10%     -38.2%       2352 =C2=B1  7%  sched_debug.cpu#55.=
curr->pid
     23915 =C2=B1  7%     -39.0%      14598 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
     48578 =C2=B1  2%     +56.7%      76103 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.exec_clock
        10 =C2=B1 10%     -38.1%          6 =C2=B1  7%  sched_debug.cpu#34.=
cpu_load[4]
        11 =C2=B1  7%     -40.9%          6 =C2=B1  7%  sched_debug.cpu#34.=
cpu_load[3]
        11 =C2=B1 13%     -44.3%          6 =C2=B1  7%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
     23919 =C2=B1  7%     -38.9%      14619 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     23944 =C2=B1  7%     -38.8%      14664 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
      4072 =C2=B1  8%     -38.1%       2520 =C2=B1  3%  sched_debug.cpu#48.=
curr->pid
     23921 =C2=B1  7%     -38.8%      14642 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
     23914 =C2=B1  7%     -38.7%      14665 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     23916 =C2=B1  7%     -38.7%      14667 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
     23922 =C2=B1  7%     -38.7%      14658 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     23924 =C2=B1  7%     -38.7%      14668 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
     23919 =C2=B1  7%     -38.7%      14671 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
     48277 =C2=B1  2%     +55.5%      75081 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.exec_clock
        35 =C2=B1 28%     +44.3%         51 =C2=B1 13%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
    517808 =C2=B1 17%     +65.4%     856644 =C2=B1  4%  sched_debug.cpu#69.=
nr_switches
    258731 =C2=B1 17%     +65.4%     428008 =C2=B1  4%  sched_debug.cpu#69.=
sched_goidle
      4391 =C2=B1  6%     -39.0%       2679 =C2=B1  5%  sched_debug.cpu#34.=
curr->pid
       145 =C2=B1 10%     +46.2%        213 =C2=B1  5%  sched_debug.cpu#105=
.ttwu_local
   1581415 =C2=B1  1%     +53.6%    2429312 =C2=B1  1%  sched_debug.cfs_rq[=
48]:/.spread0
      3875 =C2=B1 10%     -35.6%       2495 =C2=B1  1%  sched_debug.cpu#53.=
curr->pid
      8652 =C2=B1  7%     -41.0%       5101 =C2=B1  4%  sched_debug.cfs_rq[=
115]:/.avg->runnable_avg_sum
      1590 =C2=B1 20%     -34.2%       1046 =C2=B1  8%  sched_debug.cpu#66.=
curr->pid
      4441 =C2=B1  8%     -42.9%       2535 =C2=B1 16%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
       186 =C2=B1  7%     -41.0%        110 =C2=B1  4%  sched_debug.cfs_rq[=
115]:/.tg_runnable_contrib
      3687 =C2=B1 15%     -43.5%       2083 =C2=B1 10%  sched_debug.cpu#63.=
curr->pid
        14 =C2=B1 21%     -40.7%          8 =C2=B1  5%  sched_debug.cfs_rq[=
102]:/.load
    647041 =C2=B1 30%     +45.3%     939855 =C2=B1 10%  sched_debug.cpu#70.=
sched_count
   1585115 =C2=B1  1%     +53.1%    2427269 =C2=B1  1%  sched_debug.cfs_rq[=
46]:/.spread0
    193322 =C2=B1  8%     +35.4%     261730 =C2=B1 11%  numa-vmstat.node6.n=
uma_hit
        92 =C2=B1  6%     -44.9%         51 =C2=B1 21%  sched_debug.cfs_rq[=
21]:/.tg_runnable_contrib
       150 =C2=B1  8%     +43.9%        217 =C2=B1  9%  sched_debug.cpu#104=
.ttwu_local
      4622 =C2=B1  7%     -37.3%       2899 =C2=B1  5%  sched_debug.cpu#103=
.curr->pid
      4310 =C2=B1  6%     -44.1%       2410 =C2=B1 20%  sched_debug.cfs_rq[=
21]:/.avg->runnable_avg_sum
     48452 =C2=B1  2%     +55.0%      75116 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.exec_clock
       107 =C2=B1  6%     -44.4%         60 =C2=B1 20%  sched_debug.cfs_rq[=
68]:/.tg_runnable_contrib
      4321 =C2=B1 12%     -43.6%       2439 =C2=B1 15%  sched_debug.cpu#46.=
curr->pid
     48241 =C2=B1  2%     +49.7%      72197 =C2=B1  2%  sched_debug.cfs_rq[=
41]:/.exec_clock
       214 =C2=B1  3%     +46.0%        312 =C2=B1  6%  sched_debug.cpu#33.=
ttwu_local
       212 =C2=B1  8%     +56.6%        332 =C2=B1  1%  sched_debug.cpu#101=
.ttwu_local
      4431 =C2=B1  7%     -36.1%       2829 =C2=B1  1%  sched_debug.cpu#36.=
curr->pid
       156 =C2=B1 23%     +40.0%        219 =C2=B1  7%  numa-vmstat.node4.n=
r_page_table_pages
     48491 =C2=B1  2%     +51.0%      73245 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.exec_clock
 3.005e+10 =C2=B1  1%     +51.8%  4.563e+10 =C2=B1  1%  cpuidle.C6-NHM.time
        94 =C2=B1  9%     -42.4%         54 =C2=B1 17%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
    797004 =C2=B1  5%     -33.5%     529764 =C2=B1  0%  sched_debug.cpu#43.=
avg_idle
      5018 =C2=B1  6%     -44.1%       2804 =C2=B1 20%  sched_debug.cfs_rq[=
68]:/.avg->runnable_avg_sum
      5172 =C2=B1  9%     -36.8%       3266 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
   1581760 =C2=B1  1%     +51.3%    2393465 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.spread0
   1583223 =C2=B1  1%     +36.5%    2161570 =C2=B1 11%  sched_debug.cfs_rq[=
42]:/.spread0
      3913 =C2=B1 10%     -40.9%       2314 =C2=B1  6%  sched_debug.cpu#50.=
curr->pid
   1583437 =C2=B1  1%     +51.0%    2390307 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.spread0
       389 =C2=B1 23%     +45.3%        566 =C2=B1  4%  sched_debug.cpu#42.=
ttwu_local
   1583575 =C2=B1  1%     +51.5%    2398828 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.spread0
   1585384 =C2=B1  1%     +50.5%    2386226 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.spread0
       368 =C2=B1 15%     +33.6%        491 =C2=B1 16%  sched_debug.cpu#43.=
ttwu_local
       558 =C2=B1  2%     +49.4%        834 =C2=B1  1%  uptime.boot
   1582039 =C2=B1  1%     +36.4%    2157583 =C2=B1 10%  sched_debug.cfs_rq[=
41]:/.spread0
      4102 =C2=B1 10%     -38.3%       2532 =C2=B1  7%  sched_debug.cpu#45.=
curr->pid
       110 =C2=B1  9%     -36.7%         70 =C2=B1 11%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
      4500 =C2=B1  5%     -39.6%       2720 =C2=B1  8%  sched_debug.cpu#35.=
curr->pid
      2251 =C2=B1  9%     -34.7%       1471 =C2=B1  1%  sched_debug.cpu#125=
.curr->pid
       232 =C2=B1 13%     +52.3%        353 =C2=B1  7%  sched_debug.cpu#113=
.ttwu_local
      3767 =C2=B1  9%     -38.1%       2332 =C2=B1  8%  sched_debug.cpu#54.=
curr->pid
       106 =C2=B1 17%     -39.8%         64 =C2=B1  7%  sched_debug.cfs_rq[=
65]:/.tg_runnable_contrib
       106 =C2=B1  7%     -45.1%         58 =C2=B1 21%  sched_debug.cfs_rq[=
71]:/.tg_runnable_contrib
   1773802 =C2=B1  1%     +47.8%    2621361 =C2=B1  1%  sched_debug.cfs_rq[=
34]:/.spread0
      4934 =C2=B1  7%     -44.9%       2720 =C2=B1 21%  sched_debug.cfs_rq[=
71]:/.avg->runnable_avg_sum
     36.99 =C2=B1  4%     +51.1%      55.89 =C2=B1  1%  turbostat.CPU%c1
    814790 =C2=B1  9%     -32.1%     553453 =C2=B1  2%  sched_debug.cpu#99.=
avg_idle
         6 =C2=B1 38%     -38.5%          4 =C2=B1  0%  sched_debug.cpu#54.=
cpu_load[4]
        16 =C2=B1 20%     -40.6%          9 =C2=B1  5%  sched_debug.cpu#98.=
cpu_load[4]
        15 =C2=B1  8%     -38.0%          9 =C2=B1  5%  sched_debug.cpu#97.=
cpu_load[2]
        15 =C2=B1  8%     -39.4%          9 =C2=B1  5%  sched_debug.cpu#97.=
cpu_load[0]
        16 =C2=B1 25%     -43.0%          9 =C2=B1  5%  sched_debug.cpu#98.=
cpu_load[3]
        16 =C2=B1 32%     -40.6%         10 =C2=B1  0%  sched_debug.cpu#98.=
cpu_load[1]
        11 =C2=B1  8%     -39.1%          7 =C2=B1 14%  sched_debug.cpu#34.=
cpu_load[2]
        89 =C2=B1 12%     -32.7%         60 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
         6 =C2=B1 17%     -35.1%          4 =C2=B1  0%  sched_debug.cpu#55.=
cpu_load[3]
        16 =C2=B1 30%     -43.6%          9 =C2=B1  5%  sched_debug.cpu#98.=
cpu_load[2]
      4299 =C2=B1 12%     -35.9%       2757 =C2=B1  7%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
      3508 =C2=B1  6%     -35.9%       2248 =C2=B1  1%  sched_debug.cpu#62.=
curr->pid
      4942 =C2=B1 16%     -39.3%       2997 =C2=B1  7%  sched_debug.cfs_rq[=
65]:/.avg->runnable_avg_sum
      4177 =C2=B1 12%     -31.8%       2849 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
      3021 =C2=B1 11%     -39.1%       1838 =C2=B1 11%  sched_debug.cpu#108=
.curr->pid
      4389 =C2=B1 13%     -38.9%       2681 =C2=B1 17%  sched_debug.cfs_rq[=
20]:/.avg->runnable_avg_sum
     60564 =C2=B1  1%     +47.1%      89086 =C2=B1  2%  sched_debug.cfs_rq[=
33]:/.exec_clock
    816345 =C2=B1  4%     -30.9%     564325 =C2=B1  1%  sched_debug.cpu#48.=
avg_idle
        91 =C2=B1 12%     -36.3%         58 =C2=B1  7%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
   1769068 =C2=B1  1%     +47.3%    2606466 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.spread0
   1769237 =C2=B1  1%     +46.9%    2599688 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.spread0
   1768248 =C2=B1  1%     +46.5%    2589990 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.spread0
    279633 =C2=B1  6%     +38.6%     387557 =C2=B1  4%  numa-numastat.node7=
.local_node
   1773364 =C2=B1  1%     +47.2%    2610310 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.spread0
   1767847 =C2=B1  1%     +46.4%    2588864 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.spread0
   1768388 =C2=B1  1%     +46.9%    2598060 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.spread0
        93 =C2=B1 13%     -38.6%         57 =C2=B1 18%  sched_debug.cfs_rq[=
20]:/.tg_runnable_contrib
   1768419 =C2=B1  1%     +32.4%    2340527 =C2=B1 10%  sched_debug.cfs_rq[=
39]:/.spread0
    283813 =C2=B1  6%     +38.0%     391766 =C2=B1  4%  numa-numastat.node7=
.numa_hit
     59611 =C2=B1  1%     +47.0%      87610 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.exec_clock
      4430 =C2=B1  7%     -35.8%       2845 =C2=B1  6%  sched_debug.cpu#33.=
curr->pid
        21 =C2=B1 23%     -45.0%         12 =C2=B1  8%  sched_debug.cpu#96.=
cpu_load[0]
    484879 =C2=B1  5%     +28.8%     624694 =C2=B1 13%  sched_debug.cpu#98.=
sched_count
   1887361 =C2=B1  1%     +44.2%    2722254 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.spread0
     59966 =C2=B1  1%     +45.6%      87285 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.exec_clock
     59873 =C2=B1  1%     +44.7%      86619 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.exec_clock
      3518 =C2=B1 11%     -36.5%       2232 =C2=B1  2%  sched_debug.cpu#57.=
curr->pid
     63069 =C2=B1 10%     +45.5%      91793 =C2=B1  0%  numa-numastat.node5=
.local_node
     59702 =C2=B1  2%     +45.2%      86707 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.exec_clock
   1888965 =C2=B1  1%     +43.6%    2712227 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.spread0
       243 =C2=B1  7%     +39.1%        338 =C2=B1  6%  sched_debug.cpu#52.=
ttwu_local
       190 =C2=B1  9%     +50.7%        287 =C2=B1  0%  sched_debug.cpu#39.=
ttwu_local
   1878534 =C2=B1  1%     +43.7%    2700177 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.spread0
        95 =C2=B1 13%     -34.0%         63 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
   1883235 =C2=B1  1%     +44.2%    2715307 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.spread0
        13 =C2=B1 13%     -35.4%          8 =C2=B1  5%  sched_debug.cfs_rq[=
102]:/.runnable_load_avg
   1879985 =C2=B1  1%     +43.5%    2697935 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.spread0
    825499 =C2=B1  5%     -29.9%     578959 =C2=B1  2%  sched_debug.cpu#44.=
avg_idle
      4454 =C2=B1 13%     -33.7%       2955 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       102 =C2=B1 16%     -41.5%         60 =C2=B1 13%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
    391744 =C2=B1 28%     +63.0%     638443 =C2=B1  3%  sched_debug.cpu#101=
.sched_count
    192139 =C2=B1 29%     +61.3%     309842 =C2=B1  4%  sched_debug.cpu#101=
.sched_goidle
    384465 =C2=B1 29%     +61.3%     620000 =C2=B1  4%  sched_debug.cpu#101=
.nr_switches
     60186 =C2=B1  1%     +45.2%      87379 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.exec_clock
   1885201 =C2=B1  1%     +43.1%    2697194 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.spread0
   1881989 =C2=B1  1%     +42.7%    2685691 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.spread0
      1369 =C2=B1 19%     -43.6%        772 =C2=B1 20%  sched_debug.cpu#18.=
curr->pid
    861238 =C2=B1  6%     -32.5%     581385 =C2=B1  2%  sched_debug.cpu#102=
.avg_idle
    208139 =C2=B1  9%     +35.1%     281217 =C2=B1  6%  numa-vmstat.node1.n=
uma_local
     24482 =C2=B1  6%     +21.2%      29672 =C2=B1 14%  numa-meminfo.node4.=
SUnreclaim
      6120 =C2=B1  6%     +21.2%       7418 =C2=B1 14%  numa-vmstat.node4.n=
r_slab_unreclaimable
      4760 =C2=B1 16%     -41.2%       2801 =C2=B1 12%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     60017 =C2=B1  1%     +37.9%      82770 =C2=B1  4%  sched_debug.cfs_rq[=
39]:/.exec_clock
    476224 =C2=B1  5%     +26.5%     602442 =C2=B1 13%  sched_debug.cpu#98.=
nr_switches
    237937 =C2=B1  5%     +26.5%     301009 =C2=B1 13%  sched_debug.cpu#98.=
sched_goidle
      1619 =C2=B1 17%     -43.3%        918 =C2=B1 36%  sched_debug.cpu#21.=
curr->pid
    884486 =C2=B1  7%     -29.0%     628344 =C2=B1  0%  sched_debug.cpu#56.=
avg_idle
    841416 =C2=B1  7%     -30.6%     583956 =C2=B1  0%  sched_debug.cpu#53.=
avg_idle
    235573 =C2=B1 22%     +37.2%     323276 =C2=B1  6%  sched_debug.cpu#39.=
sched_count
    180886 =C2=B1 12%     +32.3%     239254 =C2=B1  9%  numa-vmstat.node4.n=
uma_local
      4419 =C2=B1  8%     -37.6%       2758 =C2=B1 12%  sched_debug.cpu#39.=
curr->pid
      3964 =C2=B1  9%     -27.8%       2861 =C2=B1  0%  sched_debug.cpu#49.=
curr->pid
      3818 =C2=B1 10%     -35.0%       2481 =C2=B1 12%  sched_debug.cpu#52.=
curr->pid
      3058 =C2=B1  9%     -36.6%       1938 =C2=B1 11%  sched_debug.cpu#109=
.curr->pid
       377 =C2=B1  5%     +29.4%        488 =C2=B1 11%  sched_debug.cpu#44.=
ttwu_local
   1957571 =C2=B1  1%     +42.0%    2780363 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.spread0
    835444 =C2=B1  3%     -30.2%     582831 =C2=B1  2%  sched_debug.cpu#46.=
avg_idle
      1886 =C2=B1 19%     +39.8%       2637 =C2=B1  6%  numa-vmstat.node5.n=
r_slab_reclaimable
      7548 =C2=B1 19%     +39.8%      10552 =C2=B1  6%  numa-meminfo.node5.=
SReclaimable
    815528 =C2=B1  6%     -29.5%     574942 =C2=B1  1%  sched_debug.cpu#45.=
avg_idle
     10167 =C2=B1 10%     +35.6%      13781 =C2=B1  3%  proc-vmstat.numa_hi=
nt_faults
    263038 =C2=B1 19%     +49.7%     393686 =C2=B1  0%  sched_debug.cpu#69.=
ttwu_count
    941248 =C2=B1  5%     -28.5%     673280 =C2=B1  2%  sched_debug.cpu#120=
.avg_idle
     74462 =C2=B1  1%     +41.0%     105005 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.exec_clock
    796455 =C2=B1  7%     -26.0%     589012 =C2=B1  0%  sched_debug.cpu#97.=
avg_idle
    281730 =C2=B1  9%     +24.6%     351105 =C2=B1 14%  numa-vmstat.node2.n=
uma_hit
       320 =C2=B1 16%     +39.2%        446 =C2=B1  5%  sched_debug.cpu#124=
.ttwu_local
      1382 =C2=B1 17%     +25.4%       1733 =C2=B1  9%  sched_debug.cpu#17.=
curr->pid
     52849 =C2=B1 14%     +19.8%      63326 =C2=B1 15%  cpuidle.C3-NHM.usage
    850228 =C2=B1  6%     -31.1%     585783 =C2=B1  8%  sched_debug.cpu#49.=
avg_idle
    849412 =C2=B1 10%     -29.3%     600564 =C2=B1  8%  sched_debug.cpu#38.=
avg_idle
    225811 =C2=B1 22%     +34.6%     304047 =C2=B1  5%  sched_debug.cpu#39.=
nr_switches
    112824 =C2=B1 22%     +34.6%     151897 =C2=B1  5%  sched_debug.cpu#39.=
sched_goidle
    197146 =C2=B1 11%     +30.3%     256943 =C2=B1  8%  numa-vmstat.node4.n=
uma_hit
     74006 =C2=B1  2%     +39.8%     103492 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.exec_clock
    779015 =C2=B1  7%     -29.1%     552556 =C2=B1  4%  sched_debug.cpu#98.=
avg_idle
    578687 =C2=B1 30%     +63.3%     945091 =C2=B1  1%  sched_debug.cpu#0.s=
ched_count
    799953 =C2=B1  6%     -24.8%     601836 =C2=B1  0%  sched_debug.cpu#103=
.avg_idle
    379380 =C2=B1  3%     +37.0%     519845 =C2=B1  1%  sched_debug.ktime
    833113 =C2=B1  5%     -28.3%     597468 =C2=B1  1%  sched_debug.cpu#41.=
avg_idle
      4347 =C2=B1 14%     -26.1%       3213 =C2=B1  1%  sched_debug.cpu#44.=
curr->pid
     44.48 =C2=B1  3%     -27.6%      32.21 =C2=B1  0%  turbostat.CPU%c6
     72882 =C2=B1  2%     +38.5%     100966 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.exec_clock
    192471 =C2=B1 16%     +34.9%     259727 =C2=B1  0%  numa-vmstat.node7.n=
uma_local
     74634 =C2=B1  1%     +37.7%     102802 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.exec_clock
        11 =C2=B1  5%     -36.4%          7 =C2=B1 14%  sched_debug.cpu#35.=
cpu_load[4]
        11 =C2=B1 20%     -36.6%          7 =C2=B1  6%  sched_debug.cpu#39.=
cpu_load[0]
        11 =C2=B1 12%     -36.6%          7 =C2=B1  6%  sched_debug.cpu#34.=
cpu_load[0]
        11 =C2=B1 18%     -35.7%          7 =C2=B1  6%  sched_debug.cfs_rq[=
39]:/.runnable_load_avg
        11 =C2=B1 10%     -34.8%          7 =C2=B1  6%  sched_debug.cpu#34.=
cpu_load[1]
    833981 =C2=B1  6%     -32.4%     563402 =C2=B1  7%  sched_debug.cpu#40.=
avg_idle
    820870 =C2=B1  6%     -29.4%     579674 =C2=B1  3%  sched_debug.cpu#101=
.avg_idle
     73607 =C2=B1  1%     +37.8%     101446 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.exec_clock
      4525 =C2=B1  6%     -30.2%       3158 =C2=B1  4%  sched_debug.cpu#100=
.curr->pid
      3847 =C2=B1  9%     -30.4%       2676 =C2=B1  1%  sched_debug.cpu#51.=
curr->pid
      2629 =C2=B1 12%     -36.6%       1667 =C2=B1  7%  sched_debug.cpu#118=
.curr->pid
      4626 =C2=B1  9%     -31.1%       3185 =C2=B1  3%  sched_debug.cpu#99.=
curr->pid
    813130 =C2=B1  4%     -32.7%     547058 =C2=B1  7%  sched_debug.cpu#47.=
avg_idle
     73284 =C2=B1  2%     +36.7%     100190 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.exec_clock
     67245 =C2=B1  9%     +36.6%      91883 =C2=B1  0%  numa-numastat.node5=
.numa_hit
     76537 =C2=B1  8%     +33.2%     101975 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.exec_clock
    399983 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.sched_c=
lk
    399983 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.cpu_clk
    399995 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#69.=
clock
    399995 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#69.=
clock_task
    399985 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#22.=
clock
    399985 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#22.=
clock_task
    399985 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#20.=
clock_task
    399985 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#20.=
clock
    399986 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.cpu#30.=
clock_task
    399986 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.cpu#30.=
clock
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#25.=
clock_task
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#25.=
clock
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#15.=
clock_task
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#15.=
clock
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#19.=
clock_task
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#19.=
clock
    399992 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#53.=
clock_task
    399992 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#53.=
clock
    399985 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#17.=
clock
    399985 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#17.=
clock_task
    399983 =C2=B1  2%     +35.0%     540021 =C2=B1  1%  sched_debug.cpu#10.=
clock_task
    399983 =C2=B1  2%     +35.0%     540021 =C2=B1  1%  sched_debug.cpu#10.=
clock
    399984 =C2=B1  2%     +35.0%     540023 =C2=B1  1%  sched_debug.cpu#14.=
clock_task
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#28.=
clock
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#28.=
clock_task
    399987 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#32.=
clock
    399987 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#32.=
clock_task
    399984 =C2=B1  2%     +35.0%     540021 =C2=B1  1%  sched_debug.cpu#12.=
clock
    399984 =C2=B1  2%     +35.0%     540021 =C2=B1  1%  sched_debug.cpu#12.=
clock_task
    399987 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.cpu#29.=
clock
    399987 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.cpu#29.=
clock_task
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#23.=
clock_task
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#23.=
clock
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#26.=
clock_task
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#26.=
clock
    399984 =C2=B1  2%     +35.0%     540022 =C2=B1  1%  sched_debug.cpu#13.=
clock_task
    399984 =C2=B1  2%     +35.0%     540022 =C2=B1  1%  sched_debug.cpu#13.=
clock
    399984 =C2=B1  2%     +35.0%     540023 =C2=B1  1%  sched_debug.cpu#14.=
clock
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#18.=
clock_task
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#18.=
clock
    399976 =C2=B1  2%     +35.0%     540012 =C2=B1  1%  sched_debug.cpu#5.c=
lock
    399976 =C2=B1  2%     +35.0%     540012 =C2=B1  1%  sched_debug.cpu#5.c=
lock_task
    399976 =C2=B1  2%     +35.0%     540009 =C2=B1  1%  sched_debug.cpu#4.c=
lock
    399976 =C2=B1  2%     +35.0%     540009 =C2=B1  1%  sched_debug.cpu#4.c=
lock_task
    399992 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#52.=
clock_task
    399992 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#52.=
clock
    399987 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#31.=
clock
    399987 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#31.=
clock_task
    399991 =C2=B1  2%     +35.0%     540030 =C2=B1  1%  sched_debug.cpu#45.=
clock
    399991 =C2=B1  2%     +35.0%     540030 =C2=B1  1%  sched_debug.cpu#45.=
clock_task
    399988 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#34.=
clock
    399988 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#34.=
clock_task
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#16.=
clock_task
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#16.=
clock
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#98.=
clock
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#98.=
clock_task
    399991 =C2=B1  2%     +35.0%     540029 =C2=B1  1%  sched_debug.cpu#44.=
clock
    399991 =C2=B1  2%     +35.0%     540029 =C2=B1  1%  sched_debug.cpu#44.=
clock_task
    399975 =C2=B1  2%     +35.0%     540008 =C2=B1  1%  sched_debug.cpu#3.c=
lock
    399975 =C2=B1  2%     +35.0%     540008 =C2=B1  1%  sched_debug.cpu#3.c=
lock_task
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#24.=
clock
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#24.=
clock_task
    399991 =C2=B1  2%     +35.0%     540030 =C2=B1  1%  sched_debug.cpu#46.=
clock_task
    399991 =C2=B1  2%     +35.0%     540030 =C2=B1  1%  sched_debug.cpu#46.=
clock
    399993 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#56.=
clock
    399993 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#56.=
clock_task
    399992 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#49.=
clock_task
    399992 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#49.=
clock
    399994 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#66.=
clock_task
    399994 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#66.=
clock
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#21.=
clock
    399985 =C2=B1  2%     +35.0%     540024 =C2=B1  1%  sched_debug.cpu#21.=
clock_task
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#27.=
clock_task
    399986 =C2=B1  2%     +35.0%     540025 =C2=B1  1%  sched_debug.cpu#27.=
clock
    399976 =C2=B1  2%     +35.0%     540013 =C2=B1  1%  sched_debug.cpu#6.c=
lock_task
    399976 =C2=B1  2%     +35.0%     540013 =C2=B1  1%  sched_debug.cpu#6.c=
lock
    399981 =C2=B1  2%     +35.0%     540014 =C2=B1  1%  sched_debug.cpu#7.c=
lock_task
    399981 =C2=B1  2%     +35.0%     540014 =C2=B1  1%  sched_debug.cpu#7.c=
lock
    399993 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#58.=
clock_task
    399993 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#58.=
clock
    399996 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#73.=
clock_task
    399996 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#73.=
clock
    399982 =C2=B1  2%     +35.0%     540018 =C2=B1  1%  sched_debug.cpu#9.c=
lock
    399982 =C2=B1  2%     +35.0%     540018 =C2=B1  1%  sched_debug.cpu#9.c=
lock_task
    399989 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#36.=
clock
    399989 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#36.=
clock_task
    399992 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#50.=
clock
    399992 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#50.=
clock_task
    399983 =C2=B1  2%     +35.0%     540020 =C2=B1  1%  sched_debug.cpu#11.=
clock
    399991 =C2=B1  2%     +35.0%     540030 =C2=B1  1%  sched_debug.cpu#47.=
clock
    399991 =C2=B1  2%     +35.0%     540030 =C2=B1  1%  sched_debug.cpu#47.=
clock_task
    399991 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#48.=
clock
    399991 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#48.=
clock_task
    399995 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#67.=
clock_task
    399995 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#67.=
clock
    399993 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#57.=
clock
    399993 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#57.=
clock_task
    399983 =C2=B1  2%     +35.0%     540020 =C2=B1  1%  sched_debug.cpu#11.=
clock_task
    399989 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#37.=
clock
    399989 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#37.=
clock_task
    399990 =C2=B1  2%     +35.0%     540028 =C2=B1  1%  sched_debug.cpu#41.=
clock_task
    399990 =C2=B1  2%     +35.0%     540028 =C2=B1  1%  sched_debug.cpu#41.=
clock
    399980 =C2=B1  2%     +35.0%     540015 =C2=B1  1%  sched_debug.cpu#8.c=
lock_task
    399980 =C2=B1  2%     +35.0%     540015 =C2=B1  1%  sched_debug.cpu#8.c=
lock
    399994 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#65.=
clock_task
    399994 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#65.=
clock
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#93.=
clock_task
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#93.=
clock
    399992 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#51.=
clock
    399992 =C2=B1  2%     +35.0%     540031 =C2=B1  1%  sched_debug.cpu#51.=
clock_task
    399994 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#64.=
clock_task
    399994 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#64.=
clock
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#61.=
clock_task
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#61.=
clock
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#92.=
clock_task
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#92.=
clock
    399995 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#68.=
clock_task
    399995 =C2=B1  2%     +35.0%     540034 =C2=B1  1%  sched_debug.cpu#68.=
clock
    399990 =C2=B1  2%     +35.0%     540028 =C2=B1  1%  sched_debug.cpu#40.=
clock
    399990 =C2=B1  2%     +35.0%     540028 =C2=B1  1%  sched_debug.cpu#40.=
clock_task
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#75.=
clock
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#75.=
clock_task
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#60.=
clock_task
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#60.=
clock
    399999 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#88.=
clock_task
    399999 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#88.=
clock
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#59.=
clock_task
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#59.=
clock
    399998 =C2=B1  2%     +35.0%     540037 =C2=B1  1%  sched_debug.cpu#82.=
clock_task
    399998 =C2=B1  2%     +35.0%     540037 =C2=B1  1%  sched_debug.cpu#82.=
clock
    399988 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.cpu#33.=
clock_task
    399988 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.cpu#33.=
clock
    399989 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#38.=
clock
    399989 =C2=B1  2%     +35.0%     540027 =C2=B1  1%  sched_debug.cpu#38.=
clock_task
    399995 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#70.=
clock_task
    399995 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#70.=
clock
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#90.=
clock
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#90.=
clock_task
    399996 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#78.=
clock_task
    399996 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#78.=
clock
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#94.=
clock
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#94.=
clock_task
    399998 =C2=B1  2%     +35.0%     540038 =C2=B1  1%  sched_debug.cpu#85.=
clock
    399998 =C2=B1  2%     +35.0%     540038 =C2=B1  1%  sched_debug.cpu#85.=
clock_task
    399991 =C2=B1  2%     +35.0%     540029 =C2=B1  1%  sched_debug.cpu#43.=
clock_task
    399991 =C2=B1  2%     +35.0%     540029 =C2=B1  1%  sched_debug.cpu#43.=
clock
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#72.=
clock
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#72.=
clock_task
    399989 =C2=B1  2%     +35.0%     540028 =C2=B1  1%  sched_debug.cpu#39.=
clock_task
    399989 =C2=B1  2%     +35.0%     540028 =C2=B1  1%  sched_debug.cpu#39.=
clock
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#62.=
clock_task
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#62.=
clock
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#76.=
clock_task
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#76.=
clock
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#74.=
clock
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#74.=
clock_task
    399995 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#71.=
clock_task
    399995 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#71.=
clock
    399999 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#89.=
clock
    399999 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#89.=
clock_task
    399997 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#79.=
clock
    399997 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#79.=
clock_task
    399993 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#54.=
clock
    399993 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#54.=
clock_task
    399990 =C2=B1  2%     +35.0%     540028 =C2=B1  1%  sched_debug.cpu#42.=
clock
    399990 =C2=B1  2%     +35.0%     540028 =C2=B1  1%  sched_debug.cpu#42.=
clock_task
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#77.=
clock_task
    399996 =C2=B1  2%     +35.0%     540035 =C2=B1  1%  sched_debug.cpu#77.=
clock
    399989 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.cpu#35.=
clock
    399989 =C2=B1  2%     +35.0%     540026 =C2=B1  1%  sched_debug.cpu#35.=
clock_task
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#63.=
clock_task
    399994 =C2=B1  2%     +35.0%     540033 =C2=B1  1%  sched_debug.cpu#63.=
clock
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#95.=
clock
    400000 =C2=B1  2%     +35.0%     540040 =C2=B1  1%  sched_debug.cpu#95.=
clock_task
    399975 =C2=B1  2%     +35.0%     540010 =C2=B1  1%  sched_debug.cpu#2.c=
lock_task
    399975 =C2=B1  2%     +35.0%     540010 =C2=B1  1%  sched_debug.cpu#2.c=
lock
    399999 =C2=B1  2%     +35.0%     540039 =C2=B1  1%  sched_debug.cpu#91.=
clock
    399999 =C2=B1  2%     +35.0%     540039 =C2=B1  1%  sched_debug.cpu#91.=
clock_task
    399993 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#55.=
clock_task
    399993 =C2=B1  2%     +35.0%     540032 =C2=B1  1%  sched_debug.cpu#55.=
clock
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#96.=
clock_task
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#96.=
clock
    399999 =C2=B1  2%     +35.0%     540038 =C2=B1  1%  sched_debug.cpu#86.=
clock
    399999 =C2=B1  2%     +35.0%     540038 =C2=B1  1%  sched_debug.cpu#86.=
clock_task
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#97.=
clock_task
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#97.=
clock
    399998 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#81.=
clock_task
    399998 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#81.=
clock
    399997 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#80.=
clock_task
    399997 =C2=B1  2%     +35.0%     540036 =C2=B1  1%  sched_debug.cpu#80.=
clock
    400004 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#115=
.clock
    400004 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#115=
.clock_task
    399998 =C2=B1  2%     +35.0%     540037 =C2=B1  1%  sched_debug.cpu#83.=
clock
    399998 =C2=B1  2%     +35.0%     540037 =C2=B1  1%  sched_debug.cpu#83.=
clock_task
    400002 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#103=
.clock_task
    400002 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#103=
.clock
    399998 =C2=B1  2%     +35.0%     540037 =C2=B1  1%  sched_debug.cpu#84.=
clock_task
    399998 =C2=B1  2%     +35.0%     540037 =C2=B1  1%  sched_debug.cpu#84.=
clock
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#110=
.clock
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#110=
.clock_task
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#99.=
clock
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#99.=
clock_task
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#100=
.clock
    400001 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#100=
.clock_task
    400002 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#106=
.clock_task
    400002 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#106=
.clock
    400002 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#101=
.clock_task
    400002 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#101=
.clock
    400002 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#102=
.clock_task
    400002 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#102=
.clock
    400002 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#109=
.clock
    400002 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#109=
.clock_task
    400002 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#105=
.clock_task
    400002 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#105=
.clock
    400002 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#104=
.clock
    400002 =C2=B1  2%     +35.0%     540041 =C2=B1  1%  sched_debug.cpu#104=
.clock_task
    399999 =C2=B1  2%     +35.0%     540038 =C2=B1  1%  sched_debug.cpu#87.=
clock_task
    399999 =C2=B1  2%     +35.0%     540038 =C2=B1  1%  sched_debug.cpu#87.=
clock
    400003 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#108=
.clock
    400003 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#108=
.clock_task
    400002 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#107=
.clock
    400002 =C2=B1  2%     +35.0%     540042 =C2=B1  1%  sched_debug.cpu#107=
.clock_task
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#111=
.clock
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#111=
.clock_task
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#114=
.clock_task
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#114=
.clock
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#112=
.clock
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#112=
.clock_task
    400004 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#118=
.clock
    400004 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#118=
.clock_task
    400004 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#117=
.clock
    400004 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#117=
.clock_task
    400004 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#116=
.clock_task
    400004 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#116=
.clock
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#113=
.clock
    400003 =C2=B1  2%     +35.0%     540043 =C2=B1  1%  sched_debug.cpu#113=
.clock_task
    400005 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#119=
.clock_task
    400005 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#119=
.clock
    400005 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#124=
.clock
    400005 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#124=
.clock_task
    400005 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#120=
.clock
    400005 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#120=
.clock_task
    400005 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#122=
.clock
    400005 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#122=
.clock_task
    400005 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#121=
.clock_task
    400005 =C2=B1  2%     +35.0%     540044 =C2=B1  1%  sched_debug.cpu#121=
.clock
    400005 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#123=
.clock_task
    400005 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#123=
.clock
    400006 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#126=
.clock
    400006 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#126=
.clock_task
    400006 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#125=
.clock_task
    400006 =C2=B1  2%     +35.0%     540045 =C2=B1  1%  sched_debug.cpu#125=
.clock
    400006 =C2=B1  2%     +35.0%     540046 =C2=B1  1%  sched_debug.cpu#127=
.clock
    400006 =C2=B1  2%     +35.0%     540046 =C2=B1  1%  sched_debug.cpu#127=
.clock_task
    399981 =C2=B1  2%     +35.0%     540013 =C2=B1  1%  sched_debug.cpu#0.c=
lock
    399981 =C2=B1  2%     +35.0%     540013 =C2=B1  1%  sched_debug.cpu#0.c=
lock_task
    399978 =C2=B1  2%     +35.0%     540006 =C2=B1  1%  sched_debug.cpu#1.c=
lock_task
    399978 =C2=B1  2%     +35.0%     540006 =C2=B1  1%  sched_debug.cpu#1.c=
lock
        20 =C2=B1 17%     -36.1%         13 =C2=B1  7%  sched_debug.cpu#96.=
cpu_load[4]
        21 =C2=B1 23%     -40.5%         13 =C2=B1  7%  sched_debug.cpu#96.=
cpu_load[1]
    325770 =C2=B1 23%     +33.0%     433154 =C2=B1  6%  sched_debug.cpu#70.=
ttwu_count
    947248 =C2=B1  3%     -29.3%     669439 =C2=B1  6%  sched_debug.cpu#108=
.avg_idle
      2621 =C2=B1 10%     -35.5%       1691 =C2=B1  8%  sched_debug.cpu#116=
.curr->pid
    837882 =C2=B1  8%     -24.9%     629180 =C2=B1  0%  sched_debug.cpu#1.a=
vg_idle
   3440345 =C2=B1  2%     +33.1%    4578443 =C2=B1  1%  meminfo.Committed_AS
    926220 =C2=B1  4%     -24.1%     702601 =C2=B1  0%  sched_debug.cpu#107=
.avg_idle
      3523 =C2=B1  9%     -35.7%       2266 =C2=B1 11%  sched_debug.cpu#60.=
curr->pid
        88 =C2=B1  9%     -38.4%         54 =C2=B1 26%  sched_debug.cfs_rq[=
24]:/.tg_runnable_contrib
    812629 =C2=B1  4%     -29.3%     574171 =C2=B1  4%  sched_debug.cpu#39.=
avg_idle
       238 =C2=B1  8%     +36.7%        325 =C2=B1  0%  sched_debug.cpu#54.=
ttwu_local
    860053 =C2=B1  3%     -26.6%     630998 =C2=B1  1%  sched_debug.cpu#50.=
avg_idle
      2111 =C2=B1 10%     -38.2%       1306 =C2=B1 19%  sched_debug.cpu#122=
.curr->pid
    915359 =C2=B1  4%     -29.0%     649852 =C2=B1  6%  sched_debug.cpu#61.=
avg_idle
       351 =C2=B1 12%     +35.6%        476 =C2=B1  3%  sched_debug.cpu#45.=
ttwu_local
    830146 =C2=B1  2%     -25.2%     621033 =C2=B1  1%  sched_debug.cpu#78.=
avg_idle
    816685 =C2=B1  3%     -27.3%     593577 =C2=B1  3%  sched_debug.cpu#100=
.avg_idle
       261 =C2=B1 12%     +36.7%        357 =C2=B1  3%  sched_debug.cpu#63.=
ttwu_local
         4 =C2=B1 23%     -46.4%          2 =C2=B1 20%  sched_debug.cpu#63.=
cpu_load[1]
         4 =C2=B1 16%     -55.6%          2 =C2=B1 50%  sched_debug.cfs_rq[=
63]:/.runnable_load_avg
    947472 =C2=B1  3%     -29.3%     669755 =C2=B1  8%  sched_debug.cpu#118=
.avg_idle
    270046 =C2=B1 17%     +35.6%     366118 =C2=B1  3%  sched_debug.cpu#67.=
sched_goidle
    540531 =C2=B1 17%     +35.6%     732830 =C2=B1  3%  sched_debug.cpu#67.=
nr_switches
     52556 =C2=B1  7%     +13.2%      59514 =C2=B1 11%  numa-meminfo.node5.=
FilePages
     13138 =C2=B1  7%     +13.2%      14878 =C2=B1 11%  numa-vmstat.node5.n=
r_file_pages
    194475 =C2=B1 23%     +33.8%     260292 =C2=B1  5%  sched_debug.cpu#101=
.ttwu_count
      4130 =C2=B1 12%     -31.6%       2823 =C2=B1 10%  sched_debug.cpu#43.=
curr->pid
     87873 =C2=B1  2%     +31.7%     115768 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.exec_clock
    854592 =C2=B1  2%     -24.6%     644615 =C2=B1  0%  sched_debug.cpu#59.=
avg_idle
    945674 =C2=B1  1%     -27.8%     683142 =C2=B1  5%  sched_debug.cpu#126=
.avg_idle
    826789 =C2=B1  7%     -26.4%     608539 =C2=B1  7%  sched_debug.cpu#35.=
avg_idle
      4831 =C2=B1 20%     -41.1%       2844 =C2=B1 21%  sched_debug.cfs_rq[=
66]:/.avg->runnable_avg_sum
    795402 =C2=B1  9%     -21.4%     624879 =C2=B1  1%  sched_debug.cpu#6.a=
vg_idle
     89042 =C2=B1  3%     +24.4%     110792 =C2=B1  4%  proc-vmstat.numa_pt=
e_updates
      4666 =C2=B1  5%     -32.5%       3151 =C2=B1 13%  sched_debug.cpu#101=
.curr->pid
    760246 =C2=B1  6%     -28.3%     544918 =C2=B1  4%  sched_debug.cpu#96.=
avg_idle
       103 =C2=B1 19%     -41.3%         61 =C2=B1 22%  sched_debug.cfs_rq[=
66]:/.tg_runnable_contrib
    896825 =C2=B1  3%     -27.0%     654444 =C2=B1  4%  sched_debug.cpu#63.=
avg_idle
    831632 =C2=B1  7%     -26.6%     610540 =C2=B1  5%  sched_debug.cpu#34.=
avg_idle
       111 =C2=B1 10%     -42.2%         64 =C2=B1 28%  sched_debug.cfs_rq[=
69]:/.tg_runnable_contrib
    944017 =C2=B1  4%     -21.5%     740973 =C2=B1  0%  sched_debug.cpu#109=
.avg_idle
    927636 =C2=B1  4%     -24.8%     697158 =C2=B1  2%  sched_debug.cpu#127=
.avg_idle
    157329 =C2=B1  6%     +19.7%     188253 =C2=B1  7%  meminfo.DirectMap4k
    930235 =C2=B1  4%     -24.8%     699693 =C2=B1  4%  sched_debug.cpu#113=
.avg_idle
    924515 =C2=B1  4%     -23.8%     704151 =C2=B1  2%  sched_debug.cpu#112=
.avg_idle
    715242 =C2=B1  9%     +27.4%     911333 =C2=B1  2%  cpuidle.C6-NHM.usage
    847191 =C2=B1  3%     -25.4%     631946 =C2=B1  2%  sched_debug.cpu#72.=
avg_idle
    937101 =C2=B1  3%     -25.5%     698306 =C2=B1  6%  sched_debug.cpu#119=
.avg_idle
    278875 =C2=B1  8%     +32.0%     367988 =C2=B1  0%  sched_debug.cpu#67.=
ttwu_count
    879043 =C2=B1  4%     -26.0%     650573 =C2=B1  5%  sched_debug.cpu#58.=
avg_idle
      5207 =C2=B1 10%     -41.8%       3032 =C2=B1 28%  sched_debug.cfs_rq[=
69]:/.avg->runnable_avg_sum
    118918 =C2=B1 18%     +25.5%     149297 =C2=B1  5%  sched_debug.cpu#39.=
ttwu_count
        21 =C2=B1 24%     -38.6%         13 =C2=B1  7%  sched_debug.cpu#96.=
cpu_load[2]
        20 =C2=B1 22%     -37.6%         13 =C2=B1  7%  sched_debug.cpu#96.=
cpu_load[3]
    844737 =C2=B1  6%     -23.0%     650855 =C2=B1  5%  sched_debug.cpu#29.=
avg_idle
    855966 =C2=B1  4%     -25.9%     634607 =C2=B1  4%  sched_debug.cpu#52.=
avg_idle
    327448 =C2=B1  6%     +22.3%     400596 =C2=B1  4%  numa-vmstat.node1.n=
uma_hit
    928880 =C2=B1  2%     -22.6%     719016 =C2=B1  0%  sched_debug.cpu#121=
.avg_idle
      3444 =C2=B1  7%     -34.2%       2267 =C2=B1 15%  sched_debug.cpu#61.=
curr->pid
    883276 =C2=B1  4%     -26.0%     653512 =C2=B1  7%  sched_debug.cpu#60.=
avg_idle
    836274 =C2=B1  7%     -25.9%     619429 =C2=B1  7%  sched_debug.cpu#36.=
avg_idle
    947172 =C2=B1  1%     -22.0%     738424 =C2=B1  2%  sched_debug.cpu#123=
.avg_idle
    844456 =C2=B1  3%     -24.4%     638363 =C2=B1  6%  sched_debug.cpu#55.=
avg_idle
        14 =C2=B1  8%     -29.2%         10 =C2=B1 14%  sched_debug.cpu#97.=
cpu_load[3]
        97 =C2=B1  1%     +22.7%        120 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
    923557 =C2=B1  4%     -19.7%     741482 =C2=B1  1%  sched_debug.cpu#111=
.avg_idle
    850546 =C2=B1  2%     -22.7%     657480 =C2=B1  4%  sched_debug.cpu#79.=
avg_idle
    944898 =C2=B1  5%     -22.8%     729759 =C2=B1  8%  sched_debug.cpu#115=
.avg_idle
    328805 =C2=B1 25%     +28.9%     423907 =C2=B1  4%  sched_debug.cpu#103=
.sched_count
      1772 =C2=B1  5%     +12.5%       1994 =C2=B1  8%  numa-meminfo.node6.=
KernelStack
    903453 =C2=B1  3%     -19.3%     729086 =C2=B1  1%  sched_debug.cpu#114=
.avg_idle
    873434 =C2=B1  4%     -18.2%     714504 =C2=B1  0%  sched_debug.cpu#32.=
avg_idle
    307140 =C2=B1  8%     +23.3%     378726 =C2=B1  0%  numa-vmstat.node7.n=
uma_hit
      1478 =C2=B1 18%     -22.9%       1139 =C2=B1  1%  sched_debug.cpu#3.c=
urr->pid
    800321 =C2=B1  6%     -24.9%     601108 =C2=B1  6%  sched_debug.cpu#4.a=
vg_idle
       268 =C2=B1 13%     +17.1%        314 =C2=B1  6%  sched_debug.cpu#55.=
ttwu_local
    887956 =C2=B1  3%     -25.4%     662192 =C2=B1  9%  sched_debug.cpu#73.=
avg_idle
    859163 =C2=B1  3%     -19.5%     691851 =C2=B1  0%  sched_debug.cpu#20.=
avg_idle
    915181 =C2=B1  4%     -20.5%     727735 =C2=B1  5%  sched_debug.cpu#104=
.avg_idle
        11 =C2=B1  9%     -35.7%          7 =C2=B1 20%  sched_debug.cpu#35.=
cpu_load[3]
    940743 =C2=B1  3%     -21.3%     740623 =C2=B1  3%  sched_debug.cpu#122=
.avg_idle
     61417 =C2=B1 16%     +24.2%      76304 =C2=B1  1%  numa-vmstat.node5.n=
uma_local
       362 =C2=B1  6%     +22.8%        445 =C2=B1  0%  sched_debug.cpu#47.=
ttwu_local
    825786 =C2=B1  8%     -18.2%     675209 =C2=B1  0%  sched_debug.cpu#3.a=
vg_idle
        13 =C2=B1 12%     +15.7%         16 =C2=B1  6%  sched_debug.cfs_rq[=
101]:/.runnable_load_avg
    943649 =C2=B1  3%     -26.0%     698462 =C2=B1 12%  sched_debug.cpu#106=
.avg_idle
      2612 =C2=B1 11%     -33.6%       1735 =C2=B1 16%  sched_debug.cpu#117=
.curr->pid
    844856 =C2=B1  5%     -17.5%     696599 =C2=B1  3%  sched_debug.cpu#54.=
avg_idle
    892057 =C2=B1  5%     -20.1%     712637 =C2=B1  4%  sched_debug.cpu#64.=
avg_idle
    936652 =C2=B1  2%     -17.5%     772666 =C2=B1  1%  sched_debug.cpu#125=
.avg_idle
    885370 =C2=B1  2%     -23.5%     677474 =C2=B1  9%  sched_debug.cpu#57.=
avg_idle
        93 =C2=B1 11%     -28.1%         67 =C2=B1 17%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
    911496 =C2=B1  1%     -19.3%     735988 =C2=B1  4%  sched_debug.cpu#62.=
avg_idle
    321379 =C2=B1 25%     +25.9%     404644 =C2=B1  3%  sched_debug.cpu#103=
.nr_switches
    160614 =C2=B1 25%     +25.9%     202180 =C2=B1  3%  sched_debug.cpu#103=
.sched_goidle
      4386 =C2=B1 11%     -28.3%       3146 =C2=B1 17%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
        12 =C2=B1 17%     -35.1%          8 =C2=B1 25%  sched_debug.cpu#35.=
cpu_load[2]
    151246 =C2=B1  0%     +18.6%     179325 =C2=B1  1%  sched_debug.cpu#49.=
nr_load_updates
    857476 =C2=B1  5%     -19.2%     693009 =C2=B1  4%  sched_debug.cpu#18.=
avg_idle
    820607 =C2=B1  6%     -18.3%     670804 =C2=B1  2%  sched_debug.cpu#8.a=
vg_idle
    161073 =C2=B1  1%     +16.7%     188013 =C2=B1  1%  sched_debug.cpu#45.=
nr_load_updates
    922874 =C2=B1  2%     -18.7%     749952 =C2=B1  4%  sched_debug.cpu#27.=
avg_idle
    151258 =C2=B1  1%     +17.9%     178364 =C2=B1  0%  sched_debug.cpu#51.=
nr_load_updates
    786778 =C2=B1  8%     -20.8%     622795 =C2=B1  3%  sched_debug.cpu#33.=
avg_idle
    144482 =C2=B1  1%     +17.4%     169583 =C2=B1  1%  sched_debug.cpu#57.=
nr_load_updates
    930475 =C2=B1  5%     -15.4%     787548 =C2=B1  1%  sched_debug.cpu#110=
.avg_idle
    853870 =C2=B1  5%     -16.9%     709957 =C2=B1  2%  sched_debug.cpu#30.=
avg_idle
    162141 =C2=B1  1%     +17.3%     190175 =C2=B1  1%  sched_debug.cpu#43.=
nr_load_updates
    172202 =C2=B1  1%     +17.0%     201527 =C2=B1  0%  sched_debug.cpu#100=
.nr_load_updates
    901812 =C2=B1  3%     -19.7%     724588 =C2=B1  5%  sched_debug.cpu#85.=
avg_idle
    172412 =C2=B1  1%     +16.1%     200170 =C2=B1  1%  sched_debug.cpu#33.=
nr_load_updates
    880540 =C2=B1  8%     -24.0%     669144 =C2=B1  7%  sched_debug.cpu#77.=
avg_idle
    161220 =C2=B1  1%     +16.7%     188199 =C2=B1  0%  sched_debug.cpu#47.=
nr_load_updates
    168687 =C2=B1  4%     +18.8%     200424 =C2=B1  0%  sched_debug.cpu#99.=
nr_load_updates
    151645 =C2=B1  1%     +17.3%     177821 =C2=B1  0%  sched_debug.cpu#53.=
nr_load_updates
    173281 =C2=B1  1%     +17.3%     203289 =C2=B1  0%  sched_debug.cpu#97.=
nr_load_updates
     10287 =C2=B1  5%     +10.2%      11332 =C2=B1  5%  numa-meminfo.node2.=
Active(file)
      2571 =C2=B1  5%     +10.1%       2832 =C2=B1  5%  numa-vmstat.node2.n=
r_active_file
    150643 =C2=B1  2%     +17.6%     177111 =C2=B1  0%  sched_debug.cpu#56.=
nr_load_updates
    133462 =C2=B1  2%      +9.7%     146447 =C2=B1  7%  sched_debug.cpu#67.=
nr_load_updates
    143955 =C2=B1  1%     +17.1%     168503 =C2=B1  0%  sched_debug.cpu#60.=
nr_load_updates
    137470 =C2=B1  7%     +21.1%     166500 =C2=B1  0%  sched_debug.cpu#62.=
nr_load_updates
      3012 =C2=B1 10%     -30.0%       2108 =C2=B1 23%  sched_debug.cpu#106=
.curr->pid
    151646 =C2=B1  1%     +16.8%     177074 =C2=B1  0%  sched_debug.cpu#54.=
nr_load_updates
    129689 =C2=B1  1%     +16.2%     150727 =C2=B1  0%  sched_debug.cpu#109=
.nr_load_updates
    152039 =C2=B1  1%     +16.6%     177285 =C2=B1  0%  sched_debug.cpu#50.=
nr_load_updates
    152080 =C2=B1  1%     +16.3%     176834 =C2=B1  1%  sched_debug.cpu#52.=
nr_load_updates
    161153 =C2=B1  1%     +17.1%     188656 =C2=B1  1%  sched_debug.cpu#46.=
nr_load_updates
    160718 =C2=B1  1%     +17.2%     188383 =C2=B1  0%  sched_debug.cpu#48.=
nr_load_updates
    132451 =C2=B1  1%     +12.4%     148835 =C2=B1  3%  sched_debug.cpu#66.=
nr_load_updates
    170171 =C2=B1  0%     +16.1%     197596 =C2=B1  0%  sched_debug.cpu#38.=
nr_load_updates
    138553 =C2=B1  8%     +20.7%     167177 =C2=B1  1%  sched_debug.cpu#59.=
nr_load_updates
    171179 =C2=B1  2%     +16.3%     199142 =C2=B1  1%  sched_debug.cpu#34.=
nr_load_updates
    817999 =C2=B1  4%     -18.8%     664606 =C2=B1  5%  sched_debug.cpu#7.a=
vg_idle
    161854 =C2=B1  1%     +16.0%     187830 =C2=B1  1%  sched_debug.cpu#44.=
nr_load_updates
    129105 =C2=B1  2%     +17.5%     151654 =C2=B1  0%  sched_debug.cpu#105=
.nr_load_updates
      6428 =C2=B1 24%     -23.2%       4938 =C2=B1  0%  meminfo.AnonHugePag=
es
    137634 =C2=B1  8%     +20.7%     166126 =C2=B1  0%  sched_debug.cpu#64.=
nr_load_updates
    135466 =C2=B1  2%     +16.2%     157470 =C2=B1  1%  sched_debug.cpu#1.n=
r_load_updates
    118904 =C2=B1  1%     +15.2%     136922 =C2=B1  1%  sched_debug.cpu#126=
.nr_load_updates
    136987 =C2=B1  1%     +14.8%     157282 =C2=B1  2%  sched_debug.cpu#10.=
nr_load_updates
      1501 =C2=B1 14%     -28.8%       1069 =C2=B1 13%  sched_debug.cpu#1.c=
urr->pid
    913075 =C2=B1  2%     -14.9%     776768 =C2=B1  2%  sched_debug.cpu#82.=
avg_idle
    131510 =C2=B1  1%     +14.4%     150398 =C2=B1  1%  sched_debug.cpu#65.=
nr_load_updates
    171308 =C2=B1  1%     +15.3%     197547 =C2=B1  1%  sched_debug.cpu#37.=
nr_load_updates
    134883 =C2=B1  3%     +16.8%     157573 =C2=B1  2%  sched_debug.cpu#9.n=
r_load_updates
    138063 =C2=B1  1%     +14.0%     157416 =C2=B1  2%  sched_debug.cpu#7.n=
r_load_updates
    170345 =C2=B1  1%     +16.3%     198129 =C2=B1  0%  sched_debug.cpu#102=
.nr_load_updates
    130650 =C2=B1  1%     +16.5%     152171 =C2=B1  0%  sched_debug.cpu#106=
.nr_load_updates
    129821 =C2=B1  2%     +16.9%     151733 =C2=B1  0%  sched_debug.cpu#104=
.nr_load_updates
    138747 =C2=B1  8%     +21.2%     168121 =C2=B1  0%  sched_debug.cpu#58.=
nr_load_updates
    129721 =C2=B1  1%     +16.0%     150517 =C2=B1  0%  sched_debug.cpu#110=
.nr_load_updates
    162243 =C2=B1  1%     +15.9%     187997 =C2=B1  0%  sched_debug.cpu#42.=
nr_load_updates
    879197 =C2=B1  3%     -17.5%     724929 =C2=B1  4%  sched_debug.cpu#25.=
avg_idle
    171983 =C2=B1  1%     +16.0%     199457 =C2=B1  1%  sched_debug.cpu#101=
.nr_load_updates
    131649 =C2=B1  1%     +14.8%     151156 =C2=B1  0%  sched_debug.cpu#69.=
nr_load_updates
    125143 =C2=B1  1%     +15.6%     144660 =C2=B1  0%  sched_debug.cpu#112=
.nr_load_updates
    122425 =C2=B1  3%     +17.0%     143197 =C2=B1  0%  sched_debug.cpu#118=
.nr_load_updates
    839821 =C2=B1  4%     -22.8%     647982 =C2=B1 11%  sched_debug.cpu#5.a=
vg_idle
    124818 =C2=B1  1%     +15.7%     144469 =C2=B1  0%  sched_debug.cpu#114=
.nr_load_updates
    170905 =C2=B1  1%     +15.8%     197904 =C2=B1  0%  sched_debug.cpu#103=
.nr_load_updates
    120606 =C2=B1  1%     +13.7%     137184 =C2=B1  2%  sched_debug.cpu#85.=
nr_load_updates
    170865 =C2=B1  0%     +15.1%     196586 =C2=B1  1%  sched_debug.cpu#40.=
nr_load_updates
    143351 =C2=B1  1%     +15.8%     166034 =C2=B1  0%  sched_debug.cpu#63.=
nr_load_updates
    124419 =C2=B1  1%     +16.6%     145013 =C2=B1  0%  sched_debug.cpu#113=
.nr_load_updates
    130104 =C2=B1  1%     +16.4%     151391 =C2=B1  0%  sched_debug.cpu#108=
.nr_load_updates
    129782 =C2=B1  1%     +16.3%     150893 =C2=B1  0%  sched_debug.cpu#111=
.nr_load_updates
    130714 =C2=B1  1%     +15.8%     151418 =C2=B1  0%  sched_debug.cpu#107=
.nr_load_updates
    797402 =C2=B1  5%     -22.7%     616774 =C2=B1 13%  sched_debug.cpu#42.=
avg_idle
    122840 =C2=B1  3%     +16.8%     143423 =C2=B1  0%  sched_debug.cpu#115=
.nr_load_updates
    151722 =C2=B1  1%     +15.4%     175070 =C2=B1  0%  sched_debug.cpu#55.=
nr_load_updates
    161144 =C2=B1  2%     +15.8%     186671 =C2=B1  0%  sched_debug.cpu#41.=
nr_load_updates
    123710 =C2=B1  1%     +15.9%     143416 =C2=B1  0%  sched_debug.cpu#119=
.nr_load_updates
    173424 =C2=B1  1%     +15.6%     200456 =C2=B1  0%  sched_debug.cpu#98.=
nr_load_updates
    884611 =C2=B1  4%     -17.1%     733692 =C2=B1  4%  sched_debug.cpu#31.=
avg_idle
    124482 =C2=B1  1%     +14.9%     143052 =C2=B1  0%  sched_debug.cpu#116=
.nr_load_updates
    171511 =C2=B1  0%     +15.3%     197712 =C2=B1  0%  sched_debug.cpu#35.=
nr_load_updates
    186346 =C2=B1  1%     +14.2%     212895 =C2=B1  1%  sched_debug.cpu#96.=
nr_load_updates
    119235 =C2=B1  1%     +14.7%     136738 =C2=B1  1%  sched_debug.cpu#123=
.nr_load_updates
    113927 =C2=B1  9%     +20.0%     136679 =C2=B1  0%  sched_debug.cpu#121=
.nr_load_updates
    120415 =C2=B1  1%     +13.8%     137045 =C2=B1  1%  sched_debug.cpu#120=
.nr_load_updates
    171129 =C2=B1  1%     +15.1%     196962 =C2=B1  0%  sched_debug.cpu#36.=
nr_load_updates
    928644 =C2=B1  4%     -13.5%     803558 =C2=B1  1%  sched_debug.cpu#84.=
avg_idle
    139467 =C2=B1  1%     +11.9%     156126 =C2=B1  2%  sched_debug.cpu#3.n=
r_load_updates
    857864 =C2=B1  5%     -12.4%     751486 =C2=B1  1%  sched_debug.cpu#24.=
avg_idle
    114272 =C2=B1  9%     +19.6%     136716 =C2=B1  0%  sched_debug.cpu#125=
.nr_load_updates
    121326 =C2=B1  4%     +12.5%     136533 =C2=B1  0%  sched_debug.cpu#127=
.nr_load_updates
    131267 =C2=B1  1%     +13.4%     148877 =C2=B1  0%  sched_debug.cpu#71.=
nr_load_updates
    119292 =C2=B1  1%     +14.3%     136386 =C2=B1  0%  sched_debug.cpu#122=
.nr_load_updates
      8654 =C2=B1  4%     +12.0%       9692 =C2=B1  1%  proc-vmstat.numa_hi=
nt_faults_local
    135247 =C2=B1  1%     +11.8%     151230 =C2=B1  2%  sched_debug.cpu#24.=
nr_load_updates
      2685 =C2=B1 14%     -31.8%       1831 =C2=B1 20%  sched_debug.cpu#119=
.curr->pid
    118403 =C2=B1  1%     +14.1%     135061 =C2=B1  0%  sched_debug.cpu#124=
.nr_load_updates
    136356 =C2=B1  4%     +13.6%     154855 =C2=B1  1%  sched_debug.cpu#12.=
nr_load_updates
    134662 =C2=B1  1%     +12.3%     151284 =C2=B1  1%  sched_debug.cpu#23.=
nr_load_updates
    902877 =C2=B1  4%     -13.6%     780191 =C2=B1  0%  sched_debug.cpu#26.=
avg_idle
    892205 =C2=B1  6%     -17.3%     738069 =C2=B1  6%  sched_debug.cpu#105=
.avg_idle
    136543 =C2=B1  1%     +12.7%     153850 =C2=B1  0%  sched_debug.cpu#15.=
nr_load_updates
    139038 =C2=B1  1%      +9.6%     152433 =C2=B1  3%  sched_debug.cpu#6.n=
r_load_updates
    134951 =C2=B1  1%      +9.6%     147934 =C2=B1  3%  sched_debug.cpu#22.=
nr_load_updates
    171061 =C2=B1  1%     +13.4%     194017 =C2=B1  0%  sched_debug.cpu#39.=
nr_load_updates
    138019 =C2=B1  1%     +12.4%     155162 =C2=B1  0%  sched_debug.cpu#4.n=
r_load_updates
    135757 =C2=B1  1%     +12.4%     152621 =C2=B1  0%  sched_debug.cpu#17.=
nr_load_updates
    135441 =C2=B1  1%     +12.3%     152047 =C2=B1  0%  sched_debug.cpu#18.=
nr_load_updates
    137746 =C2=B1  1%     +10.8%     152668 =C2=B1  1%  sched_debug.cpu#16.=
nr_load_updates
    134608 =C2=B1  1%     +10.9%     149250 =C2=B1  1%  sched_debug.cpu#70.=
nr_load_updates
    120054 =C2=B1  1%     +11.2%     133499 =C2=B1  1%  sched_debug.cpu#94.=
nr_load_updates
    122627 =C2=B1  1%     +11.4%     136585 =C2=B1  1%  sched_debug.cpu#80.=
nr_load_updates
    908327 =C2=B1  3%     -14.4%     777100 =C2=B1  2%  sched_debug.cpu#10.=
avg_idle
    137339 =C2=B1  3%     +12.1%     153906 =C2=B1  1%  sched_debug.cpu#11.=
nr_load_updates
    131995 =C2=B1  2%     +11.6%     147242 =C2=B1  0%  sched_debug.cpu#68.=
nr_load_updates
    123291 =C2=B1  1%     +10.5%     136299 =C2=B1  1%  sched_debug.cpu#73.=
nr_load_updates
    121944 =C2=B1  1%     +11.0%     135324 =C2=B1  1%  sched_debug.cpu#82.=
nr_load_updates
    137039 =C2=B1  1%     +11.8%     153237 =C2=B1  0%  sched_debug.cpu#13.=
nr_load_updates
    136337 =C2=B1  1%     +11.9%     152615 =C2=B1  0%  sched_debug.cpu#14.=
nr_load_updates
    939716 =C2=B1  3%     -19.3%     758565 =C2=B1 12%  sched_debug.cpu#117=
.avg_idle
     20100 =C2=B1  2%      +8.3%      21762 =C2=B1  3%  slabinfo.kmalloc-19=
2.num_objs
    946935 =C2=B1  2%     -12.1%     832549 =C2=B1  1%  sched_debug.cpu#92.=
avg_idle
    122273 =C2=B1  1%     +10.7%     135393 =C2=B1  1%  sched_debug.cpu#88.=
nr_load_updates
    915340 =C2=B1  2%     -18.2%     749078 =C2=B1  9%  sched_debug.cpu#116=
.avg_idle
    119947 =C2=B1  1%     +11.3%     133464 =C2=B1  1%  sched_debug.cpu#93.=
nr_load_updates
    138056 =C2=B1  1%     +11.8%     154326 =C2=B1  0%  sched_debug.cpu#8.n=
r_load_updates
    135601 =C2=B1  1%     +11.8%     151588 =C2=B1  0%  sched_debug.cpu#20.=
nr_load_updates
    122425 =C2=B1  1%     +10.2%     134933 =C2=B1  1%  sched_debug.cpu#78.=
nr_load_updates
    121551 =C2=B1  2%     +10.7%     134614 =C2=B1  2%  sched_debug.cpu#91.=
nr_load_updates
    122885 =C2=B1  2%     +11.1%     136503 =C2=B1  0%  sched_debug.cpu#0.n=
r_load_updates
    885952 =C2=B1  3%     -14.0%     761870 =C2=B1  3%  sched_debug.cpu#21.=
avg_idle
     20057 =C2=B1  2%      +8.2%      21692 =C2=B1  2%  slabinfo.kmalloc-19=
2.active_objs
    133206 =C2=B1  1%     +10.2%     146729 =C2=B1  0%  sched_debug.cpu#21.=
nr_load_updates
    139333 =C2=B1  1%     +12.2%     156390 =C2=B1  0%  sched_debug.cpu#2.n=
r_load_updates
    131162 =C2=B1  0%     +10.4%     144789 =C2=B1  1%  sched_debug.cpu#30.=
nr_load_updates
    131242 =C2=B1  0%      +9.0%     143002 =C2=B1  2%  sched_debug.cpu#25.=
nr_load_updates
    135436 =C2=B1  1%     +10.5%     149695 =C2=B1  0%  sched_debug.cpu#19.=
nr_load_updates
    120908 =C2=B1  4%     +11.6%     134900 =C2=B1  1%  sched_debug.cpu#74.=
nr_load_updates
    138538 =C2=B1  1%     +12.2%     155469 =C2=B1  0%  sched_debug.cpu#5.n=
r_load_updates
    866798 =C2=B1  3%     -19.0%     702161 =C2=B1  9%  sched_debug.cpu#75.=
avg_idle
    122470 =C2=B1  3%      +8.7%     133085 =C2=B1  1%  sched_debug.cpu#95.=
nr_load_updates
    248838 =C2=B1 18%     +20.1%     298891 =C2=B1  2%  sched_debug.cpu#37.=
sched_count
    918062 =C2=B1  1%     -17.1%     761237 =C2=B1  9%  sched_debug.cpu#124=
.avg_idle
    121958 =C2=B1  4%      +8.1%     131836 =C2=B1  3%  sched_debug.cpu#90.=
nr_load_updates
    123806 =C2=B1  1%      +9.7%     135843 =C2=B1  0%  sched_debug.cpu#72.=
nr_load_updates
    122749 =C2=B1  1%      +9.5%     134460 =C2=B1  0%  sched_debug.cpu#79.=
nr_load_updates
      2830 =C2=B1  1%      +9.1%       3087 =C2=B1  0%  proc-vmstat.nr_inac=
tive_anon
     11323 =C2=B1  1%      +9.0%      12347 =C2=B1  0%  meminfo.Inactive(an=
on)
    132566 =C2=B1  2%      +8.5%     143863 =C2=B1  1%  sched_debug.cpu#27.=
nr_load_updates
  11018584 =C2=B1  4%      -6.6%   10288610 =C2=B1  0%  meminfo.DirectMap2M
       386 =C2=B1  1%     -38.4%        238 =C2=B1  1%  turbostat.Avg_MHz
     17.23 =C2=B1  1%     -38.5%      10.59 =C2=B1  2%  turbostat.%Busy
     24314 =C2=B1  1%     -30.2%      16979 =C2=B1  0%  vmstat.system.in
    101887 =C2=B1  1%     +29.3%     131742 =C2=B1  1%  vmstat.system.cs

lkp-g5: Westmere-EX
Memory: 2048G

To reproduce:

	apt-get install ruby
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============8162901087194408600==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1
cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZh
dWx0X3dhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5v
cjogcGVyZm9ybWFuY2UKY29tbWl0OiBlYTJiYmUzYjliZjkzMDQwOGRiMjA1MzQ0ZmUxMGM4Zjcx
OWJhNzM4Cm1vZGVsOiBHNQpucl9jcHU6IDEyOAptZW1vcnk6IDIwNDhHCnJvb3Rmc19wYXJ0aXRp
b246IApwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6CiAgdGVzdDogbW1h
cDEKdGVzdGJveDogbGtwLWc1CnRib3hfZ3JvdXA6IGxrcC1nNQprY29uZmlnOiB4ODZfNjQtcmhl
bAplbnF1ZXVlX3RpbWU6IDIwMTUtMDItMTQgMDg6MDE6NTAuNDQ1MTEzNjIzICswODowMApoZWFk
X2NvbW1pdDogZWEyYmJlM2I5YmY5MzA0MDhkYjIwNTM0NGZlMTBjOGY3MTliYTczOApiYXNlX2Nv
bW1pdDogYmZhNzZkNDk1NzY1OTlhNGI5ZjliN2E3MWYyM2Q3M2Q2ZGNmZjczNQpicmFuY2g6IGxp
bnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDIxNDIzCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0
LXJoZWwvZWEyYmJlM2I5YmY5MzA0MDhkYjIwNTM0NGZlMTBjOGY3MTliYTczOC92bWxpbnV6LTMu
MTkuMC1nZWEyYmJlMyIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9sa3AtZzUvd2lsbC1pdC1z
Y2FsZS9wZXJmb3JtYW5jZS1tbWFwMS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82
NC1yaGVsL2VhMmJiZTNiOWJmOTMwNDA4ZGIyMDUzNDRmZTEwYzhmNzE5YmE3MzgvMCIKam9iX2Zp
bGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtZzUvY3ljbGljX3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFu
Y2UtbW1hcDEteDg2XzY0LXJoZWwtSEVBRC1lYTJiYmUzYjliZjkzMDQwOGRiMjA1MzQ0ZmUxMGM4
ZjcxOWJhNzM4LTAtMjAxNTAyMTQtNTIyODctejJpbzhzLnlhbWwiCmRlcXVldWVfdGltZTogMjAx
NS0wMi0xNSAwMjoyNDoxMC40MTk0NzUyNDYgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9h
ZGF2ZzogODIuMjkgNTcuODMgMjYuNDYgMS8xMDIzIDI0NTQxCnN0YXJ0X3RpbWU6ICcxNDIzOTM4
NjczJwplbmRfdGltZTogJzE0MjM5MzkxNDQnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUw
MjEzLTA5NDg0NiIK

--===============8162901087194408600==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IG1tYXAxIDggYm90aCAxIDggMTYgMjQgMzIgNDAgNDggNTYgNjQgOTYgMTI4
Cg==

--===============8162901087194408600==--

