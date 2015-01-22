Content-Type: multipart/mixed; boundary="===============2473860355206324776=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [block] 34b48db66e0: +3291.6% iostat.sde.wrqm/s
Date: Thu, 22 Jan 2015 09:21:29 +0800
Message-ID: <1421889689.6126.45.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2473860355206324776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 34b48db66e08ca1c1bc07cf305d672ac940268dc ("block: remove artifical m=
ax_hw_sectors cap")

testbox/testcase/testparams: lkp-ws02/fileio/600s-100%-1HDD-btrfs-64G-1024f=
-seqrewr-sync

c2661b806092d8ea  34b48db66e08ca1c1bc07cf305  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     47176 =C2=B1  2%     -67.3%      15406 =C2=B1  4%  softirqs.BLOCK
      1110 =C2=B1 44%     -51.0%        544 =C2=B1 35%  sched_debug.cpu#8.c=
urr->pid
        22 =C2=B1 33%     -48.9%         11 =C2=B1 43%  sched_debug.cpu#1.c=
pu_load[0]
        91 =C2=B1 43%    +125.0%        204 =C2=B1 32%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
        17 =C2=B1 46%     -65.2%          6 =C2=B1 31%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
       105 =C2=B1 43%    +102.6%        213 =C2=B1 32%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
       163 =C2=B1 35%     +62.6%        265 =C2=B1 27%  sched_debug.cfs_rq[=
16]:/.blocked_load_avg
       183 =C2=B1 29%     +51.4%        277 =C2=B1 26%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
      1411 =C2=B1 31%     -42.5%        812 =C2=B1 32%  sched_debug.cpu#6.c=
urr->pid
  57565068 =C2=B1 15%     +66.8%   96024066 =C2=B1 17%  cpuidle.C1E-NHM.time
     94625 =C2=B1  9%     -32.5%      63893 =C2=B1  4%  cpuidle.C3-NHM.usage
       200 =C2=B1 14%     -22.8%        155 =C2=B1 24%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
       244 =C2=B1 33%     -39.0%        149 =C2=B1 11%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
       265 =C2=B1 31%     -38.4%        163 =C2=B1  9%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      4959 =C2=B1  9%     -18.2%       4058 =C2=B1  1%  slabinfo.kmalloc-12=
8.active_objs
      4987 =C2=B1  9%     -18.6%       4058 =C2=B1  1%  slabinfo.kmalloc-12=
8.num_objs
        19 =C2=B1  8%     -19.7%         15 =C2=B1 14%  sched_debug.cpu#0.c=
pu_load[1]
    662307 =C2=B1  7%     -12.6%     579108 =C2=B1  3%  cpuidle.C6-NHM.usage
      3028 =C2=B1  7%     -12.3%       2656 =C2=B1  1%  slabinfo.ext4_exten=
t_status.num_objs
      3028 =C2=B1  7%     -12.3%       2656 =C2=B1  1%  slabinfo.ext4_exten=
t_status.active_objs
      4.87 =C2=B1  0%   +3291.6%     165.07 =C2=B1  0%  iostat.sde.wrqm/s
      1006 =C2=B1  0%    +120.3%       2216 =C2=B1  0%  iostat.sde.avgrq-sz
       466 =C2=B1  0%    +115.9%       1007 =C2=B1  0%  iostat.sde.await
       466 =C2=B1  0%    +115.9%       1007 =C2=B1  0%  iostat.sde.w_await
       301 =C2=B1  0%     -52.7%        142 =C2=B1  0%  iostat.sde.w/s
      2230 =C2=B1  2%      -8.2%       2048 =C2=B1  2%  vmstat.system.in

testbox/testcase/testparams: snb-drag/iozone/performance-2HDD-ext4-cfq

c2661b806092d8ea  34b48db66e08ca1c1bc07cf305  =

----------------  --------------------------  =

    190033 =C2=B1  8%    +485.5%    1112554 =C2=B1  8%  iozone.time.volunta=
ry_context_switches
   4016641 =C2=B1 13%    +107.0%    8315546 =C2=B1 19%  iozone.128KB_8recle=
n.fread
  14586734 =C2=B1 12%     -51.6%    7055577 =C2=B1 23%  iozone.256KB_128rec=
len.reread
   6277142 =C2=B1 16%     -45.3%    3431678 =C2=B1 32%  iozone.131072KB_204=
8reclen.record_rewrite
   2172125 =C2=B1 10%     +76.5%    3833705 =C2=B1 27%  iozone.64KB_32recle=
n.bkwd_read
   4122415 =C2=B1  9%     -46.9%    2188825 =C2=B1 18%  iozone.128KB_128rec=
len.frewrite
   4614021 =C2=B1 20%     +68.3%    7766650 =C2=B1 28%  iozone.128KB_128rec=
len.fread
   5218680 =C2=B1 25%     -35.9%    3344397 =C2=B1 22%  iozone.32768KB_2048=
reclen.record_rewrite
  13598531 =C2=B1 12%     -42.4%    7830813 =C2=B1 29%  iozone.128KB_32recl=
en.read
   1747191 =C2=B1  5%     +84.5%    3223043 =C2=B1 12%  iozone.128KB_8recle=
n.rewrite
  12146591 =C2=B1  6%     -49.1%    6185679 =C2=B1  5%  iozone.256KB_16recl=
en.read
   5801437 =C2=B1  1%     -44.3%    3234246 =C2=B1  8%  iozone.32768KB_4096=
reclen.read
   3407258 =C2=B1 19%     -30.3%    2374690 =C2=B1 33%  iozone.64KB_32recle=
n.fwrite
   4273739 =C2=B1  3%     +72.0%    7349316 =C2=B1 15%  iozone.4096KB_2048r=
eclen.bkwd_read
   5653011 =C2=B1  1%     -35.6%    3641226 =C2=B1 27%  iozone.65536KB_4096=
reclen.bkwd_read
   6849239 =C2=B1 20%     +81.3%   12418997 =C2=B1 18%  iozone.256KB_32recl=
en.read
   9456112 =C2=B1 13%     -29.8%    6640684 =C2=B1 20%  iozone.512KB_4recle=
n.random_read
      1754 =C2=B1  7%     -30.5%       1219 =C2=B1  9%  iozone.time.involun=
tary_context_switches
  10305719 =C2=B1 15%     -30.5%    7160220 =C2=B1 35%  iozone.512KB_64recl=
en.bkwd_read
   4322216 =C2=B1  2%     -34.4%    2834349 =C2=B1 11%  iozone.262144KB_204=
8reclen.random_write
   8468758 =C2=B1 14%     -24.0%    6433265 =C2=B1 23%  iozone.65536KB_1024=
reclen.reread
   4076482 =C2=B1  2%     -30.8%    2820015 =C2=B1 24%  iozone.262144KB_204=
8reclen.rewrite
   9333621 =C2=B1  1%     -29.7%    6558928 =C2=B1  8%  iozone.65536KB_64re=
clen.reread
   8034518 =C2=B1 12%     +29.3%   10387452 =C2=B1 10%  iozone.4096KB_512re=
clen.random_read
   8948555 =C2=B1  3%     -37.8%    5562080 =C2=B1 34%  iozone.131072KB_204=
8reclen.freread
   2883286 =C2=B1  1%     -28.9%    2049844 =C2=B1  9%  iozone.131072KB_204=
8reclen.fwrite
   4530075 =C2=B1 16%     -21.4%    3559817 =C2=B1  6%  iozone.16384KB_1638=
4reclen.bkwd_read
   9647639 =C2=B1 11%     -23.8%    7355867 =C2=B1 11%  iozone.1024KB_8recl=
en.bkwd_read
   8885460 =C2=B1  6%     -22.3%    6908005 =C2=B1 18%  iozone.32768KB_128r=
eclen.read
   9120389 =C2=B1 12%     -18.9%    7395338 =C2=B1  7%  iozone.1024KB_512re=
clen.fread
   3487268 =C2=B1  0%     -23.6%    2663962 =C2=B1 17%  iozone.262144KB_409=
6reclen.random_write
   3525970 =C2=B1 21%     +38.2%    4872904 =C2=B1  3%  iozone.128KB_8recle=
n.record_rewrite
   9309792 =C2=B1 14%     +20.6%   11232047 =C2=B1 13%  iozone.512KB_4recle=
n.read
   9088515 =C2=B1  1%     -42.8%    5197158 =C2=B1 35%  iozone.262144KB_204=
8reclen.random_read
   4328487 =C2=B1 11%     -34.4%    2838483 =C2=B1 20%  iozone.256KB_16recl=
en.fwrite
   4292935 =C2=B1 21%     +61.9%    6951375 =C2=B1 13%  iozone.4096KB_4096r=
eclen.reread
   5062737 =C2=B1  1%     -18.2%    4142609 =C2=B1 17%  iozone.131072KB_819=
2reclen.stride_read
   8193457 =C2=B1  2%     -15.4%    6931191 =C2=B1 27%  iozone.8192KB_2048r=
eclen.freread
   6627823 =C2=B1 10%     +17.5%    7789683 =C2=B1 16%  iozone.8192KB_1024r=
eclen.random_read
   3006133 =C2=B1 27%     +43.7%    4318375 =C2=B1  8%  iozone.256KB_32recl=
en.fwrite
   7274645 =C2=B1 17%     +21.7%    8850043 =C2=B1 13%  iozone.4096KB_1024r=
eclen.random_read
   6636384 =C2=B1  2%     +31.1%    8701978 =C2=B1  3%  iozone.8192KB_128re=
clen.stride_read
   3501529 =C2=B1 13%     +24.9%    4373804 =C2=B1  9%  iozone.128KB_128rec=
len.random_write
  11315178 =C2=B1 10%     -15.7%    9537488 =C2=B1 16%  iozone.2048KB_8recl=
en.reread
   3473828 =C2=B1  8%     -19.6%    2793577 =C2=B1 14%  iozone.131072KB_819=
2reclen.record_rewrite
   4963222 =C2=B1  8%     -18.4%    4049269 =C2=B1 16%  iozone.524288KB_819=
2reclen.random_read
   3917486 =C2=B1  1%     -32.6%    2640873 =C2=B1 10%  iozone.32768KB_4096=
reclen.record_rewrite
   4097783 =C2=B1 12%     +27.5%    5225546 =C2=B1  3%  iozone.16384KB_8192=
reclen.reread
   8266620 =C2=B1 12%     -26.8%    6050991 =C2=B1  7%  iozone.131072KB_102=
4reclen.reread
   3002614 =C2=B1 12%     +25.2%    3760021 =C2=B1  5%  iozone.8192KB_1024r=
eclen.fwrite
  11461219 =C2=B1  8%     -36.9%    7228334 =C2=B1 37%  iozone.256KB_4recle=
n.read
   4153052 =C2=B1  8%     -16.8%    3456496 =C2=B1 11%  iozone.131072KB_102=
4reclen.random_write
   3370193 =C2=B1  1%     -15.0%    2866094 =C2=B1 12%  iozone.131072KB_819=
2reclen.random_write
   7333520 =C2=B1 10%     +21.8%    8931293 =C2=B1  5%  iozone.4096KB_1024r=
eclen.read
  11797836 =C2=B1  6%     -16.2%    9888848 =C2=B1 11%  iozone.1024KB_32rec=
len.read
   3669268 =C2=B1  5%     -24.6%    2764993 =C2=B1  8%  iozone.65536KB_4096=
reclen.record_rewrite
   4933341 =C2=B1  9%     -22.5%    3823691 =C2=B1 13%  iozone.262144KB_819=
2reclen.reread
   9146208 =C2=B1  3%     -20.3%    7287558 =C2=B1 15%  iozone.131072KB_64r=
eclen.reread
  11070712 =C2=B1 16%     +21.3%   13425431 =C2=B1  7%  iozone.512KB_512rec=
len.reread
   3389460 =C2=B1  3%     -18.3%    2768805 =C2=B1 15%  iozone.131072KB_409=
6reclen.random_write
   6973136 =C2=B1  6%     -26.1%    5150644 =C2=B1 27%  iozone.128KB_128rec=
len.bkwd_read
   1648348 =C2=B1  7%     +10.5%    1820994 =C2=B1  2%  iozone.32768KB_8192=
reclen.write
   8946805 =C2=B1  3%     -22.7%    6917989 =C2=B1 18%  iozone.65536KB_128r=
eclen.random_read
   9479095 =C2=B1  6%     -17.3%    7838757 =C2=B1 11%  iozone.2048KB_4recl=
en.reread
   7044170 =C2=B1  5%     +22.5%    8632284 =C2=B1  8%  iozone.4096KB_512re=
clen.bkwd_read
    425242 =C2=B1  4%     -13.7%     366809 =C2=B1 12%  iozone.131072KB_409=
6reclen
  10184282 =C2=B1  4%     -21.4%    8000632 =C2=B1  8%  iozone.1024KB_1024r=
eclen.bkwd_read
    655333 =C2=B1  1%     -19.4%     528199 =C2=B1 10%  iozone.131072KB_204=
8reclen
   3509893 =C2=B1 15%     +37.1%    4813310 =C2=B1 16%  iozone.512KB_128rec=
len.frewrite
   3668357 =C2=B1  4%     +16.6%    4276349 =C2=B1  6%  iozone.2048KB_16rec=
len.frewrite
   7322643 =C2=B1  6%     +16.5%    8530304 =C2=B1  5%  iozone.4096KB_128re=
clen.read
   8914586 =C2=B1  3%     -10.9%    7938958 =C2=B1  7%  iozone.131072KB_128=
reclen.stride_read
   8450503 =C2=B1  4%     -16.6%    7048034 =C2=B1 13%  iozone.16384KB_32re=
clen.reread
   4454263 =C2=B1  7%     -28.3%    3193178 =C2=B1 26%  iozone.256KB_64recl=
en.random_write
   8491147 =C2=B1  5%     -13.5%    7348844 =C2=B1  9%  iozone.16384KB_512r=
eclen.random_read
   3948585 =C2=B1 18%     -22.8%    3049001 =C2=B1  9%  iozone.512KB_64recl=
en.fwrite
  10112307 =C2=B1  9%     -23.2%    7769806 =C2=B1 18%  iozone.2048KB_256re=
clen.freread
   4876107 =C2=B1  2%     -19.6%    3920473 =C2=B1  7%  iozone.256KB_4recle=
n.record_rewrite
   8774968 =C2=B1  3%     -12.4%    7689767 =C2=B1  6%  iozone.131072KB_64r=
eclen.stride_read
   2873532 =C2=B1  1%     -23.9%    2186794 =C2=B1 17%  iozone.262144KB_204=
8reclen.fwrite
   3196205 =C2=B1  6%     +14.6%    3661260 =C2=B1  6%  iozone.2048KB_2048r=
eclen.rewrite
   3916092 =C2=B1  3%     -14.8%    3336988 =C2=B1  2%  iozone.65536KB_512r=
eclen.fwrite
  12945364 =C2=B1  4%     -15.7%   10913159 =C2=B1  6%  iozone.1024KB_512re=
clen.random_read
   3694356 =C2=B1  3%     +11.6%    4122174 =C2=B1  6%  iozone.8192KB_16rec=
len.frewrite
   5205805 =C2=B1  1%     -20.2%    4152492 =C2=B1 14%  iozone.262144KB_819=
2reclen.stride_read
   7318041 =C2=B1  7%     +10.1%    8055512 =C2=B1  5%  iozone.8192KB_8recl=
en.freread
   3359536 =C2=B1  5%     -14.0%    2888377 =C2=B1 10%  iozone.131072KB_163=
84reclen.record_rewrite
   2217844 =C2=B1  5%      -9.2%    2013486 =C2=B1  2%  iozone.32768KB_2048=
reclen.fwrite
   3486864 =C2=B1  0%     -20.4%    2776651 =C2=B1 14%  iozone.131072KB_102=
4reclen.fwrite
   4104607 =C2=B1  9%     +11.5%    4574911 =C2=B1  4%  iozone.1024KB_64rec=
len.frewrite
   8351037 =C2=B1  3%     -11.6%    7379615 =C2=B1  6%  iozone.8192KB_32rec=
len.reread
   8472815 =C2=B1  8%     +12.1%    9496427 =C2=B1  2%  iozone.2048KB_8recl=
en.bkwd_read
   9274098 =C2=B1  0%     -21.7%    7263574 =C2=B1  8%  iozone.131072KB_128=
reclen.reread
   9198752 =C2=B1  2%     -11.7%    8122596 =C2=B1  1%  iozone.2048KB_4recl=
en.random_read
   9888579 =C2=B1  5%     +11.3%   11008403 =C2=B1  4%  iozone.2048KB_128re=
clen.freread
   4076419 =C2=B1  2%      +9.8%    4474927 =C2=B1  6%  iozone.4096KB_16rec=
len.random_write
   9014509 =C2=B1  3%     -19.4%    7262289 =C2=B1 18%  iozone.65536KB_1024=
reclen.random_read
   3797798 =C2=B1  6%      +8.1%    4106139 =C2=B1  2%  iozone.8192KB_64rec=
len.fwrite
   9054887 =C2=B1  1%     -34.3%    5953341 =C2=B1 43%  iozone.65536KB_2048=
reclen.random_read
   3272537 =C2=B1  3%      +9.9%    3596834 =C2=B1  5%  iozone.8192KB_4recl=
en.frewrite
   8755063 =C2=B1  4%      -9.3%    7941616 =C2=B1  4%  iozone.8192KB_512re=
clen.random_read
   2226548 =C2=B1 17%     +23.9%    2757960 =C2=B1  1%  iozone.131072KB_163=
84reclen.fwrite
   2091038 =C2=B1  3%      +4.7%    2190320 =C2=B1  2%  iozone.32768KB_512r=
eclen.write
   4623937 =C2=B1  3%      -7.7%    4267770 =C2=B1  5%  iozone.2048KB_32rec=
len.fwrite
   9608922 =C2=B1  4%      +6.6%   10240058 =C2=B1  3%  iozone.2048KB_256re=
clen.read
   5484722 =C2=B1  3%     -18.5%    4470600 =C2=B1 26%  iozone.2048KB_1024r=
eclen.record_rewrite
   8653006 =C2=B1  1%     -20.2%    6901968 =C2=B1 10%  iozone.32768KB_256r=
eclen.random_read
   6595324 =C2=B1  2%     -22.6%    5106872 =C2=B1 29%  iozone.2048KB_128re=
clen.record_rewrite
    742878 =C2=B1  4%     -10.2%     667046 =C2=B1  4%  iozone.512KB_32recl=
en
   2569242 =C2=B1  0%     -13.9%    2211849 =C2=B1  9%  iozone.262144KB_819=
2reclen.fwrite
    593852 =C2=B1  2%      +4.5%     620773 =C2=B1  4%  iozone.4096KB_8recl=
en
   7731451 =C2=B1  1%     -11.9%    6814549 =C2=B1  9%  iozone.8192KB_8recl=
en.stride_read
   4030276 =C2=B1  4%     -11.8%    3555139 =C2=B1  4%  iozone.16384KB_8rec=
len.rewrite
    667670 =C2=B1  2%      -9.0%     607569 =C2=B1  3%  iozone.131072KB_102=
4reclen
   4555344 =C2=B1  2%      -7.0%    4238147 =C2=B1  5%  iozone.131072KB_256=
reclen.random_write
    663732 =C2=B1  1%     -12.2%     582516 =C2=B1  8%  iozone.262144KB_204=
8reclen
   4436723 =C2=B1  1%      -7.9%    4084226 =C2=B1  3%  iozone.65536KB_64re=
clen.random_write
   4436835 =C2=B1  6%     -11.1%    3943089 =C2=B1  5%  iozone.1024KB_32rec=
len.rewrite
    400045 =C2=B1  1%     -12.8%     348866 =C2=B1  8%  iozone.131072KB_819=
2reclen
      1284 =C2=B1  0%      -7.4%       1189 =C2=B1  0%  iozone.time.elapsed=
_time
      1284 =C2=B1  0%      -7.4%       1189 =C2=B1  0%  iozone.time.elapsed=
_time.max
  11829454 =C2=B1 19%     +19.3%   14115355 =C2=B1  3%  iozone.4096KB_256re=
clen.stride_read
    660750 =C2=B1  3%      +5.6%     698026 =C2=B1  2%  iozone.4096KB_512re=
clen
   8782251 =C2=B1  2%     -10.4%    7866927 =C2=B1 12%  iozone.131072KB_256=
reclen.fread
   4112943 =C2=B1  1%     -12.3%    3607095 =C2=B1 12%  iozone.262144KB_102=
4reclen.rewrite
    443953 =C2=B1  0%     -10.9%     395738 =C2=B1  3%  iozone.262144KB_409=
6reclen
   3628536 =C2=B1  2%      -4.3%    3472913 =C2=B1  3%  iozone.8192KB_4recl=
en.fwrite
    409787 =C2=B1  1%     -13.8%     353441 =C2=B1 10%  iozone.262144KB_819=
2reclen
   2180729 =C2=B1  0%      -1.7%    2143865 =C2=B1  0%  iozone.16384KB_1024=
reclen.write
   7134489 =C2=B1 13%     +19.7%    8538015 =C2=B1  1%  iozone.16384KB_128r=
eclen.freread
   4331701 =C2=B1  1%      -7.9%    3991380 =C2=B1  3%  iozone.16384KB_32re=
clen.random_write
    672772 =C2=B1  2%      -6.1%     631908 =C2=B1  1%  iozone.131072KB_512=
reclen
   1684066 =C2=B1  6%     +10.3%    1857499 =C2=B1  1%  iozone.65536KB_1638=
4reclen.write
   7560968 =C2=B1  0%      -6.5%    7066438 =C2=B1  3%  iozone.32768KB_64re=
clen.record_rewrite
   8637488 =C2=B1  0%     -17.2%    7149416 =C2=B1 15%  iozone.16384KB_256r=
eclen.random_read
    409516 =C2=B1  2%      -9.0%     372768 =C2=B1  7%  iozone.262144KB_163=
84reclen
   2039098 =C2=B1  2%      +4.5%    2131410 =C2=B1  2%  iozone.131072KB_128=
reclen.write
   6820137 =C2=B1  1%      -4.8%    6489596 =C2=B1  2%  iozone.131072KB_512=
reclen.record_rewrite
   3368515 =C2=B1 17%     +16.6%    3928194 =C2=B1  4%  iozone.8192KB_8recl=
en.frewrite
    636959 =C2=B1  3%      +5.3%     670460 =C2=B1  2%  iozone.4096KB_1024r=
eclen
   8959946 =C2=B1  2%     -16.9%    7444825 =C2=B1 27%  iozone.131072KB_204=
8reclen.random_read
   1730222 =C2=B1  3%      +5.8%    1831099 =C2=B1  1%  iozone.16384KB_1638=
4reclen.write
    689573 =C2=B1  2%     -11.0%     613405 =C2=B1  7%  iozone.128KB_128rec=
len
   4529095 =C2=B1  2%      +6.8%    4838213 =C2=B1  1%  iozone.2048KB_16rec=
len.random_write
    673658 =C2=B1  1%      -6.9%     626975 =C2=B1  4%  iozone.65536KB_64re=
clen
   3988722 =C2=B1  2%      -5.1%    3785551 =C2=B1  3%  iozone.2048KB_4recl=
en.random_write
   4434507 =C2=B1  1%      -8.0%    4079221 =C2=B1  8%  iozone.131072KB_512=
reclen.random_write
   4209193 =C2=B1  1%      -9.8%    3796922 =C2=B1  9%  iozone.32768KB_512r=
eclen.rewrite
   1636367 =C2=B1  1%      +5.6%    1728029 =C2=B1  2%  iozone.512KB_8recle=
n.write
   5399314 =C2=B1  2%     -13.9%    4649006 =C2=B1 14%  iozone.2048KB_4recl=
en.record_rewrite
   8991216 =C2=B1  1%     -18.2%    7358805 =C2=B1 31%  iozone.131072KB_204=
8reclen.stride_read
   2064325 =C2=B1  0%      -2.6%    2011460 =C2=B1  0%  iozone.16384KB_16re=
clen.write
    694293 =C2=B1  1%      -6.2%     651466 =C2=B1  0%  iozone.131072KB_128=
reclen
   3692595 =C2=B1  2%      +6.9%    3949182 =C2=B1  4%  iozone.16384KB_16re=
clen.fwrite
    703495 =C2=B1  0%      -8.0%     647314 =C2=B1  5%  iozone.262144KB_64r=
eclen
    803189 =C2=B1  1%      -5.8%     756954 =C2=B1  2%  iozone.1024KB_512re=
clen
   3367144 =C2=B1  3%      -4.8%    3204188 =C2=B1  4%  iozone.16384KB_4rec=
len.random_write
   8821044 =C2=B1  3%      +4.9%    9250799 =C2=B1  1%  iozone.131072KB_128=
reclen.freread
   2141849 =C2=B1  2%      -2.9%    2079725 =C2=B1  2%  iozone.4096KB_64rec=
len.write
   9209523 =C2=B1  1%     -10.5%    8244271 =C2=B1 14%  iozone.262144KB_64r=
eclen.fread
   8771739 =C2=B1  2%     -12.2%    7701390 =C2=B1 11%  iozone.16384KB_128r=
eclen.read
 1.383e+08 =C2=B1  1%      -3.2%  1.338e+08 =C2=B1  1%  iozone.bkwd_read_KB=
ps
   5161430 =C2=B1  0%     -23.4%    3952507 =C2=B1 25%  iozone.131072KB_819=
2reclen.fread
   7569441 =C2=B1  0%      -4.0%    7264835 =C2=B1  2%  iozone.65536KB_64re=
clen.record_rewrite
    735869 =C2=B1  1%      -4.7%     701571 =C2=B1  0%  iozone.2048KB_32rec=
len
    671317 =C2=B1  1%      -5.2%     636480 =C2=B1  4%  iozone.131072KB_256=
reclen
   9163246 =C2=B1  1%     -12.7%    7998765 =C2=B1 19%  iozone.65536KB_1024=
reclen.read
   6892685 =C2=B1  1%     -31.6%    4717232 =C2=B1 42%  iozone.8192KB_16rec=
len.record_rewrite
   2769563 =C2=B1  1%     -11.1%    2460867 =C2=B1 12%  iozone.131072KB_163=
84reclen.frewrite
   7538254 =C2=B1  1%      -4.1%    7232391 =C2=B1  1%  iozone.524288KB_64r=
eclen.record_rewrite
   5078676 =C2=B1  1%      +2.7%    5216148 =C2=B1  1%  iozone.32768KB_8192=
reclen.bkwd_read
   5583111 =C2=B1  1%      +1.9%    5688340 =C2=B1  1%  iozone.524288KB_409=
6reclen.fread
   7632609 =C2=B1 18%     +21.8%    9298145 =C2=B1  0%  iozone.524288KB_128=
reclen.bkwd_read
   2103683 =C2=B1  1%      -4.3%    2012622 =C2=B1  2%  iozone.2048KB_128re=
clen.write
   8544794 =C2=B1 11%      +9.9%    9394465 =C2=B1  0%  iozone.524288KB_102=
4reclen.read
   7484883 =C2=B1  3%      -5.3%    7090201 =C2=B1  2%  iozone.131072KB_128=
reclen.record_rewrite
   3943490 =C2=B1  0%      -3.2%    3818389 =C2=B1  3%  iozone.16384KB_8rec=
len.random_write
    612882 =C2=B1  4%      +5.9%     649253 =C2=B1  1%  iozone.524288KB_102=
4reclen
 1.049e+08 =C2=B1  0%      -3.2%  1.016e+08 =C2=B1  1%  iozone.record_rewri=
te_KBps
   9068478 =C2=B1  0%     -12.2%    7966289 =C2=B1 20%  iozone.65536KB_1024=
reclen.stride_read
    687809 =C2=B1  1%      -4.1%     659293 =C2=B1  5%  iozone.65536KB_128r=
eclen
   1956842 =C2=B1  0%      -2.5%    1908160 =C2=B1  1%  iozone.1024KB_16rec=
len.write
   5620548 =C2=B1  1%      +1.9%    5729397 =C2=B1  0%  iozone.131072KB_409=
6reclen.fread
  76075116 =C2=B1  1%      -2.8%   73925417 =C2=B1  0%  iozone.random_write=
_KBps
   2053740 =C2=B1  1%      +3.4%    2123938 =C2=B1  1%  iozone.262144KB_256=
reclen.write
   6013543 =C2=B1  1%     -13.0%    5232692 =C2=B1 22%  iozone.65536KB_4096=
reclen.stride_read
   8878850 =C2=B1  1%     -14.8%    7569198 =C2=B1 15%  iozone.131072KB_64r=
eclen.random_read
  1.64e+08 =C2=B1  2%      -3.4%  1.584e+08 =C2=B1  1%  iozone.random_read_=
KBps
   5677438 =C2=B1  1%      -2.8%    5518952 =C2=B1  1%  iozone.16384KB_4rec=
len.record_rewrite
   9013379 =C2=B1  0%      +2.5%    9237733 =C2=B1  0%  iozone.524288KB_512=
reclen.read
   6834910 =C2=B1  0%      -5.1%    6486646 =C2=B1  5%  iozone.32768KB_1024=
reclen.record_rewrite
 1.629e+08 =C2=B1  0%      -2.4%   1.59e+08 =C2=B1  1%  iozone.read_KBps
   3339864 =C2=B1  0%     -10.4%    2991683 =C2=B1 10%  iozone.32768KB_1638=
4reclen.random_write
   5962248 =C2=B1  0%      -1.8%    5855187 =C2=B1  0%  iozone.average_KBps
   5279487 =C2=B1  0%     -14.2%    4527825 =C2=B1 15%  iozone.262144KB_163=
84reclen.bkwd_read
   4931955 =C2=B1 19%     +13.1%    5576843 =C2=B1  0%  iozone.8192KB_8192r=
eclen.read
 1.309e+08 =C2=B1  5%     -91.1%   11653700 =C2=B1  1%  cpuidle.C3-SNB.time
     24742 =C2=B1  4%     -78.8%       5252 =C2=B1  0%  cpuidle.C3-SNB.usage
    107687 =C2=B1  0%     -72.9%      29181 =C2=B1  2%  softirqs.BLOCK
         6 =C2=B1 47%    +152.0%         15 =C2=B1 38%  sched_debug.cpu#0.c=
pu_load[2]
      0.35 =C2=B1 29%    +151.1%       0.87 =C2=B1 25%  perf-profile.cpu-cy=
cles.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
     42787 =C2=B1  4%     -88.6%       4871 =C2=B1 11%  proc-vmstat.nr_dirty
    171140 =C2=B1  4%     -88.6%      19511 =C2=B1 11%  meminfo.Dirty
      0.37 =C2=B1 12%    +163.0%       0.96 =C2=B1 23%  perf-profile.cpu-cy=
cles.wait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.=
ext4_sync_file.do_fsync
      0.36 =C2=B1 10%    +172.6%       0.99 =C2=B1 25%  perf-profile.cpu-cy=
cles.io_schedule.bit_wait_io.__wait_on_bit.wait_on_page_bit.filemap_fdatawa=
it_range
     22.64 =C2=B1  1%      -9.4%      20.52 =C2=B1  2%  perf-profile.cpu-cy=
cles.scsi_finish_command.scsi_softirq_done.blk_done_softirq.__do_softirq.ir=
q_exit
      0.31 =C2=B1 30%    +169.6%       0.84 =C2=B1 24%  perf-profile.cpu-cy=
cles.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_se=
condary
      0.36 =C2=B1 17%    +165.5%       0.94 =C2=B1 23%  perf-profile.cpu-cy=
cles.__wait_on_bit.wait_on_page_bit.filemap_fdatawait_range.filemap_write_a=
nd_wait_range.ext4_sync_file
    190033 =C2=B1  8%    +485.5%    1112554 =C2=B1  8%  time.voluntary_cont=
ext_switches
       208 =C2=B1 32%     -54.4%         94 =C2=B1 21%  sched_debug.cpu#3.n=
r_uninterruptible
      0.33 =C2=B1 11%    +143.1%       0.79 =C2=B1 26%  perf-profile.cpu-cy=
cles.__schedule.io_schedule.bit_wait_io.__wait_on_bit.wait_on_page_bit
     74462 =C2=B1  2%    +223.6%     240966 =C2=B1  5%  meminfo.Writeback
     18613 =C2=B1  2%    +223.7%      60247 =C2=B1  5%  proc-vmstat.nr_writ=
eback
      0.61 =C2=B1 17%    +139.2%       1.46 =C2=B1 13%  perf-profile.cpu-cy=
cles.filemap_fdatawait_range.filemap_write_and_wait_range.ext4_sync_file.do=
_fsync.sys_fsync
         5 =C2=B1 20%    +123.8%         11 =C2=B1 19%  sched_debug.cpu#2.c=
pu_load[3]
 1.171e+08 =C2=B1  4%    +193.7%  3.439e+08 =C2=B1  5%  cpuidle.C1-SNB.time
    199468 =C2=B1  9%    +254.2%     706600 =C2=B1  7%  sched_debug.cpu#0.t=
twu_count
         6 =C2=B1 17%    +116.0%         13 =C2=B1 18%  sched_debug.cpu#2.c=
pu_load[2]
      3.12 =C2=B1  6%     -52.8%       1.47 =C2=B1 10%  perf-profile.cpu-cy=
cles.__const_udelay.ata_dev_select.ata_bmdma_qc_issue.ata_qc_issue.ata_scsi=
_queuecmd
      1754 =C2=B1  7%     -30.5%       1219 =C2=B1  9%  time.involuntary_co=
ntext_switches
      1.59 =C2=B1 14%     -54.0%       0.73 =C2=B1 22%  perf-profile.cpu-cy=
cles.iowrite8.ata_bmdma_qc_issue.ata_qc_issue.ata_scsi_queuecmd.scsi_dispat=
ch_cmd
         9 =C2=B1 11%     +75.7%         16 =C2=B1 21%  sched_debug.cpu#2.c=
pu_load[1]
      2.45 =C2=B1  6%     -52.7%       1.16 =C2=B1 13%  perf-profile.cpu-cy=
cles.delay_tsc.__const_udelay.ata_dev_select.ata_bmdma_qc_issue.ata_qc_issue
      1.00 =C2=B1 16%     -54.5%       0.46 =C2=B1 19%  perf-profile.cpu-cy=
cles.native_read_tsc.delay_tsc.__const_udelay.ata_dev_select.ata_bmdma_qc_i=
ssue
      3.71 =C2=B1  2%     -50.2%       1.85 =C2=B1 11%  perf-profile.cpu-cy=
cles.ata_dev_select.constprop.20.ata_bmdma_qc_issue.ata_qc_issue.ata_scsi_q=
ueuecmd.scsi_dispatch_cmd
         5 =C2=B1 31%    +105.0%         10 =C2=B1 19%  sched_debug.cpu#2.c=
pu_load[4]
        13 =C2=B1 22%     +56.6%         20 =C2=B1 21%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
      0.76 =C2=B1 25%    +102.6%       1.53 =C2=B1 17%  perf-profile.cpu-cy=
cles.wake_bit_function.__wake_up_common.__wake_up.__wake_up_bit.end_page_wr=
iteback
      1.00 =C2=B1 31%     +68.2%       1.68 =C2=B1 20%  perf-profile.cpu-cy=
cles.autoremove_wake_function.wake_bit_function.__wake_up_common.__wake_up.=
__wake_up_bit
      0.99 =C2=B1 32%     +65.0%       1.64 =C2=B1 21%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.wake_bit_function.__wak=
e_up_common.__wake_up
      0.79 =C2=B1 24%     +93.7%       1.53 =C2=B1 17%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up.__wake_up_bit.end_page_writeback.ext4_finis=
h_bio
      0.99 =C2=B1 31%     +62.5%       1.60 =C2=B1 22%  perf-profile.cpu-cy=
cles.try_to_wake_up.default_wake_function.autoremove_wake_function.wake_bit=
_function.__wake_up_common
        19 =C2=B1 20%     -27.8%         14 =C2=B1 27%  sched_debug.cpu#3.c=
pu_load[0]
    349094 =C2=B1  1%     -44.9%     192443 =C2=B1  0%  cpuidle.C6-SNB.usage
    326733 =C2=B1  2%     +60.7%     525033 =C2=B1  8%  sched_debug.cpu#1.s=
ched_goidle
       603 =C2=B1  0%     +75.6%       1058 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_objs
    661534 =C2=B1  2%     +60.0%    1058165 =C2=B1  8%  sched_debug.cpu#1.s=
ched_count
    660896 =C2=B1  2%     +60.0%    1057116 =C2=B1  8%  sched_debug.cpu#1.n=
r_switches
       207 =C2=B1 19%     -39.0%        126 =C2=B1  9%  sched_debug.cpu#2.n=
r_uninterruptible
       569 =C2=B1  1%     +69.1%        962 =C2=B1  2%  slabinfo.kmalloc-20=
48.active_objs
      1.91 =C2=B1 10%     -39.4%       1.16 =C2=B1 11%  perf-profile.cpu-cy=
cles.ata_sff_tf_load.ata_bmdma_qc_issue.ata_qc_issue.ata_scsi_queuecmd.scsi=
_dispatch_cmd
      1.68 =C2=B1 14%     -35.4%       1.09 =C2=B1 14%  perf-profile.cpu-cy=
cles.__const_udelay.ata_sff_tf_load.ata_bmdma_qc_issue.ata_qc_issue.ata_scs=
i_queuecmd
    246585 =C2=B1  6%     +56.9%     386981 =C2=B1  6%  cpuidle.C1-SNB.usage
       568 =C2=B1 13%     -26.0%        420 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
      1.15 =C2=B1 19%     -27.8%       0.83 =C2=B1 17%  perf-profile.cpu-cy=
cles.__ata_sff_port_intr.ata_bmdma_port_intr.ata_bmdma_interrupt.handle_irq=
_event_percpu.handle_irq_event
       596 =C2=B1 13%     -25.8%        442 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      9.03 =C2=B1  6%     -40.5%       5.37 =C2=B1  3%  perf-profile.cpu-cy=
cles.ata_bmdma_qc_issue.ata_qc_issue.ata_scsi_queuecmd.scsi_dispatch_cmd.sc=
si_request_fn
      1.19 =C2=B1 18%     -29.8%       0.84 =C2=B1 20%  perf-profile.cpu-cy=
cles.delay_tsc.__const_udelay.ata_sff_tf_load.ata_bmdma_qc_issue.ata_qc_iss=
ue
      1081 =C2=B1  0%     +39.3%       1506 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_objs
      1.77 =C2=B1  5%     -27.9%       1.28 =C2=B1  5%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.rest_in=
it
      1.89 =C2=B1  6%     -29.2%       1.34 =C2=B1  4%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.rest_init.start_ke=
rnel
 1.328e+08 =C2=B1  3%     -31.6%   90791332 =C2=B1  2%  cpuidle.C1E-SNB.time
      1.92 =C2=B1 12%     -28.7%       1.37 =C2=B1  4%  perf-profile.cpu-cy=
cles.handle_irq_event.handle_fasteoi_irq.handle_irq.do_IRQ.ret_from_intr
      0.88 =C2=B1 16%     +33.1%       1.17 =C2=B1 14%  perf-profile.cpu-cy=
cles.ata_sff_qc_issue.ata_bmdma_qc_issue.ata_qc_issue.ata_scsi_queuecmd.scs=
i_dispatch_cmd
      1.45 =C2=B1 18%     -23.1%       1.11 =C2=B1 10%  perf-profile.cpu-cy=
cles.ata_bmdma_port_intr.ata_bmdma_interrupt.handle_irq_event_percpu.handle=
_irq_event.handle_fasteoi_irq
    330931 =C2=B1  9%     +56.6%     518351 =C2=B1  2%  sched_debug.cpu#2.s=
ched_goidle
    670807 =C2=B1  9%     +55.7%    1044452 =C2=B1  2%  sched_debug.cpu#2.s=
ched_count
    670199 =C2=B1  9%     +55.7%    1043484 =C2=B1  2%  sched_debug.cpu#2.n=
r_switches
      1.87 =C2=B1 14%     -27.0%       1.37 =C2=B1  4%  perf-profile.cpu-cy=
cles.handle_irq_event_percpu.handle_irq_event.handle_fasteoi_irq.handle_irq=
.do_IRQ
      1.95 =C2=B1 13%     -27.4%       1.42 =C2=B1  3%  perf-profile.cpu-cy=
cles.handle_fasteoi_irq.handle_irq.do_IRQ.ret_from_intr.cpuidle_enter
      1.74 =C2=B1 17%     -25.1%       1.31 =C2=B1  6%  perf-profile.cpu-cy=
cles.ata_bmdma_interrupt.handle_irq_event_percpu.handle_irq_event.handle_fa=
steoi_irq.handle_irq
      2.04 =C2=B1 13%     -26.9%       1.50 =C2=B1  6%  perf-profile.cpu-cy=
cles.handle_irq.do_IRQ.ret_from_intr.cpuidle_enter.cpu_startup_entry
     60987 =C2=B1  3%     -18.6%      49666 =C2=B1  1%  sched_debug.cpu#0.n=
r_load_updates
      1271 =C2=B1  2%     +39.9%       1778 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_objs
     14.83 =C2=B1  4%     -16.4%      12.39 =C2=B1  1%  perf-profile.cpu-cy=
cles.ata_qc_issue.ata_scsi_queuecmd.scsi_dispatch_cmd.scsi_request_fn.__blk=
_run_queue
      1.17 =C2=B1 10%     -18.9%       0.95 =C2=B1  6%  perf-profile.cpu-cy=
cles.ext4_da_get_block_prep.__block_write_begin.ext4_da_write_begin.generic=
_perform_write.__generic_file_write_iter
      5.07 =C2=B1  8%     +23.9%       6.28 =C2=B1  5%  perf-profile.cpu-cy=
cles.memcpy.swiotlb_map_sg_attrs.ata_qc_issue.ata_scsi_queuecmd.scsi_dispat=
ch_cmd
      5.69 =C2=B1  4%     +21.8%       6.93 =C2=B1  5%  perf-profile.cpu-cy=
cles.swiotlb_map_sg_attrs.ata_qc_issue.ata_scsi_queuecmd.scsi_dispatch_cmd.=
scsi_request_fn
        21 =C2=B1 11%     -25.9%         15 =C2=B1 11%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    325081 =C2=B1 11%     -13.4%     281672 =C2=B1 10%  sched_debug.cpu#3.t=
twu_count
     36465 =C2=B1  3%      -8.7%      33291 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    340518 =C2=B1  9%     +23.7%     421099 =C2=B1  8%  sched_debug.cpu#3.s=
ched_goidle
    292710 =C2=B1 11%     -12.9%     254841 =C2=B1 13%  sched_debug.cpu#3.t=
twu_local
    688474 =C2=B1  9%     +23.4%     849753 =C2=B1  8%  sched_debug.cpu#3.n=
r_switches
    688995 =C2=B1  9%     +23.4%     850473 =C2=B1  8%  sched_debug.cpu#3.s=
ched_count
     16.46 =C2=B1  3%     -13.2%      14.30 =C2=B1  3%  perf-profile.cpu-cy=
cles.scsi_run_queue.scsi_next_command.scsi_end_request.scsi_io_completion.s=
csi_finish_command
      4.00 =C2=B1  9%     +27.7%       5.11 =C2=B1  9%  perf-profile.cpu-cy=
cles.start_secondary
      3.94 =C2=B1  9%     +27.9%       5.04 =C2=B1  9%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
     16.55 =C2=B1  3%     -13.3%      14.35 =C2=B1  3%  perf-profile.cpu-cy=
cles.scsi_next_command.scsi_end_request.scsi_io_completion.scsi_finish_comm=
and.scsi_softirq_done
     53676 =C2=B1  2%     -19.2%      43361 =C2=B1  5%  sched_debug.cpu#3.n=
r_load_updates
     16.42 =C2=B1  3%     -13.1%      14.27 =C2=B1  3%  perf-profile.cpu-cy=
cles.__blk_run_queue.blk_run_queue.scsi_run_queue.scsi_next_command.scsi_en=
d_request
     16.45 =C2=B1  3%     -13.2%      14.27 =C2=B1  3%  perf-profile.cpu-cy=
cles.blk_run_queue.scsi_run_queue.scsi_next_command.scsi_end_request.scsi_i=
o_completion
     16.41 =C2=B1  3%     -13.1%      14.26 =C2=B1  3%  perf-profile.cpu-cy=
cles.scsi_request_fn.__blk_run_queue.blk_run_queue.scsi_run_queue.scsi_next=
_command
     15.54 =C2=B1  4%     -12.4%      13.61 =C2=B1  2%  perf-profile.cpu-cy=
cles.scsi_dispatch_cmd.scsi_request_fn.__blk_run_queue.blk_run_queue.scsi_r=
un_queue
      4203 =C2=B1 14%     -18.4%       3428 =C2=B1 11%  sched_debug.cpu#3.c=
urr->pid
     15.52 =C2=B1  4%     -12.3%      13.61 =C2=B1  2%  perf-profile.cpu-cy=
cles.ata_scsi_queuecmd.scsi_dispatch_cmd.scsi_request_fn.__blk_run_queue.bl=
k_run_queue
     22925 =C2=B1  6%     -12.1%      20156 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     12237 =C2=B1  2%     -13.8%      10554 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.exec_clock
     27.55 =C2=B1  2%     -11.5%      24.39 =C2=B1  0%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.rest_init.start_kernel.x86_64_start_re=
servations
     28.65 =C2=B1  1%     -11.9%      25.23 =C2=B1  0%  perf-profile.cpu-cy=
cles.x86_64_start_kernel
     28.65 =C2=B1  1%     -11.9%      25.23 =C2=B1  0%  perf-profile.cpu-cy=
cles.start_kernel.x86_64_start_reservations.x86_64_start_kernel
     28.65 =C2=B1  1%     -11.9%      25.23 =C2=B1  0%  perf-profile.cpu-cy=
cles.x86_64_start_reservations.x86_64_start_kernel
     28.65 =C2=B1  1%     -11.9%      25.23 =C2=B1  0%  perf-profile.cpu-cy=
cles.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
     28.56 =C2=B1  1%     -11.9%      25.17 =C2=B1  0%  perf-profile.cpu-cy=
cles.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86=
_64_start_kernel
     25.22 =C2=B1  2%     -10.3%      22.63 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_IRQ.ret_from_intr.cpuidle_enter.cpu_startup_entry.rest_init
     58292 =C2=B1  4%     -14.9%      49600 =C2=B1  3%  sched_debug.cpu#2.n=
r_load_updates
     25.22 =C2=B1  2%     -10.3%      22.63 =C2=B1  0%  perf-profile.cpu-cy=
cles.ret_from_intr.cpuidle_enter.cpu_startup_entry.rest_init.start_kernel
     25700 =C2=B1  1%      -8.7%      23453 =C2=B1  0%  softirqs.SCHED
     62870 =C2=B1  0%     -10.4%      56344 =C2=B1  6%  sched_debug.cpu#1.n=
r_load_updates
      3.36 =C2=B1  4%      -8.7%       3.07 =C2=B1  5%  perf-profile.cpu-cy=
cles.ext4_bio_write_page.mpage_submit_page.mpage_process_page_bufs.mpage_pr=
epare_extent_to_map.ext4_writepages
     22.96 =C2=B1  2%      -8.6%      20.99 =C2=B1  0%  perf-profile.cpu-cy=
cles.irq_exit.do_IRQ.ret_from_intr.cpuidle_enter.cpu_startup_entry
     22.78 =C2=B1  1%      -9.6%      20.61 =C2=B1  2%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.do_IRQ.ret_from_intr.cpuidle_enter
     22.85 =C2=B1  1%      -9.9%      20.58 =C2=B1  2%  perf-profile.cpu-cy=
cles.blk_done_softirq.__do_softirq.irq_exit.do_IRQ.ret_from_intr
     22.68 =C2=B1  1%      -9.2%      20.58 =C2=B1  2%  perf-profile.cpu-cy=
cles.scsi_softirq_done.blk_done_softirq.__do_softirq.irq_exit.do_IRQ
     22.62 =C2=B1  1%      -9.2%      20.54 =C2=B1  2%  perf-profile.cpu-cy=
cles.scsi_io_completion.scsi_finish_command.scsi_softirq_done.blk_done_soft=
irq.__do_softirq
     22.59 =C2=B1  1%      -9.2%      20.52 =C2=B1  2%  perf-profile.cpu-cy=
cles.scsi_end_request.scsi_io_completion.scsi_finish_command.scsi_softirq_d=
one.blk_done_softirq
      7.48 =C2=B1  4%     +10.2%       8.25 =C2=B1  1%  perf-profile.cpu-cy=
cles.__fsync_nocancel
      8.71 =C2=B1  3%     +10.6%       9.63 =C2=B1  1%  perf-profile.cpu-cy=
cles.ext4_da_write_end.generic_perform_write.__generic_file_write_iter.ext4=
_file_write_iter.new_sync_write
      2080 =C2=B1  2%     +76.2%       3667 =C2=B1  4%  vmstat.system.cs
     76575 =C2=B1  0%      +8.4%      82997 =C2=B1  0%  vmstat.io.bo


testbox/testcase/testparams: bay/dd-write/performance-1HDD-cfq-ext4-10dd

c2661b806092d8ea  34b48db66e08ca1c1bc07cf305  =

----------------  --------------------------  =

        10 =C2=B1  0%     -10.0%          9 =C2=B1  0%  vmstat.procs.b
     56496 =C2=B1  0%     -46.2%      30420 =C2=B1  1%  softirqs.BLOCK
         3 =C2=B1  0%     -33.3%          2 =C2=B1  0%  ftrace.writeback_si=
ngle_inode.sda.age
     40537 =C2=B1  0%     -36.5%      25733 =C2=B1  2%  proc-vmstat.nr_dirty
    162242 =C2=B1  0%     -36.7%     102672 =C2=B1  2%  meminfo.Dirty
        41 =C2=B1 12%   +2052.1%        898 =C2=B1 22%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
         8 =C2=B1  5%     -66.7%          2 =C2=B1 15%  ftrace.global_dirty=
_state.unstable
     71545 =C2=B1  0%     +84.3%     131846 =C2=B1  0%  meminfo.Writeback
     17904 =C2=B1  0%     +83.7%      32884 =C2=B1  0%  proc-vmstat.nr_writ=
eback
     15688 =C2=B1 31%     +59.6%      25033 =C2=B1 27%  proc-vmstat.compact=
_migrate_scanned
    489655 =C2=B1 26%     +39.6%     683333 =C2=B1 24%  proc-vmstat.compact=
_free_scanned
       258 =C2=B1 32%     +52.1%        392 =C2=B1  5%  slabinfo.xfs_buf.nu=
m_objs
      7859 =C2=B1  0%     -37.2%       4937 =C2=B1  2%  ftrace.writeback_si=
ngle_inode.sda.wrote
       258 =C2=B1 32%     +48.6%        383 =C2=B1  6%  slabinfo.xfs_buf.ac=
tive_objs
     17773 =C2=B1  0%     +84.8%      32842 =C2=B1  1%  ftrace.global_dirty=
_state.writeback
       516 =C2=B1 20%     +31.6%        679 =C2=B1 18%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
      0.95 =C2=B1 11%     -27.2%       0.69 =C2=B1  6%  perf-profile.cpu-cy=
cles.shrink_active_list.shrink_lruvec.shrink_zone.kswapd_shrink_zone.kswapd
       626 =C2=B1 16%     +29.1%        808 =C2=B1 14%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      1.25 =C2=B1 15%     +31.9%       1.64 =C2=B1 16%  perf-profile.cpu-cy=
cles.__find_get_block.__getblk_gfp.__ext4_get_inode_loc.ext4_get_inode_loc.=
ext4_reserve_inode_write
     40510 =C2=B1  0%     -37.4%      25347 =C2=B1  0%  ftrace.global_dirty=
_state.dirty
       638 =C2=B1  6%     -17.4%        527 =C2=B1 15%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
      0.58 =C2=B1 33%     +62.2%       0.93 =C2=B1 11%  perf-profile.cpu-cy=
cles.__ext4_journal_stop.ext4_dirty_inode.__mark_inode_dirty.generic_write_=
end.ext4_da_write_end
      1.22 =C2=B1  6%     -23.4%       0.93 =C2=B1  1%  perf-profile.cpu-cy=
cles.security_file_permission.rw_verify_area.vfs_read.sys_read.system_call_=
fastpath
      1.62 =C2=B1  9%     +40.2%       2.28 =C2=B1 18%  perf-profile.cpu-cy=
cles.default_idle.arch_cpu_idle.cpu_startup_entry.start_secondary
      1.64 =C2=B1  9%     +39.1%       2.29 =C2=B1 18%  perf-profile.cpu-cy=
cles.arch_cpu_idle.cpu_startup_entry.start_secondary
       219 =C2=B1  4%     +35.2%        296 =C2=B1 13%  uptime.idle
        29 =C2=B1 15%     +38.8%         40 =C2=B1 11%  sched_debug.cpu#3.c=
pu_load[4]
        88 =C2=B1  9%     +28.2%        113 =C2=B1 15%  sched_debug.cpu#0.c=
pu_load[0]
     12913 =C2=B1 16%     +35.5%      17494 =C2=B1  8%  proc-vmstat.pgmigra=
te_success
      7.92 =C2=B1  8%     -16.7%       6.59 =C2=B1  8%  perf-profile.cpu-cy=
cles.ret_from_fork
      7.92 =C2=B1  8%     -16.7%       6.59 =C2=B1  8%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
     26598 =C2=B1 16%     +36.8%      36397 =C2=B1  9%  proc-vmstat.compact=
_isolated
        67 =C2=B1  5%     +21.0%         82 =C2=B1 11%  sched_debug.cpu#0.c=
pu_load[1]
       105 =C2=B1  5%     +17.6%        123 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
     63729 =C2=B1  5%     +22.0%      77752 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.min_vruntime
        56 =C2=B1  6%     +23.7%         69 =C2=B1  5%  sched_debug.cpu#3.c=
pu_load[2]
        39 =C2=B1 10%     +30.8%         51 =C2=B1  4%  sched_debug.cpu#3.c=
pu_load[3]
        85 =C2=B1  4%     +20.0%        102 =C2=B1 10%  sched_debug.cpu#3.c=
pu_load[1]
     71456 =C2=B1  5%     +16.6%      83284 =C2=B1 11%  sched_debug.cfs_rq[=
3]:/.min_vruntime
    105703 =C2=B1  4%     +10.5%     116819 =C2=B1  5%  sched_debug.cpu#2.n=
r_load_updates
      5.45 =C2=B1  4%      -6.3%       5.10 =C2=B1  4%  perf-profile.cpu-cy=
cles.pagecache_get_page.grab_cache_page_write_begin.ext4_da_write_begin.gen=
eric_perform_write.__generic_file_write_iter
      9662 =C2=B1  0%      +7.9%      10421 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sda.task_ratelimit
     61966 =C2=B1  2%      -9.2%      56254 =C2=B1  2%  softirqs.RCU
     94955 =C2=B1  0%      +8.6%     103140 =C2=B1  4%  ftrace.bdi_dirty_ra=
telimit.sda.dirty_rate
      8.71 =C2=B1  3%    +685.6%      68.42 =C2=B1  2%  iostat.sda.wrqm/s
       991 =C2=B1  0%    +120.1%       2182 =C2=B1  2%  iostat.sda.avgrq-sz
    187.72 =C2=B1  0%     -49.0%      95.64 =C2=B1  1%  iostat.sda.w/s
       760 =C2=B1  0%     +77.6%       1349 =C2=B1  0%  iostat.sda.w_await
       756 =C2=B1  0%     +77.8%       1345 =C2=B1  0%  iostat.sda.await
    141.80 =C2=B1  0%     -12.3%     124.40 =C2=B1  1%  iostat.sda.avgqu-sz
      5549 =C2=B1  0%      +2.0%       5659 =C2=B1  0%  vmstat.system.cs
   3489593 =C2=B1  0%      +1.8%    3553306 =C2=B1  0%  perf-stat.context-s=
witches
  5.71e+08 =C2=B1  2%     +18.9%  6.787e+08 =C2=B1  4%  perf-stat.cache-mis=
ses
 3.054e+08 =C2=B1  3%     +16.5%  3.558e+08 =C2=B1  3%  perf-stat.LLC-load-=
misses
 1.561e+09 =C2=B1  0%      +5.9%  1.653e+09 =C2=B1  0%  perf-stat.branch-mi=
sses
  1.56e+09 =C2=B1  0%      +6.4%  1.661e+09 =C2=B1  0%  perf-stat.branch-lo=
ad-misses
 1.409e+10 =C2=B1  0%      +3.7%  1.461e+10 =C2=B1  2%  perf-stat.L1-icache=
-load-misses
    151166 =C2=B1  0%      +6.7%     161244 =C2=B1  2%  perf-stat.cpu-migra=
tions
 1.065e+12 =C2=B1  0%      +6.1%   1.13e+12 =C2=B1  0%  perf-stat.cpu-cycles
     93722 =C2=B1  0%      +1.4%      95034 =C2=B1  0%  vmstat.io.bo
 8.095e+11 =C2=B1  0%      +5.3%  8.528e+11 =C2=B1  1%  perf-stat.L1-icache=
-loads
     93726 =C2=B1  0%      +1.4%      95037 =C2=B1  0%  iostat.sda.wkB/s
 1.123e+12 =C2=B1  1%      +5.4%  1.184e+12 =C2=B1  0%  perf-stat.ref-cycles
 1.248e+11 =C2=B1  1%      +5.2%  1.312e+11 =C2=B1  0%  perf-stat.bus-cycles
 3.305e+10 =C2=B1  0%      +3.1%  3.408e+10 =C2=B1  1%  perf-stat.cache-ref=
erences
 1.107e+08 =C2=B1  0%      +3.3%  1.144e+08 =C2=B1  0%  perf-stat.LLC-store=
-misses
 1.479e+11 =C2=B1  0%      +1.6%  1.502e+11 =C2=B1  1%  perf-stat.branch-lo=
ads
 7.971e+11 =C2=B1  0%      +1.8%  8.114e+11 =C2=B1  1%  perf-stat.instructi=
ons
 1.709e+11 =C2=B1  0%      +1.3%   1.73e+11 =C2=B1  1%  perf-stat.dTLB-stor=
es
 2.877e+11 =C2=B1  0%      +1.5%  2.919e+11 =C2=B1  0%  perf-stat.L1-dcache=
-loads
 2.876e+11 =C2=B1  0%      +1.4%  2.917e+11 =C2=B1  0%  perf-stat.dTLB-loads
 1.482e+11 =C2=B1  0%      +1.3%  1.501e+11 =C2=B1  0%  perf-stat.branch-in=
structions


testbox/testcase/testparams: ivb44/fsmark/performance-1x-1t-1HDD-xfs-4M-60G=
-NoSync

c2661b806092d8ea  34b48db66e08ca1c1bc07cf305  =

----------------  --------------------------  =

           :4           25%           1:4     kmsg.usbhid#-#:#:can't_add_hi=
d_device
     24990 =C2=B1  3%     +64.3%      41060 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
       393 =C2=B1  0%      +3.4%        407 =C2=B1  0%  fsmark.time.elapsed=
_time.max
       393 =C2=B1  0%      +3.4%        407 =C2=B1  0%  fsmark.time.elapsed=
_time
     39.02 =C2=B1  0%      -3.3%      37.73 =C2=B1  0%  fsmark.files_per_sec
     11194 =C2=B1  0%   +1169.6%     142124 =C2=B1  0%  numa-vmstat.node0.n=
r_writeback
      7721 =C2=B1  0%   +1222.6%     102125 =C2=B1  0%  numa-vmstat.node1.n=
r_writeback
     30857 =C2=B1  0%   +1224.0%     408538 =C2=B1  0%  numa-meminfo.node1.=
Writeback
     44886 =C2=B1  0%   +1167.7%     569033 =C2=B1  0%  numa-meminfo.node0.=
Writeback
     54347 =C2=B1  0%     -86.5%       7312 =C2=B1  0%  softirqs.TASKLET
       143 =C2=B1 21%    +459.5%        800 =C2=B1 38%  sched_debug.cfs_rq[=
27]:/.exec_clock
     53525 =C2=B1  0%     -87.9%       6479 =C2=B1  0%  softirqs.BLOCK
      1195 =C2=B1  6%     -62.0%        454 =C2=B1 37%  cpuidle.C3-IVT.usage
      1133 =C2=B1 21%     -67.4%        370 =C2=B1 13%  cpuidle.C1E-IVT.usa=
ge
     24990 =C2=B1  3%     +64.3%      41060 =C2=B1  0%  time.voluntary_cont=
ext_switches
       288 =C2=B1 29%    +113.6%        615 =C2=B1 43%  sched_debug.cfs_rq[=
22]:/.avg->runnable_avg_sum
       151 =C2=B1 26%    +102.0%        306 =C2=B1 41%  sched_debug.cfs_rq[=
36]:/.exec_clock
     75891 =C2=B1  0%   +1188.1%     977548 =C2=B1  0%  meminfo.Writeback
     18919 =C2=B1  0%   +1192.0%     244429 =C2=B1  0%  proc-vmstat.nr_writ=
eback
      1131 =C2=B1  5%    +148.6%       2811 =C2=B1  1%  slabinfo.xfs_trans.=
num_objs
      1131 =C2=B1  5%    +139.0%       2704 =C2=B1  1%  slabinfo.xfs_trans.=
active_objs
     19072 =C2=B1  4%     -23.5%      14593 =C2=B1  5%  sched_debug.cpu#0.t=
twu_count
       291 =C2=B1 11%     -59.2%        119 =C2=B1  8%  time.involuntary_co=
ntext_switches
       450 =C2=B1 38%     -51.7%        217 =C2=B1 27%  sched_debug.cpu#36.=
curr->pid
       552 =C2=B1 38%     +69.8%        938 =C2=B1 17%  sched_debug.cpu#42.=
sched_goidle
       343 =C2=B1 16%     -56.4%        149 =C2=B1 49%  sched_debug.cpu#1.c=
urr->pid
      2886 =C2=B1 30%    +101.3%       5808 =C2=B1 25%  sched_debug.cfs_rq[=
19]:/.min_vruntime
       957 =C2=B1 11%    +111.9%       2028 =C2=B1  3%  slabinfo.blkdev_ioc=
.num_objs
       957 =C2=B1 11%    +106.0%       1972 =C2=B1  4%  slabinfo.blkdev_ioc=
.active_objs
       166 =C2=B1  2%     +81.7%        302 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_slabs
       166 =C2=B1  2%     +81.7%        302 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_slabs
      1305 =C2=B1 31%     +59.8%       2085 =C2=B1 16%  sched_debug.cpu#42.=
nr_switches
       475 =C2=B1 11%     +74.9%        832 =C2=B1 21%  sched_debug.cpu#37.=
sched_goidle
       352 =C2=B1 28%     -34.5%        230 =C2=B1 29%  sched_debug.cfs_rq[=
40]:/.avg->runnable_avg_sum
      1081 =C2=B1 21%     -24.9%        812 =C2=B1 27%  sched_debug.cpu#28.=
ttwu_count
       472 =C2=B1 11%     +48.9%        704 =C2=B1 27%  sched_debug.cpu#41.=
sched_goidle
       567 =C2=B1 26%     +62.3%        921 =C2=B1 33%  sched_debug.cpu#38.=
sched_goidle
       671 =C2=B1 26%     +47.1%        987 =C2=B1 29%  sched_debug.cpu#34.=
ttwu_count
        42 =C2=B1 16%     +70.8%         73 =C2=B1 27%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
      2672 =C2=B1  2%     +81.5%       4850 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_objs
       170 =C2=B1 25%     +59.2%        271 =C2=B1  4%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
      1044 =C2=B1 13%     +56.8%       1637 =C2=B1 19%  sched_debug.cpu#19.=
ttwu_local
      2599 =C2=B1  2%     +80.7%       4697 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_objs
       167 =C2=B1 23%     +59.2%        267 =C2=B1  5%  sched_debug.cfs_rq[=
46]:/.blocked_load_avg
      1301 =C2=B1 24%     +56.4%       2035 =C2=B1 30%  sched_debug.cpu#38.=
nr_switches
       631 =C2=B1 24%     -33.6%        419 =C2=B1 10%  sched_debug.cpu#26.=
sched_goidle
      1156 =C2=B1 11%     +62.0%       1873 =C2=B1 17%  sched_debug.cpu#37.=
nr_switches
       249 =C2=B1 10%     -40.4%        148 =C2=B1 17%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
        46 =C2=B1 16%     +58.7%         73 =C2=B1 27%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
       124 =C2=B1 17%     +26.2%        156 =C2=B1 15%  sched_debug.cpu#34.=
ttwu_local
       247 =C2=B1 10%     -40.4%        147 =C2=B1 18%  sched_debug.cfs_rq[=
43]:/.blocked_load_avg
      1475 =C2=B1 21%     -30.8%       1020 =C2=B1 12%  sched_debug.cpu#26.=
sched_count
        28 =C2=B1 15%     -39.5%         17 =C2=B1 14%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
      1350 =C2=B1 15%     -37.7%        840 =C2=B1 12%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
      1445 =C2=B1 21%     -30.8%       1000 =C2=B1 13%  sched_debug.cpu#26.=
nr_switches
       811 =C2=B1  9%     +38.3%       1122 =C2=B1 18%  sched_debug.cpu#42.=
ttwu_count
      2167 =C2=B1 10%     +32.9%       2879 =C2=B1  6%  sched_debug.cpu#7.t=
twu_local
      1861 =C2=B1 21%     +33.9%       2492 =C2=B1 17%  sched_debug.cpu#6.t=
twu_local
     14320 =C2=B1  4%     -30.6%       9937 =C2=B1  4%  sched_debug.cpu#0.t=
twu_local
      2292 =C2=B1 16%     -26.6%       1682 =C2=B1 19%  sched_debug.cfs_rq[=
5]:/.exec_clock
      1159 =C2=B1 11%     -21.7%        907 =C2=B1 15%  sched_debug.cpu#43.=
ttwu_count
      2522 =C2=B1 47%     -41.3%       1481 =C2=B1 11%  sched_debug.cfs_rq[=
43]:/.min_vruntime
      1496 =C2=B1  5%     +14.9%       1718 =C2=B1  5%  slabinfo.blkdev_req=
uests.active_objs
      3648 =C2=B1  7%     +33.4%       4866 =C2=B1  8%  sched_debug.cpu#19.=
ttwu_count
      9094 =C2=B1 11%     +25.4%      11402 =C2=B1  7%  sched_debug.cpu#19.=
nr_switches
      1548 =C2=B1  5%     +15.6%       1791 =C2=B1  5%  slabinfo.blkdev_req=
uests.num_objs
    331321 =C2=B1  1%     -21.7%     259303 =C2=B1  0%  cpuidle.C6-IVT.usage
 2.335e+08 =C2=B1  1%     +27.0%  2.965e+08 =C2=B1 12%  cpuidle.C1-IVT.time
     21863 =C2=B1  4%     -26.5%      16059 =C2=B1  7%  sched_debug.cpu#0.n=
r_load_updates
     14153 =C2=B1  7%     +13.7%      16095 =C2=B1  4%  slabinfo.kmalloc-25=
6.num_objs
     16419 =C2=B1  5%     -25.2%      12289 =C2=B1  8%  sched_debug.cpu#0.s=
ched_goidle
     10169 =C2=B1  5%     -13.8%       8767 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.exec_clock
     35366 =C2=B1  4%     -23.9%      26910 =C2=B1  7%  sched_debug.cpu#0.n=
r_switches
      2160 =C2=B1 16%     +39.6%       3015 =C2=B1  6%  sched_debug.cpu#1.t=
twu_local
      9848 =C2=B1  2%     +20.6%      11876 =C2=B1  5%  slabinfo.kmalloc-51=
2.num_objs
      9721 =C2=B1  2%     +20.8%      11741 =C2=B1  5%  slabinfo.kmalloc-51=
2.active_objs
      5997 =C2=B1 11%     -25.0%       4499 =C2=B1 13%  sched_debug.cpu#3.t=
twu_count
      4801 =C2=B1 17%     +26.5%       6075 =C2=B1 14%  sched_debug.cpu#11.=
sched_goidle
       116 =C2=B1  8%     +40.3%        163 =C2=B1 33%  sched_debug.cpu#33.=
ttwu_local
      7180 =C2=B1  6%     +12.0%       8038 =C2=B1  7%  sched_debug.cpu#19.=
nr_load_updates
      3654 =C2=B1 11%     -15.4%       3092 =C2=B1  4%  sched_debug.cpu#44.=
nr_load_updates
      6077 =C2=B1  7%     -19.2%       4913 =C2=B1 14%  sched_debug.cpu#2.t=
twu_count
      3618 =C2=B1  6%     -13.5%       3128 =C2=B1  1%  sched_debug.cpu#35.=
nr_load_updates
      8399 =C2=B1  2%     +11.2%       9338 =C2=B1  5%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      7559 =C2=B1  2%     +12.7%       8523 =C2=B1  5%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      8529 =C2=B1  1%     +10.6%       9430 =C2=B1  5%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      3625 =C2=B1  3%     -12.1%       3188 =C2=B1  2%  sched_debug.cpu#32.=
nr_load_updates
      2761 =C2=B1  3%     +10.8%       3059 =C2=B1  5%  numa-meminfo.node1.=
KernelStack
      4672 =C2=B1  8%     +15.7%       5406 =C2=B1 11%  sched_debug.cpu#23.=
sched_goidle
      3873 =C2=B1  5%     -11.0%       3447 =C2=B1  3%  sched_debug.cpu#28.=
nr_load_updates
      8309 =C2=B1  3%     +11.1%       9232 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
      1075 =C2=B1  4%      -7.3%        996 =C2=B1  6%  slabinfo.RAW.num_ob=
js
      1075 =C2=B1  4%      -7.3%        996 =C2=B1  6%  slabinfo.RAW.active=
_objs
     10971 =C2=B1  2%      -8.6%      10032 =C2=B1  7%  sched_debug.cpu#2.n=
r_load_updates
      8231 =C2=B1  5%     +11.8%       9203 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      8153 =C2=B1  5%     +11.2%       9067 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
      9188 =C2=B1  5%      +8.5%       9970 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     52333 =C2=B1  2%     +12.6%      58934 =C2=B1  0%  softirqs.SCHED
      7393 =C2=B1  2%      +9.2%       8070 =C2=B1  3%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
     50231 =C2=B1  6%     +12.5%      56530 =C2=B1  4%  numa-meminfo.node0.=
SUnreclaim
     12557 =C2=B1  6%     +12.5%      14131 =C2=B1  4%  numa-vmstat.node0.n=
r_slab_unreclaimable
      3613 =C2=B1  2%     +13.0%       4082 =C2=B1  3%  sched_debug.cpu#27.=
nr_load_updates
     10044 =C2=B1  2%      +7.6%      10811 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      9345 =C2=B1  3%      +8.1%      10101 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      7420 =C2=B1  2%      +9.0%       8088 =C2=B1  3%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
     10101 =C2=B1  4%     -14.8%       8605 =C2=B1 12%  sched_debug.cpu#5.n=
r_load_updates
     10031 =C2=B1  2%      +7.8%      10810 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     59796 =C2=B1  2%     -10.7%      53396 =C2=B1  2%  softirqs.RCU
      7367 =C2=B1  3%      +9.2%       8046 =C2=B1  3%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
      7408 =C2=B1  2%      +8.6%       8046 =C2=B1  3%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
      7392 =C2=B1  2%      +8.9%       8054 =C2=B1  3%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
      7384 =C2=B1  3%      +8.9%       8040 =C2=B1  3%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
     34.14 =C2=B1  0%    +683.5%     267.48 =C2=B1  0%  iostat.sda.wrqm/s
      1009 =C2=B1  0%   +1255.7%      13682 =C2=B1  0%  iostat.sda.avgrq-sz
    257.55 =C2=B1  0%     -92.6%      18.94 =C2=B1  0%  iostat.sda.w/s
       544 =C2=B1  0%   +1268.9%       7460 =C2=B1  0%  iostat.sda.w_await
       544 =C2=B1  0%   +1268.5%       7457 =C2=B1  0%  iostat.sda.await
       600 =C2=B1  0%     -41.1%        353 =C2=B1  1%  vmstat.system.in
    131497 =C2=B1  0%      -1.6%     129445 =C2=B1  0%  vmstat.io.bo
    131277 =C2=B1  0%      -3.3%     126926 =C2=B1  0%  iostat.sda.wkB/s

testbox/testcase/testparams: bay/dd-write/performance-1HDD-cfq-xfs-1dd

c2661b806092d8ea  34b48db66e08ca1c1bc07cf305  =

----------------  --------------------------  =

          1:4          -25%            :4     kmsg.e1000e#:#:#eth0:Link_Spe=
ed_was_downgraded_by_SmartSpeed
         1 =C2=B1  0%    -100.0%          0 =C2=B1  0%  vmstat.procs.b
     35966 =C2=B1  0%     -68.2%      11441 =C2=B1  0%  softirqs.BLOCK
       298 =C2=B1  0%     -98.7%          4 =C2=B1 43%  ftrace.writeback_si=
ngle_inode.sda.age
     32052 =C2=B1  0%     -19.7%      25738 =C2=B1  0%  proc-vmstat.nr_dirty
    128302 =C2=B1  0%     -19.7%     102971 =C2=B1  0%  meminfo.Dirty
      1089 =C2=B1  8%     -20.2%        869 =C2=B1 15%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
    108812 =C2=B1  0%     +22.3%     133114 =C2=B1  0%  meminfo.Writeback
     27191 =C2=B1  0%     +22.3%      33261 =C2=B1  0%  proc-vmstat.nr_writ=
eback
        88 =C2=B1  6%     -24.2%         67 =C2=B1  5%  sched_debug.cpu#1.c=
pu_load[0]
      4.23 =C2=B1  4%     -34.7%       2.77 =C2=B1 22%  perf-profile.cpu-cy=
cles.do_writepages.__writeback_single_inode.writeback_sb_inodes.__writeback=
_inodes_wb.wb_writeback
      4.24 =C2=B1  4%     -34.4%       2.78 =C2=B1 22%  perf-profile.cpu-cy=
cles.__writeback_inodes_wb.wb_writeback.bdi_writeback_workfn.process_one_wo=
rk.worker_thread
      4.24 =C2=B1  4%     -34.4%       2.78 =C2=B1 22%  perf-profile.cpu-cy=
cles.__writeback_single_inode.writeback_sb_inodes.__writeback_inodes_wb.wb_=
writeback.bdi_writeback_workfn
      4.24 =C2=B1  4%     -34.4%       2.78 =C2=B1 22%  perf-profile.cpu-cy=
cles.writeback_sb_inodes.__writeback_inodes_wb.wb_writeback.bdi_writeback_w=
orkfn.process_one_work
      4.24 =C2=B1  4%     -31.8%       2.90 =C2=B1 20%  perf-profile.cpu-cy=
cles.bdi_writeback_workfn.process_one_work.worker_thread.kthread.ret_from_f=
ork
      0.54 =C2=B1 31%     +83.7%       0.99 =C2=B1 22%  perf-profile.cpu-cy=
cles.copy_from_user_atomic_iovec.iov_iter_copy_from_user_atomic.generic_per=
form_write.xfs_file_buffered_aio_write.xfs_file_write_iter
      1.06 =C2=B1  9%     -46.9%       0.56 =C2=B1 20%  perf-profile.cpu-cy=
cles.free_hot_cold_page.free_hot_cold_page_list.shrink_page_list.shrink_ina=
ctive_list.shrink_lruvec
      4.24 =C2=B1  4%     -34.1%       2.80 =C2=B1 21%  perf-profile.cpu-cy=
cles.wb_writeback.bdi_writeback_workfn.process_one_work.worker_thread.kthre=
ad
      1.12 =C2=B1 13%     -45.8%       0.61 =C2=B1 16%  perf-profile.cpu-cy=
cles.free_hot_cold_page_list.shrink_page_list.shrink_inactive_list.shrink_l=
ruvec.shrink_zone
      2.11 =C2=B1 12%     -52.4%       1.00 =C2=B1 33%  perf-profile.cpu-cy=
cles.xfs_start_page_writeback.xfs_convert_page.xfs_cluster_write.xfs_vm_wri=
tepage.__writepage
    254817 =C2=B1  8%     +80.7%     460518 =C2=B1  5%  sched_debug.cpu#1.s=
ched_goidle
    529031 =C2=B1  7%     +82.6%     966208 =C2=B1  6%  sched_debug.cpu#1.s=
ched_count
    528841 =C2=B1  7%     +82.6%     965915 =C2=B1  6%  sched_debug.cpu#1.n=
r_switches
       466 =C2=B1 20%     +51.6%        707 =C2=B1 16%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
       212 =C2=B1 11%     +55.4%        329 =C2=B1 11%  slabinfo.xfs_buf.nu=
m_objs
      0.93 =C2=B1 19%     -36.1%       0.59 =C2=B1 31%  perf-profile.cpu-cy=
cles.__run_hrtimer.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_ti=
mer_interrupt.apic_timer_interrupt
      1.24 =C2=B1 15%     -48.6%       0.64 =C2=B1 31%  perf-profile.cpu-cy=
cles.__test_set_page_writeback.xfs_start_page_writeback.xfs_convert_page.xf=
s_cluster_write.xfs_vm_writepage
      0.70 =C2=B1 18%     +43.4%       1.00 =C2=B1 17%  perf-profile.cpu-cy=
cles.__set_page_dirty.mark_buffer_dirty.__block_commit_write.block_write_en=
d.generic_write_end
       212 =C2=B1 11%     +50.2%        318 =C2=B1 12%  slabinfo.xfs_buf.ac=
tive_objs
     27192 =C2=B1  0%     +18.8%      32298 =C2=B1  5%  ftrace.global_dirty=
_state.writeback
       548 =C2=B1 18%     +40.6%        771 =C2=B1 14%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      4.23 =C2=B1  4%     -37.4%       2.65 =C2=B1 22%  perf-profile.cpu-cy=
cles.write_cache_pages.generic_writepages.xfs_vm_writepages.do_writepages._=
_writeback_single_inode
      4.22 =C2=B1  4%     -37.3%       2.65 =C2=B1 22%  perf-profile.cpu-cy=
cles.xfs_vm_writepage.__writepage.write_cache_pages.generic_writepages.xfs_=
vm_writepages
      4.22 =C2=B1  4%     -37.3%       2.65 =C2=B1 22%  perf-profile.cpu-cy=
cles.__writepage.write_cache_pages.generic_writepages.xfs_vm_writepages.do_=
writepages
      3.27 =C2=B1  4%     -41.9%       1.90 =C2=B1 29%  perf-profile.cpu-cy=
cles.xfs_cluster_write.xfs_vm_writepage.__writepage.write_cache_pages.gener=
ic_writepages
       802 =C2=B1 10%     -27.5%        581 =C2=B1 12%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
      2.85 =C2=B1  4%     -45.6%       1.55 =C2=B1 39%  perf-profile.cpu-cy=
cles.xfs_convert_page.isra.11.xfs_cluster_write.xfs_vm_writepage.__writepag=
e.write_cache_pages
      4.23 =C2=B1  4%     -34.7%       2.77 =C2=B1 22%  perf-profile.cpu-cy=
cles.generic_writepages.xfs_vm_writepages.do_writepages.__writeback_single_=
inode.writeback_sb_inodes
      4.23 =C2=B1  4%     -34.7%       2.77 =C2=B1 22%  perf-profile.cpu-cy=
cles.xfs_vm_writepages.do_writepages.__writeback_single_inode.writeback_sb_=
inodes.__writeback_inodes_wb
    262384 =C2=B1  5%     +62.0%     425142 =C2=B1 29%  sched_debug.cpu#1.t=
twu_count
     33514 =C2=B1  4%     -22.8%      25878 =C2=B1 15%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      1.82 =C2=B1  4%     +34.2%       2.44 =C2=B1  9%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_read.sys_read.system_call_fastpath.read
     32144 =C2=B1  0%     -17.4%      26555 =C2=B1  6%  ftrace.global_dirty=
_state.dirty
       720 =C2=B1 12%     -29.8%        505 =C2=B1 14%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
       213 =C2=B1  9%     +24.1%        265 =C2=B1 15%  sched_debug.cfs_rq[=
3]:/.load
        78 =C2=B1 12%     -22.3%         61 =C2=B1 19%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
      1.24 =C2=B1  9%     +35.9%       1.69 =C2=B1  6%  perf-profile.cpu-cy=
cles.security_file_permission.rw_verify_area.vfs_read.sys_read.system_call_=
fastpath
       307 =C2=B1  6%     +22.7%        377 =C2=B1 11%  slabinfo.signal_cac=
he.num_objs
       307 =C2=B1  6%     +22.7%        377 =C2=B1 11%  slabinfo.signal_cac=
he.active_objs
      1389 =C2=B1  2%     +34.0%       1862 =C2=B1  0%  uptime.idle
       562 =C2=B1  9%     -30.5%        390 =C2=B1  2%  slabinfo.blkdev_req=
uests.active_objs
       580 =C2=B1  9%     -30.0%        406 =C2=B1  1%  slabinfo.blkdev_req=
uests.num_objs
     29983 =C2=B1  5%     -22.8%      23137 =C2=B1 14%  sched_debug.cfs_rq[=
0]:/.exec_clock
      1717 =C2=B1  0%     -12.5%       1503 =C2=B1  2%  slabinfo.kmalloc-12=
8.active_objs
     13.79 =C2=B1  6%     -17.1%      11.44 =C2=B1  2%  perf-profile.cpu-cy=
cles.ret_from_fork
     13.79 =C2=B1  6%     -17.1%      11.44 =C2=B1  2%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
      1717 =C2=B1  0%     -11.1%       1527 =C2=B1  3%  slabinfo.kmalloc-12=
8.num_objs
       735 =C2=B1  2%     -17.1%        609 =C2=B1  3%  slabinfo.kmalloc-51=
2.num_objs
       700 =C2=B1  3%     -14.8%        597 =C2=B1  3%  slabinfo.kmalloc-51=
2.active_objs
      3.96 =C2=B1 10%     +24.7%       4.94 =C2=B1  5%  perf-profile.cpu-cy=
cles.iov_iter_copy_from_user_atomic.generic_perform_write.xfs_file_buffered=
_aio_write.xfs_file_write_iter.new_sync_write
     10.48 =C2=B1  4%     +18.1%      12.38 =C2=B1  7%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath.read
     12981 =C2=B1  2%     +16.5%      15123 =C2=B1  4%  meminfo.AnonHugePag=
es
     11.69 =C2=B1  6%     +15.8%      13.54 =C2=B1  6%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath.read
     11.96 =C2=B1  6%     +14.1%      13.66 =C2=B1  6%  perf-profile.cpu-cy=
cles.system_call_fastpath.read
      0.04 =C2=B1  2%  +2.6e+05%     114.04 =C2=B1  1%  iostat.sda.wrqm/s
      1006 =C2=B1  0%    +467.6%       5715 =C2=B1  0%  iostat.sda.avgrq-sz
    204.95 =C2=B1  0%     -79.7%      41.69 =C2=B1  1%  iostat.sda.w/s
       693 =C2=B1  0%     +56.8%       1087 =C2=B1  2%  iostat.sda.w_await
       693 =C2=B1  0%     +56.8%       1087 =C2=B1  2%  iostat.sda.await
    142.50 =C2=B1  0%     -68.7%      44.57 =C2=B1  2%  iostat.sda.avgqu-sz
      4516 =C2=B1  0%     +44.4%       6521 =C2=B1  3%  vmstat.system.cs
      6657 =C2=B1  1%     +11.5%       7420 =C2=B1  0%  vmstat.system.in
   2826521 =C2=B1  0%     +42.8%    4036905 =C2=B1  3%  perf-stat.context-s=
witches
  1.06e+09 =C2=B1  3%     +14.6%  1.214e+09 =C2=B1  1%  perf-stat.branch-mi=
sses
 1.058e+09 =C2=B1  2%     +11.3%  1.178e+09 =C2=B1  0%  perf-stat.branch-lo=
ad-misses
  4.62e+09 =C2=B1  1%      +9.6%  5.063e+09 =C2=B1  0%  perf-stat.L1-icache=
-load-misses
     61232 =C2=B1  2%      +6.7%      65332 =C2=B1  1%  perf-stat.cpu-migra=
tions
 5.616e+11 =C2=B1  1%      +3.7%  5.824e+11 =C2=B1  1%  perf-stat.L1-icache=
-loads
 6.938e+11 =C2=B1  0%      +3.7%  7.193e+11 =C2=B1  1%  perf-stat.ref-cycles
 7.697e+10 =C2=B1  1%      +4.1%  8.016e+10 =C2=B1  1%  perf-stat.bus-cycles
 1.127e+10 =C2=B1  1%      +5.9%  1.194e+10 =C2=B1  0%  perf-stat.cache-ref=
erences
   6150016 =C2=B1  1%      +4.9%    6452759 =C2=B1  1%  perf-stat.iTLB-load=
-misses
 5.979e+11 =C2=B1  1%      +3.7%  6.198e+11 =C2=B1  0%  perf-stat.iTLB-loads
 1.119e+08 =C2=B1  0%      +2.0%  1.141e+08 =C2=B1  1%  perf-stat.LLC-store=
-misses
 2.125e+11 =C2=B1  0%      +1.6%   2.16e+11 =C2=B1  0%  perf-stat.dTLB-loads
 1.114e+11 =C2=B1  1%      +3.2%   1.15e+11 =C2=B1  1%  perf-stat.branch-in=
structions
 1.363e+11 =C2=B1  0%      +1.4%  1.382e+11 =C2=B1  1%  perf-stat.L1-dcache=
-stores

testbox/testcase/testparams: snb-drag/iozone/performance-2HDD-btrfs-cfq

c2661b806092d8ea  34b48db66e08ca1c1bc07cf305  =

----------------  --------------------------  =

   3721949 =C2=B1 10%     -75.8%     900696 =C2=B1  2%  iozone.524288KB_163=
84reclen.random_write
   4415916 =C2=B1 18%     -80.9%     844948 =C2=B1 48%  iozone.524288KB_64r=
eclen.fwrite
     51312 =C2=B1  1%     +98.3%     101737 =C2=B1  3%  iozone.time.volunta=
ry_context_switches
   3140204 =C2=B1 36%     -68.9%     976488 =C2=B1  1%  iozone.524288KB_102=
4reclen.fwrite
   5168927 =C2=B1 30%     +72.6%    8919077 =C2=B1 12%  iozone.2048KB_2048r=
eclen.bkwd_read
  12429800 =C2=B1 22%     -57.5%    5283570 =C2=B1  0%  iozone.64KB_16recle=
n.read
   9214432 =C2=B1 31%    +100.4%   18467538 =C2=B1 13%  iozone.64KB_16recle=
n.reread
   3784507 =C2=B1 36%     +54.6%    5852297 =C2=B1  9%  iozone.64KB_32recle=
n.frewrite
   5842770 =C2=B1 10%     +59.1%    9293676 =C2=B1 25%  iozone.256KB_16recl=
en.read
   4096260 =C2=B1 22%     +26.8%    5194967 =C2=B1 25%  iozone.8192KB_2048r=
eclen.record_rewrite
   2143392 =C2=B1 10%     +71.8%    3682593 =C2=B1  7%  iozone.64KB_32recle=
n.rewrite
   3926749 =C2=B1 10%     +65.7%    6504827 =C2=B1  1%  iozone.8192KB_2048r=
eclen.bkwd_read
   3245712 =C2=B1 28%     +41.1%    4580273 =C2=B1  0%  iozone.8192KB_2048r=
eclen.fwrite
   5516996 =C2=B1  2%     -42.0%    3202464 =C2=B1  0%  iozone.131072KB_409=
6reclen.stride_read
  11626146 =C2=B1  3%     -27.5%    8425044 =C2=B1  8%  iozone.256KB_32recl=
en.read
   6552054 =C2=B1 26%     +37.2%    8987238 =C2=B1  3%  iozone.524288KB_204=
8reclen.random_read
   8126973 =C2=B1 22%     +35.7%   11027371 =C2=B1  5%  iozone.512KB_128rec=
len.bkwd_read
   9186536 =C2=B1  1%     -40.2%    5497416 =C2=B1  3%  iozone.262144KB_204=
8reclen.reread
   6785922 =C2=B1 15%     +46.0%    9908396 =C2=B1  1%  iozone.4096KB_256re=
clen.freread
   5878217 =C2=B1 11%     +32.1%    7767855 =C2=B1 17%  iozone.128KB_8recle=
n.bkwd_read
   2908035 =C2=B1 11%     +23.8%    3599941 =C2=B1 16%  iozone.65536KB_2048=
reclen.write
   7045416 =C2=B1 28%     +23.9%    8727336 =C2=B1 14%  iozone.128KB_64recl=
en.fread
   4116881 =C2=B1  7%     -32.5%    2777202 =C2=B1  0%  iozone.131072KB_409=
6reclen.record_rewrite
   9958948 =C2=B1 11%     +22.6%   12204733 =C2=B1 16%  iozone.256KB_64recl=
en.freread
   5295317 =C2=B1  0%     -38.0%    3285585 =C2=B1  5%  iozone.65536KB_1638=
4reclen.random_read
   5154774 =C2=B1  2%     -34.7%    3366812 =C2=B1  2%  iozone.32768KB_1638=
4reclen.reread
   3350211 =C2=B1  1%     -35.5%    2161492 =C2=B1  2%  iozone.131072KB_409=
6reclen.fwrite
   7058730 =C2=B1 23%     +23.5%    8720773 =C2=B1  7%  iozone.4096KB_512re=
clen.freread
   9341609 =C2=B1  0%     -34.1%    6154779 =C2=B1  0%  iozone.8192KB_16rec=
len.random_read
   4078539 =C2=B1 21%     +14.6%    4674272 =C2=B1 15%  iozone.64KB_64recle=
n.fwrite
   9496835 =C2=B1 18%     +16.4%   11050866 =C2=B1 15%  iozone.512KB_16recl=
en.reread
   6835690 =C2=B1  7%     +46.9%   10043233 =C2=B1  6%  iozone.256KB_16recl=
en.fread
   5966535 =C2=B1  7%     +32.9%    7928399 =C2=B1 15%  iozone.128KB_16recl=
en.stride_read
   6896514 =C2=B1 19%      +8.5%    7482559 =C2=B1 18%  iozone.8192KB_64rec=
len.read
   5170408 =C2=B1 19%     +27.0%    6564086 =C2=B1 15%  iozone.128KB_16recl=
en.bkwd_read
   6841685 =C2=B1 17%     +32.0%    9027640 =C2=B1  5%  iozone.4096KB_128re=
clen.stride_read
   7736851 =C2=B1 14%     -26.8%    5665375 =C2=B1  2%  iozone.128KB_4recle=
n.fread
   7263403 =C2=B1 19%     +20.2%    8727084 =C2=B1 15%  iozone.512KB_16recl=
en.bkwd_read
   1482761 =C2=B1 14%     +20.3%    1784297 =C2=B1 12%  iozone.64KB_4reclen=
.rewrite
   2838836 =C2=B1  5%     +25.0%    3548955 =C2=B1 14%  iozone.8192KB_2048r=
eclen.write
   4452040 =C2=B1  1%     -33.4%    2964529 =C2=B1  3%  iozone.262144KB_409=
6reclen.record_rewrite
   8536046 =C2=B1  1%     -17.6%    7029910 =C2=B1  0%  iozone.131072KB_204=
8reclen.freread
  11235457 =C2=B1 10%     -46.6%    5999172 =C2=B1 18%  iozone.64KB_8reclen=
.freread
   3585860 =C2=B1  0%     -34.2%    2358593 =C2=B1  0%  iozone.131072KB_204=
8reclen.fwrite
   9038144 =C2=B1  0%     -31.5%    6194380 =C2=B1  0%  iozone.262144KB_64r=
eclen.reread
   7062785 =C2=B1 19%     +27.2%    8982751 =C2=B1  0%  iozone.16384KB_1024=
reclen.read
   3950846 =C2=B1  8%     -26.8%    2893048 =C2=B1  0%  iozone.131072KB_204=
8reclen.write
   9696357 =C2=B1 23%     +36.1%   13196984 =C2=B1  0%  iozone.4096KB_64rec=
len.random_read
   4977030 =C2=B1 11%     -25.7%    3700119 =C2=B1  0%  iozone.262144KB_64r=
eclen.random_write
   3992512 =C2=B1 20%     +31.1%    5233138 =C2=B1  0%  iozone.131072KB_163=
84reclen.reread
   6816595 =C2=B1 17%     +25.3%    8538164 =C2=B1  0%  iozone.8192KB_512re=
clen.freread
   2915623 =C2=B1 19%     +10.5%    3221728 =C2=B1 16%  iozone.16384KB_4096=
reclen.write
   3998465 =C2=B1  6%     -29.3%    2825277 =C2=B1  0%  iozone.262144KB_819=
2reclen.random_write
   5300007 =C2=B1  6%     -35.0%    3444156 =C2=B1  4%  iozone.131072KB_204=
8reclen.random_write
   5816163 =C2=B1  2%     +41.6%    8237185 =C2=B1  0%  iozone.8192KB_1024r=
eclen.bkwd_read
   7152954 =C2=B1  0%     -29.7%    5028185 =C2=B1  1%  iozone.8192KB_4recl=
en.fread
   6734662 =C2=B1 16%     +24.6%    8394385 =C2=B1  1%  iozone.4096KB_256re=
clen.random_write
   3713447 =C2=B1  4%     +39.5%    5179264 =C2=B1  0%  iozone.524288KB_819=
2reclen.freread
   2921618 =C2=B1 13%     -21.7%    2288382 =C2=B1  0%  iozone.64KB_8reclen=
.fwrite
   4720964 =C2=B1  6%     +22.1%    5764336 =C2=B1 11%  iozone.128KB_128rec=
len.record_rewrite
   8197712 =C2=B1 14%     -27.5%    5942111 =C2=B1  4%  iozone.262144KB_204=
8reclen.random_read
   3250503 =C2=B1 17%     +29.7%    4215130 =C2=B1  0%  iozone.8192KB_8192r=
eclen.frewrite
   3539923 =C2=B1  9%     -22.0%    2762574 =C2=B1  5%  iozone.256KB_16recl=
en.fwrite
   8277227 =C2=B1  1%     -27.2%    6029824 =C2=B1  0%  iozone.8192KB_16rec=
len.reread
   5988294 =C2=B1  2%     +19.7%    7168885 =C2=B1 14%  iozone.8192KB_32rec=
len.fread
   5140772 =C2=B1  0%     -26.8%    3761046 =C2=B1  0%  iozone.524288KB_163=
84reclen.reread
   5352979 =C2=B1 12%     -29.3%    3785540 =C2=B1  7%  iozone.512KB_64recl=
en.rewrite
   7493022 =C2=B1 18%     +29.3%    9689073 =C2=B1 10%  iozone.4096KB_64rec=
len.reread
   6782461 =C2=B1 12%     +23.9%    8403419 =C2=B1  1%  iozone.256KB_32recl=
en.fread
   4272580 =C2=B1  2%     -27.9%    3080979 =C2=B1  0%  iozone.262144KB_204=
8reclen.write
   4182353 =C2=B1 12%     +26.3%    5281188 =C2=B1  0%  iozone.65536KB_8192=
reclen.read
   7724548 =C2=B1  0%      -2.5%    7529971 =C2=B1  1%  iozone.4096KB_4096r=
eclen.reread
   9585735 =C2=B1  9%     +25.5%   12034330 =C2=B1  3%  iozone.2048KB_64rec=
len.reread
   4328543 =C2=B1 21%     -30.2%    3020814 =C2=B1  0%  iozone.131072KB_819=
2reclen.stride_read
   5474696 =C2=B1 34%     +45.3%    7955774 =C2=B1  1%  iozone.8192KB_2048r=
eclen.freread
   6145365 =C2=B1  3%     +18.1%    7258564 =C2=B1 14%  iozone.8192KB_64rec=
len.stride_read
   8875731 =C2=B1 10%     +39.5%   12377375 =C2=B1  2%  iozone.2048KB_512re=
clen.reread
   7740075 =C2=B1  3%     +25.8%    9739699 =C2=B1  6%  iozone.2048KB_32rec=
len.read
   6901705 =C2=B1 20%     +26.7%    8744111 =C2=B1  4%  iozone.1024KB_16rec=
len.fread
   8359584 =C2=B1  1%     +27.6%   10668396 =C2=B1  3%  iozone.256KB_64recl=
en.stride_read
   8450512 =C2=B1  5%     +31.3%   11091721 =C2=B1  0%  iozone.256KB_256rec=
len.stride_read
   4355136 =C2=B1  2%     +25.6%    5468706 =C2=B1  5%  iozone.512KB_32recl=
en.frewrite
   5208724 =C2=B1  1%     -32.6%    3508395 =C2=B1 11%  iozone.32768KB_1638=
4reclen.random_read
   3209577 =C2=B1 13%     -19.0%    2598777 =C2=B1  0%  iozone.32768KB_1638=
4reclen.write
   8195860 =C2=B1  2%     -26.3%    6041688 =C2=B1  0%  iozone.8192KB_16rec=
len.read
   5404751 =C2=B1  3%     +30.9%    7075305 =C2=B1 13%  iozone.128KB_128rec=
len.random_write
   9151836 =C2=B1  1%     -25.5%    6820128 =C2=B1  0%  iozone.262144KB_102=
4reclen.read
   5093159 =C2=B1  3%     -30.9%    3516955 =C2=B1 11%  iozone.65536KB_1638=
4reclen.stride_read
   7331754 =C2=B1 13%     +17.9%    8641522 =C2=B1  2%  iozone.32768KB_256r=
eclen.freread
   8045454 =C2=B1  2%     -24.6%    6066614 =C2=B1  0%  iozone.8192KB_16rec=
len.freread
   4727302 =C2=B1 25%     +35.8%    6417749 =C2=B1 10%  iozone.64KB_8reclen=
.bkwd_read
   3122931 =C2=B1  8%     +25.8%    3929301 =C2=B1  0%  iozone.524288KB_64r=
eclen.write
   3809641 =C2=B1 13%     +23.2%    4694921 =C2=B1  9%  iozone.65536KB_8192=
reclen.fread
  10294877 =C2=B1 22%     +34.1%   13809422 =C2=B1  2%  iozone.256KB_32recl=
en.random_read
   3875132 =C2=B1  3%     -25.7%    2878020 =C2=B1  0%  iozone.262144KB_819=
2reclen.record_rewrite
   3521943 =C2=B1  0%     +19.8%    4218470 =C2=B1  9%  iozone.16384KB_256r=
eclen.write
   3263246 =C2=B1 11%     -20.5%    2592835 =C2=B1  3%  iozone.131072KB_819=
2reclen.record_rewrite
   9118649 =C2=B1  5%     +18.3%   10790863 =C2=B1 10%  iozone.512KB_64recl=
en.reread
   4387342 =C2=B1  1%      +4.1%    4566992 =C2=B1  0%  iozone.32768KB_4096=
reclen.record_rewrite
   7716943 =C2=B1  6%     +16.4%    8980781 =C2=B1  6%  iozone.1024KB_64rec=
len.bkwd_read
   8751240 =C2=B1  0%     -11.6%    7738113 =C2=B1  0%  iozone.131072KB_102=
4reclen.reread
   5503178 =C2=B1  1%     -29.4%    3885602 =C2=B1 10%  iozone.131072KB_409=
6reclen.freread
   8867546 =C2=B1  4%     +15.7%   10257049 =C2=B1  8%  iozone.1024KB_256re=
clen.bkwd_read
   6118367 =C2=B1  6%     +12.5%    6880962 =C2=B1 11%  iozone.8192KB_128re=
clen.bkwd_read
   7474083 =C2=B1 10%     +19.8%    8950225 =C2=B1  0%  iozone.65536KB_2048=
reclen.freread
   1902231 =C2=B1 11%     +14.8%    2183057 =C2=B1  5%  iozone.64KB_4reclen=
.record_rewrite
   6412619 =C2=B1  6%     +12.4%    7206535 =C2=B1 10%  iozone.8192KB_32rec=
len.freread
   2383411 =C2=B1  6%     +20.7%    2877496 =C2=B1  9%  iozone.8192KB_8192r=
eclen.write
   6474625 =C2=B1  4%     -31.5%    4437342 =C2=B1 15%  iozone.256KB_64recl=
en.record_rewrite
   7551263 =C2=B1 12%     +17.6%    8877760 =C2=B1  0%  iozone.32768KB_128r=
eclen.freread
   7258589 =C2=B1  6%     +11.1%    8061492 =C2=B1 10%  iozone.1024KB_128re=
clen.random_write
   2318350 =C2=B1  3%     +20.7%    2797222 =C2=B1  4%  iozone.128KB_32recl=
en.write
   9532159 =C2=B1  6%     -28.4%    6824469 =C2=B1  5%  iozone.2048KB_128re=
clen.bkwd_read
   9810530 =C2=B1  9%     -23.8%    7480347 =C2=B1  7%  iozone.256KB_4recle=
n.freread
   7178801 =C2=B1  6%     +26.8%    9104334 =C2=B1  1%  iozone.2048KB_512re=
clen.fread
   4073068 =C2=B1  5%     +27.3%    5183826 =C2=B1  1%  iozone.8192KB_512re=
clen.fwrite
   5217651 =C2=B1  0%     -20.9%    4129184 =C2=B1  4%  iozone.131072KB_102=
4reclen.random_write
   3568302 =C2=B1 10%     -27.8%    2577833 =C2=B1  2%  iozone.131072KB_819=
2reclen.random_write
   4348780 =C2=B1 11%     +10.8%    4818282 =C2=B1 10%  iozone.512KB_32recl=
en.fwrite
   9316483 =C2=B1  6%     -28.2%    6687738 =C2=B1  4%  iozone.1024KB_4recl=
en.read
   6755316 =C2=B1 14%     +19.5%    8070595 =C2=B1  3%  iozone.4096KB_64rec=
len.random_write
   4996612 =C2=B1  2%     -20.5%    3974292 =C2=B1  1%  iozone.524288KB_819=
2reclen.reread
   4363175 =C2=B1  6%     +14.6%    4999657 =C2=B1  6%  iozone.256KB_128rec=
len.fwrite
   4250330 =C2=B1  5%      +7.5%    4567501 =C2=B1  1%  iozone.65536KB_4096=
reclen.record_rewrite
   4856767 =C2=B1 10%     -15.9%    4085386 =C2=B1  1%  iozone.65536KB_8192=
reclen.reread
   3894694 =C2=B1 10%     +15.3%    4489754 =C2=B1  0%  iozone.65536KB_256r=
eclen.write
   4489243 =C2=B1  4%     +12.5%    5049573 =C2=B1  7%  iozone.1024KB_32rec=
len.frewrite
   4854507 =C2=B1  6%     -13.4%    4206416 =C2=B1  2%  iozone.262144KB_819=
2reclen.reread
  10392729 =C2=B1  6%     -30.2%    7253300 =C2=B1 17%  iozone.256KB_16recl=
en.stride_read
   8034794 =C2=B1  6%     -23.0%    6187632 =C2=B1  9%  iozone.131072KB_204=
8reclen.reread
   3663595 =C2=B1 24%     +25.2%    4586005 =C2=B1  6%  iozone.64KB_32recle=
n.random_write
   3426596 =C2=B1  2%     -23.6%    2617824 =C2=B1  0%  iozone.32768KB_8192=
reclen.write
  10121807 =C2=B1 11%     -21.5%    7949244 =C2=B1  2%  iozone.512KB_64recl=
en.freread
   8849875 =C2=B1  2%      +4.6%    9254086 =C2=B1  0%  iozone.65536KB_128r=
eclen.random_read
   6922909 =C2=B1 14%     +27.7%    8843304 =C2=B1  1%  iozone.65536KB_256r=
eclen.bkwd_read
   4762555 =C2=B1 13%     -23.2%    3656779 =C2=B1  5%  iozone.128KB_32recl=
en.record_rewrite
   7493376 =C2=B1 12%     +14.0%    8542375 =C2=B1  4%  iozone.4096KB_16rec=
len.stride_read
   7404571 =C2=B1 11%     +16.0%    8587206 =C2=B1  0%  iozone.16384KB_8rec=
len.reread
   2252570 =C2=B1  1%     +17.3%    2643162 =C2=B1  4%  iozone.512KB_4recle=
n.write
   8221058 =C2=B1 12%     -28.4%    5886115 =C2=B1 11%  iozone.256KB_32recl=
en.bkwd_read
   9117257 =C2=B1 18%     +23.5%   11256055 =C2=B1  1%  iozone.512KB_8recle=
n.freread
   7731661 =C2=B1  2%     +15.0%    8894151 =C2=B1  5%  iozone.2048KB_16rec=
len.stride_read
    578942 =C2=B1 10%     +13.3%     656090 =C2=B1  8%  iozone.64KB_32reclen
  13443230 =C2=B1  7%     -14.5%   11497132 =C2=B1  1%  iozone.512KB_32recl=
en.random_read
    472463 =C2=B1  3%     -19.2%     381698 =C2=B1  0%  iozone.131072KB_409=
6reclen
   8025688 =C2=B1 13%     +18.2%    9485232 =C2=B1  0%  iozone.1024KB_16rec=
len.bkwd_read
   3883697 =C2=B1  6%     +19.5%    4640601 =C2=B1  1%  iozone.16384KB_64re=
clen.write
   8604036 =C2=B1 10%     +22.9%   10573638 =C2=B1  3%  iozone.512KB_256rec=
len.freread
    687415 =C2=B1  5%     -18.7%     558826 =C2=B1  3%  iozone.131072KB_204=
8reclen
   8888491 =C2=B1  7%     +14.8%   10202126 =C2=B1  3%  iozone.2048KB_32rec=
len.stride_read
   7718415 =C2=B1  9%     +13.3%    8747529 =C2=B1  0%  iozone.131072KB_64r=
eclen.bkwd_read
   8188173 =C2=B1  6%     +10.9%    9083352 =C2=B1  6%  iozone.512KB_512rec=
len.stride_read
   5822892 =C2=B1  9%     -13.4%    5044342 =C2=B1  1%  iozone.512KB_128rec=
len.frewrite
   7510973 =C2=B1  3%     +22.8%    9225029 =C2=B1  0%  iozone.524288KB_512=
reclen.stride_read
   9732731 =C2=B1 12%     +25.1%   12175311 =C2=B1  1%  iozone.1024KB_128re=
clen.reread
   3910528 =C2=B1  8%     +13.4%    4433939 =C2=B1  1%  iozone.1024KB_128re=
clen.write
   5229285 =C2=B1  0%     +17.5%    6143606 =C2=B1  2%  iozone.2048KB_2048r=
eclen.fwrite
   3740977 =C2=B1  3%      +7.3%    4013075 =C2=B1  8%  iozone.65536KB_512r=
eclen.write
   7973715 =C2=B1  5%     +15.9%    9240823 =C2=B1  3%  iozone.2048KB_64rec=
len.read
   5347544 =C2=B1  4%     -12.6%    4674344 =C2=B1  6%  iozone.512KB_64recl=
en.fwrite
   9148256 =C2=B1  9%     +10.0%   10066331 =C2=B1  5%  iozone.2048KB_256re=
clen.freread
   7532427 =C2=B1  2%     +20.0%    9038408 =C2=B1  0%  iozone.524288KB_64r=
eclen.random_read
   9116693 =C2=B1  0%     -16.3%    7627555 =C2=B1  0%  iozone.262144KB_102=
4reclen.bkwd_read
   9293134 =C2=B1 18%     +19.5%   11103803 =C2=B1  7%  iozone.2048KB_1024r=
eclen.read
   3610496 =C2=B1  0%      +2.1%    3684779 =C2=B1  0%  iozone.262144KB_204=
8reclen.fwrite
   2841895 =C2=B1  6%     +13.6%    3228081 =C2=B1  0%  iozone.8192KB_4096r=
eclen.fwrite
   3318265 =C2=B1  5%      +8.9%    3612894 =C2=B1  4%  iozone.512KB_8recle=
n.frewrite
   7649887 =C2=B1  5%     +11.8%    8552670 =C2=B1  5%  iozone.2048KB_256re=
clen.fread
   4824041 =C2=B1  9%     +13.5%    5477321 =C2=B1  3%  iozone.2048KB_1024r=
eclen.fwrite
   2321590 =C2=B1  2%     +15.0%    2670161 =C2=B1  2%  iozone.256KB_4recle=
n.frewrite
   9060990 =C2=B1  1%     -15.5%    7655972 =C2=B1  0%  iozone.524288KB_512=
reclen.random_read
   4358431 =C2=B1 12%     -18.7%    3543052 =C2=B1  4%  iozone.131072KB_819=
2reclen.freread
   4348859 =C2=B1  4%     +10.8%    4817434 =C2=B1  4%  iozone.4096KB_16rec=
len.fwrite
   2489477 =C2=B1  7%     +10.2%    2743734 =C2=B1  1%  iozone.4096KB_4recl=
en.rewrite
   5103733 =C2=B1  0%      +3.4%    5279726 =C2=B1  0%  iozone.262144KB_819=
2reclen.stride_read
   3046196 =C2=B1 10%     -17.9%    2500831 =C2=B1  1%  iozone.131072KB_163=
84reclen.record_rewrite
   5121586 =C2=B1  2%     -16.7%    4265243 =C2=B1  1%  iozone.256KB_16recl=
en.random_write
   4094339 =C2=B1  5%     -10.8%    3653574 =C2=B1  0%  iozone.131072KB_102=
4reclen.write
  12251829 =C2=B1  7%     +11.4%   13652899 =C2=B1  0%  iozone.512KB_512rec=
len.random_read
   7690315 =C2=B1  7%     +15.2%    8860546 =C2=B1  0%  iozone.65536KB_256r=
eclen.freread
   3898899 =C2=B1  6%     +11.4%    4341836 =C2=B1  0%  iozone.16384KB_16re=
clen.random_write
   8052112 =C2=B1  4%     +12.3%    9041701 =C2=B1  4%  iozone.2048KB_8recl=
en.read
   5168943 =C2=B1  6%     -15.5%    4367526 =C2=B1  0%  iozone.2048KB_128re=
clen.fwrite
   3728684 =C2=B1  1%     +13.5%    4233448 =C2=B1  0%  iozone.512KB_128rec=
len.write
  10231887 =C2=B1 14%     -18.5%    8334367 =C2=B1  2%  iozone.512KB_4recle=
n.reread
   4976350 =C2=B1  6%     -16.7%    4147433 =C2=B1  4%  iozone.512KB_16recl=
en.random_write
   5746415 =C2=B1 12%     -30.8%    3976333 =C2=B1 19%  iozone.256KB_64recl=
en.frewrite
   7090255 =C2=B1 25%     +26.7%    8986290 =C2=B1  0%  iozone.32768KB_64re=
clen.fread
   9078196 =C2=B1  1%     -14.4%    7769083 =C2=B1  1%  iozone.262144KB_102=
4reclen.reread
    718806 =C2=B1  4%     +13.0%     812074 =C2=B1  0%  iozone.64KB_64reclen
   3747212 =C2=B1  9%     -19.6%    3014476 =C2=B1  7%  iozone.256KB_16recl=
en.frewrite
   4284349 =C2=B1  0%     -15.1%    3636384 =C2=B1 12%  iozone.131072KB_102=
4reclen.fwrite
   3432219 =C2=B1  5%      +8.2%    3714618 =C2=B1  6%  iozone.8192KB_4096r=
eclen.freread
   4877605 =C2=B1  7%     +11.2%    5423051 =C2=B1  3%  iozone.2048KB_128re=
clen.rewrite
   4039676 =C2=B1  9%     +13.9%    4601332 =C2=B1  0%  iozone.65536KB_128r=
eclen.write
   2995131 =C2=B1  7%     +14.2%    3420783 =C2=B1  5%  iozone.256KB_8recle=
n.fwrite
   8335424 =C2=B1  5%     +11.0%    9254346 =C2=B1  0%  iozone.262144KB_102=
4reclen.fread
   4847523 =C2=B1  0%     -12.9%    4221362 =C2=B1  0%  iozone.131072KB_512=
reclen.fwrite
  10976125 =C2=B1  6%     +15.2%   12646489 =C2=B1  2%  iozone.1024KB_128re=
clen.stride_read
  10787523 =C2=B1  6%      +5.6%   11391254 =C2=B1  4%  iozone.1024KB_64rec=
len.stride_read
   8384570 =C2=B1  6%      +8.8%    9124939 =C2=B1  4%  iozone.1024KB_1024r=
eclen.fread
   4668456 =C2=B1  3%     +10.0%    5137186 =C2=B1  1%  iozone.1024KB_256re=
clen.rewrite
   3077664 =C2=B1 11%     +15.1%    3541009 =C2=B1  5%  iozone.512KB_8recle=
n.rewrite
   5041323 =C2=B1  3%      +8.2%    5452436 =C2=B1  4%  iozone.2048KB_1024r=
eclen.rewrite
  14889499 =C2=B1  4%     -31.4%   10212181 =C2=B1 25%  iozone.128KB_32recl=
en.random_read
   9904025 =C2=B1  5%     -19.4%    7984004 =C2=B1  6%  iozone.2048KB_128re=
clen.read
   5050003 =C2=B1  6%     +16.8%    5896199 =C2=B1  0%  iozone.32768KB_1024=
reclen.random_write
   3624991 =C2=B1  5%      +4.0%    3770555 =C2=B1  6%  iozone.1024KB_8recl=
en.fwrite
   7916217 =C2=B1 18%     +15.2%    9116069 =C2=B1  6%  iozone.4096KB_128re=
clen.reread
   6698440 =C2=B1  2%     -14.3%    5741172 =C2=B1  3%  iozone.1024KB_1024r=
eclen.fwrite
   8067814 =C2=B1  5%     -18.4%    6580711 =C2=B1  4%  iozone.2048KB_8recl=
en.bkwd_read
   8789340 =C2=B1  0%      -7.7%    8109325 =C2=B1  5%  iozone.131072KB_128=
reclen.reread
   4839847 =C2=B1  4%     -17.2%    4006617 =C2=B1  3%  iozone.512KB_512rec=
len.rewrite
   9400749 =C2=B1  4%      +8.4%   10192299 =C2=B1  0%  iozone.2048KB_4recl=
en.random_read
   4455272 =C2=B1  2%     -17.5%    3676614 =C2=B1  5%  iozone.1024KB_16rec=
len.fwrite
   3114613 =C2=B1  3%      +7.1%    3334851 =C2=B1  5%  iozone.1024KB_8recl=
en.write
   4980243 =C2=B1  8%      +9.2%    5438915 =C2=B1  2%  iozone.8192KB_128re=
clen.fwrite
   3785353 =C2=B1  7%      +8.0%    4090008 =C2=B1  2%  iozone.1024KB_32rec=
len.write
         8 =C2=B1  0%     +12.5%          9 =C2=B1  0%  iozone.time.percent=
_of_cpu_this_job_got
    620886 =C2=B1  3%      +8.8%     675294 =C2=B1  1%  iozone.524288KB_204=
8reclen
   3413236 =C2=B1  5%      +5.0%    3582992 =C2=B1  5%  iozone.1024KB_8recl=
en.rewrite
    618456 =C2=B1  4%      +4.4%     645493 =C2=B1  4%  iozone.8192KB_32rec=
len
   8315952 =C2=B1  4%      +7.5%    8943417 =C2=B1  1%  iozone.65536KB_256r=
eclen.reread
   7913618 =C2=B1  6%     +11.8%    8845045 =C2=B1  0%  iozone.16384KB_128r=
eclen.random_read
   4233723 =C2=B1  3%      +5.6%    4469238 =C2=B1  4%  iozone.4096KB_16rec=
len.rewrite
   7895734 =C2=B1  4%     -18.7%    6416209 =C2=B1 13%  iozone.4096KB_16rec=
len.bkwd_read
   4481824 =C2=B1  2%     +19.5%    5355949 =C2=B1  0%  iozone.8192KB_64rec=
len.fwrite
   8631125 =C2=B1  5%      +7.4%    9265669 =C2=B1  0%  iozone.65536KB_2048=
reclen.random_read
   3004260 =C2=B1 19%     +15.7%    3477316 =C2=B1  5%  iozone.128KB_128rec=
len.write
   5138964 =C2=B1  8%     +15.2%    5918377 =C2=B1  0%  iozone.4096KB_64rec=
len.fwrite
   8558023 =C2=B1  5%      +7.5%    9203339 =C2=B1  3%  iozone.256KB_4recle=
n.reread
   2286884 =C2=B1  2%      +8.0%    2470446 =C2=B1  3%  iozone.64KB_16recle=
n.fwrite
   3932842 =C2=B1  3%      +8.5%    4266645 =C2=B1  1%  iozone.1024KB_16rec=
len.rewrite
   4558245 =C2=B1  0%     -10.3%    4089833 =C2=B1  0%  iozone.8192KB_16rec=
len.random_write
   4386732 =C2=B1  0%     -14.5%    3749266 =C2=B1  0%  iozone.32768KB_512r=
eclen.write
   7341150 =C2=B1  4%      +6.4%    7813536 =C2=B1  1%  iozone.16384KB_8rec=
len.random_read
   8376231 =C2=B1  3%      +9.0%    9126687 =C2=B1  1%  iozone.2048KB_512re=
clen.read
   8032190 =C2=B1  3%     +11.3%    8938556 =C2=B1  0%  iozone.65536KB_256r=
eclen.read
  10922099 =C2=B1 24%     +30.0%   14200794 =C2=B1  0%  iozone.128KB_128rec=
len.read
   5344071 =C2=B1  1%      +7.2%    5728578 =C2=B1  3%  iozone.2048KB_32rec=
len.fwrite
   3539347 =C2=B1  4%      +6.6%    3774150 =C2=B1  1%  iozone.65536KB_2048=
reclen.fwrite
   2805718 =C2=B1  4%     -18.9%    2274675 =C2=B1 12%  iozone.4096KB_4recl=
en.record_rewrite
   4812062 =C2=B1  7%      +9.2%    5256356 =C2=B1  0%  iozone.32768KB_8192=
reclen.reread
    393057 =C2=B1  4%      +6.2%     417250 =C2=B1  1%  iozone.524288KB_819=
2reclen
   7219552 =C2=B1  5%      +7.9%    7786633 =C2=B1  1%  iozone.2048KB_1024r=
eclen.record_rewrite
   5259188 =C2=B1  1%     -17.1%    4358000 =C2=B1  9%  iozone.262144KB_163=
84reclen.reread
   8092792 =C2=B1  6%      +9.1%    8829873 =C2=B1  0%  iozone.16384KB_2048=
reclen.read
    718746 =C2=B1  2%      +6.6%     765960 =C2=B1  1%  iozone.2048KB_16rec=
len
   9683795 =C2=B1  3%     -29.0%    6879528 =C2=B1 28%  iozone.4096KB_2048r=
eclen.stride_read
   4110070 =C2=B1  4%      +6.3%    4368383 =C2=B1  1%  iozone.1024KB_8recl=
en.record_rewrite
   8039446 =C2=B1  5%      +9.3%    8785884 =C2=B1  0%  iozone.16384KB_256r=
eclen.reread
   8484403 =C2=B1  3%      +4.7%    8883833 =C2=B1  0%  iozone.32768KB_256r=
eclen.random_read
  12636319 =C2=B1  6%     -16.0%   10611712 =C2=B1  7%  iozone.1024KB_1024r=
eclen.read
   6763506 =C2=B1 14%     +19.4%    8077808 =C2=B1  0%  iozone.4096KB_256re=
clen.fread
   7476510 =C2=B1  1%      +6.5%    7962242 =C2=B1  3%  iozone.4096KB_512re=
clen.record_rewrite
    749887 =C2=B1  4%      +7.1%     803484 =C2=B1  0%  iozone.4096KB_256re=
clen
   8207035 =C2=B1  2%     -12.5%    7178405 =C2=B1  9%  iozone.2048KB_128re=
clen.record_rewrite
   4138686 =C2=B1  9%     +11.8%    4625728 =C2=B1  2%  iozone.256KB_64recl=
en.rewrite
   2571399 =C2=B1  1%      -9.5%    2326457 =C2=B1  1%  iozone.2048KB_4recl=
en.frewrite
   7552793 =C2=B1  2%      +5.8%    7989546 =C2=B1  2%  iozone.65536KB_2048=
reclen.record_rewrite
   8295281 =C2=B1  1%      +5.8%    8779713 =C2=B1  3%  iozone.8192KB_128re=
clen.read
   5597466 =C2=B1  1%     -15.1%    4750831 =C2=B1  8%  iozone.262144KB_409=
6reclen.reread
   3280285 =C2=B1  0%      +1.8%    3337806 =C2=B1  0%  iozone.262144KB_819=
2reclen.fwrite
   2576207 =C2=B1  3%      +5.2%    2711076 =C2=B1  3%  iozone.1024KB_4recl=
en.write
    678845 =C2=B1  3%      +3.9%     705564 =C2=B1  3%  iozone.524288KB_256=
reclen
  12627771 =C2=B1  2%     -10.7%   11275314 =C2=B1  4%  iozone.2048KB_2048r=
eclen.random_read
   3677955 =C2=B1  3%      +4.6%    3848068 =C2=B1  1%  iozone.16384KB_8rec=
len.rewrite
    722786 =C2=B1  1%      -7.9%     666043 =C2=B1  0%  iozone.131072KB_102=
4reclen
   7960527 =C2=B1 14%     +17.3%    9340298 =C2=B1  0%  iozone.65536KB_128r=
eclen.reread
   3502223 =C2=B1 19%     +19.0%    4167876 =C2=B1  1%  iozone.16384KB_4096=
reclen.rewrite
   5551577 =C2=B1  1%     -14.1%    4769927 =C2=B1  0%  iozone.131072KB_256=
reclen.random_write
   8696931 =C2=B1  0%     -11.2%    7724092 =C2=B1  3%  iozone.131072KB_128=
reclen.fread
   4069311 =C2=B1  6%      +9.2%    4442327 =C2=B1  0%  iozone.2048KB_8recl=
en.record_rewrite
    722377 =C2=B1  2%      -9.9%     651034 =C2=B1  2%  iozone.262144KB_204=
8reclen
   1834196 =C2=B1 25%     +20.4%    2209265 =C2=B1  3%  iozone.128KB_4recle=
n.write
   5138057 =C2=B1  1%     -11.0%    4571125 =C2=B1  2%  iozone.524288KB_163=
84reclen.random_read
   8282824 =C2=B1  3%      -9.1%    7531868 =C2=B1  0%  iozone.262144KB_256=
reclen.bkwd_read
  14346407 =C2=B1  2%     -10.6%   12826594 =C2=B1  4%  iozone.512KB_64recl=
en.random_read
   8610754 =C2=B1  3%      +3.1%    8879944 =C2=B1  3%  iozone.65536KB_512r=
eclen.random_read
   6283152 =C2=B1 37%     +32.0%    8295378 =C2=B1  1%  iozone.16384KB_8rec=
len.fread
   8681267 =C2=B1  0%     -18.2%    7099340 =C2=B1 12%  iozone.16384KB_512r=
eclen.bkwd_read
   4371321 =C2=B1  7%      +7.6%    4705433 =C2=B1  4%  iozone.1024KB_32rec=
len.rewrite
   4862202 =C2=B1  1%      +6.9%    5200107 =C2=B1  1%  iozone.4096KB_256re=
clen.rewrite
   5590147 =C2=B1  6%      +6.9%    5973519 =C2=B1  2%  iozone.2048KB_64rec=
len.fwrite
   8615326 =C2=B1  3%      -9.3%    7815110 =C2=B1  4%  iozone.262144KB_512=
reclen.bkwd_read
   8623349 =C2=B1  3%      +6.7%    9199759 =C2=B1  0%  iozone.524288KB_128=
reclen.stride_read
      1290 =C2=B1  0%      -8.9%       1175 =C2=B1  0%  iozone.time.elapsed=
_time
      1290 =C2=B1  0%      -8.9%       1175 =C2=B1  0%  iozone.time.elapsed=
_time.max
   5118732 =C2=B1  2%      -8.9%    4664576 =C2=B1  1%  iozone.262144KB_512=
reclen.rewrite
   5397923 =C2=B1  4%      +5.6%    5702108 =C2=B1  1%  iozone.32768KB_2048=
reclen.random_write
   8418676 =C2=B1  3%      +5.5%    8881409 =C2=B1  0%  iozone.131072KB_256=
reclen.stride_read
   4219879 =C2=B1  1%     -19.3%    3405999 =C2=B1 14%  iozone.16384KB_1638=
4reclen.random_write
   4212419 =C2=B1  2%     -14.5%    3600701 =C2=B1  9%  iozone.512KB_8recle=
n.record_rewrite
   5690229 =C2=B1  4%      +5.9%    6028126 =C2=B1  0%  iozone.16384KB_4096=
reclen.random_read
   4177221 =C2=B1  2%     -11.6%    3691015 =C2=B1  5%  iozone.512KB_16recl=
en.frewrite
   3632679 =C2=B1  2%      +7.5%    3906683 =C2=B1  2%  iozone.65536KB_1638=
4reclen.rewrite
    630500 =C2=B1  0%      -7.3%     584468 =C2=B1  0%  iozone.8192KB_16rec=
len
    476250 =C2=B1  1%      -5.2%     451306 =C2=B1  0%  iozone.262144KB_409=
6reclen
   4761764 =C2=B1  3%     -13.8%    4105680 =C2=B1  7%  iozone.1024KB_16rec=
len.frewrite
    440579 =C2=B1  2%      -5.1%     417928 =C2=B1  0%  iozone.262144KB_819=
2reclen
   4944802 =C2=B1  4%      +6.7%    5275429 =C2=B1  0%  iozone.4096KB_64rec=
len.frewrite
   8388834 =C2=B1  4%      +5.9%    8881159 =C2=B1  0%  iozone.65536KB_256r=
eclen.random_read
  13208377 =C2=B1  3%      -8.8%   12044935 =C2=B1  2%  iozone.1024KB_256re=
clen.reread
   3267837 =C2=B1  1%     +11.8%    3653307 =C2=B1  1%  iozone.16384KB_1024=
reclen.write
   2934685 =C2=B1 11%     +11.5%    3273363 =C2=B1  0%  iozone.524288KB_819=
2reclen.frewrite
   8298872 =C2=B1  3%      +5.5%    8754890 =C2=B1  3%  iozone.16384KB_128r=
eclen.bkwd_read
   5310937 =C2=B1  4%      +9.1%    5796197 =C2=B1  0%  iozone.262144KB_409=
6reclen.freread
   7770699 =C2=B1 14%     +14.6%    8905169 =C2=B1  2%  iozone.65536KB_128r=
eclen.bkwd_read
    539518 =C2=B1  1%      +3.7%     559486 =C2=B1  3%  iozone.256KB_4reclen
   4301008 =C2=B1 16%     +18.0%    5076857 =C2=B1  0%  iozone.131072KB_819=
2reclen.bkwd_read
   7490770 =C2=B1  3%      +2.1%    7650614 =C2=B1  3%  iozone.2048KB_64rec=
len.record_rewrite
   8474515 =C2=B1  2%      +8.6%    9201379 =C2=B1  0%  iozone.131072KB_128=
reclen.bkwd_read
   9752632 =C2=B1  3%      +1.9%    9935002 =C2=B1  3%  iozone.8192KB_128re=
clen.random_read
   5918384 =C2=B1 12%     +10.5%    6539287 =C2=B1  3%  iozone.2048KB_4recl=
en.bkwd_read
   2646987 =C2=B1  5%      +7.8%    2853445 =C2=B1  0%  iozone.4096KB_4recl=
en.write
   8244553 =C2=B1  4%      +9.6%    9037092 =C2=B1  0%  iozone.16384KB_128r=
eclen.reread
   8103373 =C2=B1  7%      +8.7%    8807564 =C2=B1  2%  iozone.131072KB_512=
reclen.bkwd_read
   8695727 =C2=B1  5%      +5.5%    9177772 =C2=B1  2%  iozone.16384KB_64re=
clen.random_read
   5117574 =C2=B1  1%      +4.6%    5353731 =C2=B1  1%  iozone.2048KB_64rec=
len.rewrite
   8499282 =C2=B1  1%      +6.5%    9049599 =C2=B1  0%  iozone.131072KB_512=
reclen.stride_read
    736436 =C2=B1  0%      -5.7%     694742 =C2=B1  0%  iozone.131072KB_512=
reclen
  13251967 =C2=B1  5%      +7.4%   14226322 =C2=B1  0%  iozone.2048KB_64rec=
len.random_read
   4842288 =C2=B1  3%      +6.8%    5172749 =C2=B1  1%  iozone.32768KB_8192=
reclen.random_read
   5632428 =C2=B1  3%      +6.0%    5971338 =C2=B1  2%  iozone.16384KB_128r=
eclen.random_write
   8232506 =C2=B1 10%      +8.7%    8946073 =C2=B1  1%  iozone.16384KB_256r=
eclen.random_read
   5224250 =C2=B1  1%      +4.5%    5457558 =C2=B1  1%  iozone.131072KB_128=
reclen.rewrite
   7799129 =C2=B1  7%      +8.7%    8476105 =C2=B1  0%  iozone.131072KB_256=
reclen.bkwd_read
    706404 =C2=B1  6%      +7.5%     759081 =C2=B1  1%  iozone.4096KB_64rec=
len
   3741897 =C2=B1  4%      +6.3%    3976035 =C2=B1  1%  iozone.32768KB_4096=
reclen.rewrite
   7867821 =C2=B1  1%      +5.7%    8312843 =C2=B1  0%  iozone.131072KB_512=
reclen.record_rewrite
   3213089 =C2=B1  1%      +4.9%    3371794 =C2=B1  1%  iozone.262144KB_409=
6reclen.fwrite
   3963945 =C2=B1 18%     +16.8%    4628496 =C2=B1  0%  iozone.4096KB_2048r=
eclen.fwrite
  12632973 =C2=B1  4%      +8.7%   13731024 =C2=B1  0%  iozone.1024KB_16rec=
len.random_read
   5706448 =C2=B1  5%      +6.3%    6068351 =C2=B1  0%  iozone.16384KB_4096=
reclen.reread
  12029016 =C2=B1  3%      +7.4%   12922022 =C2=B1  0%  iozone.2048KB_16rec=
len.random_read
   8566438 =C2=B1  1%     -11.1%    7616198 =C2=B1  6%  iozone.131072KB_512=
reclen.reread
   1752687 =C2=B1 10%     +14.2%    2000974 =C2=B1  0%  iozone.128KB_4recle=
n.fwrite
   6353720 =C2=B1 21%     +17.1%    7442978 =C2=B1  1%  iozone.256KB_8recle=
n.bkwd_read
   7892141 =C2=B1 14%     +14.9%    9069494 =C2=B1  1%  iozone.65536KB_128r=
eclen.read
   5280056 =C2=B1  2%      -9.5%    4779680 =C2=B1  5%  iozone.8192KB_64rec=
len.frewrite
   3881212 =C2=B1  3%     -16.3%    3246640 =C2=B1 10%  iozone.262144KB_163=
84reclen.record_rewrite
   3634480 =C2=B1  2%      -6.7%    3390913 =C2=B1  0%  iozone.512KB_32recl=
en.write
   3599606 =C2=B1  6%      +9.4%    3939272 =C2=B1  0%  iozone.1024KB_8recl=
en.random_write
   8721661 =C2=B1  9%     -10.7%    7791708 =C2=B1  0%  iozone.256KB_4recle=
n.random_read
   2090471 =C2=B1 19%     -34.5%    1368296 =C2=B1 25%  iozone.64KB_4reclen=
.fwrite
   3820137 =C2=B1 17%     +16.0%    4430091 =C2=B1  0%  iozone.262144KB_102=
4reclen.frewrite
    848883 =C2=B1  3%      +4.1%     883999 =C2=B1  1%  iozone.512KB_128rec=
len
   2898218 =C2=B1 17%     +14.3%    3311275 =C2=B1  1%  iozone.16384KB_1638=
4reclen.write
    711350 =C2=B1  0%      +4.0%     739847 =C2=B1  1%  iozone.65536KB_256r=
eclen
    528192 =C2=B1  3%      +7.9%     570016 =C2=B1  0%  iozone.8192KB_2048r=
eclen
   4699597 =C2=B1  2%      +5.5%    4957064 =C2=B1  1%  iozone.4096KB_32rec=
len.frewrite
   5049490 =C2=B1  5%      -7.0%    4693935 =C2=B1  0%  iozone.16384KB_1638=
4reclen.read
   4192784 =C2=B1  1%     -16.0%    3519980 =C2=B1 12%  iozone.8192KB_4096r=
eclen.random_write
   8570663 =C2=B1  0%      +3.3%    8855987 =C2=B1  2%  iozone.65536KB_128r=
eclen.record_rewrite
   4278997 =C2=B1  0%      -5.4%    4046871 =C2=B1  0%  iozone.1024KB_64rec=
len.write
   8435258 =C2=B1  1%      -7.3%    7819757 =C2=B1  2%  iozone.131072KB_256=
reclen.reread
  13740909 =C2=B1  2%      -8.0%   12646489 =C2=B1  2%  iozone.1024KB_32rec=
len.random_read
   5393444 =C2=B1  2%      +3.5%    5581472 =C2=B1  1%  iozone.8192KB_128re=
clen.rewrite
   4817848 =C2=B1  1%      +3.8%    5000078 =C2=B1  1%  iozone.262144KB_512=
reclen.frewrite
   4751289 =C2=B1  1%      +3.3%    4908770 =C2=B1  1%  iozone.32768KB_2048=
reclen.rewrite
   5205405 =C2=B1  9%      +8.9%    5667739 =C2=B1  1%  iozone.16384KB_2048=
reclen.random_write
  14369401 =C2=B1  1%      +3.2%   14832934 =C2=B1  1%  iozone.512KB_128rec=
len.random_read
   8601039 =C2=B1  1%      +5.3%    9059717 =C2=B1  0%  iozone.131072KB_102=
4reclen.stride_read
   7725345 =C2=B1 19%     +16.2%    8980339 =C2=B1  0%  iozone.1024KB_512re=
clen.bkwd_read
   8189918 =C2=B1 10%     +10.9%    9085758 =C2=B1  1%  iozone.65536KB_512r=
eclen.freread
   5525682 =C2=B1  1%      -9.0%    5026193 =C2=B1  6%  iozone.131072KB_512=
reclen.random_write
   7186070 =C2=B1  3%      +4.5%    7509587 =C2=B1  1%  iozone.16384KB_4rec=
len.read
   5014894 =C2=B1  0%      +2.6%    5144714 =C2=B1  2%  iozone.131072KB_128=
reclen.frewrite
   8689927 =C2=B1  2%     -11.1%    7722061 =C2=B1  6%  iozone.524288KB_256=
reclen.bkwd_read
   7779429 =C2=B1  2%      -8.6%    7112578 =C2=B1  2%  iozone.1024KB_256re=
clen.record_rewrite
   5144245 =C2=B1  2%     -10.4%    4607355 =C2=B1  6%  iozone.16384KB_128r=
eclen.frewrite
   2693551 =C2=B1  3%      +3.4%    2785077 =C2=B1  1%  iozone.2048KB_4recl=
en.record_rewrite
   8968489 =C2=B1  0%     -10.0%    8070177 =C2=B1  5%  iozone.524288KB_128=
reclen.random_read
  13581297 =C2=B1  1%      +3.5%   14056095 =C2=B1  1%  iozone.512KB_256rec=
len.random_read
   8219973 =C2=B1  2%      -6.5%    7682016 =C2=B1  1%  iozone.262144KB_64r=
eclen.record_rewrite
   7435724 =C2=B1  5%      +5.7%    7861861 =C2=B1  2%  iozone.8192KB_512re=
clen.record_rewrite
   8406962 =C2=B1  1%      +6.6%    8965829 =C2=B1  0%  iozone.131072KB_204=
8reclen.stride_read
   3960043 =C2=B1  4%      -7.2%    3676895 =C2=B1  0%  iozone.16384KB_16re=
clen.write
   3478696 =C2=B1  2%      +5.6%    3672851 =C2=B1  0%  iozone.65536KB_2048=
reclen.frewrite
   5145881 =C2=B1  2%     -17.4%    4250075 =C2=B1 13%  iozone.524288KB_163=
84reclen.fread
    752211 =C2=B1  0%      -4.0%     722374 =C2=B1  0%  iozone.131072KB_128=
reclen
   5020800 =C2=B1  1%      +4.0%    5219629 =C2=B1  1%  iozone.65536KB_256r=
eclen.rewrite
   8948722 =C2=B1  1%      +4.4%    9341540 =C2=B1  0%  iozone.524288KB_204=
8reclen.fread
   4850242 =C2=B1  2%      +3.7%    5031843 =C2=B1  0%  iozone.65536KB_1024=
reclen.rewrite
   4966369 =C2=B1 15%     +15.4%    5730703 =C2=B1  0%  iozone.524288KB_409=
6reclen.stride_read
   6952176 =C2=B1 15%     +11.5%    7754097 =C2=B1  2%  iozone.4096KB_32rec=
len.fread
   9041612 =C2=B1  2%      +2.6%    9279240 =C2=B1  0%  iozone.262144KB_204=
8reclen.freread
   4927943 =C2=B1  0%      +3.7%    5107872 =C2=B1  1%  iozone.65536KB_256r=
eclen.fwrite
   5145327 =C2=B1  1%      -5.2%    4875664 =C2=B1  0%  iozone.524288KB_163=
84reclen.bkwd_read
    746903 =C2=B1  1%      -3.5%     720758 =C2=B1  0%  iozone.262144KB_64r=
eclen
   2141436 =C2=B1  6%      +5.8%    2266570 =C2=B1  0%  iozone.16384KB_4rec=
len.random_write
   8894902 =C2=B1  1%      -5.3%    8425790 =C2=B1  0%  iozone.32768KB_128r=
eclen.random_read
   6284873 =C2=B1  1%      +2.6%    6448006 =C2=B1  1%  iozone.8192KB_64rec=
len.bkwd_read
   5472662 =C2=B1  6%      +5.4%    5767528 =C2=B1  1%  iozone.16384KB_64re=
clen.random_write
   8802415 =C2=B1  1%      +5.5%    9290691 =C2=B1  0%  iozone.131072KB_128=
reclen.freread
   6825709 =C2=B1 16%     -14.7%    5823936 =C2=B1  0%  iozone.8192KB_512re=
clen.bkwd_read
   9002211 =C2=B1  1%      +3.2%    9293885 =C2=B1  0%  iozone.524288KB_204=
8reclen.freread
   9060520 =C2=B1  0%      +4.2%    9442930 =C2=B1  0%  iozone.524288KB_102=
4reclen.reread
   8570321 =C2=B1  1%      +3.0%    8824025 =C2=B1  1%  iozone.8192KB_128re=
clen.reread
   5511902 =C2=B1  3%      +5.4%    5811039 =C2=B1  0%  iozone.262144KB_409=
6reclen.fread
   7290581 =C2=B1  2%      +3.4%    7541658 =C2=B1  1%  iozone.512KB_64recl=
en.record_rewrite
   8557473 =C2=B1 15%     +15.3%    9868433 =C2=B1  0%  iozone.256KB_64recl=
en.reread
   8914463 =C2=B1  1%      +4.9%    9355452 =C2=B1  0%  iozone.262144KB_64r=
eclen.fread
    799025 =C2=B1  1%      +4.3%     833154 =C2=B1  1%  iozone.2048KB_256re=
clen
   3713883 =C2=B1  2%      -3.4%    3588362 =C2=B1  0%  iozone.131072KB_64r=
eclen.write
    755537 =C2=B1  1%      +1.7%     768587 =C2=B1  1%  iozone.1024KB_16rec=
len
    710165 =C2=B1  1%      +3.5%     734717 =C2=B1  1%  iozone.1024KB_8recl=
en
   8835260 =C2=B1  4%      +5.1%    9284112 =C2=B1  0%  iozone.524288KB_102=
4reclen.stride_read
   3529822 =C2=B1  1%      +3.8%    3663421 =C2=B1  0%  iozone.131072KB_819=
2reclen.rewrite
   7863389 =C2=B1 14%     +12.6%    8855866 =C2=B1  0%  iozone.16384KB_128r=
eclen.read
   5670555 =C2=B1  0%      -4.3%    5429164 =C2=B1  0%  iozone.262144KB_409=
6reclen.bkwd_read
    860746 =C2=B1  1%      +2.9%     886092 =C2=B1  1%  iozone.1024KB_128re=
clen
   5633521 =C2=B1  3%      -7.7%    5198984 =C2=B1  1%  iozone.1024KB_32rec=
len.fwrite
    722227 =C2=B1  1%      -3.9%     693896 =C2=B1  0%  iozone.262144KB_102=
4reclen
   2465364 =C2=B1  1%      +2.9%    2537975 =C2=B1  0%  iozone.1024KB_4recl=
en.frewrite
   4096279 =C2=B1  5%      +4.0%    4261022 =C2=B1  1%  iozone.1024KB_512re=
clen.write
   8709898 =C2=B1  6%      +7.6%    9368367 =C2=B1  0%  iozone.524288KB_64r=
eclen.reread
   5650560 =C2=B1  3%     -10.8%    5041445 =C2=B1  4%  iozone.1024KB_512re=
clen.fwrite
   4978457 =C2=B1  6%      +7.3%    5343755 =C2=B1  0%  iozone.16384KB_8192=
reclen.read
   4506463 =C2=B1 16%     +12.9%    5086235 =C2=B1  0%  iozone.131072KB_819=
2reclen.fread
   8756733 =C2=B1  2%      +2.1%    8939757 =C2=B1  1%  iozone.8192KB_2048r=
eclen.read
   6435816 =C2=B1 11%     +10.5%    7109834 =C2=B1  1%  iozone.2048KB_1024r=
eclen.frewrite
   8246013 =C2=B1  6%      +6.3%    8762089 =C2=B1  1%  iozone.16384KB_512r=
eclen.fread
   5154158 =C2=B1  2%      +2.6%    5286682 =C2=B1  1%  iozone.131072KB_64r=
eclen.rewrite
   8288609 =C2=B1  2%      +3.4%    8571211 =C2=B1  0%  iozone.32768KB_2048=
reclen.freread
   4997063 =C2=B1  2%      +5.5%    5273138 =C2=B1  0%  iozone.262144KB_819=
2reclen.fread
    731906 =C2=B1  0%      -2.7%     711971 =C2=B1  1%  iozone.131072KB_256=
reclen
   7568695 =C2=B1  0%      -5.0%    7190624 =C2=B1  1%  iozone.8192KB_4recl=
en.reread
   4857649 =C2=B1  3%      +5.2%    5109039 =C2=B1  0%  iozone.131072KB_163=
84reclen.bkwd_read
   4305394 =C2=B1  4%      +4.7%    4509380 =C2=B1  0%  iozone.16384KB_4096=
reclen.random_write
   8707732 =C2=B1  6%      +6.4%    9261780 =C2=B1  0%  iozone.262144KB_204=
8reclen.fread
   9053742 =C2=B1  1%      -4.2%    8670031 =C2=B1  0%  iozone.32768KB_128r=
eclen.reread
  13147518 =C2=B1  1%      -4.4%   12565952 =C2=B1  0%  iozone.1024KB_256re=
clen.random_read
   8734670 =C2=B1  1%      +4.4%    9119246 =C2=B1  0%  iozone.524288KB_256=
reclen.freread
   5165047 =C2=B1  0%      +3.1%    5324018 =C2=B1  0%  iozone.524288KB_64r=
eclen.rewrite
   5090097 =C2=B1  0%      +3.5%    5268805 =C2=B1  0%  iozone.262144KB_819=
2reclen.read
   8618018 =C2=B1  2%      +4.5%    9007477 =C2=B1  0%  iozone.16384KB_512r=
eclen.read
   2596796 =C2=B1  4%      +4.6%    2717180 =C2=B1  1%  iozone.16384KB_4rec=
len.frewrite
   7537760 =C2=B1  1%      -4.4%    7202589 =C2=B1  0%  iozone.8192KB_4recl=
en.read
   4877143 =C2=B1  1%      +3.6%    5053563 =C2=B1  0%  iozone.131072KB_64r=
eclen.frewrite
   8735163 =C2=B1  1%      -3.4%    8438783 =C2=B1  0%  iozone.16384KB_16re=
clen.reread
   7968658 =C2=B1  1%      -4.6%    7603941 =C2=B1  1%  iozone.262144KB_102=
4reclen.record_rewrite
   8474810 =C2=B1  0%      -2.7%    8241844 =C2=B1  0%  iozone.524288KB_64r=
eclen.record_rewrite
   8374674 =C2=B1  1%      +2.6%    8589893 =C2=B1  0%  iozone.131072KB_256=
reclen.read
    506646 =C2=B1  2%      -5.1%     480998 =C2=B1  1%  iozone.8192KB_4recl=
en
   4264006 =C2=B1 16%     +15.3%    4916284 =C2=B1  1%  iozone.32768KB_8192=
reclen.bkwd_read
   8502362 =C2=B1  0%      +3.1%    8764301 =C2=B1  0%  iozone.16384KB_256r=
eclen.stride_read
   4033525 =C2=B1  3%      -6.4%    3775337 =C2=B1  0%  iozone.4096KB_8recl=
en.fwrite
   8660785 =C2=B1  1%      +3.7%    8979059 =C2=B1  1%  iozone.65536KB_64re=
clen.fread
   4272540 =C2=B1  2%      +3.5%    4423901 =C2=B1  0%  iozone.32768KB_1024=
reclen.frewrite
   4660936 =C2=B1 20%     +15.5%    5384361 =C2=B1  1%  iozone.2048KB_2048r=
eclen.frewrite
   8841767 =C2=B1  3%      +5.0%    9287418 =C2=B1  0%  iozone.524288KB_512=
reclen.bkwd_read
   8363629 =C2=B1  0%      -9.6%    7562760 =C2=B1  6%  iozone.131072KB_256=
reclen.freread
   4924284 =C2=B1  0%      +3.4%    5090277 =C2=B1  0%  iozone.262144KB_256=
reclen.frewrite
    444239 =C2=B1  0%      -4.0%     426444 =C2=B1  0%  iozone.32768KB_8192=
reclen
   7239692 =C2=B1 19%     +15.8%    8385359 =C2=B1  0%  iozone.16384KB_2048=
reclen.fread
   3186860 =C2=B1  6%      +6.4%    3390568 =C2=B1  1%  iozone.262144KB_163=
84reclen.fwrite
    693176 =C2=B1  3%      +2.9%     713360 =C2=B1  1%  iozone.4096KB_32rec=
len
   9876019 =C2=B1  6%     -10.6%    8824718 =C2=B1  3%  iozone.256KB_32recl=
en.reread
   3640648 =C2=B1  2%      -6.6%    3399521 =C2=B1  1%  iozone.2048KB_8recl=
en.frewrite
   5510551 =C2=B1  0%     -20.8%    4363318 =C2=B1 21%  iozone.8192KB_8192r=
eclen.stride_read
   5075625 =C2=B1  2%      -7.1%    4713577 =C2=B1  4%  iozone.16384KB_8192=
reclen.frewrite
   3541634 =C2=B1  9%      +9.2%    3866061 =C2=B1  0%  iozone.16384KB_8rec=
len.fwrite
   4121169 =C2=B1  2%      -6.5%    3853787 =C2=B1  2%  iozone.16384KB_1638=
4reclen.fwrite
   3760939 =C2=B1  1%      +2.7%    3861953 =C2=B1  0%  iozone.16384KB_8rec=
len.frewrite
   8157284 =C2=B1  1%      +2.9%    8396221 =C2=B1  0%  iozone.16384KB_256r=
eclen.record_rewrite
   4994815 =C2=B1  1%     -20.4%    3977567 =C2=B1 22%  iozone.65536KB_1638=
4reclen.reread
   9168752 =C2=B1  0%      +2.7%    9413922 =C2=B1  0%  iozone.524288KB_102=
4reclen.read
   4093851 =C2=B1  7%      +8.4%    4438329 =C2=B1  0%  iozone.262144KB_102=
4reclen.fwrite
   8775725 =C2=B1  0%      +1.6%    8916270 =C2=B1  0%  iozone.131072KB_128=
reclen.record_rewrite
   4899985 =C2=B1  6%      +7.6%    5271924 =C2=B1  0%  iozone.262144KB_163=
84reclen.fread
   5052411 =C2=B1  1%      +3.6%    5232803 =C2=B1  0%  iozone.524288KB_819=
2reclen.fread
   5138795 =C2=B1  3%      +3.4%    5311191 =C2=B1  1%  iozone.16384KB_1638=
4reclen.freread
   8127109 =C2=B1 10%     +10.3%    8962844 =C2=B1  0%  iozone.32768KB_1024=
reclen.freread
   3240859 =C2=B1  0%      +4.2%    3375574 =C2=B1  0%  iozone.16384KB_8rec=
len.random_write
   8558845 =C2=B1  5%      +6.9%    9149078 =C2=B1  0%  iozone.262144KB_512=
reclen.fread
   9047729 =C2=B1  1%      +2.8%    9298371 =C2=B1  0%  iozone.524288KB_512=
reclen.fread
    598367 =C2=B1  1%      +2.2%     611721 =C2=B1  0%  iozone.16384KB_8rec=
len
   7924619 =C2=B1 15%     +13.2%    8971887 =C2=B1  0%  iozone.65536KB_128r=
eclen.fread
   5934921 =C2=B1  0%     -12.5%    5192079 =C2=B1 10%  iozone.8192KB_1024r=
eclen.random_write
   5794602 =C2=B1  2%      +2.8%    5958451 =C2=B1  1%  iozone.16384KB_256r=
eclen.random_write
   8709385 =C2=B1  1%      +3.7%    9027315 =C2=B1  0%  iozone.131072KB_256=
reclen.random_read
   4140616 =C2=B1  3%      +4.3%    4320284 =C2=B1  0%  iozone.32768KB_8192=
reclen.random_write
   5549357 =C2=B1  0%      +2.9%    5711175 =C2=B1  0%  iozone.262144KB_512=
reclen.random_write
    732794 =C2=B1  4%      +5.1%     770280 =C2=B1  0%  iozone.65536KB_128r=
eclen
   6523770 =C2=B1  1%      +1.5%    6621037 =C2=B1  1%  iozone.8192KB_128re=
clen.random_write
   3593208 =C2=B1  3%      -7.2%    3335532 =C2=B1  3%  iozone.131072KB_204=
8reclen.frewrite
   8285967 =C2=B1  0%      +2.0%    8449693 =C2=B1  1%  iozone.16384KB_64re=
clen.record_rewrite
 1.647e+08 =C2=B1  1%      +2.0%   1.68e+08 =C2=B1  1%  iozone.reread_KBps
   4720579 =C2=B1 11%     +10.0%    5191956 =C2=B1  0%  iozone.524288KB_163=
84reclen.stride_read
   5405499 =C2=B1  0%      +2.9%    5560629 =C2=B1  0%  iozone.131072KB_409=
6reclen.fread
   8492214 =C2=B1  7%      +7.3%    9111754 =C2=B1  0%  iozone.262144KB_512=
reclen.freread
   3609222 =C2=B1  1%      +1.2%    3651428 =C2=B1  1%  iozone.262144KB_204=
8reclen.frewrite
   3622658 =C2=B1  3%      +4.4%    3781302 =C2=B1  0%  iozone.8192KB_16rec=
len.write
   7708839 =C2=B1  3%      +4.8%    8079310 =C2=B1  0%  iozone.8192KB_1024r=
eclen.record_rewrite
    821327 =C2=B1  1%      -3.0%     796539 =C2=B1  0%  iozone.512KB_64recl=
en
   6471648 =C2=B1  2%      +2.9%    6658424 =C2=B1  1%  iozone.16384KB_4rec=
len.bkwd_read
   7966254 =C2=B1  1%      +1.9%    8118825 =C2=B1  0%  iozone.524288KB_256=
reclen.record_rewrite
   9006794 =C2=B1  1%     -12.4%    7887715 =C2=B1 11%  iozone.32768KB_64re=
clen.freread
   4198799 =C2=B1  4%      +4.7%    4394653 =C2=B1  0%  iozone.4096KB_512re=
clen.write
    667396 =C2=B1  2%      +3.0%     687243 =C2=B1  0%  iozone.128KB_32recl=
en
   5131940 =C2=B1  1%      +2.0%    5234578 =C2=B1  0%  iozone.262144KB_819=
2reclen.freread
   2649388 =C2=B1  1%      -4.3%    2534745 =C2=B1  1%  iozone.1024KB_4recl=
en.fwrite
   8440344 =C2=B1  9%      +7.6%    9079989 =C2=B1  0%  iozone.16384KB_1024=
reclen.reread
   2567854 =C2=B1  1%      +1.5%    2607344 =C2=B1  0%  iozone.2048KB_4recl=
en.rewrite
   4829612 =C2=B1  3%      +3.8%    5011975 =C2=B1  0%  iozone.16384KB_512r=
eclen.frewrite
   7509821 =C2=B1  1%      +2.0%    7661779 =C2=B1  0%  iozone.16384KB_8rec=
len.bkwd_read
   9245568 =C2=B1  1%      +1.4%    9376836 =C2=B1  0%  iozone.524288KB_64r=
eclen.fread
   3664908 =C2=B1  0%      +1.7%    3726704 =C2=B1  0%  iozone.524288KB_163=
84reclen.rewrite
  1.82e+08 =C2=B1  0%      +0.6%  1.831e+08 =C2=B1  0%  iozone.random_read_=
KBps
   7963590 =C2=B1 15%     +13.0%    8997166 =C2=B1  0%  iozone.524288KB_256=
reclen.stride_read
   4818207 =C2=B1  7%      +5.4%    5078775 =C2=B1  0%  iozone.8192KB_256re=
clen.fwrite
   8282307 =C2=B1  1%      +3.2%    8547026 =C2=B1  0%  iozone.131072KB_256=
reclen.record_rewrite
    653264 =C2=B1  0%      +1.8%     664923 =C2=B1  0%  iozone.16384KB_16re=
clen
   4492579 =C2=B1 22%     +16.7%    5241982 =C2=B1  0%  iozone.524288KB_819=
2reclen.stride_read
   5068640 =C2=B1  0%      +2.3%    5184945 =C2=B1  0%  iozone.524288KB_163=
84reclen.read
   8477862 =C2=B1 12%      +9.0%    9241119 =C2=B1  0%  iozone.524288KB_204=
8reclen.bkwd_read
   3159354 =C2=B1  9%      +8.3%    3421414 =C2=B1  0%  iozone.262144KB_163=
84reclen.frewrite
   5271794 =C2=B1  5%      +4.5%    5511542 =C2=B1  0%  iozone.131072KB_409=
6reclen.bkwd_read
   2849172 =C2=B1  1%      -2.7%    2772173 =C2=B1  0%  iozone.16384KB_4rec=
len.record_rewrite
   9093349 =C2=B1  1%      +2.2%    9293596 =C2=B1  0%  iozone.524288KB_204=
8reclen.stride_read
   5991723 =C2=B1  0%      +1.9%    6107710 =C2=B1  0%  iozone.65536KB_128r=
eclen.random_write
   5041457 =C2=B1  0%      +2.1%    5147851 =C2=B1  0%  iozone.32768KB_8192=
reclen.freread
   3202511 =C2=B1  5%      +5.4%    3374970 =C2=B1  0%  iozone.262144KB_409=
6reclen.frewrite
   4433969 =C2=B1  1%      -6.6%    4143523 =C2=B1  3%  iozone.8192KB_16rec=
len.rewrite
   9101889 =C2=B1  1%      +1.5%    9236783 =C2=B1  0%  iozone.524288KB_512=
reclen.read
   4859536 =C2=B1  9%      +8.8%    5285787 =C2=B1  0%  iozone.262144KB_163=
84reclen.freread
  79784238 =C2=B1  0%      -1.9%   78230145 =C2=B1  0%  iozone.fwrite_KBps
    740026 =C2=B1  0%      -2.8%     719505 =C2=B1  0%  iozone.262144KB_256=
reclen
   4103998 =C2=B1  5%      -5.4%    3881293 =C2=B1  0%  iozone.262144KB_512=
reclen.write
   5166349 =C2=B1 18%     +14.5%    5917164 =C2=B1  0%  iozone.16384KB_4096=
reclen.fread
   8542266 =C2=B1  4%      +3.8%    8868681 =C2=B1  0%  iozone.16384KB_128r=
eclen.record_rewrite
   5234914 =C2=B1  2%      -4.1%    5019179 =C2=B1  1%  iozone.1024KB_1024r=
eclen.rewrite
   8739322 =C2=B1  0%      -5.4%    8266567 =C2=B1  3%  iozone.131072KB_102=
4reclen.freread
   5088472 =C2=B1  1%      -2.8%    4944942 =C2=B1  0%  iozone.16384KB_32re=
clen.rewrite
   8587630 =C2=B1 10%      +8.4%    9307652 =C2=B1  0%  iozone.524288KB_128=
reclen.freread
   5809713 =C2=B1  0%     -10.0%    5230213 =C2=B1  8%  iozone.262144KB_128=
reclen.random_write
   4921492 =C2=B1  0%      -1.6%    4844785 =C2=B1  0%  iozone.262144KB_64r=
eclen.frewrite
   3327837 =C2=B1  0%      -4.4%    3181225 =C2=B1  3%  iozone.131072KB_819=
2reclen.frewrite
   5762326 =C2=B1  1%      +1.4%    5845299 =C2=B1  0%  iozone.16384KB_16re=
clen.record_rewrite
   8542725 =C2=B1  0%      +1.3%    8656262 =C2=B1  0%  iozone.131072KB_102=
4reclen.read
   8031016 =C2=B1  9%      +7.8%    8657238 =C2=B1  0%  iozone.16384KB_1024=
reclen.fread
    438258 =C2=B1  0%      -4.1%     420454 =C2=B1  2%  iozone.65536KB_1638=
4reclen
    771229 =C2=B1  0%      -5.1%     731522 =C2=B1  4%  iozone.262144KB_128=
reclen
    775060 =C2=B1  0%      +1.0%     783069 =C2=B1  0%  iozone.256KB_64recl=
en
   3800316 =C2=B1  0%      -3.4%    3672024 =C2=B1  1%  iozone.65536KB_1638=
4reclen.frewrite
   7467330 =C2=B1 14%     +11.3%    8309007 =C2=B1  0%  iozone.8192KB_8recl=
en.reread
   5397975 =C2=B1  1%      -2.4%    5268371 =C2=B1  0%  iozone.524288KB_128=
reclen.rewrite
   2639373 =C2=B1  0%      +0.7%    2658316 =C2=B1  0%  iozone.16384KB_4rec=
len.rewrite
   5207951 =C2=B1  0%      +0.7%    5246733 =C2=B1  0%  iozone.65536KB_128r=
eclen.fwrite
   8636430 =C2=B1  0%      -1.7%    8489977 =C2=B1  0%  iozone.131072KB_204=
8reclen.fread
 1.523e+08 =C2=B1  0%      -1.5%    1.5e+08 =C2=B1  0%  iozone.stride_read_=
KBps
   8572154 =C2=B1  0%      -2.1%    8393402 =C2=B1  0%  iozone.16384KB_16re=
clen.read
   4258462 =C2=B1  5%      +5.1%    4476593 =C2=B1  0%  iozone.131072KB_256=
reclen.write
   8551275 =C2=B1  1%      -2.2%    8359432 =C2=B1  0%  iozone.16384KB_16re=
clen.freread
   7314313 =C2=B1  0%      +0.5%    7353814 =C2=B1  0%  iozone.16384KB_32re=
clen.record_rewrite
  78739168 =C2=B1  8%     -93.2%    5348444 =C2=B1  5%  cpuidle.C3-SNB.time
       758 =C2=B1 26%     -86.9%         99 =C2=B1  5%  sched_debug.cpu#0.l=
oad
     16666 =C2=B1  4%     -81.2%       3127 =C2=B1  0%  cpuidle.C3-SNB.usage
         1 =C2=B1  0%    -100.0%          0 =C2=B1  0%  vmstat.procs.b
    113046 =C2=B1  0%     -72.0%      31652 =C2=B1  0%  softirqs.BLOCK
     28577 =C2=B1  4%     -85.3%       4202 =C2=B1  1%  proc-vmstat.nr_dirty
    114128 =C2=B1  4%     -85.1%      16992 =C2=B1  2%  meminfo.Dirty
     51312 =C2=B1  1%     +98.3%     101737 =C2=B1  3%  time.voluntary_cont=
ext_switches
        39 =C2=B1 36%     +38.6%         54 =C2=B1 10%  sched_debug.cpu#3.n=
r_uninterruptible
      0.43 =C2=B1 29%     +82.8%       0.78 =C2=B1 29%  perf-profile.cpu-cy=
cles.write_ctree_super.btrfs_sync_log.btrfs_sync_file.do_fsync.sys_fsync
    124727 =C2=B1  1%     +79.8%     224216 =C2=B1  0%  meminfo.Writeback
     31156 =C2=B1  1%     +80.0%      56074 =C2=B1  0%  proc-vmstat.nr_writ=
eback
         5 =C2=B1 22%    +155.9%         14 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
  48927281 =C2=B1  9%     +89.1%   92526867 =C2=B1  6%  cpuidle.C1-SNB.time
        11 =C2=B1 19%     -63.6%          4 =C2=B1 25%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
        18 =C2=B1 32%     -53.6%          8 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
        10 =C2=B1 22%     +82.8%         19 =C2=B1 17%  sched_debug.cpu#1.c=
pu_load[0]
      1009 =C2=B1 36%     +32.2%       1334 =C2=B1 24%  slabinfo.btrfs_dela=
yed_data_ref.active_objs
      1023 =C2=B1 35%     +31.0%       1341 =C2=B1 23%  slabinfo.btrfs_dela=
yed_data_ref.num_objs
      3439 =C2=B1 39%     -60.8%       1350 =C2=B1 28%  sched_debug.cpu#0.c=
urr->pid
        45 =C2=B1 16%     -46.4%         24 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
         9 =C2=B1 35%     +75.9%         17 =C2=B1 11%  sched_debug.cpu#1.c=
pu_load[1]
    412610 =C2=B1  0%     -36.8%     260704 =C2=B1  2%  cpuidle.C6-SNB.usage
       772 =C2=B1  0%     +32.5%       1023 =C2=B1  0%  slabinfo.kmalloc-20=
48.num_objs
       736 =C2=B1  0%     +28.1%        944 =C2=B1  0%  slabinfo.kmalloc-20=
48.active_objs
      1.71 =C2=B1 13%     -31.7%       1.17 =C2=B1  6%  perf-profile.cpu-cy=
cles.ata_sff_tf_load.ata_bmdma_qc_issue.ata_qc_issue.ata_scsi_queuecmd.scsi=
_dispatch_cmd
      0.70 =C2=B1 14%     +33.6%       0.94 =C2=B1 10%  perf-profile.cpu-cy=
cles.scsi_request_fn.__blk_run_queue.blk_queue_bio.generic_make_request.sub=
mit_bio
      1.81 =C2=B1  7%     +34.0%       2.42 =C2=B1 11%  perf-profile.cpu-cy=
cles.btrfs_sync_log.btrfs_sync_file.do_fsync.sys_fsync.system_call_fastpath
      1.55 =C2=B1 12%     -30.5%       1.08 =C2=B1  7%  perf-profile.cpu-cy=
cles.__const_udelay.ata_sff_tf_load.ata_bmdma_qc_issue.ata_qc_issue.ata_scs=
i_queuecmd
      0.86 =C2=B1  7%     +40.1%       1.20 =C2=B1  4%  perf-profile.cpu-cy=
cles.__set_page_dirty_nobuffers.btrfs_set_page_dirty.set_page_dirty.btrfs_d=
irty_pages.__btrfs_buffered_write
       511 =C2=B1  1%     +48.5%        759 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
       786 =C2=B1 16%     -35.9%        504 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
       849 =C2=B1 12%     +33.3%       1132 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
       475 =C2=B1  1%     +44.2%        685 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
         9 =C2=B1 49%     +66.1%         15 =C2=B1  3%  sched_debug.cpu#1.c=
pu_load[2]
       230 =C2=B1 32%     +43.5%        330 =C2=B1 17%  sched_debug.cfs_rq[=
2]:/.load
      6.92 =C2=B1  4%     -20.9%       5.47 =C2=B1  6%  perf-profile.cpu-cy=
cles.ata_bmdma_qc_issue.ata_qc_issue.ata_scsi_queuecmd.scsi_dispatch_cmd.sc=
si_request_fn
       232 =C2=B1 31%     +42.2%        330 =C2=B1 16%  sched_debug.cpu#2.l=
oad
      0.84 =C2=B1  8%     +26.3%       1.06 =C2=B1 11%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
      1.22 =C2=B1 18%     -34.4%       0.80 =C2=B1  7%  perf-profile.cpu-cy=
cles.delay_tsc.__const_udelay.ata_sff_tf_load.ata_bmdma_qc_issue.ata_qc_iss=
ue
       765 =C2=B1 18%     -37.1%        481 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
       903 =C2=B1 10%     +29.1%       1166 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
       844 =C2=B1 15%     -31.0%        582 =C2=B1  5%  slabinfo.btrfs_tran=
s_handle.active_objs
      0.77 =C2=B1  6%     +20.7%       0.93 =C2=B1 13%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
    117674 =C2=B1  3%     -21.3%      92602 =C2=B1  0%  sched_debug.cpu#0.t=
twu_local
 1.022e+08 =C2=B1  0%     -19.7%   81997390 =C2=B1  0%  cpuidle.C1E-SNB.time
      1.60 =C2=B1  8%     +25.3%       2.00 =C2=B1  2%  perf-profile.cpu-cy=
cles.btrfs_dirty_pages.__btrfs_buffered_write.btrfs_file_write_iter.new_syn=
c_write.vfs_write
       853 =C2=B1 14%     -29.4%        602 =C2=B1  5%  slabinfo.btrfs_tran=
s_handle.num_objs
      3508 =C2=B1  0%     +14.2%       4007 =C2=B1  0%  uptime.idle
    285629 =C2=B1  7%     +10.3%     314942 =C2=B1  0%  sched_debug.cpu#2.s=
ched_goidle
      0.96 =C2=B1  7%     +31.3%       1.27 =C2=B1  0%  perf-profile.cpu-cy=
cles.btrfs_set_page_dirty.set_page_dirty.btrfs_dirty_pages.__btrfs_buffered=
_write.btrfs_file_write_iter
    583101 =C2=B1  7%      +9.8%     640157 =C2=B1  0%  sched_debug.cpu#2.s=
ched_count
    580000 =C2=B1  7%     +10.0%     637904 =C2=B1  0%  sched_debug.cpu#2.n=
r_switches
      0.93 =C2=B1 12%     +17.3%       1.09 =C2=B1  7%  perf-profile.cpu-cy=
cles.find_lock_delalloc_range.constprop.44.writepage_delalloc.__extent_writ=
epage.extent_write_cache_pages.extent_writepages
      1.30 =C2=B1  2%     +21.5%       1.58 =C2=B1  2%  perf-profile.cpu-cy=
cles.set_page_dirty.btrfs_dirty_pages.__btrfs_buffered_write.btrfs_file_wri=
te_iter.new_sync_write
    804132 =C2=B1 10%     -18.4%     656255 =C2=B1  2%  sched_debug.cpu#2.a=
vg_idle
     87472 =C2=B1  1%     -18.0%      71705 =C2=B1  0%  sched_debug.cpu#0.n=
r_load_updates
     19076 =C2=B1  1%     +20.0%      22898 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.exec_clock
    134079 =C2=B1  2%     -18.3%     109513 =C2=B1  1%  sched_debug.cpu#0.s=
ched_goidle
     43539 =C2=B1  1%     -13.0%      37872 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.exec_clock
    281360 =C2=B1  2%     -17.6%     231880 =C2=B1  1%  sched_debug.cpu#0.n=
r_switches
    323775 =C2=B1  1%     -14.2%     277704 =C2=B1  5%  sched_debug.cpu#1.t=
twu_local
    284555 =C2=B1  2%     -17.8%     233791 =C2=B1  1%  sched_debug.cpu#0.s=
ched_count
    286836 =C2=B1  6%      +8.8%     312002 =C2=B1  4%  sched_debug.cpu#3.t=
twu_count
     28292 =C2=B1  3%     +24.9%      35336 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    291421 =C2=B1  5%     +10.1%     320997 =C2=B1  4%  sched_debug.cpu#3.s=
ched_goidle
    258989 =C2=B1  6%     +10.6%     286386 =C2=B1  5%  sched_debug.cpu#3.t=
twu_local
    591002 =C2=B1  5%     +10.1%     650795 =C2=B1  4%  sched_debug.cpu#3.n=
r_switches
    594058 =C2=B1  5%      +9.9%     652918 =C2=B1  4%  sched_debug.cpu#3.s=
ched_count
      3.64 =C2=B1  4%      +9.0%       3.97 =C2=B1  5%  perf-profile.cpu-cy=
cles.start_secondary
      3.56 =C2=B1  4%      +9.4%       3.89 =C2=B1  5%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      1678 =C2=B1  0%     +18.2%       1984 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_objs
      1706 =C2=B1  0%     +17.9%       2012 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
     16895 =C2=B1  4%     -14.0%      14534 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      1382 =C2=B1  7%      +6.2%       1468 =C2=B1  5%  slabinfo.proc_inode=
_cache.active_objs
      8.76 =C2=B1  1%     +13.2%       9.91 =C2=B1  0%  perf-profile.cpu-cy=
cles.new_sync_read.vfs_read.sys_read.system_call_fastpath.__read_nocancel
      8.77 =C2=B1  2%     +13.1%       9.91 =C2=B1  0%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath.__read_nocancel
     16.92 =C2=B1  0%     -13.9%      14.57 =C2=B1  1%  perf-profile.cpu-cy=
cles.do_IRQ.ret_from_intr.cpuidle_enter.cpu_startup_entry.rest_init
     16.93 =C2=B1  0%     -13.6%      14.62 =C2=B1  1%  perf-profile.cpu-cy=
cles.ret_from_intr.cpuidle_enter.cpu_startup_entry.rest_init.start_kernel
      8.80 =C2=B1  2%     +12.8%       9.93 =C2=B1  0%  perf-profile.cpu-cy=
cles.__read_nocancel
      8.78 =C2=B1  2%     +13.0%       9.91 =C2=B1  0%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath.__read_nocancel
      8.79 =C2=B1  1%     +12.8%       9.91 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_fastpath.__read_nocancel
         8 =C2=B1  0%     +12.5%          9 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      1714 =C2=B1  0%     +12.0%       1920 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    255258 =C2=B1  8%     +11.5%     284664 =C2=B1  0%  sched_debug.cpu#2.t=
twu_local
      1639 =C2=B1  1%     +12.2%       1839 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
     15.35 =C2=B1  0%     -13.7%      13.25 =C2=B1  3%  perf-profile.cpu-cy=
cles.irq_exit.do_IRQ.ret_from_intr.cpuidle_enter.cpu_startup_entry
     15.21 =C2=B1  0%     -13.2%      13.20 =C2=B1  3%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.do_IRQ.ret_from_intr.cpuidle_enter
      2.05 =C2=B1  6%      +5.8%       2.17 =C2=B1  3%  perf-profile.cpu-cy=
cles.btrfs_csum_data.btrfs_csum_one_bio.btrfs_submit_bio_hook.submit_one_bi=
o.flush_epd_write_bio
      8.53 =C2=B1  0%   +1627.3%     147.42 =C2=B1  0%  iostat.sda.wrqm/s
       868 =C2=B1  0%    +719.9%       7122 =C2=B1  1%  iostat.sda.avgrq-sz
    170.07 =C2=B1  0%     -71.5%      48.53 =C2=B1  0%  iostat.sda.w/s
       837 =C2=B1  0%    +121.6%       1855 =C2=B1  0%  iostat.sda.w_await
       837 =C2=B1  0%    +121.6%       1855 =C2=B1  0%  iostat.sda.await
    143.46 =C2=B1  0%     -71.5%      40.85 =C2=B1  0%  iostat.sda.avgqu-sz
      1936 =C2=B1  0%     +11.0%       2149 =C2=B1  0%  vmstat.system.cs
     74904 =C2=B1  0%      +9.7%      82169 =C2=B1  0%  vmstat.io.bo
     74884 =C2=B1  0%      +9.7%      82165 =C2=B1  0%  iostat.sda.wkB/s

lkp-ws02: Westmere-EP
Memory: 16G

snb-drag: Sandy Bridge
Memory: 6G

bay: Pentium D
Memory: 2G

ivb44: Ivytown Ivy Bridge-EP
Memory: 64G




                                iostat.sdi.wrqm/s

  90 ++--------------------------------------------------------------------=
-+
     |                                            O O O O   O         O O O=
 |
  80 O+    O O O   O               O   O                      O O O        =
 O
  70 ++O O             O O O O O O   O   OO O O O                          =
 |
     |                                                                     =
 |
  60 ++                                                                    =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
  30 ++                                                                    =
 |
     *.   .*.               .*.                                            =
 |
  20 ++*.*   *.*   *.*.*.*.*   *.*.*                                       =
 |
  10 ++         : :                                                        =
 |
     |          : :                                                        =
 |
   0 ++----------O---O------------------------------------O---------O------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby ruby-oj
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
Huang, Ying



_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============2473860355206324776==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBkZC13cml0ZQpkZWZhdWx0X21vbml0b3JzOgogIHdhaXQ6IHByZS10ZXN0
CiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVt
YS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDog
CiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAg
bGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0
YXRzOiAKICBjcHVpZGxlOiAKICBjcHVmcmVxOiAKICB0dXJib3N0YXQ6IAogIHNjaGVkX2RlYnVn
OgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVyOiAKZGVmYXVsdF93YXRjaGRvZ3M6CiAgd2F0Y2gt
b29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJub3I6IApjb21taXQ6IDQwNmQ0MDQ0YTNl
ZDljMTQ1NWU3NDkxNGQ5YmJjNDlkZTM1YTUxZDcKbW9kZWw6IENvcmUyCm1lbW9yeTogOEcKbnJf
aGRkX3BhcnRpdGlvbnM6IDEyCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL3Njc2kt
MzUwMDBjNTAwMCotcGFydDEiCnN3YXBfcGFydGl0aW9uczogCnJ1bnRpbWU6IDVtCmRpc2s6IDEx
SERECm1kOgotIEpCT0QKaW9zY2hlZDoKLSBjZnEKZnM6Ci0gZXh0NApmczI6Ci0gCm1vbml0b3Jz
OgogIHBlcmYtc3RhdDogCiAgcGVyZi1wcm9maWxlOiAKICBmdHJhY2U6CiAgLSBldmVudHM6IGJh
bGFuY2VfZGlydHlfcGFnZXMgYmRpX2RpcnR5X3JhdGVsaW1pdCBnbG9iYWxfZGlydHlfc3RhdGUg
d3JpdGViYWNrX3NpbmdsZV9pbm9kZQpucl90aHJlYWRzOgotIDEwZGQKZGQ6IAp0ZXN0Ym94OiBs
a3Atc3QwMgp0Ym94X2dyb3VwOiBsa3Atc3QwMgprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVl
X3RpbWU6IDIwMTQtMTItMTYgMDI6Mjg6MDYuMjQ4NDY4MjgwICswODowMApoZWFkX2NvbW1pdDog
NDA2ZDQwNDRhM2VkOWMxNDU1ZTc0OTE0ZDliYmM0OWRlMzVhNTFkNwpiYXNlX2NvbW1pdDogYjI3
NzZiZjcxNDliZGRkMWY0MTYxZjE0Zjc5NTIwZjE3ZmMxZDcxZApicmFuY2g6IGxpbnV4LWRldmVs
L2RldmVsLWhvdXJseS0yMDE0MTIxOTA3Cmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvNDA2
ZDQwNDRhM2VkOWMxNDU1ZTc0OTE0ZDliYmM0OWRlMzVhNTFkNy92bWxpbnV6LTMuMTguMC1nNDA2
ZDQwNCIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LmNnegpy
ZXN1bHRfcm9vdDogIi9yZXN1bHQvbGtwLXN0MDIvZGQtd3JpdGUvNW0tMTFIREQtSkJPRC1jZnEt
ZXh0NC0xMGRkL2RlYmlhbi14ODZfNjQuY2d6L3g4Nl82NC1yaGVsLzQwNmQ0MDQ0YTNlZDljMTQ1
NWU3NDkxNGQ5YmJjNDlkZTM1YTUxZDcvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3At
c3QwMi9jeWNsaWNfZGQtd3JpdGUtNW0tMTFIREQtSkJPRC1jZnEtZXh0NC0xMGRkLXg4Nl82NC1y
aGVsLUhFQUQtNDA2ZDQwNDRhM2VkOWMxNDU1ZTc0OTE0ZDliYmM0OWRlMzVhNTFkNy0wLnlhbWwi
CmRlcXVldWVfdGltZTogMjAxNC0xMi0xOSAxMToyMTozMy44MDIyNzYyNzQgKzA4OjAwCmpvYl9z
dGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNzkuMTIgNjkuMTAgMzEuODEgMS8xNTQgNjc2MQpzdGFy
dF90aW1lOiAnMTQxODk1OTM1NicKZW5kX3RpbWU6ICcxNDE4OTU5NjgxJwp2ZXJzaW9uOiAiL2xr
cC9sa3AvLnNyYy0yMDE0MTIxOS0wOTA5MTQiCnRpbWVfZGVsdGE6ICcxNDE4OTU5MzA1LjY2Mjk2
MDYyNycK

--===============2473860355206324776==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyAxID4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMvd3JpdGViYWNrL2JhbGFu
Y2VfZGlydHlfcGFnZXMvZW5hYmxlCmVjaG8gMSA+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcv
ZXZlbnRzL3dyaXRlYmFjay9iZGlfZGlydHlfcmF0ZWxpbWl0L2VuYWJsZQplY2hvIDEgPiAvc3lz
L2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy93cml0ZWJhY2svZ2xvYmFsX2RpcnR5X3N0YXRl
L2VuYWJsZQplY2hvIDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy93cml0ZWJh
Y2svd3JpdGViYWNrX3NpbmdsZV9pbm9kZS9lbmFibGUKbWtmcyAtdCBleHQ0IC1xIC1GIC9kZXYv
c2RiMQpta2ZzIC10IGV4dDQgLXEgLUYgL2Rldi9zZGcxCm1rZnMgLXQgZXh0NCAtcSAtRiAvZGV2
L3NkazEKbWtmcyAtdCBleHQ0IC1xIC1GIC9kZXYvc2RoMQpta2ZzIC10IGV4dDQgLXEgLUYgL2Rl
di9zZGkxCm1rZnMgLXQgZXh0NCAtcSAtRiAvZGV2L3NkajEKbWtmcyAtdCBleHQ0IC1xIC1GIC9k
ZXYvc2RlMQpta2ZzIC10IGV4dDQgLXEgLUYgL2Rldi9zZGMxCm1rZnMgLXQgZXh0NCAtcSAtRiAv
ZGV2L3NkbTEKbWtmcyAtdCBleHQ0IC1xIC1GIC9kZXYvc2RmMQpta2ZzIC10IGV4dDQgLXEgLUYg
L2Rldi9zZGwxCm1vdW50IC10IGV4dDQgL2Rldi9zZGIxIC9mcy9zZGIxCm1vdW50IC10IGV4dDQg
L2Rldi9zZGoxIC9mcy9zZGoxCm1vdW50IC10IGV4dDQgL2Rldi9zZGkxIC9mcy9zZGkxCm1vdW50
IC10IGV4dDQgL2Rldi9zZGsxIC9mcy9zZGsxCm1vdW50IC10IGV4dDQgL2Rldi9zZG0xIC9mcy9z
ZG0xCm1vdW50IC10IGV4dDQgL2Rldi9zZGcxIC9mcy9zZGcxCm1vdW50IC10IGV4dDQgL2Rldi9z
ZGwxIC9mcy9zZGwxCm1vdW50IC10IGV4dDQgL2Rldi9zZGgxIC9mcy9zZGgxCm1vdW50IC10IGV4
dDQgL2Rldi9zZGUxIC9mcy9zZGUxCm1vdW50IC10IGV4dDQgL2Rldi9zZGYxIC9mcy9zZGYxCm1v
dW50IC10IGV4dDQgL2Rldi9zZGMxIC9mcy9zZGMxCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nk
YjEvemVyby0xIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGoxL3pl
cm8tMSBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RpMS96ZXJvLTEg
c3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkazEvemVyby0xIHN0YXR1
cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZG0xL3plcm8tMSBzdGF0dXM9bm94
ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RnMS96ZXJvLTEgc3RhdHVzPW5veGZlciAm
CmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbDEvemVyby0xIHN0YXR1cz1ub3hmZXIgJgpkZCAg
aWY9L2Rldi96ZXJvIG9mPS9mcy9zZGgxL3plcm8tMSBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9k
ZXYvemVybyBvZj0vZnMvc2RlMS96ZXJvLTEgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3pl
cm8gb2Y9L2ZzL3NkZjEvemVyby0xIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9m
PS9mcy9zZGMxL3plcm8tMSBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMv
c2RiMS96ZXJvLTIgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkajEv
emVyby0yIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGkxL3plcm8t
MiBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RrMS96ZXJvLTIgc3Rh
dHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbTEvemVyby0yIHN0YXR1cz1u
b3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGcxL3plcm8tMiBzdGF0dXM9bm94ZmVy
ICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RsMS96ZXJvLTIgc3RhdHVzPW5veGZlciAmCmRk
ICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaDEvemVyby0yIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9
L2Rldi96ZXJvIG9mPS9mcy9zZGUxL3plcm8tMiBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYv
emVybyBvZj0vZnMvc2RmMS96ZXJvLTIgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8g
b2Y9L2ZzL3NkYzEvemVyby0yIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9m
cy9zZGIxL3plcm8tMyBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2Rq
MS96ZXJvLTMgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaTEvemVy
by0zIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGsxL3plcm8tMyBz
dGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RtMS96ZXJvLTMgc3RhdHVz
PW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZzEvemVyby0zIHN0YXR1cz1ub3hm
ZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGwxL3plcm8tMyBzdGF0dXM9bm94ZmVyICYK
ZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RoMS96ZXJvLTMgc3RhdHVzPW5veGZlciAmCmRkICBp
Zj0vZGV2L3plcm8gb2Y9L2ZzL3NkZTEvemVyby0zIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rl
di96ZXJvIG9mPS9mcy9zZGYxL3plcm8tMyBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVy
byBvZj0vZnMvc2RjMS96ZXJvLTMgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL3NkYjEvemVyby00IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9z
ZGoxL3plcm8tNCBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RpMS96
ZXJvLTQgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkazEvemVyby00
IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZG0xL3plcm8tNCBzdGF0
dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RnMS96ZXJvLTQgc3RhdHVzPW5v
eGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbDEvemVyby00IHN0YXR1cz1ub3hmZXIg
JgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGgxL3plcm8tNCBzdGF0dXM9bm94ZmVyICYKZGQg
IGlmPS9kZXYvemVybyBvZj0vZnMvc2RlMS96ZXJvLTQgc3RhdHVzPW5veGZlciAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL3NkZjEvemVyby00IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96
ZXJvIG9mPS9mcy9zZGMxL3plcm8tNCBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBv
Zj0vZnMvc2RiMS96ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2Zz
L3NkajEvemVyby01IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGkx
L3plcm8tNSBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RrMS96ZXJv
LTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbTEvemVyby01IHN0
YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGcxL3plcm8tNSBzdGF0dXM9
bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RsMS96ZXJvLTUgc3RhdHVzPW5veGZl
ciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaDEvemVyby01IHN0YXR1cz1ub3hmZXIgJgpk
ZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGUxL3plcm8tNSBzdGF0dXM9bm94ZmVyICYKZGQgIGlm
PS9kZXYvemVybyBvZj0vZnMvc2RmMS96ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2
L3plcm8gb2Y9L2ZzL3NkYzEvemVyby01IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJv
IG9mPS9mcy9zZGIxL3plcm8tNiBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0v
ZnMvc2RqMS96ZXJvLTYgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nk
aTEvemVyby02IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGsxL3pl
cm8tNiBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RtMS96ZXJvLTYg
c3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZzEvemVyby02IHN0YXR1
cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGwxL3plcm8tNiBzdGF0dXM9bm94
ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RoMS96ZXJvLTYgc3RhdHVzPW5veGZlciAm
CmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZTEvemVyby02IHN0YXR1cz1ub3hmZXIgJgpkZCAg
aWY9L2Rldi96ZXJvIG9mPS9mcy9zZGYxL3plcm8tNiBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9k
ZXYvemVybyBvZj0vZnMvc2RjMS96ZXJvLTYgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3pl
cm8gb2Y9L2ZzL3NkYjEvemVyby03IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9m
PS9mcy9zZGoxL3plcm8tNyBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMv
c2RpMS96ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkazEv
emVyby03IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZG0xL3plcm8t
NyBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RnMS96ZXJvLTcgc3Rh
dHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbDEvemVyby03IHN0YXR1cz1u
b3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGgxL3plcm8tNyBzdGF0dXM9bm94ZmVy
ICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RlMS96ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRk
ICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZjEvemVyby03IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9
L2Rldi96ZXJvIG9mPS9mcy9zZGMxL3plcm8tNyBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYv
emVybyBvZj0vZnMvc2RiMS96ZXJvLTggc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8g
b2Y9L2ZzL3NkajEvemVyby04IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9m
cy9zZGkxL3plcm8tOCBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2Rr
MS96ZXJvLTggc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbTEvemVy
by04IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGcxL3plcm8tOCBz
dGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RsMS96ZXJvLTggc3RhdHVz
PW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaDEvemVyby04IHN0YXR1cz1ub3hm
ZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGUxL3plcm8tOCBzdGF0dXM9bm94ZmVyICYK
ZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RmMS96ZXJvLTggc3RhdHVzPW5veGZlciAmCmRkICBp
Zj0vZGV2L3plcm8gb2Y9L2ZzL3NkYzEvemVyby04IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rl
di96ZXJvIG9mPS9mcy9zZGIxL3plcm8tOSBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVy
byBvZj0vZnMvc2RqMS96ZXJvLTkgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL3NkaTEvemVyby05IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9z
ZGsxL3plcm8tOSBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RtMS96
ZXJvLTkgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZzEvemVyby05
IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGwxL3plcm8tOSBzdGF0
dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RoMS96ZXJvLTkgc3RhdHVzPW5v
eGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZTEvemVyby05IHN0YXR1cz1ub3hmZXIg
JgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGYxL3plcm8tOSBzdGF0dXM9bm94ZmVyICYKZGQg
IGlmPS9kZXYvemVybyBvZj0vZnMvc2RjMS96ZXJvLTkgc3RhdHVzPW5veGZlciAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL3NkYjEvemVyby0xMCBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYv
emVybyBvZj0vZnMvc2RqMS96ZXJvLTEwIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJv
IG9mPS9mcy9zZGkxL3plcm8tMTAgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL3NkazEvemVyby0xMCBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMv
c2RtMS96ZXJvLTEwIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGcx
L3plcm8tMTAgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbDEvemVy
by0xMCBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RoMS96ZXJvLTEw
IHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGUxL3plcm8tMTAgc3Rh
dHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZjEvemVyby0xMCBzdGF0dXM9
bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RjMS96ZXJvLTEwIHN0YXR1cz1ub3hm
ZXIgJgpzbGVlcCAyODkKa2lsbGFsbCAtOSBkZAo=

--===============2473860355206324776==--

