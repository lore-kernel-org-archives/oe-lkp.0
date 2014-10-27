Content-Type: multipart/mixed; boundary="===============3838362776554832309=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [futex] 76835b0ebf8: -12.1% will-it-scale.per_process_ops
Date: Mon, 27 Oct 2014 10:18:22 +0800
Message-ID: <20141027021822.GH27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3838362776554832309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 76835b0ebf8a7fe85beb03c75121419a7dec52f0 ("futex: Ensure get_futex_k=
ey_refs() always implies a barrier")


0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \  =

   9204866 =C2=B1  0%     -10.2%    8266680 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-futex3
  11271283 =C2=B1  0%     -12.1%    9911001 =C2=B1  0%  nhm4/will-it-scale/=
performance-futex3
  10185806           -11.1%    9051578        GEO-MEAN will-it-scale.per_pr=
ocess_ops

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

   9211097 =C2=B1  0%     -10.2%    8268370 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-futex3
  11324367 =C2=B1  0%     -12.0%    9969101 =C2=B1  0%  nhm4/will-it-scale/=
performance-futex3
  10213219           -11.1%    9078999        GEO-MEAN will-it-scale.per_th=
read_ops

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      0.63 =C2=B1  0%      +6.3%       0.66 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-futex3
      0.66 =C2=B1  0%      +9.6%       0.72 =C2=B1  0%  nhm4/will-it-scale/=
performance-futex3
      0.64            +7.9%       0.69        GEO-MEAN will-it-scale.scalab=
ility

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      2.01 =C2=B1  1%    +365.3%       9.35 =C2=B1  1%  lkp-wsx01/will-it-s=
cale/performance-futex3
      1.67 =C2=B1  1%    +509.7%      10.17 =C2=B1  3%  nhm4/will-it-scale/=
performance-futex3
      1.83          +432.6%       9.75        GEO-MEAN perf-profile.cpu-cyc=
les.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.system_call_fa=
stpath

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

         1 =C2=B1 34%    +200.0%          4 =C2=B1 17%  lkp-wsx01/will-it-s=
cale/performance-futex3
         1          +200.0%          4        GEO-MEAN sched_debug.cpu#63.n=
r_uninterruptible

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       161 =C2=B1 27%    +159.0%        418 =C2=B1 29%  lkp-wsx01/will-it-s=
cale/performance-futex3
       161          +159.0%        418        GEO-MEAN sched_debug.cpu#48.s=
ched_goidle

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       395 =C2=B1 23%    +146.2%        972 =C2=B1 27%  lkp-wsx01/will-it-s=
cale/performance-futex3
       395          +146.2%        972        GEO-MEAN sched_debug.cpu#48.n=
r_switches

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       404 =C2=B1 23%    +143.3%        984 =C2=B1 27%  lkp-wsx01/will-it-s=
cale/performance-futex3
       404          +143.3%        984        GEO-MEAN sched_debug.cpu#48.s=
ched_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       434 =C2=B1 32%     -68.0%        139 =C2=B1 20%  lkp-wsx01/will-it-s=
cale/performance-futex3
       434           -68.0%        138        GEO-MEAN sched_debug.cpu#61.t=
twu_local

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      5335 =C2=B1 48%     -54.4%       2433 =C2=B1 43%  lkp-wsx01/will-it-s=
cale/performance-futex3
      5335           -54.4%       2433        GEO-MEAN sched_debug.cpu#20.s=
ched_goidle

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       498 =C2=B1 23%     -54.4%        227 =C2=B1 25%  lkp-wsx01/will-it-s=
cale/performance-futex3
       498           -54.4%        227        GEO-MEAN sched_debug.cpu#55.s=
ched_goidle

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       576 =C2=B1 26%     -46.8%        306 =C2=B1 34%  lkp-wsx01/will-it-s=
cale/performance-futex3
       576           -46.8%        306        GEO-MEAN sched_debug.cpu#55.t=
twu_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      0.47 =C2=B1  7%    +119.7%       1.02 =C2=B1  5%  nhm4/will-it-scale/=
performance-futex3
      0.47          +119.7%       1.02        GEO-MEAN perf-profile.cpu-cyc=
les.ret_from_sys_call.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     11216 =C2=B1 46%     -49.6%       5648 =C2=B1 38%  lkp-wsx01/will-it-s=
cale/performance-futex3
     11216           -49.6%       5648        GEO-MEAN sched_debug.cpu#20.n=
r_switches

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     11237 =C2=B1 46%     -49.5%       5669 =C2=B1 38%  lkp-wsx01/will-it-s=
cale/performance-futex3
     11237           -49.5%       5669        GEO-MEAN sched_debug.cpu#20.s=
ched_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1232 =C2=B1 27%     -52.8%        581 =C2=B1 21%  lkp-wsx01/will-it-s=
cale/performance-futex3
      1232           -52.8%        581        GEO-MEAN sched_debug.cpu#55.n=
r_switches

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       155 =C2=B1 36%    +182.5%        438 =C2=B1 40%  lkp-wsx01/will-it-s=
cale/performance-futex3
       155          +182.5%        438        GEO-MEAN sched_debug.cpu#48.t=
twu_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1245 =C2=B1 27%     -52.5%        591 =C2=B1 21%  lkp-wsx01/will-it-s=
cale/performance-futex3
      1245           -52.5%        591        GEO-MEAN sched_debug.cpu#55.s=
ched_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1461 =C2=B1 31%     -46.9%        776 =C2=B1 23%  lkp-wsx01/will-it-s=
cale/performance-futex3
      1461           -46.9%        776        GEO-MEAN sched_debug.cpu#42.t=
twu_local

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       856 =C2=B1 34%     -50.2%        426 =C2=B1 31%  lkp-wsx01/will-it-s=
cale/performance-futex3
       855           -50.2%        426        GEO-MEAN sched_debug.cpu#58.t=
twu_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       926 =C2=B1 19%     -41.0%        546 =C2=B1 24%  lkp-wsx01/will-it-s=
cale/performance-futex3
       926           -41.0%        546        GEO-MEAN sched_debug.cpu#61.t=
twu_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1593 =C2=B1 17%     -45.1%        875 =C2=B1 20%  lkp-wsx01/will-it-s=
cale/performance-futex3
      1593           -45.1%        875        GEO-MEAN sched_debug.cpu#61.n=
r_switches

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      3667 =C2=B1 25%     -38.3%       2263 =C2=B1 18%  lkp-wsx01/will-it-s=
cale/performance-futex3
      3667           -38.3%       2262        GEO-MEAN sched_debug.cpu#42.n=
r_switches

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1604 =C2=B1 17%     -44.8%        885 =C2=B1 20%  lkp-wsx01/will-it-s=
cale/performance-futex3
      1604           -44.8%        885        GEO-MEAN sched_debug.cpu#61.s=
ched_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      3680 =C2=B1 25%     -38.1%       2279 =C2=B1 18%  lkp-wsx01/will-it-s=
cale/performance-futex3
      3680           -38.1%       2279        GEO-MEAN sched_debug.cpu#42.s=
ched_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       402 =C2=B1 22%     +45.4%        585 =C2=B1 29%  lkp-wsx01/will-it-s=
cale/performance-futex3
       402           +45.4%        585        GEO-MEAN sched_debug.cpu#70.s=
ched_goidle

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       153 =C2=B1 13%     -35.3%         99 =C2=B1 22%  nhm4/will-it-scale/=
performance-futex3
       153           -35.3%         99        GEO-MEAN sched_debug.cpu#6.lo=
ad

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       595 =C2=B1 21%    +108.8%       1242 =C2=B1 40%  lkp-wsx01/will-it-s=
cale/performance-futex3
       595          +108.8%       1242        GEO-MEAN sched_debug.cpu#70.t=
twu_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1127 =C2=B1 31%     -42.3%        651 =C2=B1  8%  nhm4/will-it-scale/=
performance-futex3
      1127           -42.3%        650        GEO-MEAN sched_debug.cfs_rq[3=
]:/.blocked_load_avg

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     16.48 =C2=B1  1%     +56.0%      25.71 =C2=B1  2%  nhm4/will-it-scale/=
performance-futex3
     16.48           +56.0%      25.71        GEO-MEAN perf-profile.cpu-cyc=
les.futex_wake.do_futex.sys_futex.system_call_fastpath.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       575 =C2=B1 24%     -39.7%        346 =C2=B1 21%  lkp-wsx01/will-it-s=
cale/performance-futex3
       575           -39.7%        346        GEO-MEAN sched_debug.cpu#61.s=
ched_goidle

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       534 =C2=B1 11%     +63.0%        871 =C2=B1 35%  lkp-wsx01/will-it-s=
cale/performance-futex3
       534           +63.0%        871        GEO-MEAN sched_debug.cpu#45.n=
r_switches

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       545 =C2=B1 11%     +62.0%        883 =C2=B1 35%  lkp-wsx01/will-it-s=
cale/performance-futex3
       545           +62.0%        882        GEO-MEAN sched_debug.cpu#45.s=
ched_count

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

        10 =C2=B1 26%     -44.0%          5 =C2=B1 18%  lkp-wsx01/will-it-s=
cale/performance-futex3
        10           -44.0%          5        GEO-MEAN sched_debug.cpu#72.c=
pu_load[0]

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       827 =C2=B1 26%     +55.5%       1286 =C2=B1 23%  nhm4/will-it-scale/=
performance-futex3
       826           +55.5%       1285        GEO-MEAN sched_debug.cfs_rq[4=
]:/.blocked_load_avg

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1245 =C2=B1 28%     -38.8%        762 =C2=B1  8%  nhm4/will-it-scale/=
performance-futex3
      1245           -38.8%        762        GEO-MEAN sched_debug.cfs_rq[3=
]:/.tg_load_contrib

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       969 =C2=B1 22%     +48.4%       1438 =C2=B1 20%  nhm4/will-it-scale/=
performance-futex3
       969           +48.4%       1438        GEO-MEAN sched_debug.cfs_rq[4=
]:/.tg_load_contrib

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       133 =C2=B1 11%     -28.7%         95 =C2=B1 22%  nhm4/will-it-scale/=
performance-futex3
       133           -28.7%         95        GEO-MEAN sched_debug.cfs_rq[6=
]:/.load

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       799 =C2=B1 19%     -34.8%        521 =C2=B1 26%  nhm4/will-it-scale/=
performance-futex3
       799           -34.8%        521        GEO-MEAN sched_debug.cfs_rq[2=
]:/.blocked_load_avg

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       906 =C2=B1 17%     -30.8%        627 =C2=B1 21%  nhm4/will-it-scale/=
performance-futex3
       906           -30.8%        627        GEO-MEAN sched_debug.cfs_rq[2=
]:/.tg_load_contrib

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

        70 =C2=B1 10%     +21.7%         85 =C2=B1  9%  nhm4/will-it-scale/=
performance-futex3
        70           +21.7%         85        GEO-MEAN sched_debug.cpu#2.cp=
u_load[3]

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      3149 =C2=B1 11%     -15.0%       2677 =C2=B1 10%  lkp-wsx01/will-it-s=
cale/performance-futex3
      3149           -15.0%       2676        GEO-MEAN sched_debug.cpu#71.c=
urr->pid

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

        68 =C2=B1 12%     +23.5%         84 =C2=B1  9%  nhm4/will-it-scale/=
performance-futex3
        68           +23.5%         83        GEO-MEAN sched_debug.cpu#2.cp=
u_load[4]

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

    214345 =C2=B1 13%     +31.5%     281773 =C2=B1 13%  nhm4/will-it-scale/=
performance-futex3
    214345           +31.5%     281773        GEO-MEAN sched_debug.cfs_rq[2=
]:/.min_vruntime

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     38234 =C2=B1  5%     -17.6%      31518 =C2=B1  1%  nhm4/will-it-scale/=
performance-futex3
     38234           -17.6%      31518        GEO-MEAN softirqs.RCU

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     37071 =C2=B1 15%     +36.8%      50702 =C2=B1 15%  nhm4/will-it-scale/=
performance-futex3
     37071           +36.8%      50702        GEO-MEAN sched_debug.cfs_rq[2=
]:/.exec_clock

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

    324067 =C2=B1  8%     -18.2%     265084 =C2=B1 14%  nhm4/will-it-scale/=
performance-futex3
    324067           -18.2%     265084        GEO-MEAN sched_debug.cfs_rq[6=
]:/.min_vruntime

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       103 =C2=B1  5%     -21.8%         81 =C2=B1  9%  nhm4/will-it-scale/=
performance-futex3
       103           -21.8%         81        GEO-MEAN sched_debug.cpu#6.cp=
u_load[2]

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       114 =C2=B1  4%     -21.6%         89 =C2=B1 12%  nhm4/will-it-scale/=
performance-futex3
       114           -21.6%         89        GEO-MEAN sched_debug.cpu#6.cp=
u_load[1]

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     58381 =C2=B1 10%     -23.2%      44812 =C2=B1 18%  nhm4/will-it-scale/=
performance-futex3
     58381           -23.2%      44812        GEO-MEAN sched_debug.cfs_rq[6=
]:/.exec_clock

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     82318 =C2=B1 11%     -20.7%      65237 =C2=B1 13%  nhm4/will-it-scale/=
performance-futex3
     82318           -20.7%      65237        GEO-MEAN sched_debug.cpu#1.nr=
_load_updates

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

        95 =C2=B1  7%     -19.9%         76 =C2=B1  8%  nhm4/will-it-scale/=
performance-futex3
        95           -19.9%         76        GEO-MEAN sched_debug.cpu#6.cp=
u_load[4]

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      7.76 =C2=B1  0%     +15.3%       8.95 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-futex3
      6.55 =C2=B1  3%     +22.3%       8.01 =C2=B1  1%  nhm4/will-it-scale/=
performance-futex3
      7.13           +18.8%       8.47        GEO-MEAN perf-profile.cpu-cyc=
les.get_futex_key.futex_wake.do_futex.sys_futex.system_call_fastpath

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

        98 =C2=B1  7%     -20.5%         78 =C2=B1  8%  nhm4/will-it-scale/=
performance-futex3
        98           -20.5%         78        GEO-MEAN sched_debug.cpu#6.cp=
u_load[3]

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1.22 =C2=B1  4%     -15.5%       1.03 =C2=B1  9%  nhm4/will-it-scale/=
performance-futex3
      1.22           -15.5%       1.03        GEO-MEAN perf-profile.cpu-cyc=
les.drop_futex_key_refs.isra.12.do_futex.sys_futex.system_call_fastpath.sys=
call

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      3.76 =C2=B1  0%     -13.5%       3.25 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-futex3
      3.23 =C2=B1  2%     -15.0%       2.75 =C2=B1  2%  nhm4/will-it-scale/=
performance-futex3
      3.49           -14.3%       2.99        GEO-MEAN perf-profile.cpu-cyc=
les.sysret_check.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      3053 =C2=B1  8%     -18.2%       2499 =C2=B1 13%  nhm4/will-it-scale/=
performance-futex3
      3053           -18.2%       2499        GEO-MEAN sched_debug.cpu#6.cu=
rr->pid

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     11.31 =C2=B1  0%     -11.2%      10.05 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-futex3
     11.27 =C2=B1  1%     -16.4%       9.43 =C2=B1  1%  nhm4/will-it-scale/=
performance-futex3
     11.29           -13.8%       9.73        GEO-MEAN perf-profile.cpu-cyc=
les.system_call.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     18.21 =C2=B1  1%     -13.6%      15.74 =C2=B1  2%  nhm4/will-it-scale/=
performance-futex3
     18.21           -13.6%      15.74        GEO-MEAN perf-profile.cpu-cyc=
les.hash_futex.do_futex.sys_futex.system_call_fastpath.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     12.56 =C2=B1  0%     -12.2%      11.03 =C2=B1  1%  lkp-wsx01/will-it-s=
cale/performance-futex3
     12.54 =C2=B1  1%     -14.4%      10.73 =C2=B1  3%  nhm4/will-it-scale/=
performance-futex3
     12.55           -13.3%      10.88        GEO-MEAN perf-profile.cpu-cyc=
les.system_call_after_swapgs.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     21140 =C2=B1  9%     +17.5%      24849 =C2=B1  8%  nhm4/will-it-scale/=
performance-futex3
     21140           +17.5%      24849        GEO-MEAN sched_debug.cfs_rq[2=
]:/.avg->runnable_avg_sum

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      4.52 =C2=B1  2%     -11.5%       4.00 =C2=B1  1%  lkp-wsx01/will-it-s=
cale/performance-futex3
     42.44 =C2=B1  0%     +13.8%      48.30 =C2=B1  2%  nhm4/will-it-scale/=
performance-futex3
     13.85            +0.4%      13.90        GEO-MEAN perf-profile.cpu-cyc=
les.do_futex.sys_futex.system_call_fastpath.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1.21 =C2=B1  1%     -11.4%       1.08 =C2=B1  1%  lkp-wsx01/will-it-s=
cale/performance-futex3
      1.21           -11.4%       1.08        GEO-MEAN perf-profile.cpu-cyc=
les.drop_futex_key_refs.isra.12.futex_wake.do_futex.sys_futex.system_call_f=
astpath

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     50.65 =C2=B1  0%     +11.9%      56.69 =C2=B1  2%  nhm4/will-it-scale/=
performance-futex3
     50.65           +11.9%      56.69        GEO-MEAN perf-profile.cpu-cyc=
les.system_call_fastpath.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     20.50 =C2=B1  0%     -10.9%      18.25 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-futex3
     20.50           -10.9%      18.25        GEO-MEAN perf-profile.cpu-cyc=
les.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     27368 =C2=B1  7%     -13.6%      23638 =C2=B1  8%  nhm4/will-it-scale/=
performance-futex3
     27368           -13.6%      23638        GEO-MEAN sched_debug.cfs_rq[6=
]:/.avg->runnable_avg_sum

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      4.92 =C2=B1  0%     -11.5%       4.36 =C2=B1  1%  lkp-wsx01/will-it-s=
cale/performance-futex3
     48.57 =C2=B1  0%     +11.3%      54.04 =C2=B1  2%  nhm4/will-it-scale/=
performance-futex3
     15.46            -0.7%      15.34        GEO-MEAN perf-profile.cpu-cyc=
les.sys_futex.system_call_fastpath.syscall

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

       596 =C2=B1  7%     -13.6%        515 =C2=B1  8%  nhm4/will-it-scale/=
performance-futex3
       596           -13.6%        515        GEO-MEAN sched_debug.cfs_rq[6=
]:/.tg_runnable_contrib

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      3007 =C2=B1  6%     -11.8%       2654 =C2=B1 13%  lkp-wsx01/will-it-s=
cale/performance-futex3
      3007           -11.8%       2653        GEO-MEAN sched_debug.cpu#38.c=
urr->pid

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

     39113 =C2=B1  2%     +10.7%      43292 =C2=B1  4%  nhm4/will-it-scale/=
performance-futex3
     39113           +10.7%      43292        GEO-MEAN cpuidle.C6-NHM.usage

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      1401 =C2=B1  0%     -10.1%       1260 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-futex3
       199 =C2=B1  0%     -21.5%        156 =C2=B1  2%  nhm4/will-it-scale/=
performance-futex3
       528           -16.0%        443        GEO-MEAN time.user_time

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

      3901 =C2=B1  0%      +3.6%       4041 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-futex3
       522 =C2=B1  0%      +8.2%        565 =C2=B1  0%  nhm4/will-it-scale/=
performance-futex3
      1428            +5.9%       1511        GEO-MEAN time.system_time

lkp-wsx01: Westmere-EX
Memory: 128G

nhm4: Nehalem
Memory: 4G




                             will-it-scale.scalability

  0.73 ++----------------------------------------O-------------------------=
-+
       O    O     O    O    O     O    O    O          O    O    O     O   =
 O
  0.72 ++                                                                  =
 |
  0.71 ++                                                                  =
 |
       |                                                                   =
 |
   0.7 ++                                                                  =
 |
       |                                                                   =
 |
  0.69 ++                                                                  =
 |
       |                                                                   =
 |
  0.68 ++                                                                  =
 |
  0.67 ++                                                                  =
 |
       |                                                                   =
 |
  0.66 *+...*.....*....*....         ..*....   ..*.....*....*              =
 |
       |                    *.....*..       *..                            =
 |
  0.65 ++------------------------------------------------------------------=
-+


                             will-it-scale.per_process_ops

  1.14e+07 ++--------------------------------------------------------------=
-+
           *....*....*....*....   ..*....*....*....*....*....*             =
 |
  1.12e+07 ++                  *..                                         =
 |
           |                                                               =
 |
   1.1e+07 ++                                                              =
 |
  1.08e+07 ++                                                              =
 |
           |                                                               =
 |
  1.06e+07 ++                                                              =
 |
           |                                                               =
 |
  1.04e+07 ++                                                              =
 |
  1.02e+07 ++                                                              =
 |
           |                                                               =
 |
     1e+07 ++                                                              =
 |
           O    O    O    O    O    O    O    O    O    O    O    O    O   =
 O
   9.8e+06 ++--------------------------------------------------------------=
-+


                             will-it-scale.per_thread_ops

  1.14e+07 ++--------------------------------------------------------------=
-+
           *....*....*....*....*....*....*....*....*....*....*             =
 |
  1.12e+07 ++                                                              =
 |
           |                                                               =
 |
   1.1e+07 ++                                                              =
 |
  1.08e+07 ++                                                              =
 |
           |                                                               =
 |
  1.06e+07 ++                                                              =
 |
           |                                                               =
 |
  1.04e+07 ++                                                              =
 |
  1.02e+07 ++                                                              =
 |
           |                                                               =
 |
     1e+07 O+   O    O    O    O    O    O    O    O         O             =
 O
           |                                            O         O    O   =
 |
   9.8e+06 ++--------------------------------------------------------------=
-+




  28 ++--------------------------------------------------------------------=
-+
     |                                                      O              =
 |
  26 O+   O     O    O     O    O     O    O     O    O                    =
 O
     |                                                           O     O   =
 |
  24 ++                                                                    =
 |
     |                                                                     =
 |
  22 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  18 ++                                                                    =
 |
     |       ...*....*.....   ..*.....*....   ...*....*.....               =
 |
  16 *+...*..              *..             *..              *              =
 |
     |                                                                     =
 |
  14 ++--------------------------------------------------------------------=
-+




  11 ++--------------------------------------------------------------------=
-+
  10 O+   O     O    O          O     O    O     O    O     O          O   =
 O
     |                     O                                     O         =
 |
   9 ++                                                                    =
 |
   8 ++                                                                    =
 |
     |                                                                     =
 |
   7 ++                                                                    =
 |
   6 ++                                                                    =
 |
   5 ++                                                                    =
 |
     |                                                                     =
 |
   4 ++                                                                    =
 |
   3 ++                                                                    =
 |
     |                                                                     =
 |
   2 *+...*.....*....*.....*....*.....*....*.....*....*.....*              =
 |
   1 ++--------------------------------------------------------------------=
-+




    9 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  8.5 ++   O                                                               =
 |
      |                     O                                              =
 |
      O          O                    O               O     O              =
 O
    8 ++              O          O          O    O               O     O   =
 |
      |                                                                    =
 |
  7.5 ++                                                                   =
 |
      |                                                                    =
 |
    7 ++                                                                   =
 |
      |          *....                                                     =
 |
      |        ..     *.....   ..*....*....     .*....*.....               =
 |
  6.5 ++      .             *..            .  ..            *              =
 |
      |     ..                              *.                             =
 |
    6 *+---*---------------------------------------------------------------=
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
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============3838362776554832309==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIGVuZXJneTogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcTogCiAgdHVyYm9zdGF0
OiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMAogIHBtZXRlcjogCmRlZmF1bHRfd2F0
Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOgotIHBl
cmZvcm1hbmNlCmNvbW1pdDogZjExNDA0MGUzZWE2ZTA3MzcyMzM0YWRlNzVkMWVlMDc3NWMzNTVl
MQptb2RlbDogTmVoYWxlbQpucl9jcHU6IDgKbWVtb3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9k
ZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1w
YXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZ
Wi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQyIgpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQz
IgpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6CiAgdGVzdDoKICAtIGZ1
dGV4MwplbnF1ZXVlX3RpbWU6IDIwMTQtMTAtMjEgMDA6MzM6NTEuMzU4NDcyNTUxICswODowMAp0
ZXN0Ym94OiBuaG00CnRib3hfZ3JvdXA6IG5obTQKa2NvbmZpZzogeDg2XzY0LXJoZWwKaGVhZF9j
b21taXQ6IGY1NjQ2MThjODlmOTUyZTkxNzEyNzhlZDkzNmM0NzQwMzY0YjMzYTAKYmFzZV9jb21t
aXQ6IGYxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3NzVjMzU1ZTEKYnJhbmNoOiBsaW51
eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNDEwMjEwMAprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1y
aGVsL2YxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3NzVjMzU1ZTEvdm1saW51ei0zLjE4
LjAtcmMxLWdmMTE0MDQwIgp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyZXN1bHRfcm9vdDogIi9y
ZXN1bHQvbmhtNC93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLWZ1dGV4My9kZWJpYW4teDg2XzY0
LmNnei94ODZfNjQtcmhlbC9mMTE0MDQwZTNlYTZlMDczNzIzMzRhZGU3NWQxZWUwNzc1YzM1NWUx
LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbmhtNC9jeWNsaWNfd2lsbC1pdC1zY2FsZS1w
ZXJmb3JtYW5jZS1mdXRleDMteDg2XzY0LXJoZWwtQkFTRS1mMTE0MDQwZTNlYTZlMDczNzIzMzRh
ZGU3NWQxZWUwNzc1YzM1NWUxLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0LTEwLTIxIDAxOjAz
OjE0LjIwMTk5MjA1NCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA2LjY0IDMu
NDAgMS4zNyAxLzEyNyA1NjE4CnN0YXJ0X3RpbWU6ICcxNDEzODI0NjI1JwplbmRfdGltZTogJzE0
MTM4MjQ5MzAnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTQxMDIwLTIzMDQzOCIK

--===============3838362776554832309==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgouL3J1bnRlc3QucHkgZnV0ZXgzIDMyIDEgNCA2IDgK

--===============3838362776554832309==--

