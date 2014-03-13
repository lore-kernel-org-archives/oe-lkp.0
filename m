Content-Type: multipart/mixed; boundary="===============7170252835371539953=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [loopback] b17c706987f: +91.0% qperf.sctp_bw.bw.MB_sec
Date: Thu, 13 Mar 2014 17:29:33 +0800
Message-ID: <20140313092933.GA31360@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7170252835371539953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

We are glad to notice this big performance gain on

git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git master
commit b17c706987fa6f28bdc1771c8266e7a69e22adcb ("loopback: sctp: add NETIF=
_F_SCTP_CSUM to device features")

test case: lkp-a06/micro/qperf/600s

72f8e06f3ea022d  b17c706987fa6f28bdc1771c8  =

---------------  -------------------------  =

     39.30 ~ 3%     +91.0%      75.06 ~11%  TOTAL qperf.sctp_bw.bw.MB_sec
       126 ~ 0%      -3.2%        122 ~ 0%  TOTAL qperf.sctp_lat.latency.us
    216270 ~ 2%     -46.5%     115740 ~ 4%  TOTAL cpuidle.C4.usage
  48722971 ~ 5%     +45.1%   70681678 ~ 7%  TOTAL cpuidle.C2.time
    370655 ~ 2%     +46.8%     543952 ~ 7%  TOTAL cpuidle.C2.usage
      1.00 ~13%     -22.8%       0.77 ~15%  TOTAL perf-profile.cpu-cycles.a=
cpi_processor_ffh_cstate_enter.acpi_idle_enter_bm.cpuidle_enter_state.cpuid=
le_idle_call.arch_cpu_idle
  15233974 ~ 0%     +14.2%   17397187 ~ 3%  TOTAL proc-vmstat.pgalloc_normal
  24268359 ~ 0%     +14.2%   27716949 ~ 3%  TOTAL proc-vmstat.pgfree
   9034872 ~ 0%     +14.2%   10321019 ~ 3%  TOTAL proc-vmstat.pgalloc_dma32
     51262 ~ 2%     -10.0%      46151 ~ 3%  TOTAL time.involuntary_context_=
switches
     13874 ~ 1%      +4.8%      14540 ~ 0%  TOTAL vmstat.system.cs
       812 ~ 0%      -3.4%        784 ~ 1%  TOTAL time.system_time
   4125867 ~ 1%      +3.9%    4285302 ~ 0%  TOTAL time.voluntary_context_sw=
itches

Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                              qperf.sctp_bw.bw.MB_sec

   90 ++------------------------------------------------------------O------=
-+
      |            O                             O                         =
 |
   80 ++              O  O       O    O     O         O                    =
 |
      O  O O  O                     O               O            O       O =
 |
      |          O          O            O    O                O           =
 |
   70 ++                                                 O  O              =
 O
      |                                                                O   =
 |
   60 ++                      O                                            =
 |
      |                                                                    =
 |
   50 ++                                                                   =
 |
      |                                                                    =
 |
      |      .*..               .*..         .*..  .*.     .*..            =
 |
   40 *+.*.*.    *.*..*..*..*.*.    *.*..*..*    *.   *..*.    *.*..*..*   =
 |
      |                                                                    =
 |
   30 ++-------------------------------------------------------------------=
-+

	[O] bisect-bad  sample
	[*] bisect-good sample

Thanks,
Fengguang

--===============7170252835371539953==--

