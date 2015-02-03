Content-Type: multipart/mixed; boundary="===============3453090059312978768=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm] 721c21c17ab: +11.7% will-it-scale.per_thread_ops
Date: Tue, 03 Feb 2015 15:45:04 +0800
Message-ID: <1422949504.13951.5.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3453090059312978768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 721c21c17ab958abf19a8fc611c3bd4743680e38 ("mm: mmu_gather: use tlb->=
end !=3D 0 only for TLB invalidation")


testbox/testcase/testparams: nhm4/will-it-scale/performance-readseek1

       v3.19-rc4  721c21c17ab958abf19a8fc611  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      0.56 =C2=B1  1%      +5.2%       0.59 =C2=B1  1%  will-it-scale.scala=
bility
   1807741 =C2=B1  0%      +2.3%    1848641 =C2=B1  0%  will-it-scale.per_t=
hread_ops
       740 =C2=B1 30%     +40.9%       1043 =C2=B1 26%  sched_debug.cpu#4.t=
twu_local
      1335 =C2=B1 20%     +23.7%       1651 =C2=B1 17%  sched_debug.cpu#4.t=
twu_count
       506 =C2=B1  9%     +40.8%        712 =C2=B1  1%  cpuidle.C1-NHM.usage
       120 =C2=B1  9%     +33.1%        160 =C2=B1 11%  sched_debug.cpu#7.l=
oad
       120 =C2=B1  9%     +26.2%        151 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.load
        90 =C2=B1  5%     -16.2%         75 =C2=B1 16%  sched_debug.cpu#6.c=
pu_load[4]
        96 =C2=B1  7%     +16.7%        112 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg

testbox/testcase/testparams: nhm4/will-it-scale/performance-pread2

       v3.19-rc4  721c21c17ab958abf19a8fc611  =

----------------  --------------------------  =

    900692 =C2=B1  1%     +11.7%    1005724 =C2=B1  0%  will-it-scale.per_t=
hread_ops
  28033529 =C2=B1  0%      -1.2%   27698665 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
       671 =C2=B1 22%     +40.4%        942 =C2=B1 27%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
       802 =C2=B1 19%     +30.9%       1049 =C2=B1 25%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
     44840 =C2=B1  6%     +15.6%      51846 =C2=B1  6%  meminfo.DirectMap4k
     18284 =C2=B1  1%      -7.4%      16926 =C2=B1  2%  vmstat.system.in
    378463 =C2=B1  0%      -1.2%     373746 =C2=B1  0%  vmstat.system.cs

testbox/testcase/testparams: nhm4/will-it-scale/performance-readseek3

       v3.19-rc4  721c21c17ab958abf19a8fc611  =

----------------  --------------------------  =

      0.55 =C2=B1  0%      +9.9%       0.60 =C2=B1  5%  will-it-scale.scala=
bility
   1791707 =C2=B1  0%      +2.9%    1843202 =C2=B1  0%  will-it-scale.per_t=
hread_ops
       187 =C2=B1 41%    +167.3%        501 =C2=B1 23%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
       281 =C2=B1 29%    +121.3%        622 =C2=B1 18%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
       110 =C2=B1  9%     +25.5%        138 =C2=B1 13%  sched_debug.cfs_rq[=
5]:/.load
       110 =C2=B1  9%     +25.9%        138 =C2=B1 13%  sched_debug.cpu#5.l=
oad
       178 =C2=B1  6%     -19.5%        144 =C2=B1 16%  sched_debug.cpu#4.c=
pu_load[1]
        94 =C2=B1  6%     +12.9%        107 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
      1.78 =C2=B1  7%     +17.4%       2.09 =C2=B1  0%  perf-profile.cpu-cy=
cles.put_page.shmem_file_read_iter.new_sync_read.__vfs_read.vfs_read
       187 =C2=B1  9%     -19.1%        152 =C2=B1 16%  sched_debug.cpu#4.c=
pu_load[2]
       757 =C2=B1  5%     +10.6%        838 =C2=B1  2%  slabinfo.kmalloc-20=
48.active_objs
      3064 =C2=B1  7%      +7.8%       3302 =C2=B1  6%  sched_debug.cpu#1.c=
urr->pid
      5.23 =C2=B1  2%      +8.8%       5.69 =C2=B1  4%  perf-profile.cpu-cy=
cles.security_file_permission.rw_verify_area.vfs_read.sys_read.system_call_=
fastpath
      3.23 =C2=B1  4%      +8.0%       3.48 =C2=B1  5%  perf-profile.cpu-cy=
cles.copy_page_to_iter_iovec.copy_page_to_iter.shmem_file_read_iter.new_syn=
c_read.__vfs_read
      4216 =C2=B1  7%      +7.5%       4531 =C2=B1  5%  slabinfo.kmalloc-19=
2.active_objs

nhm4: Nehalem
Memory: 4G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G




                             will-it-scale.per_thread_ops

  1.04e+06 ++--------------------------------------------------------------=
-+
           |               O            O      O                           =
 |
  1.02e+06 ++ O   O  O  O      O            O     O      O               O =
 |
     1e+06 O+                     O  O               O            O        =
 O
           |                                                O  O      O    =
 |
    980000 ++                                                              =
 |
           |                                                               =
 |
    960000 ++                                                              =
 |
           |                                                               =
 |
    940000 ++                                                              =
 |
    920000 ++                                                              =
 |
           *..          *..*                                               =
 |
    900000 ++          +                                                   =
 |
           |  *...*.. +                                                    =
 |
    880000 ++--------*-----------------------------------------------------=
-+



        [*] bisect-good sample
        [O] bisect-bad  sample

To reproduce:

        apt-get install ruby ruby-oj
        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
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
Huang, Ying



_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============3453090059312978768==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3
YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpj
b21taXQ6IDYzNGIwYmQ0OTBiN2ViZDdhMDU0Y2VhNGY3ZTBkMjU3NDhiZGU2NzgKbW9kZWw6IE5l
aGFsZW0KbnJfY3B1OiA4Cm1lbW9yeTogNEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnkt
aWQvYXRhLVdEQ19XRDEwMDNGQllaLTAxMEZCMF9XRC1XQ0FXMzY4MTIwNDEtcGFydDEiCnN3YXBf
cGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dE
LVdDQVczNjgxMjA0MS1wYXJ0MiIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9h
dGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MyIKbmV0Y29uc29s
ZV9wb3J0OiA2NjQ5CnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0
ZXN0OgogIC0gcHJlYWQyCnRlc3Rib3g6IG5obTQKdGJveF9ncm91cDogbmhtNAprY29uZmlnOiB4
ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDEtMTYgMTk6Mzk6MTIuODQ4ODIxNTExICsw
ODowMApoZWFkX2NvbW1pdDogNjM0YjBiZDQ5MGI3ZWJkN2EwNTRjZWE0ZjdlMGQyNTc0OGJkZTY3
OApiYXNlX2NvbW1pdDogZWFhMjdmMzRlOTFhMTRjZGNlZWQyNmVkNmM2NzkzZWMxZDE4NjExNQpi
cmFuY2g6IG5leHQvbWFzdGVyCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvNjM0YjBiZDQ5
MGI3ZWJkN2EwNTRjZWE0ZjdlMGQyNTc0OGJkZTY3OC92bWxpbnV6LTMuMTkuMC1yYzQtbmV4dC0y
MDE1MDExNi1nNjM0YjBiZCIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4t
eDg2XzY0LTIwMTUtMDEtMTMuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9uaG00L3dpbGwtaXQt
c2NhbGUvcGVyZm9ybWFuY2UtcHJlYWQyL2RlYmlhbi14ODZfNjQtMjAxNS0wMS0xMy5jZ3oveDg2
XzY0LXJoZWwvNjM0YjBiZDQ5MGI3ZWJkN2EwNTRjZWE0ZjdlMGQyNTc0OGJkZTY3OC8wIgpqb2Jf
ZmlsZTogIi9sa3Avc2NoZWR1bGVkL25obTQvY3ljbGljX3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFu
Y2UtcHJlYWQyLXg4Nl82NC1yaGVsLUhFQUQtNjM0YjBiZDQ5MGI3ZWJkN2EwNTRjZWE0ZjdlMGQy
NTc0OGJkZTY3OC0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wMS0xNyAwMjozMDozNS4zMzI0
MDI4NTUgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNS4xMiAzLjIxIDEuMzQg
MS8xMjMgNjcwMgpzdGFydF90aW1lOiAnMTQyMTQzMzA2NycKZW5kX3RpbWU6ICcxNDIxNDMzMzcy
Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDExNi0xMTM1MjUiCg==

--===============3453090059312978768==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IHByZWFkMiAzMiAxIDQgNiA4Cg==

--===============3453090059312978768==--

