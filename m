Content-Type: multipart/mixed; boundary="===============5868943298857307621=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [rcu] 0eb885afb20: -25.8% softirqs.RCU
Date: Thu, 21 Aug 2014 21:50:35 +0800
Message-ID: <20140821135035.GA19246@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5868943298857307621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Pranith,

FYI, these changes look nice:

git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/dev
commit 0eb885afb20317016670c1c5dd3a436c91e1e910 ("rcu: Use rcu_gp_kthread_w=
ake() to wake up grace period kthreads")

test case: lkp-a04/aim7/400-disk_rr

It's an in-memory aim7/disk_rr test.
lkp-a04 is an Atom micro server with 8G Memory.

5db6a289a3a0a69  0eb885afb20317016670c1c5d =

---------------  ------------------------- =

    150860 =C2=B1 1%     -25.8%     111937 =C2=B1 1%  TOTAL softirqs.RCU
      2809 =C2=B1 1%     -12.5%       2457 =C2=B1 1%  TOTAL vmstat.system.cs
      4202 =C2=B1 1%      -6.9%       3911 =C2=B1 1%  TOTAL vmstat.system.in
    212421 =C2=B1 2%      -7.7%     196035 =C2=B1 3%  TOTAL time.involuntar=
y_context_switches

                                 vmstat.system.in

  4300 ++------------------------------------------------------------------=
-+
       | .*..                  *..        .*..                     *       =
 |
  4250 *+            .*..     +        .*.    *              *.. .. :      =
 |
  4200 ++    *..*..*.    *.. +    *..*.        :           ..   *    :     =
 |
       |                    *                   :        .*          :  .* =
 |
  4150 ++                                       :  .*..*.             *.   =
 |
  4100 ++                                        *.                        =
 |
       |                                                                   =
 |
  4050 ++                                                                  =
 |
  4000 ++                                                                  =
 |
       |  O  O              O              O                             O =
 |
  3950 O+       O  O     O     O     O  O        O     O  O     O          =
 |
  3900 ++             O                       O     O              O       =
 |
       |                                                     O             =
 |
  3850 ++-------------------------O-----------------------------------O----=
-O


                                 vmstat.system.cs

  3000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  2900 ++                      *..                                         =
 |
       *..*..*..*..*..*..*.. ..   *..*..*..*..*..           .*..  .*..     =
 |
  2800 ++                   *                            .*.    *.      .* =
 |
       |                                         *..*..*.             *.   =
 |
  2700 ++                                                                  =
 |
       |                                                                   =
 |
  2600 ++                                                                  =
 |
       |              O                 O                                  =
 |
  2500 O+ O  O     O        O  O     O     O              O     O  O     O =
 |
       |        O        O        O              O     O                   =
 |
  2400 ++                                     O     O                 O    =
 O
       |                                                     O             =
 |
  2300 ++------------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Fengguang

--===============5868943298857307621==--

