Content-Type: multipart/mixed; boundary="===============7410931657638201068=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Thu, 26 Nov 2015 08:56:12 +0800
Message-ID: <87ziy1a89f.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7410931657638201068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit d0164adc89f6bb374d304ffcc375c6d2652fe67d ("mm, page_alloc: distingui=
sh between being unable to sleep, unwilling to sleep and avoiding waking ks=
wapd")

Note: the testing machine is a virtual machine with only 1G memory.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/filesize/fs/iterations/kconfig/nr_directories/nr_files_per_di=
rectory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/1HDD/16MB/xfs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-2015-02=
-07.cgz/fsyncBeforeClose/vm-vp-1G/60G/fsmark

commit: =

  016c13daa5c9e4827eca703e2f0621c131f2cca3
  d0164adc89f6bb374d304ffcc375c6d2652fe67d

016c13daa5c9e482 d0164adc89f6bb374d304ffcc3 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4          100%           4:4     last_state.fsmark.exit_code.1=
43
           :4           50%           2:4     last_state.is_incomplete_run
           :4          100%           4:4     dmesg.Mem-Info
           :4          100%           4:4     dmesg.page_allocation_failure=
:order:#,mode
           :4          100%           4:4     dmesg.warn_alloc_failed+0x
      6327  23%     -93.5%     409.00  80%  proc-vmstat.allocstall
    173495  58%    -100.0%       0.00  -1%  proc-vmstat.compact_free_scanned
      4394  59%    -100.0%       0.00  -1%  proc-vmstat.compact_isolated
     10055  44%    -100.0%       0.00  -1%  proc-vmstat.compact_migrate_sca=
nned
    443.25  13%     -99.7%       1.50 100%  proc-vmstat.kswapd_high_wmark_h=
it_quickly
     28950  12%     -91.4%       2502  81%  proc-vmstat.kswapd_low_wmark_hi=
t_quickly
  15704144   0%     -91.1%    1402050  73%  proc-vmstat.nr_dirtied
     12851   0%     +26.3%      16235  18%  proc-vmstat.nr_dirty_background=
_threshold
     25704   0%     +26.3%      32471  18%  proc-vmstat.nr_dirty_threshold
      2882   0%   +1130.5%      35463  84%  proc-vmstat.nr_free_pages
  15693749   0%     -91.3%    1365065  75%  proc-vmstat.nr_written
  16289593   0%     -91.0%    1464689  72%  proc-vmstat.numa_hit
  16289593   0%     -91.0%    1464689  72%  proc-vmstat.numa_local
     30453  12%     -91.6%       2552  81%  proc-vmstat.pageoutrun
  16316641   0%     -91.0%    1468330  72%  proc-vmstat.pgalloc_dma32
    642889   5%     -90.5%      61326  56%  proc-vmstat.pgfault
  16218859   0%     -91.6%    1355797  78%  proc-vmstat.pgfree
     69.25  68%    -100.0%       0.00  -1%  proc-vmstat.pgmigrate_fail
      2066  58%    -100.0%       0.00  -1%  proc-vmstat.pgmigrate_success
  62849613   0%     -91.2%    5512004  74%  proc-vmstat.pgpgout
    417966  16%     -80.1%      82999  36%  proc-vmstat.pgscan_direct_dma32
  15259915   0%     -91.5%    1303209  76%  proc-vmstat.pgscan_kswapd_dma32
    360298  23%     -93.5%      23325  82%  proc-vmstat.pgsteal_direct_dma32
  15224912   0%     -91.7%    1270706  79%  proc-vmstat.pgsteal_kswapd_dma32
    236736   0%     -96.1%       9216 100%  proc-vmstat.slabs_scanned
    108153   0%     -98.0%       2154 100%  proc-vmstat.workingset_noderecl=
aim

vm-vp-1G: qemu-system-x86_64 -enable-kvm -cpu Nehalem
Memory: 1G

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

--===============7410931657638201068==
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
b29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IAptb2RlbDogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFi
bGUta3ZtIC1jcHUgTmVoYWxlbQpucl92bTogOApucl9jcHU6IDIKbWVtb3J5OiAxRwpyb290ZnM6
IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L3ZkYSAv
ZGV2L3ZkYiAvZGV2L3ZkYyAvZGV2L3ZkZCAvZGV2L3ZkZSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rl
di92ZGYiCnNzaF9iYXNlX3BvcnQ6IDIzMTAwCmNhdGVnb3J5OiBiZW5jaG1hcmsKaXRlcmF0aW9u
czogMXgKbnJfdGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IHhmcwpmczI6IApmc21hcms6CiAg
ZmlsZXNpemU6IDE2TUIKICB0ZXN0X3NpemU6IDYwRwogIHN5bmNfbWV0aG9kOiBmc3luY0JlZm9y
ZUNsb3NlCiAgbnJfZGlyZWN0b3JpZXM6IDE2ZAogIG5yX2ZpbGVzX3Blcl9kaXJlY3Rvcnk6IDI1
NmZwZAplbnF1ZXVlX3RpbWU6IDIwMTUtMTEtMjUgMjE6MTI6MzMuNjg0ODA1Mjc4ICswODowMApi
cmFuY2g6IGxpbnVzL21hc3Rlcgpjb21taXQ6IGQwMTY0YWRjODlmNmJiMzc0ZDMwNGZmY2MzNzVj
NmQyNjUyZmU2N2QKcXVldWU6IGJpc2VjdApjb21waWxlcjogZ2NjLTQuOQp0ZXN0Ym94OiB2bS12
cC0xRy04CnRib3hfZ3JvdXA6IHZtLXZwLTFHCmtjb25maWc6IHg4Nl82NC1yaGVsCmlkOiBlZDI2
MWE0N2M2YjA1YTUxM2U2NjVkYzQzYjJlNzc1Njc5NmY5MmI5CnVzZXI6IGxrcApyZXN1bHRfcm9v
dDogIi9yZXN1bHQvZnNtYXJrLzF4LTMydC0xSERELXhmcy0xNk1CLTYwRy1mc3luY0JlZm9yZUNs
b3NlLTE2ZC0yNTZmcGQvdm0tdnAtMUcvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZf
NjQtcmhlbC9nY2MtNC45L2QwMTY0YWRjODlmNmJiMzc0ZDMwNGZmY2MzNzVjNmQyNjUyZmU2N2Qv
MCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC92bS12cC0xRy04L2Jpc2VjdF9mc21hcmstMXgt
MzJ0LTFIREQteGZzLTE2TUItNjBHLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC1kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLWQwMTY0YWRjODlmNmJiMzc0ZDMwNGZm
Y2MzNzVjNmQyNjUyZmU2N2QtMjAxNTExMjUtNzMyNi03N2l2ejEtMC55YW1sIgptYXhfdXB0aW1l
OiA2NzQuMDcKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBq
b2I9L2xrcC9zY2hlZHVsZWQvdm0tdnAtMUctOC9iaXNlY3RfZnNtYXJrLTF4LTMydC0xSERELXhm
cy0xNk1CLTYwRy1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQtZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei14ODZfNjQtcmhlbC1kMDE2NGFkYzg5ZjZiYjM3NGQzMDRmZmNjMzc1YzZkMjY1
MmZlNjdkLTIwMTUxMTI1LTczMjYtNzdpdnoxLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZp
Zz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51cy9tYXN0ZXIKLSBjb21taXQ9ZDAxNjRhZGM4OWY2
YmIzNzRkMzA0ZmZjYzM3NWM2ZDI2NTJmZTY3ZAotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZf
NjQtcmhlbC9nY2MtNC45L2QwMTY0YWRjODlmNmJiMzc0ZDMwNGZmY2MzNzVjNmQyNjUyZmU2N2Qv
dm1saW51ei00LjMuMC0wODA1Ni1nZDAxNjRhZAotIG1heF91cHRpbWU9Njc0Ci0gUkVTVUxUX1JP
T1Q9L3Jlc3VsdC9mc21hcmsvMXgtMzJ0LTFIREQteGZzLTE2TUItNjBHLWZzeW5jQmVmb3JlQ2xv
c2UtMTZkLTI1NmZwZC92bS12cC0xRy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82
NC1yaGVsL2djYy00LjkvZDAxNjRhZGM4OWY2YmIzNzRkMzA0ZmZjYzM3NWM2ZDI2NTJmZTY3ZC8w
Ci0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0
ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVk
IHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3Vw
X3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJv
bXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9y
bWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19p
bml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZDAxNjRhZGM4OWY2YmIzNzRk
MzA0ZmZjYzM3NWM2ZDI2NTJmZTY3ZC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1h
cmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMy
LmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJrLmNneiIKa2VybmVsOiAiL3BrZy9saW51eC94ODZf
NjQtcmhlbC9nY2MtNC45L2QwMTY0YWRjODlmNmJiMzc0ZDMwNGZmY2MzNzVjNmQyNjUyZmU2N2Qv
dm1saW51ei00LjMuMC0wODA1Ni1nZDAxNjRhZCIKZGVxdWV1ZV90aW1lOiAyMDE1LTExLTI1IDIx
OjIzOjA1LjE5MzI5MDIwMCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA2LjI3
IDEuNDAgMC40NiAyLzE0NSA5MTUKc3RhcnRfdGltZTogJzE0NDg0NTc4NTUnCmVuZF90aW1lOiAn
MTQ0ODQ1Nzg2MycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTExMjUtMTg0MzM0Igo=

--===============7410931657638201068==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNS0xMS0yNSAyMToyNDoxMiBta2ZzIC10IHhmcyAvZGV2L3ZkYQoyMDE1LTExLTI1IDIxOjI0
OjE0IG1vdW50IC10IHhmcyAtbyBub2JhcnJpZXIsaW5vZGU2NCAvZGV2L3ZkYSAvZnMvdmRhCjIw
MTUtMTEtMjUgMjE6MjQ6MTUgLi9mc19tYXJrIC1kIC9mcy92ZGEvMSAtZCAvZnMvdmRhLzIgLWQg
L2ZzL3ZkYS8zIC1kIC9mcy92ZGEvNCAtZCAvZnMvdmRhLzUgLWQgL2ZzL3ZkYS82IC1kIC9mcy92
ZGEvNyAtZCAvZnMvdmRhLzggLWQgL2ZzL3ZkYS85IC1kIC9mcy92ZGEvMTAgLWQgL2ZzL3ZkYS8x
MSAtZCAvZnMvdmRhLzEyIC1kIC9mcy92ZGEvMTMgLWQgL2ZzL3ZkYS8xNCAtZCAvZnMvdmRhLzE1
IC1kIC9mcy92ZGEvMTYgLWQgL2ZzL3ZkYS8xNyAtZCAvZnMvdmRhLzE4IC1kIC9mcy92ZGEvMTkg
LWQgL2ZzL3ZkYS8yMCAtZCAvZnMvdmRhLzIxIC1kIC9mcy92ZGEvMjIgLWQgL2ZzL3ZkYS8yMyAt
ZCAvZnMvdmRhLzI0IC1kIC9mcy92ZGEvMjUgLWQgL2ZzL3ZkYS8yNiAtZCAvZnMvdmRhLzI3IC1k
IC9mcy92ZGEvMjggLWQgL2ZzL3ZkYS8yOSAtZCAvZnMvdmRhLzMwIC1kIC9mcy92ZGEvMzEgLWQg
L2ZzL3ZkYS8zMiAtRCAxNiAtTiAyNTYgLW4gMTIwIC1MIDEgLVMgMSAtcyAxNjc3NzIxNgo=

--===============7410931657638201068==--

