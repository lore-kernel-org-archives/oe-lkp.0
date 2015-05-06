Content-Type: multipart/mixed; boundary="===============9075270643017572932=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [fs] 04b2fa9f8f3: +2.2% unixbench.score
Date: Wed, 06 May 2015 10:36:10 +0800
Message-ID: <1430879770.25120.278.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9075270643017572932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 04b2fa9f8f36ec6fb6fd1c9dc9df6fff0cd27323 ("fs: split generic and aio=
 kiocb")


testbox/testcase/testparams: ivb42/unixbench/performance-pipe

599bd19bdc4c6b20  04b2fa9f8f36ec6fb6fd1c9dc9  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      1733 =C2=B1  0%      +2.2%       1770 =C2=B1  0%  unixbench.score
     21746 =C2=B1  5%      -9.4%      19710 =C2=B1  5%  numa-meminfo.node0.=
SReclaimable
     20531 =C2=B1  6%      +9.5%      22492 =C2=B1  5%  numa-meminfo.node1.=
SReclaimable
      5436 =C2=B1  5%      -9.4%       4927 =C2=B1  5%  numa-vmstat.node0.n=
r_slab_reclaimable
      5132 =C2=B1  6%      +9.6%       5622 =C2=B1  5%  numa-vmstat.node1.n=
r_slab_reclaimable
     22344 =C2=B1 41%     -49.2%      11343 =C2=B1 21%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      8908 =C2=B1 10%     -23.9%       6780 =C2=B1 20%  sched_debug.cfs_rq[=
19]:/.min_vruntime
         2 =C2=B1 30%     -63.6%          1 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.nr_spread_over
       245 =C2=B1  8%     +37.6%        337 =C2=B1 18%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
      4354 =C2=B1 19%     -23.6%       3327 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.exec_clock
     11391 =C2=B1 13%     -36.9%       7185 =C2=B1 20%  sched_debug.cfs_rq[=
4]:/.min_vruntime
       558 =C2=B1 17%     -30.7%        387 =C2=B1 23%  sched_debug.cfs_rq[=
4]:/.exec_clock
      2679 =C2=B1  6%     +43.9%       3856 =C2=B1 13%  sched_debug.cpu#13.=
sched_count
      1038 =C2=B1  4%     +54.8%       1607 =C2=B1 19%  sched_debug.cpu#13.=
ttwu_count
       720 =C2=B1 21%     +22.2%        880 =C2=B1  9%  sched_debug.cpu#33.=
nr_switches
       726 =C2=B1 21%     +22.3%        888 =C2=B1  9%  sched_debug.cpu#33.=
sched_count
      4524 =C2=B1  1%     +79.6%       8127 =C2=B1 45%  sched_debug.cpu#33.=
nr_load_updates
       326 =C2=B1 21%     +21.3%        396 =C2=B1 11%  sched_debug.cpu#33.=
sched_goidle
       598 =C2=B1 10%     +27.8%        764 =C2=B1 15%  sched_debug.cpu#35.=
nr_switches
       606 =C2=B1 10%     +27.0%        770 =C2=B1 15%  sched_debug.cpu#35.=
sched_count
      7807 =C2=B1 41%     -42.6%       4477 =C2=B1  2%  sched_debug.cpu#35.=
nr_load_updates
       269 =C2=B1 11%     +27.5%        344 =C2=B1 13%  sched_debug.cpu#35.=
sched_goidle
      4923 =C2=B1 36%     -43.3%       2790 =C2=B1 11%  sched_debug.cpu#4.s=
ched_count
       501 =C2=B1 17%     -25.3%        374 =C2=B1 28%  sched_debug.cpu#44.=
sched_goidle
       396 =C2=B1  6%     +17.7%        466 =C2=B1  8%  sched_debug.cpu#46.=
sched_goidle
       833 =C2=B1 10%     +39.4%       1162 =C2=B1  4%  sched_debug.cpu#8.s=
ched_goidle
       249 =C2=B1 39%    +113.6%        533 =C2=B1 10%  sched_debug.cpu#8.t=
twu_local
      1738 =C2=B1 10%     +40.7%       2446 =C2=B1  5%  sched_debug.cpu#8.n=
r_switches
       670 =C2=B1 11%     +36.0%        911 =C2=B1  8%  sched_debug.cpu#8.t=
twu_count
      0.00 =C2=B1 20%     +55.2%       0.00 =C2=B1 39%  sched_debug.rt_rq[4=
4]:/.rt_time

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G




                                  unixbench.score

  1790 ++------------------------------------------------------------------=
-+
       | O                 O                O   O O O                      =
 |
  1780 O+  O O O         O   O O          O   O           O                =
 |
  1770 ++        O O O O                              O O   O O O O O   O O=
 O
       |                         O O   O                              O    =
 |
  1760 ++                            O                                     =
 |
  1750 ++                                                                  =
 |
       |                                                                   =
 |
  1740 ++                                                                  =
 |
  1730 ++        *.*                                      *.*.*.*          =
 |
       *.       +   :                                    :                 =
 |
  1720 ++*.*.*.*    :   .*.*.*.*                         :                 =
 |
  1710 ++            :.*        + .*.    .*.*.*.*.*.*.*.*                  =
 |
       |             *           *   *.*.                                  =
 |
  1700 ++------------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
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
Ying Huang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============9075270643017572932==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB1bml4YmVuY2gKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBwcmUtdGVz
dAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51
bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6
IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAog
IGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tz
dGF0czogCiAgbmZzc3RhdDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9z
dGF0OiAKICBwbWV0ZXI6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHQt
d2F0Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOiBw
ZXJmb3JtYW5jZQpjb21taXQ6IGI3ODdmNjhjMzZkNDliYjFkOTIzNmY0MDM4MTM2NDFlZmE3NGEw
MzEKbW9kZWw6IEl2eXRvd24gSXZ5IEJyaWRnZS1FUApucl9jcHU6IDQ4Cm1lbW9yeTogNjRHCnVu
aXhiZW5jaDoKICB0ZXN0OiBwaXBlCnRlc3Rib3g6IGl2YjQyCnRib3hfZ3JvdXA6IGl2YjQyCmtj
b25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wNC0yOSAwMzoxNTo0NC43MjQ4
OTI2MzMgKzA4OjAwCmhlYWRfY29tbWl0OiAzNmFhMjkzMmI1ZWNmMGM4Y2NlZmIzOWMyNzM3MzU1
MWE5Njc0MmFlCmJhc2VfY29tbWl0OiBiNzg3ZjY4YzM2ZDQ5YmIxZDkyMzZmNDAzODEzNjQxZWZh
NzRhMDMxCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwNTAxMjMKa2VybmVs
OiAiL2tlcm5lbC94ODZfNjQtcmhlbC9iNzg3ZjY4YzM2ZDQ5YmIxZDkyMzZmNDAzODEzNjQxZWZh
NzRhMDMxL3ZtbGludXotNC4xLjAtcmMxIgp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyb290ZnM6
IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2l2YjQy
L3VuaXhiZW5jaC9wZXJmb3JtYW5jZS1waXBlL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
eDg2XzY0LXJoZWwvYjc4N2Y2OGMzNmQ0OWJiMWQ5MjM2ZjQwMzgxMzY0MWVmYTc0YTAzMS8wIgpM
S1BfU0VSVkVSOiBpbm4Kam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9pdmI0Mi9jeWNsaWNfdW5p
eGJlbmNoLXBlcmZvcm1hbmNlLXBpcGUteDg2XzY0LXJoZWwtQkFTRS1iNzg3ZjY4YzM2ZDQ5YmIx
ZDkyMzZmNDAzODEzNjQxZWZhNzRhMDMxLTAtMjAxNTA0MjktOTEzODYtMzdzNDRqLnlhbWwiCmRl
cXVldWVfdGltZTogMjAxNS0wNS0wMiAxMDoxMDo0MS41Njk4OTc0MTkgKzA4OjAwCmluaXRyZDog
Ii9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVy
X2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVk
L2l2YjQyL2N5Y2xpY191bml4YmVuY2gtcGVyZm9ybWFuY2UtcGlwZS14ODZfNjQtcmhlbC1CQVNF
LWI3ODdmNjhjMzZkNDliYjFkOTIzNmY0MDM4MTM2NDFlZmE3NGEwMzEtMC0yMDE1MDQyOS05MTM4
Ni0zN3M0NGoueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5j
aD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA1MDEyMwotIGNvbW1pdD1iNzg3ZjY4YzM2
ZDQ5YmIxZDkyMzZmNDAzODEzNjQxZWZhNzRhMDMxCi0gQk9PVF9JTUFHRT0va2VybmVsL3g4Nl82
NC1yaGVsL2I3ODdmNjhjMzZkNDliYjFkOTIzNmY0MDM4MTM2NDFlZmE3NGEwMzEvdm1saW51ei00
LjEuMC1yYzEKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2l2YjQyL3VuaXhiZW5jaC9wZXJmb3JtYW5j
ZS1waXBlL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvYjc4N2Y2OGMz
NmQ0OWJiMWQ5MjM2ZjQwMzgxMzY0MWVmYTc0YTAzMS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0K
CgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCByZC51ZGV2LmxvZy1wcmlvcml0eT1lcnIgc3lz
dGVtZC5sb2dfdGFyZ2V0PWpvdXJuYWwgc3lzdGVtZC5sb2dfbGV2ZWw9d2FybmluZwogIGRlYnVn
IGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90
aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFu
aWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10
dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbWF4X3VwdGltZTogOTU1
LjA0CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6
ICIva2VybmVsL3g4Nl82NC1yaGVsL2I3ODdmNjhjMzZkNDliYjFkOTIzNmY0MDM4MTM2NDFlZmE3
NGEwMzEvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6
LC9sa3AvYmVuY2htYXJrcy91bml4YmVuY2guY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRh
dmc6IDAuNjAgMC4yNyAwLjEwIDEvNDk3IDUwNDYKc3RhcnRfdGltZTogJzE0MzA1MzI2OTEnCmVu
ZF90aW1lOiAnMTQzMDUzMjgyMicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA1MDEtMTU0
NzMzIgo=

--===============9075270643017572932==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgouL1J1biBwaXBlCg==

--===============9075270643017572932==--

