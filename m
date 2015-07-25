Content-Type: multipart/mixed; boundary="===============7130884167291200794=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/preempt] 103637a5b94: 12.4% fsmark.app_overhead, -1.4% fsmark.files_per_sec
Date: Sat, 25 Jul 2015 14:09:05 +0800
Message-ID: <87si8cahvi.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7130884167291200794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://internal_merge_and_test_tree revert-103637a5b947af7e6abb8d19b341acff6=
fbf1ec3-103637a5b947af7e6abb8d19b341acff6fbf1ec3
commit 103637a5b947af7e6abb8d19b341acff6fbf1ec3 ("sched/preempt: Fix cond_r=
esched_lock() and cond_resched_softirq()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_files_=
per_directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/nfsv4/9B/400M/fsyncBeforeClose/16d/256fpd

commit: =

  834b9279b37ad019272ff140497b1e07ab52d124
  103637a5b947af7e6abb8d19b341acff6fbf1ec3

834b9279b37ad019 103637a5b947af7e6abb8d19b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  10808007 =C2=B1  2%     +12.4%   12147111 =C2=B1  3%  fsmark.app_overhead
    348.95 =C2=B1  0%      -1.4%     343.95 =C2=B1  0%  fsmark.files_per_sec
    292.92 =C2=B1  0%      +1.8%     298.06 =C2=B1  0%  fsmark.time.elapsed=
_time
    292.92 =C2=B1  0%      +1.8%     298.06 =C2=B1  0%  fsmark.time.elapsed=
_time.max
    103928 =C2=B1  0%     +13.9%     118415 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    468477 =C2=B1  0%      -2.2%     458135 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
    103928 =C2=B1  0%     +13.9%     118415 =C2=B1  0%  time.involuntary_co=
ntext_switches
     16609 =C2=B1  0%      -2.1%      16267 =C2=B1  0%  vmstat.system.in
   4527868 =C2=B1  2%     +25.9%    5698416 =C2=B1  2%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_dcache.__lookup_hash
 2.317e+09 =C2=B1  0%      +5.5%  2.444e+09 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
 1.548e+09 =C2=B1  0%      +2.9%  1.593e+09 =C2=B1  0%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastp=
ath
 3.399e+08 =C2=B1  1%     +19.0%  4.043e+08 =C2=B1  2%  cpuidle.C1-NHM.time
  82737781 =C2=B1  0%     +24.8%  1.032e+08 =C2=B1  0%  cpuidle.C1E-NHM.time
    141228 =C2=B1  0%     +23.4%     174263 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
    128964 =C2=B1154%    +209.1%     398639 =C2=B1 26%  cpuidle.POLL.time
      3.47 =C2=B1  0%      -2.5%       3.38 =C2=B1  0%  turbostat.%Busy
    110.25 =C2=B1  0%      -2.0%     108.00 =C2=B1  0%  turbostat.Avg_MHz
     32.94 =C2=B1  0%     +14.4%      37.69 =C2=B1  1%  turbostat.CPU%c1
     32.26 =C2=B1  1%     -11.3%      28.62 =C2=B1  1%  turbostat.CPU%c3
     -2795 =C2=B1 -9%     -19.2%      -2258 =C2=B1 -4%  sched_debug.cfs_rq[=
1]:/.spread0
      3273 =C2=B1  4%     +29.9%       4250 =C2=B1 10%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
     70.25 =C2=B1  4%     +29.5%      91.00 =C2=B1 10%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     -2687 =C2=B1  0%     -14.1%      -2308 =C2=B1 -2%  sched_debug.cpu#0.n=
r_uninterruptible
    333314 =C2=B1 74%     -46.7%     177695 =C2=B1  3%  sched_debug.cpu#0.t=
twu_count
    318.25 =C2=B1 11%     -41.3%     186.75 =C2=B1  6%  sched_debug.cpu#1.n=
r_uninterruptible
    331.50 =C2=B1  9%     -16.0%     278.50 =C2=B1 11%  sched_debug.cpu#2.n=
r_uninterruptible
    172.25 =C2=B1 21%     +63.6%     281.75 =C2=B1 14%  sched_debug.cpu#3.n=
r_uninterruptible
    753.75 =C2=B1  2%     +38.7%       1045 =C2=B1  4%  sched_debug.cpu#4.n=
r_uninterruptible
    839497 =C2=B1169%     -98.0%      16681 =C2=B1  1%  sched_debug.cpu#4.t=
twu_local
    392.00 =C2=B1  3%     -50.6%     193.50 =C2=B1 12%  sched_debug.cpu#5.n=
r_uninterruptible
     12.50 =C2=B1 35%    +272.0%      46.50 =C2=B1 73%  sched_debug.cpu#6.c=
pu_load[0]
    385.00 =C2=B1  7%     -53.0%     181.00 =C2=B1  8%  sched_debug.cpu#6.n=
r_uninterruptible
    362.00 =C2=B1  2%     -53.8%     167.25 =C2=B1 15%  sched_debug.cpu#7.n=
r_uninterruptible


nhm4: Nehalem
Memory: 4G


                               fsmark.files_per_sec

  352 *+-*-------------------------*-----*--*------------------------------=
-+
  351 ++    *..                  .. :   :    :                             =
 |
      |        .                .    :  :     :                            =
 |
  350 ++        *..           .*     : :      :                            =
 |
  349 ++           *..*..*..*.        *        *...*..*..*                 =
 |
      |                                                                    =
 |
  348 ++                                                                   =
 |
  347 ++                                                                   =
 |
  346 ++                                                                   =
 |
      O     O               O  O      O     O         O           O        =
 |
  345 ++ O                                                     O           =
 O
  344 ++              O  O         O                                       =
 |
      |                                                                    =
 |
  343 ++        O  O                     O     O   O     O  O         O  O =
 |
  342 ++-------------------------------------------------------------------=
-+


                             fsmark.time.elapsed_time

  299 ++-------------------------------------------------------------------=
-+
      |         O  O                     O     O   O     O  O         O  O =
 |
  298 ++ O            O  O         O        O         O        O  O        =
 O
  297 O+                    O  O      O                                    =
 |
      |     O                                                              =
 |
  296 ++                                                                   =
 |
  295 ++                                                                   =
 |
      |                                                                    =
 |
  294 ++           *..*..                                                  =
 |
  293 ++         ..      *..                   *...*..*..                  =
 |
      *..   *...*           *..*...  .*..     +          *                 =
 |
  292 ++  ..                       *.    *.. +                             =
 |
  291 ++ *                                  *                              =
 |
      |                                                                    =
 |
  290 ++-------------------------------------------------------------------=
-+


                           fsmark.time.elapsed_time.max

  299 ++-------------------------------------------------------------------=
-+
      |         O  O                     O     O   O     O  O         O  O =
 |
  298 ++ O            O  O         O        O         O        O  O        =
 O
  297 O+                    O  O      O                                    =
 |
      |     O                                                              =
 |
  296 ++                                                                   =
 |
  295 ++                                                                   =
 |
      |                                                                    =
 |
  294 ++           *..*..                                                  =
 |
  293 ++         ..      *..                   *...*..*..                  =
 |
      *..   *...*           *..*...  .*..     +          *                 =
 |
  292 ++  ..                       *.    *.. +                             =
 |
  291 ++ *                                  *                              =
 |
      |                                                                    =
 |
  290 ++-------------------------------------------------------------------=
-+


                       fsmark.time.voluntary_context_switches

  470000 ++--------------------------------*-------------------------------=
-+
         |                          *..*.     *..  .*..*..*                =
 |
  468000 *+.*..*..  .*..*..*..    ..             *.                        =
 |
  466000 ++       *.            .*                                         =
 |
         |                    *.                                           =
 |
  464000 ++                                                                =
 |
         |                                                                 =
 |
  462000 ++                                                                =
 |
         |                                                                 =
 |
  460000 ++                                                                =
 |
  458000 ++                                            O  O  O  O  O  O  O =
 O
         |        O  O     O  O  O  O  O            O                      =
 |
  456000 O+ O  O        O                  O  O  O                         =
 |
         |                                                                 =
 |
  454000 ++----------------------------------------------------------------=
-+


                      fsmark.time.involuntary_context_switches

  120000 ++----------------------------------------------------------------=
-+
         |                                             O  O     O  O  O    =
 O
  118000 O+ O        O           O               O  O        O           O =
 |
  116000 ++    O  O     O  O  O     O  O   O  O                            =
 |
         |                                                                 =
 |
  114000 ++                                                                =
 |
  112000 ++                                                                =
 |
         |                                                                 =
 |
  110000 ++                                                                =
 |
  108000 ++                                                                =
 |
         |                                                                 =
 |
  106000 ++                                                                =
 |
  104000 *+.*..*..*..*..           .*..*...*..*..     .*..*                =
 |
         |              *..*..*..*.              *..*.                     =
 |
  102000 ++----------------------------------------------------------------=
-+


                          time.involuntary_context_switches

  120000 ++----------------------------------------------------------------=
-+
         |                                             O  O     O  O  O    =
 O
  118000 O+ O        O           O               O  O        O           O =
 |
  116000 ++    O  O     O  O  O     O  O   O  O                            =
 |
         |                                                                 =
 |
  114000 ++                                                                =
 |
  112000 ++                                                                =
 |
         |                                                                 =
 |
  110000 ++                                                                =
 |
  108000 ++                                                                =
 |
         |                                                                 =
 |
  106000 ++                                                                =
 |
  104000 *+.*..*..*..*..           .*..*...*..*..     .*..*                =
 |
         |              *..*..*..*.              *..*.                     =
 |
  102000 ++----------------------------------------------------------------=
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
Ying Huang

--===============7130884167291200794==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogYzg4YzI1MjA4NjBh
NWFlOTAzOWQxZjk5ZThkYjAzYTJiN2Q5ZDIyZQptb2RlbDogTmVoYWxlbQpucl9jcHU6IDgKbWVt
b3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZC
WVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQy
Igpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0w
MTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQzIgpuZXRjb25zb2xlX3BvcnQ6IDY2NDkKY2F0ZWdv
cnk6IGJlbmNobWFyawppdGVyYXRpb25zOiAxeApucl90aHJlYWRzOiAzMnQKZGlzazogMUhERApm
czogZjJmcwpmczI6IG5mc3Y0CmZzbWFyazoKICBmaWxlc2l6ZTogOUIKICB0ZXN0X3NpemU6IDQw
ME0KICBzeW5jX21ldGhvZDogZnN5bmNCZWZvcmVDbG9zZQogIG5yX2RpcmVjdG9yaWVzOiAxNmQK
ICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAyNTZmcGQKcXVldWU6IGN5Y2xpYwp0ZXN0Ym94OiBu
aG00CnRib3hfZ3JvdXA6IG5obTQKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAy
MDE1LTA3LTE0IDAyOjExOjI5LjQ5MzgwMTg3MCArMDg6MDAKdXNlcjogbGtwCmNvbXBpbGVyOiBn
Y2MtNC45CmhlYWRfY29tbWl0OiBjODhjMjUyMDg2MGE1YWU5MDM5ZDFmOTllOGRiMDNhMmI3ZDlk
MjJlCmJhc2VfY29tbWl0OiBiYzAxOTVhYWQwZGFhMmFkNWIwZDc2Y2NlMjJiMTY3YmMzNDM1NTkw
CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwNzE2MDEKa2VybmVsOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2M4OGMyNTIwODYwYTVhZTkwMzlkMWY5OWU4ZGIw
M2EyYjdkOWQyMmUvdm1saW51ei00LjIuMC1yYzItMDIxODAtZ2M4OGMyNTIiCnJvb3RmczogZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZnNtYXJrL3Bl
cmZvcm1hbmNlLTF4LTMydC0xSERELWYyZnMtbmZzdjQtOUItNDAwTS1mc3luY0JlZm9yZUNsb3Nl
LTE2ZC0yNTZmcGQvbmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVs
L2djYy00LjkvYzg4YzI1MjA4NjBhNWFlOTAzOWQxZjk5ZThkYjAzYTJiN2Q5ZDIyZS8wIgpqb2Jf
ZmlsZTogIi9sa3Avc2NoZWR1bGVkL25obTQvY3ljbGljX2ZzbWFyay1wZXJmb3JtYW5jZS0xeC0z
MnQtMUhERC1mMmZzLW5mc3Y0LTlCLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkLXg4
Nl82NC1yaGVsLUNZQ0xJQ19IRUFELWM4OGMyNTIwODYwYTVhZTkwMzlkMWY5OWU4ZGIwM2EyYjdk
OWQyMmUtMjAxNTA3MTQtODYxNDItMTcycDkzOC0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0w
Ny0xNiAwMjoyNzo0Ny4zODAzMzM4NzkgKzA4OjAwCm1heF91cHRpbWU6IDEyNDAuMzU5OTk5OTk5
OTk5Nwppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
eiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0v
bGtwL3NjaGVkdWxlZC9uaG00L2N5Y2xpY19mc21hcmstcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQt
ZjJmcy1uZnN2NC05Qi00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC14ODZfNjQtcmhl
bC1DWUNMSUNfSEVBRC1jODhjMjUyMDg2MGE1YWU5MDM5ZDFmOTllOGRiMDNhMmI3ZDlkMjJlLTIw
MTUwNzE0LTg2MTQyLTE3MnA5MzgtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82
NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDcxNjAxCi0gY29t
bWl0PWM4OGMyNTIwODYwYTVhZTkwMzlkMWY5OWU4ZGIwM2EyYjdkOWQyMmUKLSBCT09UX0lNQUdF
PS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9jODhjMjUyMDg2MGE1YWU5MDM5ZDFmOTll
OGRiMDNhMmI3ZDlkMjJlL3ZtbGludXotNC4yLjAtcmMyLTAyMTgwLWdjODhjMjUyCi0gbWF4X3Vw
dGltZT0xMjQwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0
LTFIREQtZjJmcy1uZnN2NC05Qi00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9uaG00
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9jODhjMjUy
MDg2MGE1YWU5MDM5ZDFmOTllOGRiMDNhMmI3ZDlkMjJlLzAKLSBMS1BfU0VSVkVSPWlubgotIHwt
CiAgbGliYXRhLmZvcmNlPTEuNUdicHMKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3Rl
bWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQg
cmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBf
cGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9t
cHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3Jt
YWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2lu
aXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9jODhjMjUyMDg2MGE1YWU5MDM5
ZDFmOTllOGRiMDNhMmI3ZDlkMjJlL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9k
ZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBz
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFy
a3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovZnMuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mczIu
Y2d6LC9sa3AvYmVuY2htYXJrcy9mc21hcmsuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRh
dmc6IDM2LjIwIDIzLjQ2IDEwLjE1IDEvMTY2IDQ4MTUKc3RhcnRfdGltZTogJzE0MzY5ODQ5MDUn
CmVuZF90aW1lOiAnMTQzNjk4NTIwMycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA3MTUt
MTU1OTMzIgo=

--===============7130884167291200794==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgpta2ZzIC10IGYyZnMgL2Rldi9zZGExCm1vdW50IC10IGYyZnMgL2Rldi9z
ZGExIC9mcy9zZGExCi9ldGMvaW5pdC5kL3JwY2JpbmQgc3RhcnQKL2V0Yy9pbml0LmQvbmZzLWNv
bW1vbiBzdGFydAovZXRjL2luaXQuZC9uZnMta2VybmVsLXNlcnZlciBzdGFydAptb3VudCAtdCBu
ZnMgLW8gdmVycz00IGxvY2FsaG9zdDovZnMvc2RhMSAvbmZzL3NkYTEKLi9mc19tYXJrIC1kIC9u
ZnMvc2RhMS8xIC1kIC9uZnMvc2RhMS8yIC1kIC9uZnMvc2RhMS8zIC1kIC9uZnMvc2RhMS80IC1k
IC9uZnMvc2RhMS81IC1kIC9uZnMvc2RhMS82IC1kIC9uZnMvc2RhMS83IC1kIC9uZnMvc2RhMS84
IC1kIC9uZnMvc2RhMS85IC1kIC9uZnMvc2RhMS8xMCAtZCAvbmZzL3NkYTEvMTEgLWQgL25mcy9z
ZGExLzEyIC1kIC9uZnMvc2RhMS8xMyAtZCAvbmZzL3NkYTEvMTQgLWQgL25mcy9zZGExLzE1IC1k
IC9uZnMvc2RhMS8xNiAtZCAvbmZzL3NkYTEvMTcgLWQgL25mcy9zZGExLzE4IC1kIC9uZnMvc2Rh
MS8xOSAtZCAvbmZzL3NkYTEvMjAgLWQgL25mcy9zZGExLzIxIC1kIC9uZnMvc2RhMS8yMiAtZCAv
bmZzL3NkYTEvMjMgLWQgL25mcy9zZGExLzI0IC1kIC9uZnMvc2RhMS8yNSAtZCAvbmZzL3NkYTEv
MjYgLWQgL25mcy9zZGExLzI3IC1kIC9uZnMvc2RhMS8yOCAtZCAvbmZzL3NkYTEvMjkgLWQgL25m
cy9zZGExLzMwIC1kIC9uZnMvc2RhMS8zMSAtZCAvbmZzL3NkYTEvMzIgLUQgMTYgLU4gMjU2IC1u
IDMyMDAgLUwgMSAtUyAxIC1zIDkK

--===============7130884167291200794==--

