Content-Type: multipart/mixed; boundary="===============1107385507518478835=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [x86/build] b2c51106c75: -18.1% will-it-scale.per_process_ops
Date: Sat, 01 Aug 2015 13:17:33 +0800
Message-ID: <87pp37y4cy.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1107385507518478835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm
commit b2c51106c7581866c37ffc77c5d739f3d4b7cbc9 ("x86/build: Fix detection =
of GCC -mpreferred-stack-boundary support")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  wsm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/readseek2

commit: =

  f2a50f8b7da45ff2de93a71393e715a2ab9f3b68
  b2c51106c7581866c37ffc77c5d739f3d4b7cbc9

f2a50f8b7da45ff2 b2c51106c7581866c37ffc77c5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    879002 =C2=B1  0%     -18.1%     720270 =C2=B1  7%  will-it-scale.per_p=
rocess_ops
      0.02 =C2=B1  0%     +34.5%       0.02 =C2=B1  7%  will-it-scale.scala=
bility
  26153173 =C2=B1  0%      +7.0%   27977076 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
     15.70 =C2=B1  2%     +14.5%      17.98 =C2=B1  0%  time.user_time
    370683 =C2=B1  0%      +6.2%     393491 =C2=B1  0%  vmstat.system.cs
    830343 =C2=B1 56%     -54.0%     382128 =C2=B1 39%  cpuidle.C1E-NHM.time
    788.25 =C2=B1 14%     -21.7%     617.25 =C2=B1 16%  cpuidle.C1E-NHM.usa=
ge
      3947 =C2=B1  2%     +10.6%       4363 =C2=B1  3%  slabinfo.kmalloc-19=
2.active_objs
      3947 =C2=B1  2%     +10.6%       4363 =C2=B1  3%  slabinfo.kmalloc-19=
2.num_objs
   1082762 =C2=B1162%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1082762 =C2=B1162%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1082762 =C2=B1162%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      2.58 =C2=B1  8%     +19.5%       3.09 =C2=B1  3%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.finish_wait.__wait_on_bit_lock.__lock_page.find=
_lock_entry
      7.02 =C2=B1  3%      +9.2%       7.67 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.prepare_to_wait_exclusive.__wait_on_bit_lock.__=
lock_page.find_lock_entry
      3.07 =C2=B1  2%     +14.8%       3.53 =C2=B1  3%  perf-profile.cpu-cy=
cles.finish_wait.__wait_on_bit_lock.__lock_page.find_lock_entry.shmem_getpa=
ge_gfp
      3.05 =C2=B1  5%      -8.4%       2.79 =C2=B1  4%  perf-profile.cpu-cy=
cles.hrtimer_start_range_ns.tick_nohz_stop_sched_tick.__tick_nohz_idle_ente=
r.tick_nohz_idle_enter.cpu_startup_entry
      0.98 =C2=B1  3%     -25.1%       0.74 =C2=B1  7%  perf-profile.cpu-cy=
cles.is_ftrace_trampoline.print_context_stack.dump_trace.save_stack_trace_t=
sk.__account_scheduler_latency
      1.82 =C2=B1 18%     +46.6%       2.67 =C2=B1  3%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.finish_wait.__=
wait_on_bit_lock.__lock_page
      8.05 =C2=B1  3%      +9.5%       8.82 =C2=B1  3%  perf-profile.cpu-cy=
cles.prepare_to_wait_exclusive.__wait_on_bit_lock.__lock_page.find_lock_ent=
ry.shmem_getpage_gfp
      7.75 =C2=B1 34%     -64.5%       2.75 =C2=B1 64%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
      1135 =C2=B1 20%     -43.6%     640.75 =C2=B1 49%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
      1215 =C2=B1 21%     -43.1%     691.50 =C2=B1 46%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
     38.50 =C2=B1 21%    +129.9%      88.50 =C2=B1 36%  sched_debug.cfs_rq[=
4]:/.load
     26.00 =C2=B1 20%     +98.1%      51.50 =C2=B1 46%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
    128.25 =C2=B1 18%    +227.5%     420.00 =C2=B1 43%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
      1015 =C2=B1 78%    +101.1%       2042 =C2=B1 25%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
      1069 =C2=B1 72%    +100.2%       2140 =C2=B1 23%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
     88.75 =C2=B1 14%     -47.3%      46.75 =C2=B1 36%  sched_debug.cfs_rq[=
9]:/.load
     59.25 =C2=B1 23%     -41.4%      34.75 =C2=B1 34%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
    315.50 =C2=B1 45%     -64.6%     111.67 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
   2246758 =C2=B1  7%     +87.6%    4213925 =C2=B1 65%  sched_debug.cpu#0.n=
r_switches
   2249376 =C2=B1  7%     +87.4%    4215969 =C2=B1 65%  sched_debug.cpu#0.s=
ched_count
   1121438 =C2=B1  7%     +81.0%    2030313 =C2=B1 61%  sched_debug.cpu#0.s=
ched_goidle
   1151160 =C2=B1  7%     +86.5%    2146608 =C2=B1 64%  sched_debug.cpu#0.t=
twu_count
     33.75 =C2=B1 15%     -22.2%      26.25 =C2=B1  6%  sched_debug.cpu#1.c=
pu_load[3]
     33.25 =C2=B1 10%     -18.0%      27.25 =C2=B1  7%  sched_debug.cpu#1.c=
pu_load[4]
     40.00 =C2=B1 18%     +24.4%      49.75 =C2=B1 18%  sched_debug.cpu#10.=
cpu_load[2]
     39.25 =C2=B1 14%     +22.3%      48.00 =C2=B1 10%  sched_debug.cpu#10.=
cpu_load[3]
     39.50 =C2=B1 15%     +20.3%      47.50 =C2=B1  6%  sched_debug.cpu#10.=
cpu_load[4]
   5269004 =C2=B1  1%     +27.8%    6731790 =C2=B1 30%  sched_debug.cpu#10.=
nr_switches
   5273193 =C2=B1  1%     +27.8%    6736526 =C2=B1 30%  sched_debug.cpu#10.=
sched_count
   2633974 =C2=B1  1%     +27.8%    3365271 =C2=B1 30%  sched_debug.cpu#10.=
sched_goidle
   2644149 =C2=B1  1%     +26.9%    3356318 =C2=B1 30%  sched_debug.cpu#10.=
ttwu_count
     30.75 =C2=B1 15%     +66.7%      51.25 =C2=B1 31%  sched_debug.cpu#11.=
cpu_load[1]
   5116609 =C2=B1  4%     +34.5%    6884238 =C2=B1 33%  sched_debug.cpu#9.n=
r_switches
   5120531 =C2=B1  4%     +34.5%    6889156 =C2=B1 33%  sched_debug.cpu#9.s=
ched_count
   2557822 =C2=B1  4%     +34.5%    3441428 =C2=B1 33%  sched_debug.cpu#9.s=
ched_goidle
      0.00 =C2=B1141%  +4.2e+05%       4.76 =C2=B1173%  sched_debug.rt_rq[1=
0]:/.rt_time


wsm: Westmere
Memory: 6G

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

--===============1107385507518478835==
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
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDExYjlk
ZTRiMzM1OTVmODE2OGM0YThmYTJiZmYzY2E0YzliMzhjN2IKbW9kZWw6IFdlc3RtZXJlCm1lbW9y
eTogNkcKbnJfaGRkX3BhcnRpdGlvbnM6IDEKaGRkX3BhcnRpdGlvbnM6IGF0YS1BVEFQSV9pSEVT
MjA4XzJfMzc4MjIwODAxN18yNTA5MTU0MDQKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRp
dGlvbjogCm5ldGNvbnNvbGVfcG9ydDogNjY2NwpjYXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJv
ZmlsZToKICBmcmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OiByZWFkc2VlazIKcXVldWU6
IGN5Y2xpYwp0ZXN0Ym94OiB3c20KdGJveF9ncm91cDogd3NtCmtjb25maWc6IHg4Nl82NC1yaGVs
CmVucXVldWVfdGltZTogMjAxNS0wNy0yOCAwNDowODo0OC4zNzE3NTI4OTkgKzA4OjAwCnVzZXI6
IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogMTFiOWRlNGIzMzU5NWY4MTY4YzRh
OGZhMmJmZjNjYTRjOWIzOGM3YgpiYXNlX2NvbW1pdDogY2JmZThmYTZjZDY3MjAxMWM3NTVjM2Nk
ODVjOWZmZDRlMmQxMGE2ZgpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDcy
ODE4Cmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8xMWI5ZGU0YjMzNTk1
ZjgxNjhjNGE4ZmEyYmZmM2NhNGM5YjM4YzdiL3ZtbGludXotNC4yLjAtcmM0LTAyNDY5LWcxMWI5
ZGU0Igpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIv
cmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtcmVhZHNlZWsyL3dzbS9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMTFiOWRlNGIzMzU5NWY4MTY4
YzRhOGZhMmJmZjNjYTRjOWIzOGM3Yi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL3dzbS9j
eWNsaWNfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1yZWFkc2VlazIteDg2XzY0LXJoZWwtQ1lD
TElDX0hFQUQtMTFiOWRlNGIzMzU5NWY4MTY4YzRhOGZhMmJmZjNjYTRjOWIzOGM3Yi0yMDE1MDcy
OC0yMjU2MC0xOTI3MTV6LTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA3LTI5IDAwOjU2OjI3
LjY3Njc4MTY3MyArMDg6MDAKbnJfY3B1OiAiJChucHJvYykiCm1heF91cHRpbWU6IDE1MDAKaW5p
dHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rs
b2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hl
ZHVsZWQvd3NtL2N5Y2xpY193aWxsLWl0LXNjYWxlLXBlcmZvcm1hbmNlLXJlYWRzZWVrMi14ODZf
NjQtcmhlbC1DWUNMSUNfSEVBRC0xMWI5ZGU0YjMzNTk1ZjgxNjhjNGE4ZmEyYmZmM2NhNGM5YjM4
YzdiLTIwMTUwNzI4LTIyNTYwLTE5MjcxNXotMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmln
PXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDcyODE4
Ci0gY29tbWl0PTExYjlkZTRiMzM1OTVmODE2OGM0YThmYTJiZmYzY2E0YzliMzhjN2IKLSBCT09U
X0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8xMWI5ZGU0YjMzNTk1ZjgxNjhj
NGE4ZmEyYmZmM2NhNGM5YjM4YzdiL3ZtbGludXotNC4yLjAtcmM0LTAyNDY5LWcxMWI5ZGU0Ci0g
bWF4X3VwdGltZT0xNTAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZv
cm1hbmNlLXJlYWRzZWVrMi93c20vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQt
cmhlbC9nY2MtNC45LzExYjlkZTRiMzM1OTVmODE2OGM0YThmYTJiZmYzY2E0YzliMzhjN2IvMAot
IExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVt
ZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCBy
Y3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9w
YW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21w
dF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1h
bAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5p
dHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzExYjlkZTRiMzM1OTVmODE2OGM0
YThmYTJiZmYzY2E0YzliMzhjN2IvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2Rl
cHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMv
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJr
cy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy93aWxsLWl0LXNjYWxlLmNneiIKam9iX3N0
YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA5LjkzIDUuMTEgMi4wNiAxLzE4NiA0ODQ0CnN0YXJ0X3Rp
bWU6ICcxNDM4MTAyNzYwJwplbmRfdGltZTogJzE0MzgxMDMwNjQnCnZlcnNpb246ICIvbGtwL2xr
cC8uc3JjLTIwMTUwNzI4LTEwMDEzMiIK

--===============1107385507518478835==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgouL3J1bnRlc3QucHkgcmVhZHNlZWsyIDMyIGJvdGggMSA2
IDkgMTIK

--===============1107385507518478835==--

