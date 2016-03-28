Content-Type: multipart/mixed; boundary="===============5137160678725423008=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [cpufreq] a4675fbc4a:unixbench.score +37.4% improvement
Date: Mon, 28 Mar 2016 14:29:33 +0800
Message-ID: <20160328062933.GA4389@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5137160678725423008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that unixbench.score +37.4% improvement with your commit. =



https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit a4675fbc4a7abe072ac6ba38c252f22a91ebcd94 ("cpufreq: intel_pstate: Re=
place timers with utilization update callbacks")


commit: =

  34e2c555f3e13c90e9284e23d00f03be8a6e06c5
  a4675fbc4a7abe072ac6ba38c252f22a91ebcd94

34e2c555f3e13c90 a4675fbc4a7abe072ac6ba38c2
---------------- --------------------------
         %stddev     %change         %stddev
             \          |                \
    471.50 =C2=B1  0%     +37.4%     647.98 =C2=B1  0%  unixbench.score
    181102 =C2=B1  0%     +36.8%     247709 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
   8448017 =C2=B1  0%     +36.6%   11542098 =C2=B1  0%  unixbench.time.mino=
r_page_faults
      8726 =C2=B1  0%     +21.9%      10639 =C2=B1  0%  vmstat.system.cs
    181102 =C2=B1  0%     +36.8%     247709 =C2=B1  0%  time.involuntary_co=
ntext_switches
   8448017 =C2=B1  0%     +36.6%   11542098 =C2=B1  0%  time.minor_page_fau=
lts
      5958 =C2=B1  4%      -7.9%       5488 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_objs
      6512 =C2=B1  6%      -8.9%       5930 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_objs
     22373 =C2=B1  4%      +8.6%      24291 =C2=B1  4%  slabinfo.kmalloc-32=
.active_objs
     22373 =C2=B1  4%      +8.6%      24291 =C2=B1  4%  slabinfo.kmalloc-32=
.num_objs
      4664 =C2=B1 19%     -37.3%       2925 =C2=B1 26%  cpuidle.C1-HSW.usage
    886.25 =C2=B1  3%     +50.4%       1333 =C2=B1 10%  cpuidle.C1E-HSW.usa=
ge
  45236605 =C2=B1  4%     -52.0%   21702696 =C2=B1  4%  cpuidle.C3-HSW.time
    395591 =C2=B1  0%     +22.6%     485056 =C2=B1  0%  cpuidle.C6-HSW.usage
     11660 =C2=B1  5%     +33.9%      15610 =C2=B1  6%  cpuidle.POLL.usage
   6819262 =C2=B1  0%     +36.2%    9290485 =C2=B1  0%  proc-vmstat.numa_hit
   6819262 =C2=B1  0%     +36.2%    9290485 =C2=B1  0%  proc-vmstat.numa_lo=
cal
    910141 =C2=B1  0%     +36.2%    1239946 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
   5915149 =C2=B1  0%     +36.2%    8057456 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
   8533297 =C2=B1  0%     +36.3%   11626985 =C2=B1  0%  proc-vmstat.pgfault
   6821913 =C2=B1  0%     +36.2%    9293880 =C2=B1  0%  proc-vmstat.pgfree
      6.19 =C2=B1  0%      -1.9%       6.07 =C2=B1  0%  turbostat.%Busy
     85.75 =C2=B1  0%     +54.8%     132.75 =C2=B1  0%  turbostat.Avg_MHz
      1384 =C2=B1  0%     +58.1%       2188 =C2=B1  0%  turbostat.Bzy_MHz
     16.87 =C2=B1  0%     +11.1%      18.74 =C2=B1  0%  turbostat.CPU%c1
      4.39 =C2=B1  4%     -57.3%       1.88 =C2=B1  4%  turbostat.CPU%c3
     17.55 =C2=B1  0%     +14.4%      20.07 =C2=B1  0%  turbostat.PkgWatt
     31.10 =C2=B1 10%     +48.0%      46.02 =C2=B1 16%  sched_debug.cfs_rq:=
/.load_avg.avg
     29.51 =C2=B1 21%    +110.2%      62.02 =C2=B1 36%  sched_debug.cfs_rq:=
/.load_avg.stddev
    132.14 =C2=B1  6%     +11.6%     147.44 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.avg
    630069 =C2=B1 13%     -30.9%     435560 =C2=B1  5%  sched_debug.cpu.avg=
_idle.min
    116621 =C2=B1 17%     +51.1%     176162 =C2=B1  2%  sched_debug.cpu.avg=
_idle.stddev
      4052 =C2=B1  3%     +17.5%       4763 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.min
     18741 =C2=B1  1%     +19.3%      22354 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
     33330 =C2=B1  6%     +20.5%      40157 =C2=B1  9%  sched_debug.cpu.nr_=
switches.max
      8418 =C2=B1  4%     +30.5%      10985 =C2=B1  5%  sched_debug.cpu.nr_=
switches.min
      8423 =C2=B1  4%     +30.5%      10991 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.min
      7484 =C2=B1  1%     +15.7%       8655 =C2=B1  0%  sched_debug.cpu.sch=
ed_goidle.avg
     13946 =C2=B1  7%     +18.9%      16585 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.max
      3078 =C2=B1  4%     +28.0%       3941 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.min
      7645 =C2=B1  1%     +15.5%       8831 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.avg
      2614 =C2=B1  4%     +33.9%       3500 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.min
      4499 =C2=B1  0%     +27.2%       5723 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
      8842 =C2=B1  4%     +14.6%      10134 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.max
      2322 =C2=B1  3%     +30.8%       3038 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.min
      2220 =C2=B1  4%     +13.8%       2527 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.stddev





                                  unixbench.score

  700 ++-------------------------------------------------------------------=
-+
      OO OO OO OO OO OO OOO OO OO OO OO OOO OO OO OO OO OO OOO OO OO OO    =
 |
  600 ++                                                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      **.**.**.**.**  *.***.**.**.**.**.***.**.**.**.**.**.***.**.**.**.**.=
**
  400 ++           :  :                                                    =
 |
      |            :  :                                                    =
 |
  300 ++            : :                                                    =
 |
      |             : :                                                    =
 |
  200 ++            ::                                                     =
 |
      |             ::                                                     =
 |
  100 ++             :                                                     =
 |
      |              :                                                     =
 |
    0 ++-------------*-----------------------------------------------------=
-+


                           unixbench.time.minor_page_faults

  1.2e+07 OO-OO-O-O-OOO-OO-OOO-OOO-OO-OOO-OOO--O---O--O------OO-OO-----O---=
-+
          |      O                            O  OO  O O OO O     O OO     =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
          **.**.***.***  *.***.***.**.***.***.**.***.***.**.***.***.**.***.=
**
    8e+06 ++          :  :                                                 =
 |
          |           :  :                                                 =
 |
    6e+06 ++           : :                                                 =
 |
          |            : :                                                 =
 |
    4e+06 ++           : :                                                 =
 |
          |            ::                                                  =
 |
          |            ::                                                  =
 |
    2e+06 ++            :                                                  =
 |
          |             :                                                  =
 |
        0 ++------------*--------------------------------------------------=
-+


                     unixbench.time.involuntary_context_switches

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 OO O  O O     OO OO OOO OO OOO OO OOO OO  O  OO  OO OOO OO O O    =
 |
         |   O  O  OO O                          O  O   O            O     =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         **.**.***.**.* *.**.***.**.***.**.***.***.**.***.**.***.**.***.**.=
**
  150000 ++           : :                                                  =
 |
         |            : :                                                  =
 |
  100000 ++           : :                                                  =
 |
         |             ::                                                  =
 |
         |             :                                                   =
 |
   50000 ++            :                                                   =
 |
         |             :                                                   =
 |
       0 ++------------*---------------------------------------------------=
-+


                                time.minor_page_faults

  1.2e+07 OO-OO-O-O-OOO-OO-OOO-OOO-OO-OOO-OOO--O---O--O------OO-OO-----O---=
-+
          |      O                            O  OO  O O OO O     O OO     =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
          **.**.***.***  *.***.***.**.***.***.**.***.***.**.***.***.**.***.=
**
    8e+06 ++          :  :                                                 =
 |
          |           :  :                                                 =
 |
    6e+06 ++           : :                                                 =
 |
          |            : :                                                 =
 |
    4e+06 ++           : :                                                 =
 |
          |            ::                                                  =
 |
          |            ::                                                  =
 |
    2e+06 ++            :                                                  =
 |
          |             :                                                  =
 |
        0 ++------------*--------------------------------------------------=
-+


                          time.involuntary_context_switches

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 OO O  O O     OO OO OOO OO OOO OO OOO OO  O  OO  OO OOO OO O O    =
 |
         |   O  O  OO O                          O  O   O            O     =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         **.**.***.**.* *.**.***.**.***.**.***.***.**.***.**.***.**.***.**.=
**
  150000 ++           : :                                                  =
 |
         |            : :                                                  =
 |
  100000 ++           : :                                                  =
 |
         |             ::                                                  =
 |
         |             :                                                   =
 |
   50000 ++            :                                                   =
 |
         |             :                                                   =
 |
       0 ++------------*---------------------------------------------------=
-+




	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Xiaolong Ye

--===============5137160678725423008==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6
IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3Rh
dDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBvd2Vy
c2F2ZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1p
dDogYTQ2NzVmYmM0YTdhYmUwNzJhYzZiYTM4YzI1MmYyMmE5MWViY2Q5NAptb2RlbDogR3JhbnRs
ZXkgSGFzd2VsbApucl9jcHU6IDE2Cm1lbW9yeTogMTZHCmhkZF9wYXJ0aXRpb25zOiAKc3dhcF9w
YXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCmNhdGVnb3J5OiBiZW5jaG1hcmsKbnJfdGFz
azogMQp1bml4YmVuY2g6CiAgdGVzdDogZXhlY2wKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsaXR1
eWEKdGJveF9ncm91cDogbGl0dXlhCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTog
MjAxNi0wMy0yNyAxNzowMDo1My43NzQ3MTg3MDUgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJv
b3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogNDhlMmJhZGVlZmI3MTkzNGQy
ZjJhMmZmNmI2YmUyMDU2MmJkOTNlZAp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IDFjZjc0OTE1ZTM0
NjlmZWE5NmM1YzUzYzQ1NjFkY2UxMTRiODNhY2UKYmFzZV9jb21taXQ6IGI1NjJlNDRmNTA3ZTg2
M2M2NzkyOTQ2ZTRlMWIxNDQ5ZmJiYWM4NWQKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3Vy
bHktMjAxNjAzMjIyMQpyZXN1bHRfcm9vdDogIi9yZXN1bHQvdW5peGJlbmNoL3Bvd2Vyc2F2ZS0x
LWV4ZWNsL2xpdHV5YS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2dj
Yy00LjkvYTQ2NzVmYmM0YTdhYmUwNzJhYzZiYTM4YzI1MmYyMmE5MWViY2Q5NC8wIgpqb2JfZmls
ZTogIi9sa3Avc2NoZWR1bGVkL2xpdHV5YS9iaXNlY3RfdW5peGJlbmNoLXBvd2Vyc2F2ZS0xLWV4
ZWNsLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtYTQ2NzVmYmM0YTdh
YmUwNzJhYzZiYTM4YzI1MmYyMmE5MWViY2Q5NC0yMDE2MDMyNy00MDA3OS0xYzFiYWNnLTAueWFt
bCIKbWF4X3VwdGltZTogODUyLjY5OTk5OTk5OTk5OTkKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFu
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9
L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGl0dXlhL2Jpc2VjdF91
bml4YmVuY2gtcG93ZXJzYXZlLTEtZXhlY2wtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14
ODZfNjQtcmhlbC1hNDY3NWZiYzRhN2FiZTA3MmFjNmJhMzhjMjUyZjIyYTkxZWJjZDk0LTIwMTYw
MzI3LTQwMDc5LTFjMWJhY2ctMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1y
aGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDMyMjIxCi0gY29tbWl0
PWE0Njc1ZmJjNGE3YWJlMDcyYWM2YmEzOGMyNTJmMjJhOTFlYmNkOTQKLSBCT09UX0lNQUdFPS9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9hNDY3NWZiYzRhN2FiZTA3MmFjNmJhMzhjMjUy
ZjIyYTkxZWJjZDk0L3ZtbGludXotNC41LjAtcmMyLTAwMDAzLWdhNDY3NWZiCi0gbWF4X3VwdGlt
ZT04NTIKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3VuaXhiZW5jaC9wb3dlcnNhdmUtMS1leGVjbC9s
aXR1eWEvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2E0
Njc1ZmJjNGE3YWJlMDcyYWM2YmEzOGMyNTJmMjJhOTFlYmNkOTQvMAotIExLUF9TRVJWRVI9aW5u
Ci0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJy
CiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1
X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRj
aGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBj
b25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5p
dHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51
eC94ODZfNjQtcmhlbC9nY2MtNC45L2E0Njc1ZmJjNGE3YWJlMDcyYWM2YmEzOGMyNTJmMjJhOTFl
YmNkOTQvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6
LC9sa3AvYmVuY2htYXJrcy91bml4YmVuY2guY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9hNDY3NWZiYzRhN2FiZTA3MmFjNmJhMzhjMjUy
ZjIyYTkxZWJjZDk0L2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2E0Njc1ZmJjNGE3YWJlMDcyYWM2YmEzOGMyNTJm
MjJhOTFlYmNkOTQvdm1saW51ei00LjUuMC1yYzItMDAwMDMtZ2E0Njc1ZmIiCmRlcXVldWVfdGlt
ZTogMjAxNi0wMy0yNyAxNzowMToxNC42NzMyNjUyMjYgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogMC43NyAwLjI4IDAuMTAgMS8yMzcgMjMwNgpzdGFydF90aW1lOiAnMTQ1OTA2
OTMwMycKZW5kX3RpbWU6ICcxNDU5MDY5NDAyJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2
MDMyNS0yMDU4MTciCg==

--===============5137160678725423008==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yNyAxNzowMTo0MiBlY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTc6MDE6NDIgZWNo
byBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxL2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE3OjAxOjQyIGVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcg
MTc6MDE6NDIgZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxNzowMTo0MiBlY2hvIHBvd2Vyc2F2
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTI3IDE3OjAxOjQyIGVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTc6MDE6NDIg
ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxNzowMTo0MiBlY2hvIHBvd2Vyc2F2ZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTI3IDE3OjAxOjQyIGVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxNzowMTo0MiBlY2hvIHBvd2Vy
c2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDMtMjcgMTc6MDE6NDIgZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE3OjAxOjQy
IGVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxNzowMTo0MiBlY2hvIHBvd2Vyc2F2ZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjcgMTc6MDE6NDIgZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE3OjAxOjQyIGVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0yNyAxNzowMTo0MiBlY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTc6MDE6NDMg
Li9SdW4gZXhlY2wgLWMgMQo=

--===============5137160678725423008==--

