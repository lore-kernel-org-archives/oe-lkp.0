Content-Type: multipart/mixed; boundary="===============6956717185003105089=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [fs] e691fc4583e: -59.7% dbench.throughput-MB/sec
Date: Thu, 07 Aug 2014 18:55:38 +0800
Message-ID: <20140807105538.GC17655@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============6956717185003105089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Neil,

We noticed the below dbench regression on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit e691fc4583e512f936bd04efb870815fe1ed750d ("fs: allow ->d_manage() to=
 declare -EISDIR in rcu_walk mode.")

test case: ivb44/dbench/100%

53bcc0567b8c520  e691fc4583e512f936bd04efb =

---------------  ------------------------- =

     25957 =C2=B1 0%     -59.7%      10460 =C2=B1 4%  TOTAL dbench.throughp=
ut-MB/sec
      0.00           +Inf%      24.33 =C2=B131%  TOTAL perf-profile.cpu-cyc=
les._raw_spin_lock.lockref_get_not_dead.unlazy_walk.lookup_fast.link_path_w=
alk
     15.14 =C2=B1 0%     -82.1%       2.71 =C2=B125%  TOTAL perf-profile.cp=
u-cycles.copy_user_enhanced_fast_string.copy_page_to_iter.generic_file_read=
_iter.new_sync_read.vfs_read
      0.00           +Inf%       4.33 =C2=B135%  TOTAL perf-profile.cpu-cyc=
les.lockref_put_or_lock.dput.link_path_walk.path_openat.do_filp_open
      0.00           +Inf%       4.35 =C2=B136%  TOTAL perf-profile.cpu-cyc=
les.lockref_get_not_dead.unlazy_walk.lookup_fast.link_path_walk.path_openat
      0.00           +Inf%       5.06 =C2=B136%  TOTAL perf-profile.cpu-cyc=
les.lockref_put_or_lock.dput.link_path_walk.path_lookupat.filename_lookup
      1.11 =C2=B1 1%    -100.0%       0.00 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock.dcache_readdir.iterate_dir.sys_getdents.system_call=
_fastpath
      0.00           +Inf%       5.10 =C2=B136%  TOTAL perf-profile.cpu-cyc=
les.lockref_get_not_dead.unlazy_walk.lookup_fast.link_path_walk.path_lookup=
at
      0.00           +Inf%      11.19 =C2=B130%  TOTAL perf-profile.cpu-cyc=
les._raw_spin_lock.lockref_put_or_lock.dput.link_path_walk.path_openat
      0.00           +Inf%      12.85 =C2=B131%  TOTAL perf-profile.cpu-cyc=
les._raw_spin_lock.lockref_put_or_lock.dput.link_path_walk.path_lookupat
      2.00 =C2=B1 0%     -79.5%       0.41 =C2=B126%  TOTAL perf-profile.cp=
u-cycles.find_get_entry.pagecache_get_page.generic_file_read_iter.new_sync_=
read.vfs_read
      2.01 =C2=B1 3%     -74.0%       0.52 =C2=B117%  TOTAL perf-profile.cp=
u-cycles.rcu_nocb_kthread.kthread.ret_from_fork
      8.70 =C2=B1 1%     -77.5%       1.96 =C2=B124%  TOTAL perf-profile.cp=
u-cycles.copy_user_enhanced_fast_string.iov_iter_copy_from_user_atomic.gene=
ric_perform_write.__generic_file_write_iter.generic_file_write_iter
      1.20 =C2=B1 0%     -75.9%       0.29 =C2=B125%  TOTAL perf-profile.cp=
u-cycles.get_empty_filp.path_openat.do_filp_open.do_sys_open.sys_openat
      1.11 =C2=B1 3%     -72.9%       0.30 =C2=B122%  TOTAL perf-profile.cp=
u-cycles.selinux_inode_permission.security_inode_permission.__inode_permiss=
ion.inode_permission.link_path_walk
      2.03 =C2=B1 1%     -69.2%       0.63 =C2=B121%  TOTAL perf-profile.cp=
u-cycles.__vdso_gettimeofday
      1.52 =C2=B1 4%     -67.6%       0.49 =C2=B113%  TOTAL perf-profile.cp=
u-cycles.avc_has_perm_noaudit.selinux_inode_permission.security_inode_permi=
ssion.__inode_permission.inode_permission
  47938419 =C2=B1 0%     -60.6%   18877399 =C2=B1 3%  TOTAL proc-vmstat.pga=
lloc_dma32
  9.25e+08 =C2=B1 0%     -59.7%  3.728e+08 =C2=B1 3%  TOTAL proc-vmstat.pga=
lloc_normal
  22194267 =C2=B1 0%     -59.3%    9023662 =C2=B1 3%  TOTAL proc-vmstat.pga=
ctivate
  4.53e+08 =C2=B1 0%     -58.0%  1.904e+08 =C2=B1 2%  TOTAL numa-numastat.n=
ode1.local_node
  4.53e+08 =C2=B1 0%     -58.0%  1.904e+08 =C2=B1 2%  TOTAL numa-numastat.n=
ode1.numa_hit
   2987057 =C2=B1 0%     -56.3%    1306633 =C2=B1 2%  TOTAL softirqs.RCU
    964655 =C2=B114%     -47.3%     508785 =C2=B123%  TOTAL cpuidle.C3-IVT.=
time
      0.32 =C2=B1 5%     -37.3%       0.20 =C2=B112%  TOTAL turbostat.%c1
     69254 =C2=B1 6%     -32.7%      46602 =C2=B1 9%  TOTAL cpuidle.C6-IVT.=
usage
      2724 =C2=B115%     -32.3%       1843 =C2=B1 6%  TOTAL cpuidle.C3-IVT.=
usage
   6665511 =C2=B111%     -31.9%    4540015 =C2=B1 8%  TOTAL cpuidle.C1E-IVT=
.time
  26138868 =C2=B111%     -27.6%   18932437 =C2=B117%  TOTAL cpuidle.C1-IVT.=
time
      6013 =C2=B1 9%     -28.3%       4311 =C2=B118%  TOTAL proc-vmstat.pgm=
igrate_success
      6013 =C2=B1 9%     -28.3%       4311 =C2=B118%  TOTAL proc-vmstat.num=
a_pages_migrated
     48751 =C2=B1 4%     -18.3%      39837 =C2=B1 6%  TOTAL proc-vmstat.num=
a_hint_faults
      1849 =C2=B1 2%     -14.9%       1573 =C2=B1 3%  TOTAL numa-vmstat.nod=
e0.nr_alloc_batch
     48570 =C2=B1 4%     -16.9%      40343 =C2=B1 6%  TOTAL proc-vmstat.num=
a_pte_updates
     17191 =C2=B1 6%     -15.3%      14566 =C2=B114%  TOTAL cpuidle.C1E-IVT=
.usage
     85893 =C2=B1 3%     +12.4%      96578 =C2=B1 4%  TOTAL meminfo.Committ=
ed_AS
     29718 =C2=B1 4%      -8.0%      27337 =C2=B1 2%  TOTAL proc-vmstat.num=
a_hint_faults_local
     13612 =C2=B1 3%     -10.4%      12195 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-192.num_objs
     13611 =C2=B1 3%     -10.4%      12195 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-192.active_objs
      9469 =C2=B1 0%     -62.3%       3574 =C2=B1 3%  TOTAL time.user_time
   1365218 =C2=B1 1%     -44.4%     759678 =C2=B1 1%  TOTAL time.involuntar=
y_context_switches
      4818 =C2=B1 1%     -38.7%       2954 =C2=B1 1%  TOTAL vmstat.system.cs
           =C2=B1 0%     -37.0%            =C2=B1 1%  TOTAL turbostat.RAM_W
     23661 =C2=B1 0%     +28.8%      30466 =C2=B1 0%  TOTAL time.system_time
    158133 =C2=B1 8%     -16.6%     131932 =C2=B1 9%  TOTAL time.voluntary_=
context_switches
    196790 =C2=B1 7%     -15.8%     165728 =C2=B1 8%  TOTAL time.minor_page=
_faults
           =C2=B1 0%     -10.5%            =C2=B1 0%  TOTAL turbostat.Cor_W
           =C2=B1 0%      -9.8%            =C2=B1 0%  TOTAL turbostat.Pkg_W
      4599 =C2=B1 0%      +2.7%       4724 =C2=B1 0%  TOTAL time.percent_of=
_cpu_this_job_got
     54951 =C2=B1 0%      -1.7%      54021 =C2=B1 0%  TOTAL vmstat.system.in

Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============6956717185003105089==
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
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgpkYmVuY2ggNDggLWMgL3Vzci9zaGFyZS9kYmVuY2gvY2xpZW50LnR4dAo=

--===============6956717185003105089==--

