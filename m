Content-Type: multipart/mixed; boundary="===============2802795361781004868=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched/balance] 18e6296b85e: -96.9% interrupts.RES
Date: Tue, 04 Mar 2014 21:05:59 +0800
Message-ID: <20140304130559.GA28781@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2802795361781004868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alex,

FYI, we noticed the below changes on

https://github.com/alexshi/power-scheduling.git single-balance
commit 18e6296b85ea72c81aa485653d442ad88296d475 ("sched/balance: central ba=
lance prototype")

test case: snb-drag/crypto/tcrypt/2s-301-319

598143917dc5ecf  18e6296b85ea72c81aa485653  =

---------------  -------------------------  =

    206307 ~ 0%     -96.9%       6337 ~ 4%  TOTAL interrupts.RES
    506552 ~ 1%     -24.3%     383290 ~ 3%  TOTAL cpuidle.C6-SNB.usage
     18.27 ~ 9%   +1063.5%     212.53 ~25%  TOTAL time.system_time
         1 ~30%   +1262.5%         21 ~31%  TOTAL time.percent_of_cpu_this_=
job_got
       821 ~12%     -22.3%        638 ~19%  TOTAL vmstat.system.in



                                 time.system_time

   400 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
   350 ++        O         O    O                                          =
 |
   300 ++O  O                     O                                        =
 |
       O      O         O    O       O O                                   =
 |
   250 ++          O                          O                            =
 |
       |              O                          O                         =
 |
   200 ++                                                                  =
 |
       |                                  O                                =
 |
   150 ++                                   O                              =
 |
   100 ++                                                                  =
 |
       |                                                                   =
 |
    50 ++                                                                  =
 |
       *.*..*.*..*.*..*.*..*.*..*.*..*.*..*.*.*..*.*..*.*..*.*..*.*..*.*..*=
.*
     0 ++------------------------------------------------------------------=
-+


Thanks,
Fengguang

--===============2802795361781004868==--

