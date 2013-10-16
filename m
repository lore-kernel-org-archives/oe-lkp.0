Content-Type: multipart/mixed; boundary="===============5586499976795378923=="
MIME-Version: 1.0
From: fengguang.wu@intel.com
To: lkp@lists.01.org
Subject: +8.6% netperf.Throughput_Mbps increase by "page_alloc: fair zone allocator policy"
Date: Wed, 16 Oct 2013 21:28:41 +0800
Message-ID: <20131016132841.GC22518@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5586499976795378923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

We are pleased to notice that your commit 81c0a2bb51 ("mm: page_alloc:
fair zone allocator policy") improves performance in the netperf
TCP_STREAM case:

    e085dbc52fad8d79fa22      81c0a2bb515fd4daae8c  =

------------------------  ------------------------  =

                  649.00        +8.6%       704.80  lkp-nex04/micro/netperf=
/120s-200%-TCP_STREAM
                  649.00        +8.6%       704.80  TOTAL netperf.Throughpu=
t_Mbps


Thanks,
Fengguang

PS. The changed items compared between the bisect GOOD/BAD commits.


                              netperf.Throughput_Mbps

   760 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
   740 O+   O O OO O   OO                                                  =
 |
       | OO          O                                                     =
 |
   720 ++                        O                                         =
 |
       |                  O    O      O O    O      O  O   OO O    O   O OO=
 |
   700 ++                   OO     OO     O    OO O   O         O O  O     =
 O
       |                                                                   =
 |
   680 *+**.*.*.**.*.*.*                                                   =
 |
       |               :       *                                           =
 |
   660 ++               :     : :          O     .*                        =
 |
       |                :.*.* : : .* .*    *.*. *  +     O                 =
 |
   640 ++               *    *   *  *  + .*    *    *                      =
 |
       |                                *                                  =
 |
   620 ++------------------------------------------------------------------=
-+


                                   vmstat.system.cs

   550000 ++---------------------------------------------------------------=
-+
   500000 O+O  O OO O OO O OO  O O OO O  O O  O O O  O  O   OO O  O OO O OO=
 |
          |  O                O         O              O                   =
 |
   450000 ++                                       O            O          =
 O
   400000 ++                                                               =
 |
   350000 ++                                 O            O                =
 |
   300000 ++                                                               =
 |
          |                                                                =
 |
   250000 ++                                                               =
 |
   200000 ++                                                               =
 |
   150000 ++                                                               =
 |
   100000 ++                                                               =
 |
          |                                                                =
 |
    50000 *+**.*.**.*.**.*.**.**.*.**.*.**.*.**.*.**.*                     =
 |
        0 ++---------------------------------------------------------------=
-+


                      lock_stat.&(&zone->lock)->rlock.contentions

   2.4e+07 ++--------------------------------------------------------------=
-+
           |                                 O            O                =
 |
   2.2e+07 O+OO O OO OO O OO                                               =
 O
           |                                        O            O         =
 |
     2e+07 ++                                                              =
 |
           |                    O OO    O O              O  OO O       O  O=
 |
   1.8e+07 ++                O O     O O    O  O  O  O O          O O O  O =
 |
           |                                    O                          =
 |
   1.6e+07 ++                                                              =
 |
           |                                                               =
 |
   1.4e+07 ++                 .*  *                                        =
 |
           *.**.*.**.**.*.**.*  :+ *.*.*                                   =
 |
   1.2e+07 ++                   *       *.*.**.**.*.**                     =
 |
           |                                                               =
 |
     1e+07 ++--------------------------------------------------------------=
-+


          lock_stat.&(&zone->lock)->rlock.contentions.get_page_from_freelist

   2.6e+07 ++--------------------------------------------------------------=
-+
           |    O OO       O                 O            O                =
 |
   2.4e+07 O+OO      OO O O                                                =
 O
   2.2e+07 ++                                       O            O         =
 |
           |                    O OO    O O              O  OO O    O  O  O=
 |
     2e+07 ++                O O     O O    O  OO O  O O          O   O  O =
 |
   1.8e+07 ++                                                              =
 |
           |                                                               =
 |
   1.6e+07 ++                                                              =
 |
   1.4e+07 ++                                                              =
 |
           |                                                               =
 |
   1.2e+07 ++                     *                                        =
 |
     1e+07 *+**.*.**.**.*.**.*.* + *.*.*                                   =
 |
           |                    *       *.*.**.**.*.**                     =
 |
     8e+06 ++--------------------------------------------------------------=
-+


              lock_stat.&(&zone->lock)->rlock.contentions.__free_pages_ok

   2.2e+07 ++---------------------------------------------O----------------=
-+
           |                                 O                             =
 |
   2.1e+07 ++                                                              =
 |
     2e+07 ++     O                                                        =
 O
           O O  O  O OO O OO                                               =
 |
   1.9e+07 ++ O                                     O            O         =
 |
           |                                                               =
 |
   1.8e+07 ++                                                              =
 |
           |                      OO      O                                =
 |
   1.7e+07 ++                 .*O *     O      O         O  OO O       O OO=
 |
   1.6e+07 ++**.    .*     *.* O  :  O O    O     O  O O          O O O    =
 |
           *    *.**  *.*.*     :: :.*.*        O                          =
 |
   1.5e+07 ++                   :: *    *. .* .* .*.*                      =
 |
           |                    *         *  *  *    *                     =
 |
   1.4e+07 ++--------------------------------------------------------------=
-+


                           lock_stat.rcu_node_1.contentions

   100000 ++---------------------------------------------------------------=
-+
    95000 ++                                      *                        =
 |
          |                                   *. +:                        =
 |
    90000 ++                   *    *.*.   *  : *  :.*                     =
 |
    85000 ++                   :+   :   * + +:     *                       =
 |
          |      *     *    *.:  *  :    *   *                             =
 |
    80000 *+**. + *.*.* + .*  *   +:  O                                    =
 |
    75000 ++   *         *  O      *O                                      =
 |
    70000 ++ O      O         OO        O     O        OO                  =
 |
          O O    OO   O  O O     O O     O   O  O O       O                =
 O
    65000 ++   O       O                   O       O        O   O O OO O   =
 |
    60000 ++                                         O       O            O=
 |
          |                                                    O           =
 |
    55000 ++                                                             O =
 |
    50000 ++---------------------------------------------------------------=
-+


                lock_stat.rcu_node_1.contentions.rcu_process_callbacks

   180000 ++---------------------------------------------------------------=
-+
          |                                       *                        =
 |
   170000 ++                                  *  ::                        =
 |
   160000 ++                                  :+ : :                       =
 |
          |                    *    *.*.   *  : *  *.*                     =
 |
   150000 ++     *     *       :+   :   * + +:                             =
 |
   140000 *+ *  : *.*. :+ .**.:  *.:  O  *   *                             =
 |
          | * + :   O *  *  O *    *O         O                            =
 |
   130000 ++OO *  O   O  O    OO   O    O       O      OO O                =
 |
   120000 O+   O O     O   O     O       O O O    OO                O      =
 O
          |                                                 O   O O  O O   =
 |
   110000 ++                                         O       O O          O=
 |
   100000 ++                                                             O =
 |
          |                                                                =
 |
    90000 ++---------------------------------------------------------------=
-+


                                  iostat.cpu.user

   1.8 ++------------------------------------------------------------------=
-+
   1.7 ++                 O OO O O OO O O                                  =
 |
       |                                  O     O          O               =
 |
   1.6 ++O    O                              O O    O OO    O O   OO O O O =
 |
   1.5 O+ O O    O O O OO                                                 O=
 |
   1.4 ++       O                                 O                        =
 |
   1.3 ++                                                       O          =
 O
       |                                                                   =
 |
   1.2 ++                                  O             O                 =
 |
   1.1 ++                                 *                                =
 |
     1 ++                                + :.*.*                           =
 |
   0.9 *+ *.*.*.* .*.*.*            *.*.*  *    *.*.*                      =
 |
       | *       *      :.*.  .*.*.*                                       =
 |
   0.8 ++               *   **                                             =
 |
   0.7 ++------------------------------------------------------------------=
-+

--===============5586499976795378923==--

