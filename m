Content-Type: multipart/mixed; boundary="===============6263314048483504573=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [SUNRPC] c4a7ca77494: +6.0% fsmark.time.involuntary_context_switches, no primary result change
Date: Sun, 15 Feb 2015 15:57:09 +0800
Message-ID: <1423987029.5538.16.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6263314048483504573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit c4a7ca774949960064dac11b326908f28407e8c3 ("SUNRPC: Allow waiting on =
memory allocation")


testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-f2fs-nfsv4=
-8K-400M-fsyncBeforeClose-16d-256fpd

127b21b89f9d8ba0  c4a7ca774949960064dac11b32  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     52524 =C2=B1  0%      +6.0%      55672 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
       436 =C2=B1 14%     +54.9%        676 =C2=B1 20%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
       433 =C2=B1 15%     +54.7%        670 =C2=B1 21%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
      8348 =C2=B1  7%     +27.0%      10602 =C2=B1  9%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    190081 =C2=B1 13%     +32.7%     252269 =C2=B1 13%  sched_debug.cpu#0.s=
ched_goidle
    205783 =C2=B1 12%     +30.2%     267903 =C2=B1 13%  sched_debug.cpu#0.t=
twu_local
    464065 =C2=B1 11%     +26.6%     587524 =C2=B1 12%  sched_debug.cpu#0.n=
r_switches
    464278 =C2=B1 11%     +26.6%     587734 =C2=B1 12%  sched_debug.cpu#0.s=
ched_count
     15807 =C2=B1 11%     +19.6%      18910 =C2=B1 12%  sched_debug.cpu#4.n=
r_load_updates
    300041 =C2=B1  8%     +20.3%     360969 =C2=B1 10%  sched_debug.cpu#0.t=
twu_count
      1863 =C2=B1  9%     +18.1%       2201 =C2=B1 10%  sched_debug.cfs_rq[=
4]:/.exec_clock

testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-btrfs-nfsv=
4-8K-400M-fsyncBeforeClose-16d-256fpd

127b21b89f9d8ba0  c4a7ca774949960064dac11b32  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

     52184 =C2=B1  0%      +5.6%      55122 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
       557 =C2=B1 19%     +21.5%        677 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
       217 =C2=B1 19%     -42.9%        124 =C2=B1 21%  sched_debug.cfs_rq[=
2]:/.load
     45852 =C2=B1 14%     -39.4%      27773 =C2=B1 24%  sched_debug.cpu#7.t=
twu_local
       457 =C2=B1 18%     +50.1%        686 =C2=B1 20%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
       455 =C2=B1 18%     +46.7%        668 =C2=B1 19%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
     66605 =C2=B1 10%     -26.7%      48826 =C2=B1 14%  sched_debug.cpu#7.s=
ched_goidle
     78249 =C2=B1  9%     -22.5%      60678 =C2=B1 11%  sched_debug.cpu#7.t=
twu_count
    153506 =C2=B1  9%     -22.7%     118649 =C2=B1 12%  sched_debug.cpu#7.n=
r_switches
    153613 =C2=B1  9%     -22.7%     118755 =C2=B1 12%  sched_debug.cpu#7.s=
ched_count
     15806 =C2=B1  6%     +19.2%      18833 =C2=B1 18%  sched_debug.cpu#4.n=
r_load_updates
      2171 =C2=B1  5%     +15.6%       2510 =C2=B1 13%  sched_debug.cfs_rq[=
4]:/.exec_clock
      9924 =C2=B1 11%     -27.0%       7244 =C2=B1 25%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      3156 =C2=B1  4%     -13.4%       2734 =C2=B1  8%  sched_debug.cfs_rq[=
7]:/.min_vruntime

testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-ext4-nfsv4=
-9B-400M-fsyncBeforeClose-16d-256fpd

127b21b89f9d8ba0  c4a7ca774949960064dac11b32  =

----------------  --------------------------  =

    104802 =C2=B1  0%      +7.7%     112883 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    471755 =C2=B1  0%      -1.3%     465592 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
      1977 =C2=B1 36%     +90.8%       3771 =C2=B1  8%  sched_debug.cpu#4.c=
urr->pid
         2 =C2=B1 34%     +80.0%          4 =C2=B1 24%  sched_debug.cpu#6.c=
pu_load[1]
         4 =C2=B1 33%     +83.3%          8 =C2=B1 31%  sched_debug.cpu#6.c=
pu_load[0]
       193 =C2=B1 17%     +48.0%        286 =C2=B1 19%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
       196 =C2=B1 17%     +47.5%        290 =C2=B1 19%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
        96 =C2=B1 18%     +40.6%        135 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.load
        97 =C2=B1 18%     +38.5%        135 =C2=B1 11%  sched_debug.cpu#7.l=
oad
      2274 =C2=B1  7%     -16.5%       1898 =C2=B1  3%  proc-vmstat.pgalloc=
_dma
       319 =C2=B1  6%     -29.7%        224 =C2=B1 24%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
       314 =C2=B1  5%     -29.4%        222 =C2=B1 25%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
       621 =C2=B1 10%     +41.9%        881 =C2=B1 37%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum

nhm4: Nehalem
Memory: 4G




                      fsmark.time.involuntary_context_switches

  114000 ++----------------------------------------------------------------=
-+
  113000 O+    O     O  O  O  O  O  O  O   O  O  O  O  O  O  O     O     O =
 |
         |  O     O                                             O     O    =
 O
  112000 ++                                                                =
 |
  111000 ++                                                                =
 |
         |                                                                 =
 |
  110000 ++                                                                =
 |
  109000 ++                                                                =
 |
  108000 ++                                                                =
 |
         |                                                                 =
 |
  107000 ++                                                                =
 |
  106000 ++                                                                =
 |
         |                                                                 =
 |
  105000 *+.*..*..*..*..*..*..*..*..*..*...*..*..*..*..*..*..*..*          =
 |
  104000 ++----------------------------------------------------------------=
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
Fengguang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============6263314048483504573==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBmc21hcmsKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAog
IHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEt
dm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6IAog
IG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxh
dGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0
czogCiAgbmZzc3RhdDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0
OiAKICBwbWV0ZXI6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHRfd2F0
Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOiBwZXJm
b3JtYW5jZQpjb21taXQ6IDU3MjFmN2YwZjE0YjY4MmQyZTg2ZTlhNGFhOTAyNWFjYWY2OTM5OWQK
bW9kZWw6IE5laGFsZW0KbnJfY3B1OiA4Cm1lbW9yeTogNEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2
L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwMDNGQllaLTAxMEZCMF9XRC1XQ0FXMzY4MTIwNDEtcGFy
dDEiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVot
MDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MiIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlz
ay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MyIK
bmV0Y29uc29sZV9wb3J0OiA2NjQ5Cml0ZXJhdGlvbnM6IDF4Cm5yX3RocmVhZHM6IDMydApkaXNr
OiAxSERECmZzOiBleHQ0CmZzMjogbmZzdjQKZnNtYXJrOgogIGZpbGVzaXplOiA5QgogIHRlc3Rf
c2l6ZTogNDAwTQogIHN5bmNfbWV0aG9kOiBmc3luY0JlZm9yZUNsb3NlCiAgbnJfZGlyZWN0b3Jp
ZXM6IDE2ZAogIG5yX2ZpbGVzX3Blcl9kaXJlY3Rvcnk6IDI1NmZwZAp0ZXN0Ym94OiBuaG00CnRi
b3hfZ3JvdXA6IG5obTQKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTAy
LTEwIDIzOjU3OjM2LjY0NzEzNjM4OSArMDg6MDAKaGVhZF9jb21taXQ6IDU3MjFmN2YwZjE0YjY4
MmQyZTg2ZTlhNGFhOTAyNWFjYWY2OTM5OWQKYmFzZV9jb21taXQ6IGJmYTc2ZDQ5NTc2NTk5YTRi
OWY5YjdhNzFmMjNkNzNkNmRjZmY3MzUKYnJhbmNoOiBuZXh0L21hc3RlcgprZXJuZWw6ICIva2Vy
bmVsL3g4Nl82NC1yaGVsLzU3MjFmN2YwZjE0YjY4MmQyZTg2ZTlhNGFhOTAyNWFjYWY2OTM5OWQv
dm1saW51ei0zLjE5LjAtbmV4dC0yMDE1MDIxMS1nNTcyMWY3ZiIKdXNlcjogbGtwCnF1ZXVlOiBj
eWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAi
L3Jlc3VsdC9uaG00L2ZzbWFyay9wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1leHQ0LW5mc3Y0LTlC
LTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oveDg2XzY0LXJoZWwvNTcyMWY3ZjBmMTRiNjgyZDJlODZlOWE0YWE5MDI1YWNhZjY5Mzk5
ZC8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL25obTQvY3ljbGljX2ZzbWFyay1wZXJmb3Jt
YW5jZS0xeC0zMnQtMUhERC1leHQ0LW5mc3Y0LTlCLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQt
MjU2ZnBkLXg4Nl82NC1yaGVsLUhFQUQtNTcyMWY3ZjBmMTRiNjgyZDJlODZlOWE0YWE5MDI1YWNh
ZjY5Mzk5ZC0wLTIwMTUwMjEwLTEyMzQ1LTFvYm84cHMueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1
LTAyLTExIDE2OjUyOjE3LjY2Nzc1OTczMSArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2Fk
YXZnOiAyOS4yMyAzOC4wNCAzMy42MyAxLzE1NSAyNzgxNwpzdGFydF90aW1lOiAnMTQyMzY0NDc2
NicKZW5kX3RpbWU6ICcxNDIzNjQ2NDk5Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDIx
MS0xMTQ5MTMiCg==

--===============6263314048483504573==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCBleHQ0IC1xIC1GIC9kZXYvc2RhMQptb3VudCAtdCBleHQ0IC9kZXYvc2RhMSAvZnMv
c2RhMQovZXRjL2luaXQuZC9ycGNiaW5kIHN0YXJ0Ci9ldGMvaW5pdC5kL25mcy1jb21tb24gc3Rh
cnQKL2V0Yy9pbml0LmQvbmZzLWtlcm5lbC1zZXJ2ZXIgc3RhcnQKbW91bnQgLXQgbmZzIC1vIHZl
cnM9NCBsb2NhbGhvc3Q6L2ZzL3NkYTEgL25mcy9zZGExCi4vZnNfbWFyayAtZCAvbmZzL3NkYTEv
MSAtZCAvbmZzL3NkYTEvMiAtZCAvbmZzL3NkYTEvMyAtZCAvbmZzL3NkYTEvNCAtZCAvbmZzL3Nk
YTEvNSAtZCAvbmZzL3NkYTEvNiAtZCAvbmZzL3NkYTEvNyAtZCAvbmZzL3NkYTEvOCAtZCAvbmZz
L3NkYTEvOSAtZCAvbmZzL3NkYTEvMTAgLWQgL25mcy9zZGExLzExIC1kIC9uZnMvc2RhMS8xMiAt
ZCAvbmZzL3NkYTEvMTMgLWQgL25mcy9zZGExLzE0IC1kIC9uZnMvc2RhMS8xNSAtZCAvbmZzL3Nk
YTEvMTYgLWQgL25mcy9zZGExLzE3IC1kIC9uZnMvc2RhMS8xOCAtZCAvbmZzL3NkYTEvMTkgLWQg
L25mcy9zZGExLzIwIC1kIC9uZnMvc2RhMS8yMSAtZCAvbmZzL3NkYTEvMjIgLWQgL25mcy9zZGEx
LzIzIC1kIC9uZnMvc2RhMS8yNCAtZCAvbmZzL3NkYTEvMjUgLWQgL25mcy9zZGExLzI2IC1kIC9u
ZnMvc2RhMS8yNyAtZCAvbmZzL3NkYTEvMjggLWQgL25mcy9zZGExLzI5IC1kIC9uZnMvc2RhMS8z
MCAtZCAvbmZzL3NkYTEvMzEgLWQgL25mcy9zZGExLzMyIC1EIDE2IC1OIDI1NiAtbiAzMjAwIC1M
IDEgLVMgMSAtcyA5Cg==

--===============6263314048483504573==--

