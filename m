Content-Type: multipart/mixed; boundary="===============5480959996091703987=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [f2fs] b9d777b85f: No primary result change, +18023.3% latency_stats.sum.call_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
Date: Thu, 14 Jan 2016 10:53:17 +0800
Message-ID: <87a8o8x46a.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5480959996091703987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs dev-test
commit b9d777b85ff1ff79a1173190317b25bebc404ab4 ("f2fs: check inline_data f=
lag at converting time")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/filesize/fs/iterations/kconfig/nr_directories/nr_files_per_di=
rectory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/1HDD/16MB/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-2015-0=
2-07.cgz/NoSync/nhm4/60G/fsmark

commit: =

  74fd8d9927ef08db30a85f131a124152aeba66c7
  b9d777b85ff1ff79a1173190317b25bebc404ab4

74fd8d9927ef08db b9d777b85ff1ff79a117319031 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10.00 =C2=B1  0%     -10.0%       9.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     10.00 =C2=B1  0%     -10.0%       9.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      2.35 =C2=B1  0%      -3.7%       2.26 =C2=B1  0%  turbostat.%Busy
     67.30 =C2=B1  0%      -4.5%      64.30 =C2=B1  0%  turbostat.Avg_MHz
      2116 =C2=B1  1%     -98.7%      27.20 =C2=B1110%  proc-vmstat.kswapd_=
inodesteal
    191431 =C2=B1  0%     +18.2%     226316 =C2=B1  0%  proc-vmstat.slabs_s=
canned
     56566 =C2=B1  0%     +21.3%      68612 =C2=B1  0%  proc-vmstat.working=
set_nodereclaim
   1176917 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_convert_inline_inode.[f2fs].f2fs_write_begi=
n.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write=
_iter.f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write.SyS_write.entry_SYS=
CALL_64_fastpath
     62312 =C2=B1 55%   +1577.8%    1045503 =C2=B1 11%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     11969 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].g=
eneric_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs=
_file_write_iter.[f2fs].__vfs_write.vfs_write
   1773702 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_convert_inline_inode.[f2fs].f2fs_write_begi=
n.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write=
_iter.f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write.SyS_write.entry_SYS=
CALL_64_fastpath
 3.041e+08 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_convert_inline_inode.[f2fs].f2fs_write_begi=
n.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write=
_iter.f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write.SyS_write.entry_SYS=
CALL_64_fastpath
    163413 =C2=B1112%    +165.9%     434477 =C2=B1147%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2=
fs_get_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic=
_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_=
write
    788095 =C2=B1164%     -60.4%     312194 =C2=B1122%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].reserve_ne=
w_block.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_write_b=
egin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_wr=
ite_iter
   1743538 =C2=B1 56%  +18023.3%   3.16e+08 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
   1677147 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].ge=
neric_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs_=
file_write_iter.[f2fs].__vfs_write.vfs_write


nhm4: Nehalem
Memory: 4G

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

