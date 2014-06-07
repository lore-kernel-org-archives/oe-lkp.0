Content-Type: multipart/mixed; boundary="===============7519107165658984028=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: [raid5] cf170f3fa45: +4.8% vmstat.io.bo
Date: Sat, 07 Jun 2014 14:53:16 +0800
Message-ID: <5392B6DC.6040502@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7519107165658984028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Eivind,

FYI, we noticed the below changes on

git://neil.brown.name/md for-next
commit cf170f3fa451350e431314e1a0a52014fda4b2d6 ("raid5: avoid release list=
 until last reference of the stripe")

test case: lkp-st02/dd-write/11HDD-RAID5-cfq-xfs-10dd

8b32bf5e37328c0  cf170f3fa451350e431314e1a
---------------  -------------------------
    486996 ~ 0%      +4.8%     510428 ~ 0%  TOTAL vmstat.io.bo
     17643 ~ 1%     -17.3%      14599 ~ 0%  TOTAL vmstat.system.in
     11633 ~ 4%     -56.7%       5039 ~ 0%  TOTAL vmstat.system.cs
       109 ~ 1%      +6.5%        116 ~ 1%  TOTAL iostat.sdb.rrqm/s
       109 ~ 2%      +5.1%        114 ~ 1%  TOTAL iostat.sdc.rrqm/s
       110 ~ 2%      +5.5%        117 ~ 0%  TOTAL iostat.sdj.rrqm/s
     12077 ~ 0%      +4.8%      12660 ~ 0%  TOTAL iostat.sde.wrqm/s
     48775 ~ 0%      +4.8%      51125 ~ 0%  TOTAL iostat.sde.wkB/s
     12077 ~ 0%      +4.8%      12659 ~ 0%  TOTAL iostat.sdb.wrqm/s
     12076 ~ 0%      +4.8%      12659 ~ 0%  TOTAL iostat.sdd.wrqm/s
     12077 ~ 0%      +4.8%      12660 ~ 0%  TOTAL iostat.sdf.wrqm/s
     48775 ~ 0%      +4.8%      51121 ~ 0%  TOTAL iostat.sdb.wkB/s
     12078 ~ 0%      +4.8%      12659 ~ 0%  TOTAL iostat.sdj.wrqm/s
     12078 ~ 0%      +4.8%      12660 ~ 0%  TOTAL iostat.sdi.wrqm/s
     12076 ~ 0%      +4.8%      12658 ~ 0%  TOTAL iostat.sdg.wrqm/s
     48774 ~ 0%      +4.8%      51122 ~ 0%  TOTAL iostat.sdd.wkB/s
     48776 ~ 0%      +4.8%      51128 ~ 0%  TOTAL iostat.sdf.wkB/s
     48780 ~ 0%      +4.8%      51121 ~ 0%  TOTAL iostat.sdj.wkB/s
     48779 ~ 0%      +4.8%      51128 ~ 0%  TOTAL iostat.sdi.wkB/s
     48773 ~ 0%      +4.8%      51119 ~ 0%  TOTAL iostat.sdg.wkB/s
    486971 ~ 0%      +4.8%     510409 ~ 0%  TOTAL iostat.md0.wkB/s
     12076 ~ 0%      +4.8%      12657 ~ 0%  TOTAL iostat.sdc.wrqm/s
     12077 ~ 0%      +4.8%      12659 ~ 0%  TOTAL iostat.sdh.wrqm/s
      1910 ~ 0%      +4.8%       2001 ~ 0%  TOTAL iostat.md0.w/s
       110 ~ 2%      +6.5%        117 ~ 1%  TOTAL iostat.sdk.rrqm/s
     12077 ~ 0%      +4.8%      12659 ~ 0%  TOTAL iostat.sdk.wrqm/s
     48772 ~ 0%      +4.8%      51115 ~ 0%  TOTAL iostat.sdc.wkB/s
     48776 ~ 0%      +4.8%      51121 ~ 0%  TOTAL iostat.sdh.wkB/s
     48777 ~ 0%      +4.8%      51121 ~ 0%  TOTAL iostat.sdk.wkB/s
       109 ~ 2%      +3.3%        113 ~ 1%  TOTAL iostat.sde.rrqm/s
  4.28e+09 ~ 0%      -4.1%  4.104e+09 ~ 0%  TOTAL perf-stat.cache-misses
 8.654e+10 ~ 0%      +4.7%  9.058e+10 ~ 0%  TOTAL perf-stat.L1-dcache-store=
-misses
 3.549e+09 ~ 1%      +3.7%  3.682e+09 ~ 0%  TOTAL perf-stat.L1-dcache-prefe=
tches
 6.764e+11 ~ 0%      +3.7%  7.011e+11 ~ 0%  TOTAL perf-stat.dTLB-stores
 6.759e+11 ~ 0%      +3.7%  7.011e+11 ~ 0%  TOTAL perf-stat.L1-dcache-stores
 4.731e+10 ~ 0%      +3.6%  4.903e+10 ~ 0%  TOTAL perf-stat.L1-dcache-load-=
misses
 3.017e+12 ~ 0%      +3.5%  3.121e+12 ~ 0%  TOTAL perf-stat.instructions
 1.118e+12 ~ 0%      +3.3%  1.156e+12 ~ 0%  TOTAL perf-stat.dTLB-loads
 1.117e+12 ~ 0%      +3.2%  1.152e+12 ~ 0%  TOTAL perf-stat.L1-dcache-loads
 3.022e+12 ~ 0%      +3.2%  3.119e+12 ~ 0%  TOTAL perf-stat.iTLB-loads
 5.613e+11 ~ 0%      +3.2%  5.794e+11 ~ 0%  TOTAL perf-stat.branch-instruct=
ions
  5.62e+11 ~ 0%      +3.1%  5.793e+11 ~ 0%  TOTAL perf-stat.branch-loads
 1.343e+09 ~ 0%      +2.6%  1.378e+09 ~ 0%  TOTAL perf-stat.LLC-store-misses
 2.073e+10 ~ 0%      +2.9%  2.133e+10 ~ 1%  TOTAL perf-stat.LLC-loads
 4.854e+10 ~ 0%      +1.6%  4.931e+10 ~ 0%  TOTAL perf-stat.cache-references
 1.167e+10 ~ 0%      +1.4%  1.183e+10 ~ 0%  TOTAL perf-stat.L1-icache-load-=
misses
   7068624 ~ 4%     -56.4%    3078966 ~ 0%  TOTAL perf-stat.context-switches
 2.214e+09 ~ 1%      -7.8%  2.041e+09 ~ 1%  TOTAL perf-stat.LLC-load-misses
    131433 ~ 0%     -18.9%     106597 ~ 1%  TOTAL perf-stat.cpu-migrations


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent

Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Jet


--===============7519107165658984028==
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
ZS9lbmFibGUKbWtmcyAtdCB4ZnMgL2Rldi9tZDAKbW91bnQgLXQgeGZzIC1vIG5vYmFycmllcixp
bm9kZTY0IC9kZXYvbWQwIC9mcy9tZDAKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8t
MSBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTIgc3RhdHVz
PW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby0zIHN0YXR1cz1ub25lICYK
ZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tNCBzdGF0dXM9bm9uZSAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJvLTUgc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJv
IG9mPS9mcy9tZDAvemVyby02IHN0YXR1cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMv
bWQwL3plcm8tNyBzdGF0dXM9bm9uZSAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL21kMC96ZXJv
LTggc3RhdHVzPW5vbmUgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9tZDAvemVyby05IHN0YXR1
cz1ub25lICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvbWQwL3plcm8tMTAgc3RhdHVzPW5vbmUg
JgpzbGVlcCA2MDAKa2lsbGFsbCAtOSBkZAoK

--===============7519107165658984028==--

