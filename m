Content-Type: multipart/mixed; boundary="===============2160065272015031560=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Mon, 06 Jun 2016 10:27:24 +0800
Message-ID: <20160606022724.GA26227@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2160065272015031560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a -6.3% regression of unixbench.score due to commit:

commit 5c0a85fad949212b3e059692deecdeed74ae7ec7 ("mm: make faultaround prod=
uce old ptes")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

in testcase: unixbench
on test machine: lituya: 16 threads Haswell High-end Desktop (i7-5960X 3.0G=
) with 16G memory
with following parameters: cpufreq_governor=3Dperformance/nr_task=3D1/test=
=3Dshell8


Details are as below:
---------------------------------------------------------------------------=
----------------------->


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lituya/she=
ll8/unixbench

commit: =

  4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
  5c0a85fad949212b3e059692deecdeed74ae7ec7

4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          3:4          -75%            :4     kmsg.DHCP/BOOTP:Reply_not_for=
_us,op[#]xid[#]
         %stddev     %change         %stddev
             \          |                \  =

     14321 =C2=B1  0%      -6.3%      13425 =C2=B1  0%  unixbench.score
   1996897 =C2=B1  0%      -6.1%    1874635 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 1.721e+08 =C2=B1  0%      -6.2%  1.613e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    758.65 =C2=B1  0%      -3.0%     735.86 =C2=B1  0%  unixbench.time.syst=
em_time
    387.66 =C2=B1  0%      +5.4%     408.49 =C2=B1  0%  unixbench.time.user=
_time
   5950278 =C2=B1  0%      -6.2%    5583456 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
   1960642 =C2=B1  0%     -11.4%    1737753 =C2=B1  0%  cpuidle.C1-HSW.usage
      5851 =C2=B1  0%     -43.8%       3286 =C2=B1  1%  proc-vmstat.nr_acti=
ve_file
     46185 =C2=B1  0%     -21.2%      36385 =C2=B1  2%  meminfo.Active
     23404 =C2=B1  0%     -43.8%      13147 =C2=B1  1%  meminfo.Active(file)
      4109 =C2=B1  5%     -19.6%       3302 =C2=B1  4%  slabinfo.pid.active=
_objs
      4109 =C2=B1  5%     -19.6%       3302 =C2=B1  4%  slabinfo.pid.num_ob=
js
     94603 =C2=B1  0%      -5.7%      89247 =C2=B1  0%  vmstat.system.cs
      8976 =C2=B1  0%      -2.5%       8754 =C2=B1  0%  vmstat.system.in
      3.38 =C2=B1  2%     +11.8%       3.77 =C2=B1  0%  turbostat.CPU%c3
      0.24 =C2=B1101%     -86.3%       0.03 =C2=B1 54%  turbostat.Pkg%pc3
     66.53 =C2=B1  0%      -1.7%      65.41 =C2=B1  0%  turbostat.PkgWatt
      2061 =C2=B1  1%      -8.5%       1886 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.stddev
    737154 =C2=B1  5%     +10.8%     817107 =C2=B1  3%  sched_debug.cpu.avg=
_idle.max
    133057 =C2=B1  5%     -33.2%      88864 =C2=B1 11%  sched_debug.cpu.avg=
_idle.min
    181562 =C2=B1  8%     +15.9%     210434 =C2=B1  3%  sched_debug.cpu.avg=
_idle.stddev
      0.97 =C2=B1  7%     +19.0%       1.16 =C2=B1  8%  sched_debug.cpu.clo=
ck.stddev
      0.97 =C2=B1  7%     +19.0%       1.16 =C2=B1  8%  sched_debug.cpu.clo=
ck_task.stddev
    248.06 =C2=B1 11%     +31.0%     324.94 =C2=B1  8%  sched_debug.cpu.cpu=
_load[1].max
     55.65 =C2=B1 14%     +28.1%      71.30 =C2=B1  8%  sched_debug.cpu.cpu=
_load[1].stddev
    233.38 =C2=B1 10%     +34.4%     313.56 =C2=B1  8%  sched_debug.cpu.cpu=
_load[2].max
     49.79 =C2=B1 15%     +35.6%      67.50 =C2=B1  9%  sched_debug.cpu.cpu=
_load[2].stddev
    233.25 =C2=B1 12%     +29.9%     302.94 =C2=B1  6%  sched_debug.cpu.cpu=
_load[3].max
     46.56 =C2=B1  8%     +12.2%      52.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[3].min
     48.51 =C2=B1 15%     +31.4%      63.76 =C2=B1  7%  sched_debug.cpu.cpu=
_load[3].stddev
    238.44 =C2=B1 12%     +19.0%     283.69 =C2=B1  3%  sched_debug.cpu.cpu=
_load[4].max
     49.56 =C2=B1  9%     +13.4%      56.19 =C2=B1  4%  sched_debug.cpu.cpu=
_load[4].min
     48.22 =C2=B1 13%     +20.1%      57.93 =C2=B1  5%  sched_debug.cpu.cpu=
_load[4].stddev
     14792 =C2=B1 30%     +71.9%      25424 =C2=B1 17%  sched_debug.cpu.cur=
r->pid.avg
     42862 =C2=B1  1%     +42.6%      61121 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.max
     19466 =C2=B1 10%     +35.4%      26351 =C2=B1  9%  sched_debug.cpu.cur=
r->pid.stddev
      1067 =C2=B1  6%     -14.9%     909.35 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.stddev



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
Xiaolong

--===============2160065272015031560==
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
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZv
cm1hbmNlCk5GU19IQU5HX0RGX1RJTUVPVVQ6IDIwMApORlNfSEFOR19DSEVDS19JTlRFUlZBTDog
OTAwCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKICBuZnMt
aGFuZzogCmNvbW1pdDogNWMwYTg1ZmFkOTQ5MjEyYjNlMDU5NjkyZGVlY2RlZWQ3NGFlN2VjNwpt
b2RlbDogSGFzd2VsbCBIaWdoLWVuZCBEZXNrdG9wCm5yX2NwdTogMTYKbWVtb3J5OiAxNkcKaGRk
X3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKZGVzY3Jp
cHRpb246IDE2IHRocmVhZHMgSGFzd2VsbCBIaWdoLWVuZCBEZXNrdG9wIChpNy01OTYwWCAzLjBH
KSB3aXRoIDE2RyBtZW1vcnkKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90YXNrOiAxCnVuaXhiZW5j
aDoKICB0ZXN0OiBzaGVsbDgKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsaXR1eWEKdGJveF9ncm91
cDogbGl0dXlhCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wNi0wNCAw
MzoyNjo1Mi40NDQ1ODYwMDYgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogMTAxOTMyY2EzNGY2ZmYyMDYxM2I4OGY2YmVkNjZm
YmM0YWZkZmI5NQp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IDczYWE4NWIzMDcwNmY3NDI2NTVhMTBj
OTY3YzAzM2I1NmM3MzFhZmYKYmFzZV9jb21taXQ6IDFhNjk1YTkwNWMxODU0ODA2MjUwOTE3OGI5
OGJjOTFlNjc1MTA4NjQKYnJhbmNoOiBpbnRlcm5hbC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjA2
MDEwOC1pbnRlcm5hbApyZXN1bHRfcm9vdDogIi9yZXN1bHQvdW5peGJlbmNoL3BlcmZvcm1hbmNl
LTEtc2hlbGw4L2xpdHV5YS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVs
L2djYy00LjkvNWMwYTg1ZmFkOTQ5MjEyYjNlMDU5NjkyZGVlY2RlZWQ3NGFlN2VjNy8xIgpqb2Jf
ZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xpdHV5YS9iaXNlY3RfdW5peGJlbmNoLXBlcmZvcm1hbmNl
LTEtc2hlbGw4LWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNWMwYTg1
ZmFkOTQ5MjEyYjNlMDU5NjkyZGVlY2RlZWQ3NGFlN2VjNy0yMDE2MDYwNC01NzQwMC0xZm92b2Q4
LTEueWFtbCIKbWF4X3VwdGltZTogMTAzMi4yOAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2
L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9saXR1eWEvYmlzZWN0X3VuaXhi
ZW5jaC1wZXJmb3JtYW5jZS0xLXNoZWxsOC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4
Nl82NC1yaGVsLTVjMGE4NWZhZDk0OTIxMmIzZTA1OTY5MmRlZWNkZWVkNzRhZTdlYzctMjAxNjA2
MDQtNTc0MDAtMWZvdm9kOC0xLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJo
ZWwKLSBicmFuY2g9aW50ZXJuYWwtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwNjAxMDgtaW50ZXJu
YWwKLSBjb21taXQ9NWMwYTg1ZmFkOTQ5MjEyYjNlMDU5NjkyZGVlY2RlZWQ3NGFlN2VjNwotIEJP
T1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzVjMGE4NWZhZDk0OTIxMmIz
ZTA1OTY5MmRlZWNkZWVkNzRhZTdlYzcvdm1saW51ei00LjYuMC0wNjYyOS1nNWMwYTg1ZgotIG1h
eF91cHRpbWU9MTAzMgotIFJFU1VMVF9ST09UPS9yZXN1bHQvdW5peGJlbmNoL3BlcmZvcm1hbmNl
LTEtc2hlbGw4L2xpdHV5YS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVs
L2djYy00LjkvNWMwYTg1ZmFkOTQ5MjEyYjNlMDU5NjkyZGVlY2RlZWQ3NGFlN2VjNy8xCi0gTEtQ
X1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxv
Z19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBk
YXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3Bhbmlj
PTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3Jh
bWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgog
IHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6
ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNWMwYTg1ZmFkOTQ5MjEyYjNlMDU5Njky
ZGVlY2RlZWQ3NGFlN2VjNy9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1
cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3VuaXhiZW5jaC5jZ3oiCmxpbnV4X2hlYWRlcnNf
aW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzVjMGE4NWZhZDk0OTIxMmIz
ZTA1OTY5MmRlZWNkZWVkNzRhZTdlYzcvbGludXgtaGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgpr
ZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNWMwYTg1ZmFkOTQ5MjEyYjNl
MDU5NjkyZGVlY2RlZWQ3NGFlN2VjNy92bWxpbnV6LTQuNi4wLTA2NjI5LWc1YzBhODVmIgpkZXF1
ZXVlX3RpbWU6IDIwMTYtMDYtMDQgMDM6NDA6NTAuODA3Mjc0MjAxICswODowMApqb2Jfc3RhdGU6
IGZpbmlzaGVkCmxvYWRhdmc6IDUuNzAgMi43MCAxLjA1IDEvMjU3IDM3NDQKc3RhcnRfdGltZTog
JzE0NjUwMTA4MzQnCmVuZF90aW1lOiAnMTQ2NTAxMTAyMycKdmVyc2lvbjogIi9sa3AvbGtwLy5z
cmMtMjAxNjA2MDMtMjE0NDI3Igo=

--===============2160065272015031560==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNi0wNCAxMToyMzozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNi0wNCAxMToyMzozMiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNi0wNCAxMToyMzozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDYtMDQgMTE6MjM6MzIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA2LTA0IDExOjIzOjMyIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNi0wNCAxMToyMzozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDYt
MDQgMTE6MjM6MzIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA2LTA0IDExOjIzOjMyIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNi0wNCAxMToyMzozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNi0wNCAx
MToyMzozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNi0wNCAxMToyMzozMiBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNi0wNCAxMToyMzozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNi0wNCAxMToyMzoz
MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNi0wNCAxMToyMzozMiBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wNi0wNCAxMToyMzozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNi0wNCAxMToyMzozMiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNi0wNCAxMToyMzozMyAuL1J1biBzaGVsbDggLWMgMQo=

--===============2160065272015031560==--

