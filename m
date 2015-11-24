Content-Type: multipart/mixed; boundary="===============2879024346470601317=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [genirq/msi] 460ec9d780: 8.5% unixbench.score
Date: Tue, 24 Nov 2015 13:32:11 +0800
Message-ID: <87h9kcufms.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2879024346470601317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/w=
ire-msi-bridge
commit 460ec9d78057bf462f5b5cd0a140e32252d81405 ("genirq/msi: Make the .pre=
pare callback reusable")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/debian-x86_64-2015-02-07.cgz/nhm-white2/context1/unix=
bench

commit: =

  c175e94e50249623f7e0c9dc087798afd2e541ae
  460ec9d78057bf462f5b5cd0a140e32252d81405

c175e94e50249623 460ec9d78057bf462f5b5cd0a1 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1421 =C2=B1  0%      +8.5%       1543 =C2=B1  0%  unixbench.score
  64569793 =C2=B1  0%      +7.0%   69093806 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
  18591611 =C2=B1114%     -62.0%    7060772 =C2=B1104%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     25939 =C2=B1  4%      -7.2%      24059 =C2=B1  5%  softirqs.SCHED
     10.80 =C2=B1  1%     +11.5%      12.04 =C2=B1  1%  time.user_time
      3971 =C2=B1 14%     -18.9%       3220 =C2=B1  5%  vmstat.system.in
     60.25 =C2=B1 20%     +28.6%      77.50 =C2=B1 15%  sched_debug.cfs_rq[=
0]:/.load_avg
     34.75 =C2=B1  6%     +50.4%      52.25 =C2=B1 23%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
     60.25 =C2=B1 20%     +28.6%      77.50 =C2=B1 15%  sched_debug.cfs_rq[=
0]:/.tg_load_avg_contrib
    440.00 =C2=B1 15%     +32.9%     584.75 =C2=B1 11%  sched_debug.cfs_rq[=
0]:/.util_avg
     32425 =C2=B1  4%     -15.2%      27496 =C2=B1 20%  sched_debug.cfs_rq[=
5]:/.exec_clock
     53.00 =C2=B1 16%     +72.6%      91.50 =C2=B1 21%  sched_debug.cfs_rq[=
5]:/.load_avg
     53.00 =C2=B1 16%     +73.1%      91.75 =C2=B1 21%  sched_debug.cfs_rq[=
5]:/.tg_load_avg_contrib
     80.25 =C2=B1 24%     +28.0%     102.75 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.load_avg
     37.00 =C2=B1  8%     +39.9%      51.75 =C2=B1 29%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
     80.25 =C2=B1 24%     +28.7%     103.25 =C2=B1 15%  sched_debug.cfs_rq[=
6]:/.tg_load_avg_contrib
     36.00 =C2=B1  3%     +27.1%      45.75 =C2=B1 14%  sched_debug.cpu#0.c=
pu_load[1]
     36.25 =C2=B1  4%     +22.8%      44.50 =C2=B1  8%  sched_debug.cpu#0.c=
pu_load[2]
     35.75 =C2=B1  7%     +24.5%      44.50 =C2=B1  9%  sched_debug.cpu#0.c=
pu_load[3]
     35.50 =C2=B1  9%     +28.9%      45.75 =C2=B1 12%  sched_debug.cpu#0.c=
pu_load[4]
   2030062 =C2=B1  4%     -16.0%    1705635 =C2=B1  5%  sched_debug.cpu#1.s=
ched_goidle
     35.00 =C2=B1 11%     +14.3%      40.00 =C2=B1  5%  sched_debug.cpu#3.c=
pu_load[0]
     32.75 =C2=B1 23%     +25.2%      41.00 =C2=B1  4%  sched_debug.cpu#3.c=
pu_load[2]
     32.50 =C2=B1 24%     +29.2%      42.00 =C2=B1  6%  sched_debug.cpu#3.c=
pu_load[3]
     32.00 =C2=B1 26%     +34.4%      43.00 =C2=B1 10%  sched_debug.cpu#3.c=
pu_load[4]
     35.50 =C2=B1 13%     +18.3%      42.00 =C2=B1  5%  sched_debug.cpu#4.c=
pu_load[4]
     38729 =C2=B1  6%     -17.3%      32035 =C2=B1 20%  sched_debug.cpu#5.n=
r_load_updates
   1357857 =C2=B1 24%     -46.7%     724368 =C2=B1 35%  sched_debug.cpu#5.s=
ched_goidle


nhm-white2: Nehalem
Memory: 4G



                                  unixbench.score

  1700 O+O--OO-------------------------------------------------------------=
-+
       |  O                                                                =
 |
  1650 ++                                                                  =
 |
       |                                                                   =
 |
  1600 ++      OO                                                          =
 |
       |          OO    O  O    OO O  OO O                                 =
 |
  1550 ++                O  O O     O     O OO O                           =
 |
       |             OO                                                    =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1450 ++                                                                  =
 |
       |                 *.**.*.**.**.                              *.**.**=
.*
  1400 *+**.**.**.**.**.*             **.**.**.**.**.*.**.**.**.**.*       =
 |
       |                                                                   =
 |
  1350 ++------------------------------------------------------------------=
-+


                       unixbench.time.voluntary_context_switches

  7.6e+07 O+--O------------------------------------------------------------=
-+
          |O O  O                                                          =
 |
  7.4e+07 ++                                                               =
 |
          |                                                                =
 |
  7.2e+07 ++       O                                                       =
 |
          |      O                  O     O                                =
 |
    7e+07 ++        O O   O OO OOO O  OO O  O                              =
 |
          |            O O                   O OO                          =
 |
  6.8e+07 ++                                                               =
 |
          |                                                                =
 |
  6.6e+07 ++                      .*                                       =
 |
          |                 **.***  *.*                              * .**.=
*|
  6.4e+07 **. *.* .**.* .* +           *.* .**. *.**. **. *.* .**.* + *    =
 *
          |  *   *     *  *               *    *     *   *   *     *       =
 |
  6.2e+07 ++---------------------------------------------------------------=
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

--===============2879024346470601317==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6
CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDQ2MGVjOWQ3ODA1N2JmNDYyZjVi
NWNkMGExNDBlMzIyNTJkODE0MDUKbW9kZWw6IE5laGFsZW0KbWVtb3J5OiA0Rwpucl9jcHU6IDgK
aGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKbmV0
Y29uc29sZV9wb3J0OiA2NjcxCmNhdGVnb3J5OiBiZW5jaG1hcmsKdW5peGJlbmNoOgogIHRlc3Q6
IGNvbnRleHQxCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogbmhtLXdoaXRlMgp0Ym94X2dyb3VwOiBu
aG0td2hpdGUyCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0xMS0yMyAx
NTo0MToyMS4wMzcyMzAzMTAgKzA4OjAwCmlkOiAyZWY2ZmM2ZDJlMDlhNTgyZTk3NDBjNWM0NTQ2
NmQyZGIyMWRjNTRhCnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogNmU2
ZTY4YmRiODdjOTI3MTA2MTFhNGFiOWE5YThlODVjZmUzNDEwMApiYXNlX2NvbW1pdDogODAwNWM0
OWQ5YWVhNzRkMzgyZjQ3NGNlMTFhZmJiYzdkNzEzMGJlYwpicmFuY2g6IGxpbnV4LWRldmVsL2Rl
dmVsLWhvdXJseS0yMDE1MTEyMjIxCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
egpyZXN1bHRfcm9vdDogIi9yZXN1bHQvdW5peGJlbmNoL2NvbnRleHQxL25obS13aGl0ZTIvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzQ2MGVjOWQ3ODA1
N2JmNDYyZjViNWNkMGExNDBlMzIyNTJkODE0MDUvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxl
ZC9uaG0td2hpdGUyL2Jpc2VjdF91bml4YmVuY2gtY29udGV4dDEtZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei14ODZfNjQtcmhlbC00NjBlYzlkNzgwNTdiZjQ2MmY1YjVjZDBhMTQwZTMyMjUy
ZDgxNDA1LTIwMTUxMTIzLTcwOTk3LXFlMmkxbS0wLnlhbWwiCm1heF91cHRpbWU6IDEzMTAuMDIw
MDAwMDAwMDAwMgppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAot
IGpvYj0vbGtwL3NjaGVkdWxlZC9uaG0td2hpdGUyL2Jpc2VjdF91bml4YmVuY2gtY29udGV4dDEt
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC00NjBlYzlkNzgwNTdiZjQ2
MmY1YjVjZDBhMTQwZTMyMjUyZDgxNDA1LTIwMTUxMTIzLTcwOTk3LXFlMmkxbS0wLnlhbWwKLSBB
UkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2
ZWwtaG91cmx5LTIwMTUxMTIyMjEKLSBjb21taXQ9NDYwZWM5ZDc4MDU3YmY0NjJmNWI1Y2QwYTE0
MGUzMjI1MmQ4MTQwNQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45
LzQ2MGVjOWQ3ODA1N2JmNDYyZjViNWNkMGExNDBlMzIyNTJkODE0MDUvdm1saW51ei00LjQuMC1y
YzEtMDAwMDQtZzQ2MGVjOWQKLSBtYXhfdXB0aW1lPTEzMTAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0
L3VuaXhiZW5jaC9jb250ZXh0MS9uaG0td2hpdGUyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oveDg2XzY0LXJoZWwvZ2NjLTQuOS80NjBlYzlkNzgwNTdiZjQ2MmY1YjVjZDBhMTQwZTMyMjUy
ZDgxNDA1LzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1
MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlz
X2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNv
ZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRp
c2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkw
IHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igpt
b2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS80NjBlYzlkNzgw
NTdiZjQ2MmY1YjVjZDBhMTQwZTMyMjUyZDgxNDA1L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFn
ZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtw
L2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdW5peGJlbmNoLmNneiIK
cmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS80NjBl
YzlkNzgwNTdiZjQ2MmY1YjVjZDBhMTQwZTMyMjUyZDgxNDA1L3ZtbGludXotNC40LjAtcmMxLTAw
MDA0LWc0NjBlYzlkIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMTEtMjMgMTY6NDI6NTcuNzA4NTE1MDkx
ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDYuOTQgMy4xMCAxLjE4IDEvMTY5
IDQ1NzEKc3RhcnRfdGltZTogJzE0NDgyNjgyMDEnCmVuZF90aW1lOiAnMTQ0ODI2ODQ2MicKdmVy
c2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTExMjAtMjIzODQzIgo=

--===============2879024346470601317==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNS0xMS0yMyAxNjo0MzoyMSAuL1J1biBjb250ZXh0MQo=

--===============2879024346470601317==--

