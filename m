Content-Type: multipart/mixed; boundary="===============3979958555088425939=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched/numa] b52da86e0a: -1.4% will-it-scale.per_thread_ops
Date: Wed, 21 Oct 2015 15:31:32 +0800
Message-ID: <87wpug7k4r.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3979958555088425939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit b52da86e0ad58f096710977fcda856fd84da9233 ("sched/numa: Fix task_tick=
_fair() from disabling numa_balancing")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  nhm4/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfo=
rmance/readseek1

commit: =

  e2bf1c4b17aff25f07e0d2952d8c1c66643f33fe
  b52da86e0ad58f096710977fcda856fd84da9233

e2bf1c4b17aff25f b52da86e0ad58f096710977fcd =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1868374 =C2=B1  0%      -1.4%    1843108 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.57 =C2=B1  0%     +14.1%       0.65 =C2=B1 10%  will-it-scale.scala=
bility
     14052 =C2=B1  0%     -29.6%       9896 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
    161.75 =C2=B1 45%     -53.2%      75.75 =C2=B1 23%  cpuidle.C1E-NHM.usa=
ge
     14052 =C2=B1  0%     -29.6%       9896 =C2=B1  0%  time.minor_page_fau=
lts
      6943 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_hi=
nt_faults
      6943 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_hi=
nt_faults_local
      7780 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_pt=
e_updates
      1.19 =C2=B1  4%     -14.1%       1.02 =C2=B1  4%  perf-profile.cpu-cy=
cles.__fget_light.sys_lseek.entry_SYSCALL_64_fastpath
      5.47 =C2=B1  1%     -11.8%       4.83 =C2=B1  2%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64
      1.17 =C2=B1  6%     -16.7%       0.98 =C2=B1 12%  perf-profile.cpu-cy=
cles.fsnotify.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      1.70 =C2=B1  4%     -15.0%       1.45 =C2=B1  4%  perf-profile.cpu-cy=
cles.shmem_file_llseek.sys_lseek.entry_SYSCALL_64_fastpath
      5.39 =C2=B1  1%     -12.8%       4.70 =C2=B1  5%  perf-profile.cpu-cy=
cles.sys_lseek.entry_SYSCALL_64_fastpath
    116.50 =C2=B1 14%     -35.4%      75.25 =C2=B1 13%  sched_debug.cfs_rq[=
2]:/.load
     95126 =C2=B1  8%     +17.5%     111795 =C2=B1 10%  sched_debug.cpu#0.n=
r_load_updates
      2464 =C2=B1  6%     -39.4%       1494 =C2=B1 29%  sched_debug.cpu#2.c=
urr->pid
    116.50 =C2=B1 14%     -35.4%      75.25 =C2=B1 13%  sched_debug.cpu#2.l=
oad
      1243 =C2=B1  2%     +50.4%       1870 =C2=B1 22%  sched_debug.cpu#3.c=
urr->pid
     17134 =C2=B1 29%   +7834.3%    1359530 =C2=B1110%  sched_debug.cpu#4.n=
r_switches
     17204 =C2=B1 29%   +7802.5%    1359602 =C2=B1110%  sched_debug.cpu#4.s=
ched_count
      4538 =C2=B1 78%  +12299.8%     562734 =C2=B1119%  sched_debug.cpu#4.s=
ched_goidle
    950401 =C2=B1  4%      -7.9%     875553 =C2=B1  4%  sched_debug.cpu#7.a=
vg_idle


nhm4: Nehalem
Memory: 4G


                           proc-vmstat.numa_pte_updates

  8000 ++---------------------------------------------------*---*-*-----*-*=
-+
       |                                                  *   *     *.*    =
 *
  7000 ++                                                 :                =
 |
       |                                                  :                =
 |
       |                                                  :                =
 |
  6000 ++                                                :                 =
 |
       |                                                 :                 =
 |
  5000 ++                                                :                 =
 |
       |                                                 :                 =
 |
  4000 ++                                                :                 =
 |
       |                                                 :                 =
 |
       |                                                :                  =
 |
  3000 ++                                               :                  =
 |
       *.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*                  =
 |
  2000 ++------------------------------------------------------------------=
-+


                           proc-vmstat.numa_hint_faults

  7000 ++-------------------------------------------------*-*-*-*-*-*-*-*-*=
-*
       |                                                  :                =
 |
  6000 ++                                                 :                =
 |
       |                                                  :                =
 |
       |                                                 :                 =
 |
  5000 ++                                                :                 =
 |
       |                                                 :                 =
 |
  4000 ++                                                :                 =
 |
       |                                                 :                 =
 |
  3000 ++                                                :                 =
 |
       |                                                :                  =
 |
       |                                                :                  =
 |
  2000 ++                                               :                  =
 |
       *.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*                  =
 |
  1000 ++------------------------------------------------------------------=
-+


                        proc-vmstat.numa_hint_faults_local

  7000 ++-------------------------------------------------*-*-*-*-*-*-*-*-*=
-*
       |                                                  :                =
 |
  6000 ++                                                 :                =
 |
       |                                                  :                =
 |
       |                                                 :                 =
 |
  5000 ++                                                :                 =
 |
       |                                                 :                 =
 |
  4000 ++                                                :                 =
 |
       |                                                 :                 =
 |
  3000 ++                                                :                 =
 |
       |                                                :                  =
 |
       |                                                :                  =
 |
  2000 ++                                               :                  =
 |
       *.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*                  =
 |
  1000 ++------------------------------------------------------------------=
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

--===============3979958555088425939==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1h
LW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3Rh
dDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86
IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGly
cXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVp
ZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVm
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGZkNzg3
NzVjZjVjOWNjZjNkMDMyNzVmNmQwZWRmMGQwN2IxOTE5OTAKbW9kZWw6IE5laGFsZW0KbnJfY3B1
OiA4Cm1lbW9yeTogNEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19X
RDEwMDNGQllaLTAxMEZCMF9XRC1XQ0FXMzY4MTIwNDEtcGFydDEiCnN3YXBfcGFydGl0aW9uczog
Ii9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0
MS1wYXJ0MiIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAw
M0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MyIKbmV0Y29uc29sZV9wb3J0OiA2NjQ5
CmNhdGVnb3J5OiBiZW5jaG1hcmsKcGVyZi1wcm9maWxlOgogIGZyZXE6IDgwMAp3aWxsLWl0LXNj
YWxlOgogIHRlc3Q6IHJlYWRzZWVrMQpxdWV1ZTogY3ljbGljCnRlc3Rib3g6IG5obTQKdGJveF9n
cm91cDogbmhtNAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMTAtMTkg
MTI6MjY6MTIuODI2NjMxNjU2ICswODowMAppZDogYjQ2MWJlZTViZWQ0OTljZWIyZmVkNWU1YmFj
NTk0NTg5NWRiNTk4OAp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IGZk
Nzg3NzVjZjVjOWNjZjNkMDMyNzVmNmQwZWRmMGQwN2IxOTE5OTAKYmFzZV9jb21taXQ6IDczNzkw
NDdkNTU4NTE4N2QxMjg4NDg2ZDQ2Mjc4NzMxNzBkMDAwNWEKYnJhbmNoOiBsaW51eC1kZXZlbC9k
ZXZlbC1zcG90LTIwMTUxMDE5MDcxMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2dj
Yy00LjkvZmQ3ODc3NWNmNWM5Y2NmM2QwMzI3NWY2ZDBlZGYwZDA3YjE5MTk5MC92bWxpbnV6LTQu
My4wLXJjNi0wNjk2OC1nZmQ3ODc3NSIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLXJlYWRz
ZWVrMS9uaG00L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQu
OS9mZDc4Nzc1Y2Y1YzljY2YzZDAzMjc1ZjZkMGVkZjBkMDdiMTkxOTkwLzAiCmpvYl9maWxlOiAi
L2xrcC9zY2hlZHVsZWQvbmhtNC9jeWNsaWNfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1yZWFk
c2VlazEteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtZmQ3ODc3NWNmNWM5Y2NmM2QwMzI3NWY2ZDBl
ZGYwZDA3YjE5MTk5MC0yMDE1MTAxOS0zMjE5OC12aTlvaGItMC55YW1sIgpkZXF1ZXVlX3RpbWU6
IDIwMTUtMTAtMTkgMTY6NTM6MTkuODY2OTkwMjc2ICswODowMAptYXhfdXB0aW1lOiAxNTAwCmlu
aXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290
bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2No
ZWR1bGVkL25obTQvY3ljbGljX3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2UtcmVhZHNlZWsxLXg4
Nl82NC1yaGVsLUNZQ0xJQ19IRUFELWZkNzg3NzVjZjVjOWNjZjNkMDMyNzVmNmQwZWRmMGQwN2Ix
OTE5OTAtMjAxNTEwMTktMzIxOTgtdmk5b2hiLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZp
Zz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1zcG90LTIwMTUxMDE5MDcx
MgotIGNvbW1pdD1mZDc4Nzc1Y2Y1YzljY2YzZDAzMjc1ZjZkMGVkZjBkMDdiMTkxOTkwCi0gQk9P
VF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZmQ3ODc3NWNmNWM5Y2NmM2Qw
MzI3NWY2ZDBlZGYwZDA3YjE5MTk5MC92bWxpbnV6LTQuMy4wLXJjNi0wNjk2OC1nZmQ3ODc3NQot
IG1heF91cHRpbWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wZXJm
b3JtYW5jZS1yZWFkc2VlazEvbmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82
NC1yaGVsL2djYy00LjkvZmQ3ODc3NWNmNWM5Y2NmM2QwMzI3NWY2ZDBlZGYwZDA3YjE5MTk5MC8w
Ci0gTEtQX1NFUlZFUj1pbm4KLSB8LQogIGxpYmF0YS5mb3JjZT0xLjVHYnBzCgogIGVhcmx5cHJp
bnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVn
IHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAK
ICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFu
aWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAw
IGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3At
eDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvZmQ3ODc3NWNmNWM5Y2NmM2QwMzI3NWY2ZDBlZGYwZDA3YjE5MTk5MC9tb2R1bGVzLmNneiIK
Ym1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xr
cC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNv
bmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJv
c3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3dp
bGwtaXQtc2NhbGUuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDYuNzkgMy40NCAx
LjM5IDEvMTUyIDQ3NTQKc3RhcnRfdGltZTogJzE0NDUyNDQ4MzUnCmVuZF90aW1lOiAnMTQ0NTI0
NTEzOScKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTEwMTktMDkzMTE3Igo=

--===============3979958555088425939==
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
bGluZ19nb3Zlcm5vcgouL3J1bnRlc3QucHkgcmVhZHNlZWsxIDMyIGJvdGggMSA0IDYgOAo=

--===============3979958555088425939==--

