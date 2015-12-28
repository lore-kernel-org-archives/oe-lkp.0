Content-Type: multipart/mixed; boundary="===============6653040904130866909=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [selinux] 5d226df4ed: -10.1% unixbench.score
Date: Mon, 28 Dec 2015 09:59:18 +0800
Message-ID: <87twn32v0p.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6653040904130866909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.infradead.org/users/pcmoore/selinux stable-4.5
commit 5d226df4edfa0eb1e689e7ac2741cf261ff7cbf1 ("selinux: Revalidate inval=
id inode security labels")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/ivb42/pipe=
/unixbench

commit: =

  6f3be9f562e3027c77bc4482ccf2cea8600a7f74
  5d226df4edfa0eb1e689e7ac2741cf261ff7cbf1

6f3be9f562e3027c 5d226df4edfa0eb1e689e7ac27 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2086 =C2=B1  0%     -10.1%       1876 =C2=B1  0%  unixbench.score
      7.79 =C2=B1  0%     -10.2%       7.00 =C2=B1  1%  time.user_time
     33404 =C2=B1117%   +9470.5%    3196941 =C2=B1173%  latency_stats.max.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
     18934 =C2=B1 34%     -82.8%       3252 =C2=B1 73%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
     57519 =C2=B1100%   +5478.5%    3208706 =C2=B1172%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
     13414 =C2=B1 33%     +49.4%      20036 =C2=B1  8%  numa-meminfo.node0.=
Active(anon)
     13399 =C2=B1 33%     +49.0%      19963 =C2=B1  7%  numa-meminfo.node0.=
AnonPages
     11624 =C2=B1 38%     -52.7%       5495 =C2=B1 18%  numa-meminfo.node1.=
Active(anon)
     11518 =C2=B1 38%     -52.6%       5457 =C2=B1 17%  numa-meminfo.node1.=
AnonPages
      1641 =C2=B1 50%     -53.8%     757.75 =C2=B1 15%  numa-meminfo.node1.=
PageTables
      3353 =C2=B1 33%     +49.2%       5004 =C2=B1  8%  numa-vmstat.node0.n=
r_active_anon
      3349 =C2=B1 33%     +49.0%       4991 =C2=B1  7%  numa-vmstat.node0.n=
r_anon_pages
      2904 =C2=B1 38%     -52.7%       1374 =C2=B1 18%  numa-vmstat.node1.n=
r_active_anon
      2878 =C2=B1 38%     -52.6%       1365 =C2=B1 17%  numa-vmstat.node1.n=
r_anon_pages
    410.00 =C2=B1 50%     -53.9%     189.00 =C2=B1 15%  numa-vmstat.node1.n=
r_page_table_pages
     14760 =C2=B1  2%    +207.2%      45336 =C2=B1 65%  numa-vmstat.node1.n=
uma_other


ivb42: Ivytown Ivy Bridge-EP
Memory: 64G



                                  unixbench.score

  2150 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  2100 ++              .*..*.*..                                           =
 |
       |          .*..*         *.*..*.                   .*.*..*.*        =
 |
       *.*..*.*..*                     *..*.*.*..*.*..*.*.                 =
 |
  2050 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1950 ++                                                                  =
 |
       |                                                                   =
 |
       O O  O O  O      O    O  O O  O O  O O O                            =
 |
  1900 ++          O  O    O                     O O  O O  O O  O O        =
 |
       |                                                             O O  O=
 O
  1850 ++------------------------------------------------------------------=
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

--===============6653040904130866909==
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
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogNWQyMjZkZjRl
ZGZhMGViMWU2ODllN2FjMjc0MWNmMjYxZmY3Y2JmMQptb2RlbDogSXZ5dG93biBJdnkgQnJpZGdl
LUVQCm5yX2NwdTogNDgKbWVtb3J5OiA2NEcKc3dhcF9wYXJ0aXRpb25zOiBMQUJFTD1TV0FQCnJv
b3Rmc19wYXJ0aXRpb246IExBQkVMPUxLUC1ST09URlMKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90
YXNrOiAxCnVuaXhiZW5jaDoKICB0ZXN0OiBwaXBlCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogaXZi
NDIKdGJveF9ncm91cDogaXZiNDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAy
MDE1LTEyLTI1IDEzOjI5OjQ2LjA3NDA5OTAwMyArMDg6MDAKaWQ6IGU3YWYwNjk5NTk2MWE5ZWFm
NzhmMTIwZjQ2YjdhNWQyMTBmOWI3ZDQKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45CmhlYWRf
Y29tbWl0OiBjMWM4MmQ4Y2E3NmUyYjMxZjU0ODdhNTk0MjZhY2E0N2M2OWFjMGMzCmJhc2VfY29t
bWl0OiA0ZWY3Njc1MzQ0ZDY4N2EwZWY1YjBkN2MwY2VlMTJkYTAwNTg3MGMwCmJyYW5jaDogbGlu
dXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUxMjI1MDIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC91bml4YmVuY2gvcGVyZm9ybWFuY2Ut
MS1waXBlL2l2YjQyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2Nj
LTQuOS81ZDIyNmRmNGVkZmEwZWIxZTY4OWU3YWMyNzQxY2YyNjFmZjdjYmYxLzAiCmpvYl9maWxl
OiAiL2xrcC9zY2hlZHVsZWQvaXZiNDIvYmlzZWN0X3VuaXhiZW5jaC1wZXJmb3JtYW5jZS0xLXBp
cGUtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC01ZDIyNmRmNGVkZmEw
ZWIxZTY4OWU3YWMyNzQxY2YyNjFmZjdjYmYxLTIwMTUxMjI1LTExOTQtMWIweGtuNS0xLnlhbWwi
Cm1heF91cHRpbWU6IDkyNC44MTk5OTk5OTk5OTk5CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9k
ZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2l2YjQyL2Jpc2VjdF91bml4
YmVuY2gtcGVyZm9ybWFuY2UtMS1waXBlLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2
XzY0LXJoZWwtNWQyMjZkZjRlZGZhMGViMWU2ODllN2FjMjc0MWNmMjYxZmY3Y2JmMS0yMDE1MTIy
NS0xMTk0LTFiMHhrbjUtMS55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVs
Ci0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MTIyNTAyCi0gY29tbWl0PTVk
MjI2ZGY0ZWRmYTBlYjFlNjg5ZTdhYzI3NDFjZjI2MWZmN2NiZjEKLSBCT09UX0lNQUdFPS9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS81ZDIyNmRmNGVkZmEwZWIxZTY4OWU3YWMyNzQxY2Yy
NjFmZjdjYmYxL3ZtbGludXotNC40LjAtcmMyLTAwMDA5LWc1ZDIyNmRmCi0gbWF4X3VwdGltZT05
MjQKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3VuaXhiZW5jaC9wZXJmb3JtYW5jZS0xLXBpcGUvaXZi
NDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzVkMjI2
ZGY0ZWRmYTBlYjFlNjg5ZTdhYzI3NDFjZjI2MWZmN2NiZjEvMAotIExLUF9TRVJWRVI9aW5uCi0g
fDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAg
ZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0
YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRv
Zz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25z
b2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJk
OiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45LzVkMjI2ZGY0ZWRmYTBlYjFlNjg5ZTdhYzI3NDFjZjI2MWZmN2Ni
ZjEvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9s
a3AvYmVuY2htYXJrcy91bml4YmVuY2guY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzVkMjI2ZGY0ZWRmYTBlYjFlNjg5ZTdhYzI3NDFjZjI2
MWZmN2NiZjEvdm1saW51ei00LjQuMC1yYzItMDAwMDktZzVkMjI2ZGYiCmRlcXVldWVfdGltZTog
MjAxNS0xMi0yNSAxMzo0MDowNy45MzUwMTI0MTcgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQK
bG9hZGF2ZzogMC42OSAwLjM0IDAuMTMgMS81MjMgNDc1NQpzdGFydF90aW1lOiAnMTQ1MTAyMjA0
OScKZW5kX3RpbWU6ICcxNDUxMDIyMTc5Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MTIy
NS0xMjUzMDgiCg==

--===============6653040904130866909==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUt
MTItMjUgMTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTIt
MjUgMTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjUg
MTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjUgMTM6
NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjUgMTM6NDA6NDggZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0
OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjUgMTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjUgMTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1
LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMjUgMTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEy
LTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjUg
MTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjUgMTM6
NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjUgMTM6NDA6
NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjUgMTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1
LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMjUgMTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEy
LTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yNSAxMzo0MDo0OCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTUtMTItMjUgMTM6NDA6NDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1
IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQw
OjQ4IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTI1IDEzOjQwOjQ4IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE1LTEyLTI1IDEzOjQwOjQ5IC4vUnVuIHBpcGUgLWMgMQo=

--===============6653040904130866909==--

