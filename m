Content-Type: multipart/mixed; boundary="===============0146480638392923641=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm] 39a1aa8e19: will-it-scale.per_process_ops +5.2% improvement
Date: Wed, 30 Mar 2016 13:46:31 +0800
Message-ID: <20160330054631.GC2923@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0146480638392923641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that will-it-scale.per_process_ops +5.2% improvement with y=
our commit.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 39a1aa8e194ab67983de3b9d0b204ccee12e689a ("mm: deduplicate memory ov=
ercommitment code")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/ivb42/malloc=
1/will-it-scale

commit: =

  ea606cf5d8df370e7932460dfd960b21f20e7c6d
  39a1aa8e194ab67983de3b9d0b204ccee12e689a

ea606cf5d8df370e 39a1aa8e194ab67983de3b9d0b =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    101461 =C2=B1  0%      +5.2%     106703 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.10 =C2=B1  0%     +31.8%       0.13 =C2=B1  0%  will-it-scale.scala=
bility
      6966 =C2=B1  8%      -9.9%       6278 =C2=B1 10%  meminfo.AnonHugePag=
es
  62767556 =C2=B1 10%     -24.3%   47486848 =C2=B1  7%  cpuidle.C3-IVT.time
    232686 =C2=B1  5%     -18.4%     189919 =C2=B1  9%  cpuidle.C3-IVT.usage
   6823970 =C2=B1  3%      -8.9%    6214309 =C2=B1  4%  cpuidle.C6-IVT.usage
     66703 =C2=B1  0%     +12.2%      74872 =C2=B1  2%  numa-vmstat.node0.n=
uma_other
  37441585 =C2=B1  0%     +26.4%   47319887 =C2=B1  0%  numa-vmstat.node1.n=
uma_hit
  37417000 =C2=B1  0%     +26.4%   47303041 =C2=B1  0%  numa-vmstat.node1.n=
uma_local
     24584 =C2=B1  0%     -31.5%      16845 =C2=B1 11%  numa-vmstat.node1.n=
uma_other
      6.15 =C2=B1 31%     +36.2%       8.37 =C2=B1 15%  sched_debug.cpu.cpu=
_load[4].stddev
     20260 =C2=B1  6%     +13.4%      22965 =C2=B1  5%  sched_debug.cpu.nr_=
switches.min
      4450 =C2=B1  9%     +16.5%       5183 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.max
    920.59 =C2=B1 10%     +15.0%       1058 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.stddev
  2.59e+08 =C2=B1  0%     +13.9%   2.95e+08 =C2=B1  0%  numa-numastat.node0=
.local_node
  2.59e+08 =C2=B1  0%     +13.9%   2.95e+08 =C2=B1  0%  numa-numastat.node0=
.numa_hit
     10.25 =C2=B1119%  +75378.0%       7736 =C2=B1 19%  numa-numastat.node0=
.other_node
 1.097e+08 =C2=B1  0%     +28.0%  1.404e+08 =C2=B1  0%  numa-numastat.node1=
.local_node
 1.097e+08 =C2=B1  0%     +28.0%  1.404e+08 =C2=B1  0%  numa-numastat.node1=
.numa_hit
      9285 =C2=B1  0%     -83.1%       1568 =C2=B1 98%  numa-numastat.node1=
.other_node
 3.687e+08 =C2=B1  0%     +18.1%  4.354e+08 =C2=B1  0%  proc-vmstat.numa_hit
 3.687e+08 =C2=B1  0%     +18.1%  4.354e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
  52281716 =C2=B1  0%     +11.1%   58060959 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
 3.943e+08 =C2=B1  0%     +16.7%  4.603e+08 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
 1.854e+08 =C2=B1  0%     +18.0%  2.187e+08 =C2=B1  0%  proc-vmstat.pgfault
 4.465e+08 =C2=B1  0%     +16.1%  5.183e+08 =C2=B1  0%  proc-vmstat.pgfree
      0.00 =C2=B1 -1%      +Inf%       2.36 =C2=B1 12%  perf-profile.cycles=
-pp.__split_vma.isra.36.do_munmap.vm_munmap.sys_munmap.entry_SYSCALL_64_fas=
tpath
      2.38 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__split_vma.isra.37.do_munmap.vm_munmap.sys_munmap.entry_SYSCALL_64_fas=
tpath
      4.37 =C2=B1 31%     +32.9%       5.80 =C2=B1 15%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.rest_init.start_kernel.x86_64_start_rese=
rvations
      4.52 =C2=B1 28%     +29.4%       5.85 =C2=B1 14%  perf-profile.cycles=
-pp.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86_=
64_start_kernel
      4.37 =C2=B1 31%     +32.9%       5.80 =C2=B1 15%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.rest_init.start_kernel
      4.08 =C2=B1 34%     +39.8%       5.70 =C2=B1 15%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.rest_i=
nit
      0.89 =C2=B1  6%     +16.3%       1.04 =C2=B1  5%  perf-profile.cycles=
-pp.perf_event_aux.part.46.perf_event_mmap.mmap_region.do_mmap.vm_mmap_pgoff
      4.52 =C2=B1 28%     +29.4%       5.85 =C2=B1 14%  perf-profile.cycles=
-pp.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      4.52 =C2=B1 28%     +29.4%       5.85 =C2=B1 14%  perf-profile.cycles=
-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      4.52 =C2=B1 28%     +29.4%       5.85 =C2=B1 14%  perf-profile.cycles=
-pp.x86_64_start_kernel
      4.52 =C2=B1 28%     +29.4%       5.85 =C2=B1 14%  perf-profile.cycles=
-pp.x86_64_start_reservations.x86_64_start_kernel


ivb42: Ivytown Ivy Bridge-EP
Memory: 64G



                              will-it-scale.scalability

   0.14 ++-----------OOOO-O------------------------------------------------=
-+
  0.135 ++               O      OOO                                        =
 |
        |          OO      O O                                             =
 |
   0.13 OOOOOO OOOO         O OO   OOOOOOOO                                =
 |
  0.125 ++    O                                                            =
 |
        |                                                                  =
 |
   0.12 ++                                                                 =
 |
  0.115 ++                                                                 =
 |
   0.11 ++                                                                 =
 |
        |                                       *                          =
 |
  0.105 ++        *                        ***** :                         =
 |
    0.1 ********** **     *****************      *****************         =
 |
        |          * *   *                                        ** *  ***=
**
  0.095 ++            ***                                           * **   =
 |
   0.09 ++-----------------------------------------------------------------=
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

--===============0146480638392923641==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2
bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86
IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZv
OiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0
YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5m
c3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1l
dGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBw
ZXJmb3JtYW5jZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzog
CmNvbW1pdDogMzlhMWFhOGUxOTRhYjY3OTgzZGUzYjlkMGIyMDRjY2VlMTJlNjg5YQptb2RlbDog
SXZ5dG93biBJdnkgQnJpZGdlLUVQCm5yX2NwdTogNDgKbWVtb3J5OiA2NEcKc3dhcF9wYXJ0aXRp
b25zOiBMQUJFTD1TV0FQCnJvb3Rmc19wYXJ0aXRpb246IExBQkVMPUxLUC1ST09URlMKY2F0ZWdv
cnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6CiAg
dGVzdDogbWFsbG9jMQpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGl2YjQyCnRib3hfZ3JvdXA6IGl2
YjQyCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wMy0yNyAwMToyODo1
MC4yNzQwNDM5MzIgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnegppZDogY2JiNzI3Y2YwYWJiYzE3ODhhZTdhMmJlMTMxMDdhOGNkMDU5
YTNjYQp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IDg1MDYwZjA1NmYxMzYzNWFkYTMxNzUxNzM0Y2Vh
YTQxN2ZhZmE0NzcKYmFzZV9jb21taXQ6IGI1NjJlNDRmNTA3ZTg2M2M2NzkyOTQ2ZTRlMWIxNDQ5
ZmJiYWM4NWQKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAzMjYwOApyZXN1
bHRfcm9vdDogIi9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS1tYWxsb2MxL2l2YjQy
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8zOWExYWE4
ZTE5NGFiNjc5ODNkZTNiOWQwYjIwNGNjZWUxMmU2ODlhLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hl
ZHVsZWQvaXZiNDIvYmlzZWN0X3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2UtbWFsbG9jMS1kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTM5YTFhYThlMTk0YWI2Nzk4M2Rl
M2I5ZDBiMjA0Y2NlZTEyZTY4OWEtMjAxNjAzMjctNjU1OTgtdWw0ZXdzLTAueWFtbCIKbWF4X3Vw
dGltZTogMTUwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAot
IGpvYj0vbGtwL3NjaGVkdWxlZC9pdmI0Mi9iaXNlY3Rfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5j
ZS1tYWxsb2MxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtMzlhMWFh
OGUxOTRhYjY3OTgzZGUzYjlkMGIyMDRjY2VlMTJlNjg5YS0yMDE2MDMyNy02NTU5OC11bDRld3Mt
MC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4
LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDMyNjA4Ci0gY29tbWl0PTM5YTFhYThlMTk0YWI2Nzk4
M2RlM2I5ZDBiMjA0Y2NlZTEyZTY4OWEKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJo
ZWwvZ2NjLTQuOS8zOWExYWE4ZTE5NGFiNjc5ODNkZTNiOWQwYjIwNGNjZWUxMmU2ODlhL3ZtbGlu
dXotNC41LjAtMDI1NjctZzM5YTFhYTgKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0v
cmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtbWFsbG9jMS9pdmI0Mi9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMzlhMWFhOGUxOTRhYjY3OTgz
ZGUzYjlkMGIyMDRjY2VlMTJlNjg5YS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5
cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRl
YnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0x
MDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9
cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1
MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9s
a3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2dj
Yy00LjkvMzlhMWFhOGUxOTRhYjY3OTgzZGUzYjlkMGIyMDRjY2VlMTJlNjg5YS9tb2R1bGVzLmNn
eiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1p
cGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1
cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3dpbGwtaXQtc2NhbGUuY2d6LC9sa3AvYmVuY2ht
YXJrcy93aWxsLWl0LXNjYWxlLmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2FsZS14ODZf
NjQuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2Nj
LTQuOS8zOWExYWE4ZTE5NGFiNjc5ODNkZTNiOWQwYjIwNGNjZWUxMmU2ODlhL2xpbnV4LWhlYWRl
cnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2Mt
NC45LzM5YTFhYThlMTk0YWI2Nzk4M2RlM2I5ZDBiMjA0Y2NlZTEyZTY4OWEvdm1saW51ei00LjUu
MC0wMjU2Ny1nMzlhMWFhOCIKZGVxdWV1ZV90aW1lOiAyMDE2LTAzLTI3IDAxOjM4OjU1LjM4NjA2
NDIzNyArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAzNy43NyAxOC4xNSA3LjE5
IDEvNTQ0IDkzODEKc3RhcnRfdGltZTogJzE0NTkwMTM5NzknCmVuZF90aW1lOiAnMTQ1OTAxNDI5
MCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAzMjUtMjA1ODE3Igo=

--===============0146480638392923641==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjcgMDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjcgMDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcg
MDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6
Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6Mzk6MzggZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMTozOToz
OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcg
MDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6
Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6Mzk6
MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMTozOTozOCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMjcgMDE6Mzk6MzggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3
IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5
OjM4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAxOjM5OjM4IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTI3IDAxOjM5OjM5IC4vcnVudGVzdC5weSBtYWxsb2MxIDI1IGJvdGggMSAxMiAyNCAz
NiA0OAo=

--===============0146480638392923641==--

