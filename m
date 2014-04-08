Content-Type: multipart/mixed; boundary="===============5314104745375465253=="
MIME-Version: 1.0
From: Wanlong Gao <gaowanlong@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Fwd: [Btrfs] b88935bf982: -3.4% iostat.sdd.wkB/s
Date: Tue, 08 Apr 2014 09:17:06 +0800
Message-ID: <53434E12.60009@cn.fujitsu.com>
In-Reply-To: <5340083a.IaeqbGUWxBlTru/6%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5314104745375465253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Miao,

FYI, we noticed the below changes contain some iostat regressions on

commit b88935bf9822cda58fd70dffe8e016d448757d40 ("Btrfs: remove the unneces=
sary flush when preparing the pages")

test case: lkp-st02/micro/dd-write/11HDD-RAID5-cfq-btrfs-100dd

41bd9ca459a007c  b88935bf9822cda58fd70dffe  =

---------------  -------------------------  =

       548 ~ 4%      +9.7%        601 ~ 3%  TOTAL proc-vmstat.kswapd_high_w=
mark_hit_quickly
     82.47 ~ 3%     +91.4%     157.84 ~ 2%  TOTAL iostat.sdd.rrqm/s
     82.35 ~ 1%     +91.4%     157.63 ~ 2%  TOTAL iostat.sde.rrqm/s
     84.22 ~ 3%     +88.6%     158.85 ~ 2%  TOTAL iostat.sdf.rrqm/s
     84.71 ~ 3%     +90.2%     161.08 ~ 3%  TOTAL iostat.sdh.rrqm/s
     83.29 ~ 1%     +91.2%     159.27 ~ 2%  TOTAL iostat.sdb.rrqm/s
     83.04 ~ 2%     +89.2%     157.14 ~ 3%  TOTAL iostat.sdl.rrqm/s
     84.17 ~ 2%     +90.4%     160.27 ~ 2%  TOTAL iostat.sdg.rrqm/s
     83.84 ~ 1%     +87.1%     156.83 ~ 4%  TOTAL iostat.sdj.rrqm/s
     83.57 ~ 1%     +85.5%     155.06 ~ 4%  TOTAL iostat.sdk.rrqm/s
     83.25 ~ 0%     +90.9%     158.96 ~ 2%  TOTAL iostat.sdc.rrqm/s
     83.60 ~ 4%     +87.7%     156.91 ~ 3%  TOTAL iostat.sdi.rrqm/s
       400 ~ 3%     +78.6%        715 ~ 2%  TOTAL iostat.sdd.rkB/s
       400 ~ 2%     +78.7%        715 ~ 2%  TOTAL iostat.sde.rkB/s
       404 ~ 2%     +78.5%        721 ~ 2%  TOTAL iostat.sdb.rkB/s
       408 ~ 3%     +76.4%        719 ~ 2%  TOTAL iostat.sdf.rkB/s
       410 ~ 4%     +77.9%        729 ~ 2%  TOTAL iostat.sdh.rkB/s
       405 ~ 1%     +75.4%        711 ~ 3%  TOTAL iostat.sdj.rkB/s
       407 ~ 3%     +78.1%        726 ~ 2%  TOTAL iostat.sdg.rkB/s
       404 ~ 1%     +78.5%        720 ~ 2%  TOTAL iostat.sdc.rkB/s
       402 ~ 3%     +77.0%        712 ~ 2%  TOTAL iostat.sdl.rkB/s
       404 ~ 2%     +73.9%        703 ~ 4%  TOTAL iostat.sdk.rkB/s
       405 ~ 4%     +75.7%        711 ~ 3%  TOTAL iostat.sdi.rkB/s
    295541 ~ 2%      -3.6%     284874 ~ 1%  TOTAL vmstat.io.bo
    295407 ~ 2%      -3.6%     284688 ~ 1%  TOTAL iostat.md0.wkB/s
      7169 ~ 2%      -3.5%       6920 ~ 1%  TOTAL iostat.sdl.wrqm/s
     29656 ~ 2%      -3.5%      28630 ~ 1%  TOTAL iostat.sdl.wkB/s
      7168 ~ 2%      -3.5%       6920 ~ 1%  TOTAL iostat.sdk.wrqm/s
      7170 ~ 2%      -3.4%       6924 ~ 1%  TOTAL iostat.sdf.wrqm/s
      7168 ~ 2%      -3.5%       6920 ~ 1%  TOTAL iostat.sdi.wrqm/s
      7168 ~ 2%      -3.4%       6921 ~ 1%  TOTAL iostat.sdj.wrqm/s
     29653 ~ 2%      -3.5%      28630 ~ 1%  TOTAL iostat.sdk.wkB/s
     29660 ~ 2%      -3.4%      28647 ~ 1%  TOTAL iostat.sdf.wkB/s
     29651 ~ 2%      -3.4%      28630 ~ 1%  TOTAL iostat.sdi.wkB/s
     29651 ~ 2%      -3.4%      28635 ~ 1%  TOTAL iostat.sdj.wkB/s
      7169 ~ 2%      -3.4%       6925 ~ 1%  TOTAL iostat.sdg.wrqm/s
      7170 ~ 2%      -3.4%       6924 ~ 1%  TOTAL iostat.sdc.wrqm/s
     29656 ~ 2%      -3.4%      28649 ~ 1%  TOTAL iostat.sdg.wkB/s
      7168 ~ 2%      -3.4%       6925 ~ 1%  TOTAL iostat.sde.wrqm/s
      7169 ~ 2%      -3.4%       6924 ~ 1%  TOTAL iostat.sdb.wrqm/s
     29658 ~ 2%      -3.4%      28646 ~ 1%  TOTAL iostat.sdc.wkB/s
     29654 ~ 2%      -3.4%      28652 ~ 1%  TOTAL iostat.sde.wkB/s
     29658 ~ 2%      -3.4%      28648 ~ 1%  TOTAL iostat.sdb.wkB/s
      7169 ~ 2%      -3.4%       6923 ~ 1%  TOTAL iostat.sdh.wrqm/s
     29655 ~ 2%      -3.4%      28644 ~ 1%  TOTAL iostat.sdh.wkB/s
      7166 ~ 2%      -3.4%       6922 ~ 1%  TOTAL iostat.sdd.wrqm/s
     29645 ~ 2%      -3.4%      28640 ~ 1%  TOTAL iostat.sdd.wkB/s
      2357 ~ 2%      -3.4%       2277 ~ 1%  TOTAL iostat.md0.w/s
  8.24e+12 ~ 0%      -2.6%  8.029e+12 ~ 0%  TOTAL perf-stat.ref-cycles

Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                                 iostat.sdi.rkB/s

   800 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
   750 ++                                        O      O                  =
 |
   700 ++     O       O    O              O   O       O    O               =
 |
       O O       O O    O    O  O O  O O    O      O                       =
 |
   650 ++   O                                                              =
 |
   600 ++                                                                  =
 |
       |                                                                   =
 |
   550 ++                                                                  =
 |
   500 ++                                                                  =
 |
       |                                                                   =
 |
   450 ++    .*..*          .*..                            .*..      .*.. =
 |
   400 ++*..*     +  .*.*..*    *.*..*.*..*.*.*..*.*..    .*    *.*..*    *=
.|
       *           *.                                 *.*.                 =
 *
   350 ++------------------------------------------------------------------=
-+


                                 iostat.sdc.rkB/s

   750 ++----------------------------------------O-------------------------=
-+
       |                   O                       O  O O                  =
 |
   700 ++               O              O    O              O               =
 |
   650 O+O  O O  O O  O      O  O O  O    O   O                            =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
       |                                                                   =
 |
   550 ++                                                                  =
 |
       |                                                                   =
 |
   500 ++                                                                  =
 |
   450 ++                                                                  =
 |
       |.*.. .*..                .*..*.  .*. .*..*.    .*..                =
 |
   400 *+   *    *.*..*.*..*.*..*      *.   *      *..*    *.*.. .*..*.*..*=
.*
       |                                                        *          =
 |
   350 ++------------------------------------------------------------------=
-+


                                 iostat.sdi.rrqm/s

   170 ++----------------------------------------O-------------------------=
-+
   160 ++                                               O                  =
 |
       |      O       O    O                          O    O               =
 |
   150 ++O       O O    O    O  O O  O O  O O O    O                       =
 |
   140 O+   O                                                              =
 |
       |                                                                   =
 |
   130 ++                                                                  =
 |
   120 ++                                                                  =
 |
   110 ++                                                                  =
 |
       |                                                                   =
 |
   100 ++                                                                  =
 |
    90 ++    .*..*          .*..                            .*..      .*.. =
 |
       |.*..*     +  .*.*..*    *.*..*.*..*.*.*..*.*..    .*    *.*..*    *=
.|
    80 *+          *.                                 *.*.                 =
 *
    70 ++------------------------------------------------------------------=
-+


                                 iostat.sdj.rrqm/s

   170 ++----------------------------------------O-------------------------=
-+
   160 ++                                               O                  =
 |
       |         O    O    O                          O                    =
 |
   150 ++O  O O    O    O    O  O    O O  O O O    O       O               =
 |
   140 O+                         O                                        =
 |
       |                                                                   =
 |
   130 ++                                                                  =
 |
   120 ++                                                                  =
 |
   110 ++                                                                  =
 |
       |                                                                   =
 |
   100 ++                                                                  =
 |
    90 ++    .*..*             .*.  .*.                                    =
 |
       *.*..*     +  .*.*..*.*.   *.   *..*.*.*..*.*..    .*.*..*.*..*.*..*=
.*
    80 ++          *.                                 *.*.                 =
 |
    70 ++------------------------------------------------------------------=
-+


                                 iostat.sdj.rkB/s

   800 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
   750 ++                                        O    O O                  =
 |
   700 ++        O    O    O                                               =
 |
       O O  O O    O    O    O  O O  O O  O O O    O       O               =
 |
   650 ++                                                                  =
 |
   600 ++                                                                  =
 |
       |                                                                   =
 |
   550 ++                                                                  =
 |
   500 ++                                                                  =
 |
       |                                                                   =
 |
   450 ++    .*..*          .*..             .*..                          =
 |
   400 *+*..*     +  .*.*..*    *.*..*.*..*.*    *.*..    .*.*..*.*..*.*..*=
.*
       |           *.                                 *.*.                 =
 |
   350 ++------------------------------------------------------------------=
-+


                                 iostat.sdk.rrqm/s

   170 ++------------------------------------------------------------------=
-+
       |                                         O                         =
 |
   160 ++        O         O                          O O                  =
 |
   150 ++O         O  O O    O  O    O O    O      O                       =
 |
       O    O O                   O       O   O            O               =
 |
   140 ++                                                                  =
 |
   130 ++                                                                  =
 |
       |                                                                   =
 |
   120 ++                                                                  =
 |
   110 ++                                                                  =
 |
       |                                                                   =
 |
   100 ++                                                                  =
 |
    90 ++                                    .*..                          =
 |
       |.*..*.*..*.    .*..*.*..*.*..*.*..*.*    *.*.. .*.. .*..    .*.*..*=
.|
    80 *+----------*--*-------------------------------*----*----*-*--------=
-*


                                 iostat.sdk.rkB/s

   750 ++----------------------------------------O-------------------------=
-+
       |                   O                          O O                  =
 |
   700 ++        O    O         O                  O                       =
 |
   650 O+O  O O    O    O    O    O  O O  O O O            O               =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
       |                                                                   =
 |
   550 ++                                                                  =
 |
       |                                                                   =
 |
   500 ++                                                                  =
 |
   450 ++                                                                  =
 |
       |.*..*.*..           .*..*.*..*.  .*. .*..                          =
 |
   400 *+        *.*..*.*..*           *.   *    *.*..*.*..*.*..*.  .*.*..*=
.|
       |                                                          *.       =
 *
   350 ++------------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample



Thanks,
Wanlong Gao




--===============5314104745375465253==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWRhZG0gLXEgLS1jcmVhdGUgL2Rldi9tZDAgLS1jaHVuaz0yNTYgLS1sZXZlbD1yYWlkNSAtLXJh
aWQtZGV2aWNlcz0xMSAtLWZvcmNlIC0tYXNzdW1lLWNsZWFuIC9kZXYvc2RiMSAvZGV2L3NkYzEg
L2Rldi9zZGQxIC9kZXYvc2RlMSAvZGV2L3NkZjEgL2Rldi9zZGcxIC9kZXYvc2RoMSAvZGV2L3Nk
aTEgL2Rldi9zZGoxIC9kZXYvc2RrMSAvZGV2L3NkbDEKZWNobyAxID4gL3N5cy9rZXJuZWwvZGVi
dWcvdHJhY2luZy9ldmVudHMvd3JpdGViYWNrL2JhbGFuY2VfZGlydHlfcGFnZXMvZW5hYmxlCmVj
aG8gMSA+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL3dyaXRlYmFjay9iZGlfZGly
dHlfcmF0ZWxpbWl0L2VuYWJsZQplY2hvIDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2
ZW50cy93cml0ZWJhY2svZ2xvYmFsX2RpcnR5X3N0YXRlL2VuYWJsZQplY2hvIDEgPiAvc3lzL2tl
cm5lbC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy93cml0ZWJhY2svd3JpdGViYWNrX3NpbmdsZV9pbm9k
ZS9lbmFibGUKbWtmcyAtdCBidHJmcyAvZGV2L21kMAptb3VudCAtdCBidHJmcyAvZGV2L21kMCAv
ZnMvbWQwCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTEgc3RhdHVzPW5vbmUgJgpk
ZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby0yIHN0YXR1cz1ub25lICYKZGQgIGlmPS9k
ZXYvemVybyBvZj0vZnMvbWQwL3plcm8tMyBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8g
b2Y9L2ZzL21kMC96ZXJvLTQgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9t
ZDAvemVyby01IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8t
NiBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTcgc3RhdHVz
PW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby04IHN0YXR1cz1ub25lICYK
ZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tOSBzdGF0dXM9bm9uZSAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTEwIHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVy
byBvZj0vZnMvbWQwL3plcm8tMTEgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9m
cy9tZDAvemVyby0xMiBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96
ZXJvLTEzIHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tMTQg
c3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby0xNSBzdGF0dXM9
bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTE2IHN0YXR1cz1ub25lICYK
ZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tMTcgc3RhdHVzPW5vbmUgJgpkZCAgaWY9
L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby0xOCBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3pl
cm8gb2Y9L2ZzL21kMC96ZXJvLTE5IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0v
ZnMvbWQwL3plcm8tMjAgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAv
emVyby0yMSBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTIy
IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tMjMgc3RhdHVz
PW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby0yNCBzdGF0dXM9bm9uZSAm
CmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTI1IHN0YXR1cz1ub25lICYKZGQgIGlm
PS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tMjYgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96
ZXJvIG9mPS9mcy9tZDAvemVyby0yNyBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL21kMC96ZXJvLTI4IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQw
L3plcm8tMjkgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby0z
MCBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTMxIHN0YXR1
cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tMzIgc3RhdHVzPW5vbmUg
JgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby0zMyBzdGF0dXM9bm9uZSAmCmRkICBp
Zj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTM0IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYv
emVybyBvZj0vZnMvbWQwL3plcm8tMzUgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9m
PS9mcy9tZDAvemVyby0zNiBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21k
MC96ZXJvLTM3IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8t
Mzggc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby0zOSBzdGF0
dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTQwIHN0YXR1cz1ub25l
ICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tNDEgc3RhdHVzPW5vbmUgJgpkZCAg
aWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby00MiBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2
L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTQzIHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBv
Zj0vZnMvbWQwL3plcm8tNDQgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9t
ZDAvemVyby00NSBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJv
LTQ2IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tNDcgc3Rh
dHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby00OCBzdGF0dXM9bm9u
ZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTQ5IHN0YXR1cz1ub25lICYKZGQg
IGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tNTAgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rl
di96ZXJvIG9mPS9mcy9tZDAvemVyby01MSBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8g
b2Y9L2ZzL21kMC96ZXJvLTUyIHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMv
bWQwL3plcm8tNTMgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVy
by01NCBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTU1IHN0
YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tNTYgc3RhdHVzPW5v
bmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby01NyBzdGF0dXM9bm9uZSAmCmRk
ICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTU4IHN0YXR1cz1ub25lICYKZGQgIGlmPS9k
ZXYvemVybyBvZj0vZnMvbWQwL3plcm8tNTkgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJv
IG9mPS9mcy9tZDAvemVyby02MCBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2Zz
L21kMC96ZXJvLTYxIHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3pl
cm8tNjIgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby02MyBz
dGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTY0IHN0YXR1cz1u
b25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tNjUgc3RhdHVzPW5vbmUgJgpk
ZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby02NiBzdGF0dXM9bm9uZSAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTY3IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVy
byBvZj0vZnMvbWQwL3plcm8tNjggc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9m
cy9tZDAvemVyby02OSBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96
ZXJvLTcwIHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tNzEg
c3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby03MiBzdGF0dXM9
bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTczIHN0YXR1cz1ub25lICYK
ZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tNzQgc3RhdHVzPW5vbmUgJgpkZCAgaWY9
L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby03NSBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3pl
cm8gb2Y9L2ZzL21kMC96ZXJvLTc2IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0v
ZnMvbWQwL3plcm8tNzcgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAv
emVyby03OCBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTc5
IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tODAgc3RhdHVz
PW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby04MSBzdGF0dXM9bm9uZSAm
CmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTgyIHN0YXR1cz1ub25lICYKZGQgIGlm
PS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tODMgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96
ZXJvIG9mPS9mcy9tZDAvemVyby04NCBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL21kMC96ZXJvLTg1IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQw
L3plcm8tODYgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby04
NyBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTg4IHN0YXR1
cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tODkgc3RhdHVzPW5vbmUg
JgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby05MCBzdGF0dXM9bm9uZSAmCmRkICBp
Zj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTkxIHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYv
emVybyBvZj0vZnMvbWQwL3plcm8tOTIgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9m
PS9mcy9tZDAvemVyby05MyBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21k
MC96ZXJvLTk0IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8t
OTUgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby05NiBzdGF0
dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTk3IHN0YXR1cz1ub25l
ICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tOTggc3RhdHVzPW5vbmUgJgpkZCAg
aWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby05OSBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2
L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTEwMCBzdGF0dXM9bm9uZSAmCnNsZWVwIDU5NgpraWxsYWxs
IC05IGRkCgo=

--===============5314104745375465253==--