--===============5480959996091703987==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6CiAg
b29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGI5ZDc3N2I4NWZmMWZmNzlhMTE3MzE5
MDMxN2IyNWJlYmM0MDRhYjQKbW9kZWw6IE5laGFsZW0KbnJfY3B1OiA4Cm1lbW9yeTogNEcKaGRk
X3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwMDNGQllaLTAxMEZCMF9X
RC1XQ0FXMzY4MTIwNDEtcGFydDEiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9h
dGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MiIKcm9vdGZzX3Bh
cnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdD
QVczNjgxMjA0MS1wYXJ0MyIKbmV0Y29uc29sZV9wb3J0OiA2NjQ5CmNhdGVnb3J5OiBiZW5jaG1h
cmsKaXRlcmF0aW9uczogMXgKbnJfdGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IGYyZnMKZnMy
OiAKZnNtYXJrOgogIGZpbGVzaXplOiAxNk1CCiAgdGVzdF9zaXplOiA2MEcKICBzeW5jX21ldGhv
ZDogTm9TeW5jCiAgbnJfZGlyZWN0b3JpZXM6IDE2ZAogIG5yX2ZpbGVzX3Blcl9kaXJlY3Rvcnk6
IDI1NmZwZApxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IG5obTQKdGJveF9ncm91cDogbmhtNAprY29u
ZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDEtMTMgMTM6NDA6NTMuOTk5NTI0
MzMyICswODowMAppZDogZmFkMjFhMDRkM2ExZmVhMmEyZWVjMGQ3ODY1YjdkOGJmNDc2YmIwNAp1
c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IDQwMjJmNjg0MmVlOTc1MjQ1
NTUyM2NmMzZhZDkzZjhmYzNiNWZiOTAKYmFzZV9jb21taXQ6IGFmZDJmZjliN2UxYjM2NzE3MmYx
OGJhN2Y2OTNkZmI2MmJkY2IyZGMKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAx
NjAxMTEyMgpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6
ICIvcmVzdWx0L2ZzbWFyay8xeC0zMnQtMUhERC1mMmZzLTE2TUItNjBHLU5vU3luYy0xNmQtMjU2
ZnBkL25obTQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45
L2I5ZDc3N2I4NWZmMWZmNzlhMTE3MzE5MDMxN2IyNWJlYmM0MDRhYjQvMCIKam9iX2ZpbGU6ICIv
bGtwL3NjaGVkdWxlZC9uaG00L2Jpc2VjdF9mc21hcmstMXgtMzJ0LTFIREQtZjJmcy0xNk1CLTYw
Ry1Ob1N5bmMtMTZkLTI1NmZwZC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1y
aGVsLWI5ZDc3N2I4NWZmMWZmNzlhMTE3MzE5MDMxN2IyNWJlYmM0MDRhYjQtMjAxNjAxMTMtNDA4
Mi16and2MHYtMC55YW1sIgptYXhfdXB0aW1lOiAxNjA2LjA2CmluaXRyZDogIi9vc2ltYWdlL2Rl
Ymlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSBy
b290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL25obTQvYmlzZWN0
X2ZzbWFyay0xeC0zMnQtMUhERC1mMmZzLTE2TUItNjBHLU5vU3luYy0xNmQtMjU2ZnBkLWRlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtYjlkNzc3Yjg1ZmYxZmY3OWExMTcz
MTkwMzE3YjI1YmViYzQwNGFiNC0yMDE2MDExMy00MDgyLXpqd3Ywdi0wLnlhbWwKLSBBUkNIPXg4
Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91
cmx5LTIwMTYwMTExMjIKLSBjb21taXQ9YjlkNzc3Yjg1ZmYxZmY3OWExMTczMTkwMzE3YjI1YmVi
YzQwNGFiNAotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2I5ZDc3
N2I4NWZmMWZmNzlhMTE3MzE5MDMxN2IyNWJlYmM0MDRhYjQvdm1saW51ei00LjQuMC1yYzMtMDAy
ODItZ2I5ZDc3N2IKLSBtYXhfdXB0aW1lPTE2MDYKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2ZzbWFy
ay8xeC0zMnQtMUhERC1mMmZzLTE2TUItNjBHLU5vU3luYy0xNmQtMjU2ZnBkL25obTQvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2I5ZDc3N2I4NWZmMWZm
NzlhMTE3MzE5MDMxN2IyNWJlYmM0MDRhYjQvMAotIExLUF9TRVJWRVI9aW5uCi0gfC0KICBsaWJh
dGEuZm9yY2U9MS41R2JwcwoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2df
bGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0
ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0x
IG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1k
aXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBy
dwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAi
L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2I5ZDc3N2I4NWZmMWZmNzlhMTE3MzE5MDMx
N2IyNWJlYmM0MDRhYjQvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJi
b3N0YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mcy5j
Z3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzMi5jZ3osL2xr
cC9iZW5jaG1hcmtzL2ZzbWFyay5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51
eC94ODZfNjQtcmhlbC9nY2MtNC45L2I5ZDc3N2I4NWZmMWZmNzlhMTE3MzE5MDMxN2IyNWJlYmM0
MDRhYjQvbGludXgtaGVhZGVycy5jZ3oiCnJlcGVhdF90bzogNQprZXJuZWw6ICIvcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvYjlkNzc3Yjg1ZmYxZmY3OWExMTczMTkwMzE3YjI1YmViYzQw
NGFiNC92bWxpbnV6LTQuNC4wLXJjMy0wMDI4Mi1nYjlkNzc3YiIKZGVxdWV1ZV90aW1lOiAyMDE2
LTAxLTEzIDE0OjI4OjQ1Ljk3MDM5Mjk4NCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2Fk
YXZnOiAyOS4zOCAyNS42NCAxMy4wOSAxLzE1NyA3MDM0CnN0YXJ0X3RpbWU6ICcxNDUyNjY2NTU0
JwplbmRfdGltZTogJzE0NTI2NjcwMzInCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMTEz
LTEyNTAxMSIK

--===============5480959996091703987==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0xMyAxNDoyOToxMSBta2ZzIC10IGYyZnMgL2Rldi9zZGIxCjIwMTYtMDEtMTMgMTQ6
Mjk6MTIgbW91bnQgLXQgZjJmcyAvZGV2L3NkYjEgL2ZzL3NkYjEKMjAxNi0wMS0xMyAxNDoyOTox
NCAuL2ZzX21hcmsgLWQgL2ZzL3NkYjEvMSAtZCAvZnMvc2RiMS8yIC1kIC9mcy9zZGIxLzMgLWQg
L2ZzL3NkYjEvNCAtZCAvZnMvc2RiMS81IC1kIC9mcy9zZGIxLzYgLWQgL2ZzL3NkYjEvNyAtZCAv
ZnMvc2RiMS84IC1kIC9mcy9zZGIxLzkgLWQgL2ZzL3NkYjEvMTAgLWQgL2ZzL3NkYjEvMTEgLWQg
L2ZzL3NkYjEvMTIgLWQgL2ZzL3NkYjEvMTMgLWQgL2ZzL3NkYjEvMTQgLWQgL2ZzL3NkYjEvMTUg
LWQgL2ZzL3NkYjEvMTYgLWQgL2ZzL3NkYjEvMTcgLWQgL2ZzL3NkYjEvMTggLWQgL2ZzL3NkYjEv
MTkgLWQgL2ZzL3NkYjEvMjAgLWQgL2ZzL3NkYjEvMjEgLWQgL2ZzL3NkYjEvMjIgLWQgL2ZzL3Nk
YjEvMjMgLWQgL2ZzL3NkYjEvMjQgLWQgL2ZzL3NkYjEvMjUgLWQgL2ZzL3NkYjEvMjYgLWQgL2Zz
L3NkYjEvMjcgLWQgL2ZzL3NkYjEvMjggLWQgL2ZzL3NkYjEvMjkgLWQgL2ZzL3NkYjEvMzAgLWQg
L2ZzL3NkYjEvMzEgLWQgL2ZzL3NkYjEvMzIgLUQgMTYgLU4gMjU2IC1uIDEyMCAtTCAxIC1TIDAg
LXMgMTY3NzcyMTYK

--===============5480959996091703987==--

