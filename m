Content-Type: multipart/mixed; boundary="===============2159017895505170329=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [fs/file.c] 8a81252b77: 14.2% will-it-scale.per_thread_ops
Date: Thu, 10 Sep 2015 10:30:30 +0800
Message-ID: <87si6natvd.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2159017895505170329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 8a81252b774b53e628a8a0fe18e2b8fc236d92cc ("fs/file.c: don't acquire =
files->file_lock in fd_install()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  xps/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/open1

commit: =

  1af95de6f0119d5bde02d3a811a9f3a3661e954e
  8a81252b774b53e628a8a0fe18e2b8fc236d92cc

1af95de6f0119d5b 8a81252b774b53e628a8a0fe18 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    581483 =C2=B1  2%     +14.2%     663787 =C2=B1  2%  will-it-scale.per_t=
hread_ops
    689.96 =C2=B1  0%      -2.7%     671.31 =C2=B1  0%  will-it-scale.time.=
system_time
     17.86 =C2=B1  1%     +59.8%      28.55 =C2=B1  0%  will-it-scale.time.=
user_time
      3521 =C2=B1  6%     -11.2%       3125 =C2=B1  3%  slabinfo.kmalloc-19=
2.active_objs
     17.86 =C2=B1  1%     +59.8%      28.55 =C2=B1  0%  time.user_time
      8.75 =C2=B1 16%     -51.4%       4.25 =C2=B1 50%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
      5.50 =C2=B1 20%     +95.5%      10.75 =C2=B1 35%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
    473.25 =C2=B1 23%     +45.7%     689.50 =C2=B1 25%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
    811992 =C2=B1 10%     +11.6%     906272 =C2=B1  3%  sched_debug.cpu#0.a=
vg_idle
     80.00 =C2=B1 17%     +61.6%     129.25 =C2=B1 33%  sched_debug.cpu#7.c=
pu_load[0]
      1372 =C2=B1 19%     +50.6%       2066 =C2=B1 13%  sched_debug.cpu#7.c=
urr->pid
     20835 =C2=B1 26%     +40.7%      29308 =C2=B1 18%  sched_debug.cpu#7.t=
twu_count
      2.15 =C2=B1  2%     +34.2%       2.88 =C2=B1  2%  perf-profile.cpu-cy=
cles.__alloc_fd.get_unused_fd_flags.do_sys_open.sys_open.system_call_fastpa=
th
      1.40 =C2=B1  3%      -8.7%       1.28 =C2=B1  3%  perf-profile.cpu-cy=
cles.__slab_alloc.kmem_cache_alloc.get_empty_filp.path_openat.do_filp_open
      0.96 =C2=B1  4%      -8.4%       0.88 =C2=B1  2%  perf-profile.cpu-cy=
cles.dput.__fput.____fput.task_work_run.do_notify_resume
      2.55 =C2=B1  4%     +42.7%       3.63 =C2=B1  2%  perf-profile.cpu-cy=
cles.get_unused_fd_flags.do_sys_open.sys_open.system_call_fastpath
      3.67 =C2=B1  4%      -9.1%       3.34 =C2=B1  3%  perf-profile.cpu-cy=
cles.getname.do_sys_open.sys_open.system_call_fastpath
      1.02 =C2=B1  7%     +16.4%       1.19 =C2=B1  5%  perf-profile.cpu-cy=
cles.kmem_cache_free.putname.do_sys_open.sys_open.system_call_fastpath
      1.45 =C2=B1  6%     +22.8%       1.78 =C2=B1  5%  perf-profile.cpu-cy=
cles.path_init.path_openat.do_filp_open.do_sys_open.sys_open
      1.19 =C2=B1  6%     +25.4%       1.49 =C2=B1  4%  perf-profile.cpu-cy=
cles.putname.do_sys_open.sys_open.system_call_fastpath
      1.71 =C2=B1  7%     -14.0%       1.47 =C2=B1  4%  perf-profile.cpu-cy=
cles.security_file_free.__fput.____fput.task_work_run.do_notify_resume


xps: Nehalem
Memory: 4G




                          will-it-scale.time.user_time

  35 ++--------------------------------------------------------------------=
-+
     O                     O O  O O  O O                                   =
 |
  30 ++O    O    O  O O  O                O O  O O  O                      =
 |
     |                                                O O  O O  O          =
 |
  25 ++                                                                    =
 |
     |             .*.*..*.*.*..*.*..*.*..*.*..*                           =
 |
  20 *+*..*.*..*.*.                             +                          =
 |
     |                                           *..*.*.*..*.*..*.*..*.*..*=
.*
  15 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   5 ++                                                                    =
 |
     |                                                                     =
 |
   0 ++---O----O-----------------------------------------------------------=
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

--===============2159017895505170329==
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
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDY0Mjkx
ZjdkYjViZDgxNTBhNzRhZDIwMzZmMTAzN2U2YTA0MjhkZjIKbW9kZWw6IE5laGFsZW0KbnJfY3B1
OiA4Cm1lbW9yeTogNEcKaGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6ICIvZGV2L2Rp
c2svYnktaWQvYXRhLUhEVDcyMjUxNkRMQTM4MF9WREs5MUdURTBXTVpCUi1wYXJ0MiIKcm9vdGZz
X3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtSERUNzIyNTE2RExBMzgwX1ZESzkxR1RF
MFdNWkJSLXBhcnQxIgpuZXRjb25zb2xlX3BvcnQ6IDY2NjYKcHhlX3VzZXI6IHJsaTkKY2F0ZWdv
cnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6CiAg
dGVzdDogb3BlbjEKcXVldWU6IGN5Y2xpYwp0ZXN0Ym94OiB4cHMKdGJveF9ncm91cDogeHBzCmtj
b25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wOC0zMSAxNzo0MjozNy42MTU1
NzcyNzIgKzA4OjAwCmlkOiBlY2I0OTM4ZGVhYTgxZjcyMGIzN2U4Mzg5MzljY2VkNDgzYjc4M2Mz
CnVzZXI6IHJsaTkKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IDJkMTFjNjc1ZTJjMzI4
YTE3NjNkNGZiYWQ3YjY2ODQ4NzlmODEwMmEKYmFzZV9jb21taXQ6IDY0MjkxZjdkYjViZDgxNTBh
NzRhZDIwMzZmMTAzN2U2YTA0MjhkZjIKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHkt
MjAxNTA4MzEwNQprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNjQyOTFm
N2RiNWJkODE1MGE3NGFkMjAzNmYxMDM3ZTZhMDQyOGRmMi92bWxpbnV6LTQuMi4wIgpyb290ZnM6
IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3dpbGwt
aXQtc2NhbGUvcGVyZm9ybWFuY2Utb3BlbjEveHBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oveDg2XzY0LXJoZWwvZ2NjLTQuOS82NDI5MWY3ZGI1YmQ4MTUwYTc0YWQyMDM2ZjEwMzdlNmEw
NDI4ZGYyLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQveHBzL2N5Y2xpY193aWxsLWl0LXNj
YWxlLXBlcmZvcm1hbmNlLW9wZW4xLXg4Nl82NC1yaGVsLUNZQ0xJQ19CQVNFLTY0MjkxZjdkYjVi
ZDgxNTBhNzRhZDIwMzZmMTAzN2U2YTA0MjhkZjItMjAxNTA4MzEtMjk1MDkteWV3dWNjLTAueWFt
bCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA4LTMxIDE5OjI2OjA0LjU0NDMwODUxMCArMDg6MDAKbWF4
X3VwdGltZTogMTUwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPXJs
aTkKLSBqb2I9L2xrcC9zY2hlZHVsZWQveHBzL2N5Y2xpY193aWxsLWl0LXNjYWxlLXBlcmZvcm1h
bmNlLW9wZW4xLXg4Nl82NC1yaGVsLUNZQ0xJQ19CQVNFLTY0MjkxZjdkYjViZDgxNTBhNzRhZDIw
MzZmMTAzN2U2YTA0MjhkZjItMjAxNTA4MzEtMjk1MDkteWV3dWNjLTAueWFtbAotIEFSQ0g9eDg2
XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3Vy
bHktMjAxNTA4MzEwNQotIGNvbW1pdD02NDI5MWY3ZGI1YmQ4MTUwYTc0YWQyMDM2ZjEwMzdlNmEw
NDI4ZGYyCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNjQyOTFm
N2RiNWJkODE1MGE3NGFkMjAzNmYxMDM3ZTZhMDQyOGRmMi92bWxpbnV6LTQuMi4wCi0gbWF4X3Vw
dGltZT0xNTAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNl
LW9wZW4xL3hwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00
LjkvNjQyOTFmN2RiNWJkODE1MGE3NGFkMjAzNmYxMDM3ZTZhMDQyOGRmMi8wCi0gTEtQX1NFUlZF
Uj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZl
bD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJj
dV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1p
X3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9
MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3Cmxr
cF9pbml0cmQ6ICIvbGtwL3JsaTkvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzY0MjkxZjdkYjViZDgxNTBhNzRhZDIwMzZmMTAz
N2U2YTA0MjhkZjIvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0
YXQuY2d6LC9sa3AvYmVuY2htYXJrcy93aWxsLWl0LXNjYWxlLmNneiIKam9iX3N0YXRlOiBmaW5p
c2hlZApsb2FkYXZnOiA2Ljg5IDMuNTggMS40NCAxLzE0OCA0NzIwCnN0YXJ0X3RpbWU6ICcxNDQx
MDIwNDAxJwplbmRfdGltZTogJzE0NDEwMjA3MDUnCnZlcnNpb246ICIvbGtwL3JsaTkvLnNyYy0y
MDE1MDgzMS0xNzQxMTAiCg==

--===============2159017895505170329==
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
bGluZ19nb3Zlcm5vcgouL3J1bnRlc3QucHkgb3BlbjEgMzIgYm90aCAxIDQgNiA4Cg==

--===============2159017895505170329==--

