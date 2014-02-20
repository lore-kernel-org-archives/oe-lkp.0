Content-Type: multipart/mixed; boundary="===============4498065856067330882=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [x86] 339a3922f6: +4.3% aim7 jobs-per-min
Date: Thu, 20 Feb 2014 21:06:46 +0800
Message-ID: <20140220130646.GA22815@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4498065856067330882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Maarten,

We are glad to find that your commit 339a3922f68dcb7d93001f07b7e914d5cf6c06=
6d
("decrease useless padding") increased aim disk_src performance by 4.3%:

74833276be6802b  339a3922f68dcb7d93001f07b  =

---------------  -------------------------  =

    511685 ~ 0%      +4.3%     533571 ~ 0%  TOTAL aim7.2000.jobs-per-min
     77.30 ~ 0%      -9.9%      69.66 ~ 0%  TOTAL time.system_time
      1.95 ~ 2%      +7.0%       2.09 ~ 2%  TOTAL iostat.sda.rrqm/s
     23.57 ~ 0%      -4.1%      22.60 ~ 0%  TOTAL time.elapsed_time
       425 ~ 0%      -3.1%        412 ~ 0%  TOTAL time.percent_of_cpu_this_=
job_got
      7.59 ~ 0%      -2.9%       7.37 ~ 0%  TOTAL boottime.dhcp
     15.24 ~ 0%      -1.9%      14.94 ~ 0%  TOTAL boottime.boot

                                 time.system_time

   82 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
   80 ++                                 ..*..                             =
 |
      |                   .*..        .*.          .*..                    =
 |
   78 ++.*..*..*..*..*..*.    *..  .*.        *..*.    *..*..        .*..* =
 |
      *.                         *.                          *..*..*.      =
 |
   76 ++                                                                   =
 |
      |                                                                    =
 |
   74 ++                                                                   =
 |
      |                                                                    =
 |
   72 ++                                                                   =
 |
      |                                                                    =
 |
   70 O+ O  O  O  O  O  O  O  O     O  O   O  O  O  O  O           O  O  O =
 |
      |                                                   O  O  O          =
 O
   68 ++-------------------------O-----------------------------------------=
-+


                                  time.elapsed_time

     24 ++-----------------------------------------------------------------=
-+
        |                                  *..                             =
 |
   23.8 ++                                +   *..                          =
 |
        *..*..  .*..     .*..*..*..  .*..*       *..*..*..*..        .*..  =
 |
   23.6 ++    *.    *..*.          *.                        *..*..*.    * =
 |
   23.4 ++                                                                 =
 |
        |                                                                  =
 |
   23.2 ++                                                                 =
 |
        |                                                                  =
 |
     23 ++                                                                 =
 |
        |                                                                  =
 |
   22.8 ++          O              O     O    O              O             =
 |
   22.6 O+ O  O  O     O  O  O  O     O    O     O  O  O        O  O  O  O =
 O
        |                                                 O                =
 |
   22.4 ++-----------------------------------------------------------------=
-+


                                aim7.2000.jobs-per-min

   540000 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
   535000 O+ O  O             O        O    O     O  O  O  O     O O  O  O =
 |
   530000 ++       O O  O  O     O  O     O    O              O            =
 O
          |                                                                =
 |
   525000 ++                                                               =
 |
          |                                                                =
 |
   520000 ++                                                               =
 |
          |                                                                =
 |
   515000 ++                                                    .*.        =
 |
   510000 *+.*..*..*.*..*..*..*..*..*..                      .*.   *..  .* =
 |
          |                            *..*.     .*..*..*..*.         *.   =
 |
   505000 ++                                *..*.                          =
 |
          |                                                                =
 |
   500000 ++---------------------------------------------------------------=
-+


--===============4498065856067330882==--

