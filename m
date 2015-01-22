Content-Type: multipart/mixed; boundary="===============6009807955223788445=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [kernel] fc7f0dd3817: -2.1% will-it-scale.per_thread_ops
Date: Thu, 22 Jan 2015 10:39:00 +0800
Message-ID: <1421894340.6126.55.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6009807955223788445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit fc7f0dd381720ea5ee5818645f7d0e9dece41cb0 ("kernel: avoid overflow in=
 cmp_range")


testbox/testcase/testparams: lituya/will-it-scale/powersave-mmap2

7ad4b4ae5757b896  fc7f0dd381720ea5ee5818645f  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    252693 =C2=B1  0%      -2.2%     247031 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.18 =C2=B1  0%      +1.8%       0.19 =C2=B1  0%  will-it-scale.scala=
bility
     43536 =C2=B1 24%    +276.2%     163774 =C2=B1 33%  sched_debug.cpu#6.t=
twu_local
      3.55 =C2=B1  2%     +36.2%       4.84 =C2=B1  2%  perf-profile.cpu-cy=
cles.___might_sleep.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_regi=
on
      8.49 =C2=B1 12%     -29.5%       5.99 =C2=B1  5%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.__percpu_counter_add.do_munmap.vm_munmap.sys_mu=
nmap
     12.27 =C2=B1  8%     -20.2%       9.80 =C2=B1  3%  perf-profile.cpu-cy=
cles.__percpu_counter_add.do_munmap.vm_munmap.sys_munmap.system_call_fastpa=
th
      7.45 =C2=B1  7%     -20.8%       5.90 =C2=B1  5%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.__percpu_counter_add.__vm_enough_memory.selinux=
_vm_enough_memory.security_vm_enough_memory_mm
     11.11 =C2=B1  3%     -12.9%       9.67 =C2=B1  3%  perf-profile.cpu-cy=
cles.__percpu_counter_add.__vm_enough_memory.selinux_vm_enough_memory.secur=
ity_vm_enough_memory_mm.mmap_region
      2.46 =C2=B1  3%     +13.1%       2.78 =C2=B1  2%  perf-profile.cpu-cy=
cles.___might_sleep.unmap_single_vma.unmap_vmas.unmap_region.do_munmap
     11.42 =C2=B1  3%     -12.3%      10.01 =C2=B1  2%  perf-profile.cpu-cy=
cles.__vm_enough_memory.selinux_vm_enough_memory.security_vm_enough_memory_=
mm.mmap_region.do_mmap_pgoff
     12.39 =C2=B1  3%     -11.2%      11.00 =C2=B1  2%  perf-profile.cpu-cy=
cles.selinux_vm_enough_memory.security_vm_enough_memory_mm.mmap_region.do_m=
map_pgoff.vm_mmap_pgoff
     12.45 =C2=B1  3%     -11.1%      11.07 =C2=B1  2%  perf-profile.cpu-cy=
cles.security_vm_enough_memory_mm.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.s=
ys_mmap_pgoff
     14.38 =C2=B1  1%      +9.5%      15.75 =C2=B1  1%  perf-profile.cpu-cy=
cles.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region.do_munmap

testbox/testcase/testparams: lituya/will-it-scale/performance-mmap2

7ad4b4ae5757b896  fc7f0dd381720ea5ee5818645f  =

----------------  --------------------------  =

    268761 =C2=B1  0%      -2.1%     263177 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.18 =C2=B1  0%      +1.8%       0.19 =C2=B1  0%  will-it-scale.scala=
bility
      0.01 =C2=B1 37%     -99.3%       0.00 =C2=B1 12%  sched_debug.rt_rq[1=
0]:/.rt_time
    104123 =C2=B1 41%     -63.7%      37788 =C2=B1 45%  sched_debug.cpu#5.t=
twu_local
    459901 =C2=B1 48%     +60.7%     739071 =C2=B1 31%  sched_debug.cpu#6.t=
twu_count
   1858053 =C2=B1 12%     -36.9%    1171826 =C2=B1 38%  sched_debug.cpu#10.=
sched_goidle
   3716823 =C2=B1 12%     -36.9%    2344353 =C2=B1 38%  sched_debug.cpu#10.=
nr_switches
   3777468 =C2=B1 11%     -36.9%    2383575 =C2=B1 36%  sched_debug.cpu#10.=
sched_count
        36 =C2=B1 28%     -40.9%         21 =C2=B1  7%  sched_debug.cpu#6.c=
pu_load[1]
     18042 =C2=B1 17%     +54.0%      27789 =C2=B1 30%  sched_debug.cfs_rq[=
4]:/.exec_clock
        56 =C2=B1 17%     -48.8%         29 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
        36 =C2=B1 29%     +43.6%         52 =C2=B1 11%  sched_debug.cpu#4.l=
oad
    594415 =C2=B1  4%     +82.4%    1084432 =C2=B1 18%  sched_debug.cpu#2.t=
twu_count
        15 =C2=B1  0%     +51.1%         22 =C2=B1 14%  sched_debug.cpu#4.c=
pu_load[4]
      2077 =C2=B1 11%     -36.7%       1315 =C2=B1 15%  sched_debug.cpu#6.c=
urr->pid
        11 =C2=B1 28%     +48.6%         17 =C2=B1 23%  sched_debug.cpu#7.c=
pu_load[4]
      0.00 =C2=B1 20%     +77.0%       0.00 =C2=B1 26%  sched_debug.rt_rq[5=
]:/.rt_time
        16 =C2=B1  5%     +52.1%         24 =C2=B1  9%  sched_debug.cpu#4.c=
pu_load[3]
        17 =C2=B1 11%     +50.0%         26 =C2=B1  8%  sched_debug.cpu#4.c=
pu_load[2]
     48035 =C2=B1  7%     -22.2%      37362 =C2=B1 24%  sched_debug.cfs_rq[=
12]:/.exec_clock
        34 =C2=B1 12%     -24.5%         25 =C2=B1 20%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
        33 =C2=B1 11%     -24.2%         25 =C2=B1 20%  sched_debug.cpu#12.=
cpu_load[4]
        19 =C2=B1 25%     +50.9%         28 =C2=B1  3%  sched_debug.cpu#4.c=
pu_load[1]
        66 =C2=B1 17%     -24.7%         49 =C2=B1  5%  sched_debug.cpu#6.l=
oad
    421462 =C2=B1 16%     +18.8%     500676 =C2=B1 13%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      3.60 =C2=B1  0%     +35.4%       4.87 =C2=B1  0%  perf-profile.cpu-cy=
cles.___might_sleep.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_regi=
on
        44 =C2=B1  9%     +37.9%         60 =C2=B1 17%  sched_debug.cpu#3.l=
oad
        37 =C2=B1  6%     -17.9%         30 =C2=B1 15%  sched_debug.cpu#15.=
cpu_load[3]
      6.96 =C2=B1  4%     -10.4%       6.24 =C2=B1  3%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.__percpu_counter_add.do_munmap.vm_munmap.sys_mu=
nmap
        36 =C2=B1  6%     +24.1%         44 =C2=B1  2%  sched_debug.cpu#2.l=
oad
        39 =C2=B1  7%     -16.9%         32 =C2=B1 12%  sched_debug.cpu#15.=
cpu_load[2]
   1528695 =C2=B1  6%     -19.5%    1230190 =C2=B1 16%  sched_debug.cpu#10.=
ttwu_count
        36 =C2=B1  6%     +27.3%         46 =C2=B1  9%  sched_debug.cpu#10.=
load
       447 =C2=B1  3%     -13.9%        385 =C2=B1 10%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     20528 =C2=B1  3%     -13.8%      17701 =C2=B1 10%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
    634808 =C2=B1  6%     +50.3%     954347 =C2=B1 24%  sched_debug.cpu#2.s=
ched_goidle
   1270648 =C2=B1  6%     +50.3%    1909528 =C2=B1 24%  sched_debug.cpu#2.n=
r_switches
   1284042 =C2=B1  6%     +51.4%    1944604 =C2=B1 23%  sched_debug.cpu#2.s=
ched_count
        55 =C2=B1 11%     +28.7%         71 =C2=B1  4%  sched_debug.cpu#8.c=
pu_load[0]
      6.39 =C2=B1  0%      -8.7%       5.84 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.__percpu_counter_add.__vm_enough_memory.selinux=
_vm_enough_memory.security_vm_enough_memory_mm
     48721 =C2=B1 11%     +19.1%      58037 =C2=B1  5%  sched_debug.cpu#11.=
nr_load_updates
        53 =C2=B1  9%     +16.1%         62 =C2=B1  1%  sched_debug.cpu#8.c=
pu_load[1]
      1909 =C2=B1  0%     +22.2%       2333 =C2=B1  9%  sched_debug.cpu#3.c=
urr->pid
      0.95 =C2=B1  4%      -8.4%       0.87 =C2=B1  4%  perf-profile.cpu-cy=
cles.file_map_prot_check.selinux_mmap_file.security_mmap_file.vm_mmap_pgoff=
.sys_mmap_pgoff
    567608 =C2=B1  8%     +11.0%     629780 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.min_vruntime
    804637 =C2=B1 15%     +24.4%    1000664 =C2=B1 13%  sched_debug.cpu#3.t=
twu_count
    684460 =C2=B1  5%      -9.6%     618867 =C2=B1  3%  sched_debug.cpu#14.=
avg_idle
      1.02 =C2=B1  4%      -7.2%       0.94 =C2=B1  4%  perf-profile.cpu-cy=
cles.selinux_mmap_file.security_mmap_file.vm_mmap_pgoff.sys_mmap_pgoff.sys_=
mmap
      2605 =C2=B1  2%      -5.8%       2454 =C2=B1  5%  slabinfo.kmalloc-96=
.active_objs
      2605 =C2=B1  2%      -5.8%       2454 =C2=B1  5%  slabinfo.kmalloc-96=
.num_objs
        50 =C2=B1  4%     +11.3%         56 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
      1.15 =C2=B1  4%      -6.4%       1.08 =C2=B1  4%  perf-profile.cpu-cy=
cles.security_mmap_file.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.system_call_f=
astpath
      1.07 =C2=B1  2%      +9.7%       1.17 =C2=B1  3%  perf-profile.cpu-cy=
cles.vma_compute_subtree_gap.__vma_link_rb.vma_link.mmap_region.do_mmap_pgo=
ff

To reproduce:

	apt-get install ruby ruby-oj
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
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============6009807955223788445==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1
cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZh
dWx0X3dhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5v
cjoKLSBwb3dlcnNhdmUKY29tbWl0OiBlYzZmMzRlNWI1NTJmYjBhNTJlNmFhZTFhNWFmYmJiMTYw
NWNjNmNjCm1vZGVsOiBHcmFudGxleSBIYXN3ZWxsCm5yX2NwdTogMTYKbWVtb3J5OiAxNkcKaGRk
X3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKcGVyZi1w
cm9maWxlOgogIGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6CiAgLSBtbWFwMgp0ZXN0
Ym94OiBsaXR1eWEKdGJveF9ncm91cDogbGl0dXlhCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVl
dWVfdGltZTogMjAxNS0wMS0xOCAxNDoxMDowNy41NDE0NDI5NTcgKzA4OjAwCmhlYWRfY29tbWl0
OiBiMjEzZDU1OTE1ZjJlZTY3NDhiYTYyZjc0M2I1ZTcwNTY0YWIzMWU3CmJhc2VfY29tbWl0OiBl
YzZmMzRlNWI1NTJmYjBhNTJlNmFhZTFhNWFmYmJiMTYwNWNjNmNjCmJyYW5jaDogbGludXgtZGV2
ZWwvZGV2ZWwtaG91cmx5LTIwMTUwMTE5MTcKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC9l
YzZmMzRlNWI1NTJmYjBhNTJlNmFhZTFhNWFmYmJiMTYwNWNjNmNjL3ZtbGludXotMy4xOS4wLXJj
NS1nZWM2ZjM0ZSIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0
LTIwMTUtMDEtMTMuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9saXR1eWEvd2lsbC1pdC1zY2Fs
ZS9wb3dlcnNhdmUtbW1hcDIvZGViaWFuLXg4Nl82NC0yMDE1LTAxLTEzLmNnei94ODZfNjQtcmhl
bC9lYzZmMzRlNWI1NTJmYjBhNTJlNmFhZTFhNWFmYmJiMTYwNWNjNmNjLzAiCmpvYl9maWxlOiAi
L2xrcC9zY2hlZHVsZWQvbGl0dXlhL2N5Y2xpY193aWxsLWl0LXNjYWxlLXBvd2Vyc2F2ZS1tbWFw
Mi14ODZfNjQtcmhlbC1CQVNFLWVjNmYzNGU1YjU1MmZiMGE1MmU2YWFlMWE1YWZiYmIxNjA1Y2M2
Y2MtMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDEtMTkgMTg6MDg6MzUuMjMyNDczNDk4ICsw
ODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDExLjMyIDYuNjAgMi43MCAxLzE3OCA3
MDk5CnN0YXJ0X3RpbWU6ICcxNDIxNjYyMTQ5JwplbmRfdGltZTogJzE0MjE2NjI0NTMnCnZlcnNp
b246ICIvbGtwL2xrcC8uc3JjLTIwMTUwMTE5LTExMzc0OSIK

--===============6009807955223788445==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IG1tYXAyIDMyIDEgOCAxMiAxNgo=

--===============6009807955223788445==--

