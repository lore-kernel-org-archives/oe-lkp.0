Content-Type: multipart/mixed; boundary="===============0884726900151503367=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [xfs] dbe1b5ca263: +6.5% will-it-scale.per_thread_ops
Date: Mon, 29 Dec 2014 14:57:31 +0800
Message-ID: <1419836251.4862.4.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0884726900151503367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit dbe1b5ca26396b6c61d711c8ac4de13ebb02e9f6 ("xfs: Make xfs_vn_rename c=
ompliant with renameat2() syscall")


testbox/testcase/testparams: lkp-nex05/will-it-scale/performance-pwrite1

       v3.19-rc1  dbe1b5ca26396b6c61d711c8ac  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

   1131870 =C2=B1  0%      +6.5%    1205531 =C2=B1  0%  will-it-scale.per_t=
hread_ops
   1209729 =C2=B1  0%      +5.8%    1280184 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.54 =C2=B1  0%      -3.1%       0.53 =C2=B1  1%  will-it-scale.scala=
bility
      1400 =C2=B1 30%    +174.5%       3842 =C2=B1 34%  sched_debug.cpu#36.=
nr_switches
       810 =C2=B1 33%    +154.2%       2060 =C2=B1 25%  sched_debug.cpu#36.=
ttwu_count
       163 =C2=B1 41%     +96.6%        320 =C2=B1 42%  sched_debug.cpu#2.t=
twu_local
       242 =C2=B1 38%     +71.4%        416 =C2=B1 19%  slabinfo.blkdev_que=
ue.active_objs
       137 =C2=B1 28%     +99.3%        274 =C2=B1 22%  sched_debug.cpu#26.=
ttwu_local
        29 =C2=B1 44%    +116.0%         63 =C2=B1 28%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
      1296 =C2=B1 34%     +41.5%       1835 =C2=B1 19%  sched_debug.cpu#63.=
ttwu_local
       405 =C2=B1 30%     -42.3%        234 =C2=B1 15%  sched_debug.cpu#56.=
sched_goidle
       314 =C2=B1 27%     +43.6%        452 =C2=B1 11%  slabinfo.blkdev_que=
ue.num_objs
       980 =C2=B1 28%     -37.7%        611 =C2=B1 13%  sched_debug.cpu#56.=
nr_switches
       684 =C2=B1 25%     +40.5%        962 =C2=B1 20%  sched_debug.cpu#10.=
ttwu_count
      1.03 =C2=B1  2%     -38.8%       0.63 =C2=B1  7%  perf-profile.cpu-cy=
cles.current_kernel_time.file_update_time.__generic_file_write_iter.generic=
_file_write_iter.new_sync_write
       838 =C2=B1 25%     -33.1%        560 =C2=B1 14%  sched_debug.cpu#60.=
nr_switches
      4870 =C2=B1 19%     +25.8%       6127 =C2=B1 14%  sched_debug.cpu#63.=
nr_switches
      1443 =C2=B1 10%     +39.9%       2019 =C2=B1 23%  sched_debug.cpu#2.s=
ched_count
        39 =C2=B1 20%     +55.1%         61 =C2=B1 16%  latency_stats.max.c=
all_rwsem_down_write_failed.SyS_mprotect.system_call_fastpath
       336 =C2=B1 33%     -37.8%        209 =C2=B1 12%  sched_debug.cpu#60.=
sched_goidle
      2.27 =C2=B1 12%     -33.6%       1.51 =C2=B1  2%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_write.sys_pwrite64.system_call_fastpath.__libc_pwri=
te
       394 =C2=B1 19%     -31.5%        270 =C2=B1 13%  sched_debug.cpu#52.=
sched_goidle
       986 =C2=B1 19%     -25.0%        740 =C2=B1 11%  sched_debug.cpu#52.=
nr_switches
      2.25 =C2=B1  4%     -28.4%       1.61 =C2=B1  6%  perf-profile.cpu-cy=
cles.security_file_permission.rw_verify_area.vfs_write.sys_pwrite64.system_=
call_fastpath
       257 =C2=B1 15%     +52.9%        394 =C2=B1 28%  sched_debug.cpu#10.=
ttwu_local
      1.24 =C2=B1 10%     -26.7%       0.91 =C2=B1  8%  perf-profile.cpu-cy=
cles.selinux_file_permission.security_file_permission.rw_verify_area.vfs_wr=
ite.sys_pwrite64
      1.12 =C2=B1  6%     -27.7%       0.81 =C2=B1  8%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_write.sys_pwrite64.system_call_fastpath.__libc_pwri=
te64
      3385 =C2=B1 10%      +8.9%       3687 =C2=B1  8%  sched_debug.cpu#39.=
curr->pid
      4.01 =C2=B1  0%     +27.4%       5.11 =C2=B1  1%  perf-profile.cpu-cy=
cles.file_update_time.__generic_file_write_iter.generic_file_write_iter.new=
_sync_write.vfs_write
      1.05 =C2=B1  2%     -23.8%       0.80 =C2=B1  5%  perf-profile.cpu-cy=
cles.iov_iter_fault_in_readable.__generic_file_write_iter.generic_file_writ=
e_iter.new_sync_write.vfs_write
      0.83 =C2=B1  3%     +24.7%       1.03 =C2=B1  1%  perf-profile.cpu-cy=
cles.current_fs_time.file_update_time.__generic_file_write_iter.generic_fil=
e_write_iter.new_sync_write
      0.88 =C2=B1  2%     +15.2%       1.02 =C2=B1  2%  perf-profile.cpu-cy=
cles.__sb_end_write.vfs_write.sys_pwrite64.system_call_fastpath.__libc_pwri=
te64
      0.99 =C2=B1  1%     +14.5%       1.14 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call.__libc_pwrite
      2.60 =C2=B1  2%     +11.7%       2.91 =C2=B1  0%  perf-profile.cpu-cy=
cles.__srcu_read_lock.fsnotify.vfs_write.sys_pwrite64.system_call_fastpath
      3.56 =C2=B1  6%     +12.4%       4.00 =C2=B1  4%  perf-profile.cpu-cy=
cles.unlock_page.shmem_write_end.generic_perform_write.__generic_file_write=
_iter.generic_file_write_iter
       252 =C2=B1  0%      +7.8%        272 =C2=B1  1%  time.user_time

lkp-nex05: Nehalem-EX
Memory: 192G




                             will-it-scale.per_process_ops

   1.4e+06 ++--O--------------O--------------------------------------------=
-+
  1.38e+06 O+         O   O                                                =
 |
           |                      O                                        =
 |
  1.36e+06 ++      O                                                       =
 |
  1.34e+06 ++                                                              =
 |
           |                                                               =
 |
  1.32e+06 ++                         O                                    =
 |
   1.3e+06 ++                                O   O       O                 =
 |
  1.28e+06 ++                             O          O       O      O   O  =
 |
           |                                                     O         =
 O
  1.26e+06 ++                                                              =
 |
  1.24e+06 ++                                                              =
 |
           |                                                               =
 |
  1.22e+06 ++        .*...*...*...*...*...*..*                             =
 |
   1.2e+06 *+--*---*-------------------------------------------------------=
-+


                             will-it-scale.per_thread_ops

  1.32e+06 ++--------------------------------------------------------------=
-+
   1.3e+06 ++  O      O   O                                                =
 |
           O       O          O                                            =
 |
  1.28e+06 ++                     O                                        =
 |
  1.26e+06 ++                                                              =
 |
           |                                                               =
 |
  1.24e+06 ++                                                              =
 |
  1.22e+06 ++                         O          O       O                 =
 |
   1.2e+06 ++                             O  O       O       O   O  O   O  =
 O
           |                                                               =
 |
  1.18e+06 ++                                                              =
 |
  1.16e+06 ++                                                              =
 |
           |                        ..*...                                 =
 |
  1.14e+06 *+..      .*...*...*...*.      *..*                             =
 |
  1.12e+06 ++--*---*-------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

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


--===============0884726900151503367==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3
YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpj
b21taXQ6IDExYzg0Mjg3NmU1ZjFlZTkwYjBjNDdhMjk5YmJmNGE1MjFkNmZiYWYKbW9kZWw6IE5l
aGFsZW0tRVgKbWVtb3J5OiAxOTJHCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKd2lsbC1pdC1z
Y2FsZToKICB0ZXN0OgogIC0gcHdyaXRlMQp0ZXN0Ym94OiBsa3AtbmV4MDUKdGJveF9ncm91cDog
bGtwLW5leDA1Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNC0xMi0yNSAy
MDowOToxOC45OTU5MjQxNjkgKzA4OjAwCmhlYWRfY29tbWl0OiAxMWM4NDI4NzZlNWYxZWU5MGIw
YzQ3YTI5OWJiZjRhNTIxZDZmYmFmCmJhc2VfY29tbWl0OiA5N2JmNmFmMWY5MjgyMTZmZDZjNWE2
NmU4YTU3YmZhOTVhNjU5NjcyCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTQx
MjI1MjEKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC8xMWM4NDI4NzZlNWYxZWU5MGIwYzQ3
YTI5OWJiZjRhNTIxZDZmYmFmL3ZtbGludXotMy4xOS4wLXJjMS1nMTFjODQyOCIKdXNlcjogbGtw
CnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LmNnegpyZXN1bHRfcm9vdDogIi9y
ZXN1bHQvbGtwLW5leDA1L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtcHdyaXRlMS9kZWJpYW4t
eDg2XzY0LmNnei94ODZfNjQtcmhlbC8xMWM4NDI4NzZlNWYxZWU5MGIwYzQ3YTI5OWJiZjRhNTIx
ZDZmYmFmLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLW5leDA1L2N5Y2xpY193aWxs
LWl0LXNjYWxlLXBlcmZvcm1hbmNlLXB3cml0ZTEteDg2XzY0LXJoZWwtSEVBRC0xMWM4NDI4NzZl
NWYxZWU5MGIwYzQ3YTI5OWJiZjRhNTIxZDZmYmFmLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0
LTEyLTI2IDEwOjUyOjAwLjYxMzAxNDA0MSArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2Fk
YXZnOiA0OC4yMSAyMS44NiA4LjUzIDEvNTIzIDEyMDc2CnN0YXJ0X3RpbWU6ICcxNDE5NTYyMzk5
JwplbmRfdGltZTogJzE0MTk1NjI3MTMnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTQxMjI2
LTA5MDkxMiIK

--===============0884726900151503367==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vcnVu
dGVzdC5weSBwd3JpdGUxIDIwIDEgMTAgMjAgMzAgNDggNjQK

--===============0884726900151503367==--

