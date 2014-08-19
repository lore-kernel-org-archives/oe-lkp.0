Content-Type: multipart/mixed; boundary="===============4973382791982122308=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [memcontrol] 05b84301233: +129.9% vm-scalability.throughput, -12.6% turbostat.Pkg_W
Date: Tue, 19 Aug 2014 20:12:30 +0800
Message-ID: <20140819121230.GD18960@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4973382791982122308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

We find interesting multi-thread mmap rand read performance gain and
power reduction on

commit 05b8430123359886ef6a4146fba384e30d771b3f ("mm: memcontrol: use root_=
mem_cgroup res_counter")

test case: brickland3/vm-scalability/300s-mmap-pread-rand-mt

The test box "brickland3" is Brickland Ivy Bridge-EX with 512G memory,
120 logical CPUs.

692e7c45d95ad10  05b8430123359886ef6a4146f =

---------------  ------------------------- =

      0.03 =C2=B1100%  +12170.5%       3.13 =C2=B150%  TOTAL vm-scalability=
.stddev
   1282439 =C2=B110%    +129.9%    2947754 =C2=B122%  TOTAL vm-scalability.=
throughput
     24056 =C2=B117%   +1619.6%     413661 =C2=B140%  TOTAL numa-vmstat.nod=
e0.nr_active_file
    374762 =C2=B113%    +403.4%    1886450 =C2=B133%  TOTAL numa-vmstat.nod=
e3.nr_mapped
     26019 =C2=B120%   +1798.6%     494013 =C2=B140%  TOTAL numa-vmstat.nod=
e3.nr_active_file
    352052 =C2=B113%    +352.0%    1591441 =C2=B133%  TOTAL numa-vmstat.nod=
e0.nr_mapped
   1499575 =C2=B113%    +403.4%    7549434 =C2=B133%  TOTAL numa-meminfo.no=
de3.Mapped
      0.01 =C2=B1 0%  +6.2e+05%      62.16 =C2=B149%  TOTAL perf-profile.cp=
u-cycles.do_unit
   1488742 =C2=B120%    +377.0%    7101311 =C2=B133%  TOTAL numa-meminfo.no=
de2.Mapped
    102414 =C2=B120%   +1723.4%    1867451 =C2=B140%  TOTAL numa-meminfo.no=
de2.Active(file)
      2.37 =C2=B127%    +636.7%      17.46 =C2=B135%  TOTAL turbostat.%c6
    143698 =C2=B116%   +1205.1%    1875367 =C2=B136%  TOTAL numa-meminfo.no=
de1.Active(file)
    151914 =C2=B116%   +1273.9%    2087141 =C2=B130%  TOTAL numa-meminfo.no=
de1.Active
    103946 =C2=B120%   +1803.3%    1978406 =C2=B140%  TOTAL numa-meminfo.no=
de3.Active(file)
   1408602 =C2=B113%    +352.1%    6368584 =C2=B133%  TOTAL numa-meminfo.no=
de0.Mapped
     96122 =C2=B117%   +1623.5%    1656668 =C2=B140%  TOTAL numa-meminfo.no=
de0.Active(file)
    372146 =C2=B120%    +376.8%    1774356 =C2=B133%  TOTAL numa-vmstat.nod=
e2.nr_mapped
     35970 =C2=B116%   +1201.8%     468251 =C2=B136%  TOTAL numa-vmstat.nod=
e1.nr_active_file
    441937 =C2=B117%   +1561.9%    7344724 =C2=B139%  TOTAL meminfo.Active(=
file)
    110544 =C2=B117%   +1560.6%    1835659 =C2=B139%  TOTAL proc-vmstat.nr_=
active_file
   1120643 =C2=B1 5%    +590.6%    7739311 =C2=B135%  TOTAL meminfo.Active
  18371498 =C2=B1 3%    +453.4%  1.017e+08 =C2=B135%  TOTAL proc-vmstat.pgf=
ault
     25633 =C2=B120%   +1719.1%     466289 =C2=B140%  TOTAL numa-vmstat.nod=
e2.nr_active_file
   6658192 =C2=B111%    +324.6%   28272474 =C2=B131%  TOTAL meminfo.Mapped
   1665171 =C2=B111%    +324.2%    7063886 =C2=B131%  TOTAL proc-vmstat.nr_=
mapped
   2428188 =C2=B1 9%    +227.6%    7953909 =C2=B130%  TOTAL numa-meminfo.no=
de3.FilePages
    606895 =C2=B1 9%    +227.5%    1987651 =C2=B130%  TOTAL numa-vmstat.nod=
e3.nr_file_pages
    569759 =C2=B1 5%    +219.4%    1819531 =C2=B126%  TOTAL numa-vmstat.nod=
e1.nr_mapped
   2279554 =C2=B1 5%    +219.4%    7281938 =C2=B126%  TOTAL numa-meminfo.no=
de1.Mapped
    556008 =C2=B125%    +232.5%    1848486 =C2=B132%  TOTAL numa-vmstat.nod=
e2.nr_file_pages
   2224676 =C2=B125%    +232.5%    7397397 =C2=B132%  TOTAL numa-meminfo.no=
de2.FilePages
    533395 =C2=B127%    +209.0%    1648097 =C2=B132%  TOTAL numa-vmstat.nod=
e0.nr_file_pages
   2134139 =C2=B127%    +209.0%    6594790 =C2=B132%  TOTAL numa-meminfo.no=
de0.FilePages
  10069745 =C2=B118%    +196.2%   29824943 =C2=B128%  TOTAL vmstat.memory.c=
ache
  10095876 =C2=B118%    +195.9%   29875905 =C2=B128%  TOTAL meminfo.Cached
   2525023 =C2=B118%    +195.6%    7464604 =C2=B128%  TOTAL proc-vmstat.nr_=
file_pages
   1969114 =C2=B120%    +195.7%    5823012 =C2=B128%  TOTAL numa-meminfo.no=
de3.Inactive
   1962869 =C2=B120%    +196.5%    5820705 =C2=B128%  TOTAL numa-meminfo.no=
de3.Inactive(file)
    490557 =C2=B120%    +196.6%    1454975 =C2=B128%  TOTAL numa-vmstat.nod=
e3.nr_inactive_file
   1790247 =C2=B119%    +175.7%    4935454 =C2=B129%  TOTAL numa-meminfo.no=
de0.Inactive(file)
    447375 =C2=B119%    +175.8%    1233766 =C2=B129%  TOTAL numa-vmstat.nod=
e0.nr_inactive_file
   1794406 =C2=B119%    +175.1%    4936742 =C2=B129%  TOTAL numa-meminfo.no=
de0.Inactive
       117 =C2=B110%     -48.4%         60 =C2=B149%  TOTAL proc-vmstat.nr_=
dirtied
   3371503 =C2=B1 9%    +143.2%    8198318 =C2=B120%  TOTAL proc-vmstat.pga=
ctivate
   2184713 =C2=B120%    +150.4%    5470979 =C2=B126%  TOTAL proc-vmstat.nr_=
inactive_file
   8735108 =C2=B120%    +150.7%   21899817 =C2=B126%  TOTAL meminfo.Inactiv=
e(file)
   3337503 =C2=B117%    +138.4%    7957665 =C2=B122%  TOTAL numa-meminfo.no=
de1.FilePages
    834094 =C2=B117%    +138.4%    1988537 =C2=B122%  TOTAL numa-vmstat.nod=
e1.nr_file_pages
   9002304 =C2=B119%    +146.2%   22163923 =C2=B126%  TOTAL meminfo.Inactive
   5007211 =C2=B1 4%    +116.0%   10818062 =C2=B122%  TOTAL numa-meminfo.no=
de3.MemUsed
   4817372 =C2=B111%    +112.8%   10252314 =C2=B123%  TOTAL numa-meminfo.no=
de2.MemUsed
   4748497 =C2=B111%     +99.7%    9482674 =C2=B122%  TOTAL numa-meminfo.no=
de0.MemUsed
    678705 =C2=B1 3%     -41.9%     394587 =C2=B131%  TOTAL meminfo.Active(=
anon)
    169636 =C2=B1 3%     -41.8%      98684 =C2=B131%  TOTAL proc-vmstat.nr_=
active_anon
   3037702 =C2=B118%     +86.6%    5666857 =C2=B120%  TOTAL numa-meminfo.no=
de1.Inactive(file)
    759113 =C2=B118%     +86.6%    1416427 =C2=B120%  TOTAL numa-vmstat.nod=
e1.nr_inactive_file
      3.06 =C2=B112%     +88.8%       5.77 =C2=B112%  TOTAL turbostat.%c1
   3191174 =C2=B118%     +84.1%    5875267 =C2=B119%  TOTAL numa-meminfo.no=
de1.Inactive
   6070097 =C2=B1 9%     +80.0%   10923602 =C2=B116%  TOTAL numa-meminfo.no=
de1.MemUsed
       162 =C2=B1 6%     -34.6%        106 =C2=B128%  TOTAL proc-vmstat.nr_=
written
      8361 =C2=B1 2%     +61.1%      13473 =C2=B115%  TOTAL uptime.idle
    914728 =C2=B1 2%     -31.3%     628385 =C2=B120%  TOTAL meminfo.Shmem
    228644 =C2=B1 2%     -31.3%     157110 =C2=B120%  TOTAL proc-vmstat.nr_=
shmem
     93589 =C2=B112%     +54.2%     144291 =C2=B112%  TOTAL slabinfo.radix_=
tree_node.num_objs
      1670 =C2=B112%     +54.2%       2576 =C2=B112%  TOTAL slabinfo.radix_=
tree_node.num_slabs
      1670 =C2=B112%     +54.2%       2576 =C2=B112%  TOTAL slabinfo.radix_=
tree_node.active_slabs
     93251 =C2=B112%     +54.0%     143616 =C2=B112%  TOTAL slabinfo.radix_=
tree_node.active_objs
      5789 =C2=B1 9%     +37.5%       7958 =C2=B1 4%  TOTAL numa-vmstat.nod=
e3.nr_slab_reclaimable
     23161 =C2=B1 9%     +37.5%      31844 =C2=B1 4%  TOTAL numa-meminfo.no=
de3.SReclaimable
   2014435 =C2=B1 2%     -23.4%    1542102 =C2=B1 9%  TOTAL meminfo.Committ=
ed_AS
  25777315 =C2=B110%     -26.9%   18834186 =C2=B1 3%  TOTAL softirqs.TIMER
     98593 =C2=B1 6%     +29.1%     127310 =C2=B1 8%  TOTAL meminfo.SReclai=
mable
     24651 =C2=B1 6%     +29.1%      31817 =C2=B1 8%  TOTAL proc-vmstat.nr_=
slab_reclaimable
       114 =C2=B1 0%     -19.2%         92 =C2=B1 8%  TOTAL vmstat.procs.r
     54218 =C2=B1 6%     +17.0%      63418 =C2=B1 6%  TOTAL numa-meminfo.no=
de2.Slab
    432162 =C2=B1 1%     +17.4%     507299 =C2=B1 4%  TOTAL numa-vmstat.nod=
e3.nr_page_table_pages
   1729816 =C2=B1 1%     +17.3%    2029692 =C2=B1 4%  TOTAL numa-meminfo.no=
de3.PageTables
   6918899 =C2=B1 1%     +16.4%    8056526 =C2=B1 3%  TOTAL meminfo.PageTab=
les
   1730406 =C2=B1 1%     +16.3%    2012726 =C2=B1 3%  TOTAL proc-vmstat.nr_=
page_table_pages
   1732736 =C2=B1 1%     +17.2%    2030910 =C2=B1 3%  TOTAL numa-meminfo.no=
de0.PageTables
   1735229 =C2=B1 1%     +15.9%    2011761 =C2=B1 3%  TOTAL numa-meminfo.no=
de2.PageTables
    432880 =C2=B1 1%     +17.2%     507504 =C2=B1 3%  TOTAL numa-vmstat.nod=
e0.nr_page_table_pages
    433466 =C2=B1 1%     +16.0%     502747 =C2=B1 3%  TOTAL numa-vmstat.nod=
e2.nr_page_table_pages
    433015 =C2=B1 1%     +14.5%     495963 =C2=B1 3%  TOTAL numa-vmstat.nod=
e1.nr_page_table_pages
   1733140 =C2=B1 1%     +14.5%    1984694 =C2=B1 3%  TOTAL numa-meminfo.no=
de1.PageTables
     55586 =C2=B1 4%     +14.6%      63699 =C2=B1 5%  TOTAL numa-meminfo.no=
de3.Slab
    235040 =C2=B1 2%     +12.0%     263152 =C2=B1 3%  TOTAL meminfo.Slab
    129349 =C2=B1 4%     -10.5%     115832 =C2=B1 7%  TOTAL meminfo.DirectM=
ap4k
   4428414 =C2=B123%   +2068.0%   96008011 =C2=B140%  TOTAL time.minor_page=
_faults
     94.57 =C2=B1 0%     -18.8%      76.76 =C2=B1 8%  TOTAL turbostat.%c0
     11277 =C2=B1 0%     -18.5%       9191 =C2=B1 7%  TOTAL time.percent_of=
_cpu_this_job_got
       391 =C2=B1 0%     -15.1%        332 =C2=B1 6%  TOTAL turbostat.Cor_W
       461 =C2=B1 0%     -12.6%        403 =C2=B1 5%  TOTAL turbostat.Pkg_W
    208054 =C2=B115%     -19.3%     167943 =C2=B1 4%  TOTAL time.involuntar=
y_context_switches

Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Fengguang

--===============4973382791982122308==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUx
MDEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDQv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDcvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTExNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEx
OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTEyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTE1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTE4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1MzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHU2MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU2NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU2Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Nzkv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTgyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTg1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1ODYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU5MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5Ny9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTk4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm1v
dW50IC10IHRtcGZzIC1vIHNpemU9MTAwJSB2bS1zY2FsYWJpbGl0eS10bXAgL3RtcC92bS1zY2Fs
YWJpbGl0eS10bXAKdHJ1bmNhdGUgLXMgNTQwOTUyMDcyMTkyIC90bXAvdm0tc2NhbGFiaWxpdHku
aW1nCm1rZnMueGZzIC1xIC90bXAvdm0tc2NhbGFiaWxpdHkuaW1nCm1vdW50IC1vIGxvb3AgL3Rt
cC92bS1zY2FsYWJpbGl0eS5pbWcgL3RtcC92bS1zY2FsYWJpbGl0eQouL2Nhc2UtbW1hcC1wcmVh
ZC1yYW5kLW10CnRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLW1tYXAtcHJlYWQt
cmFuZC1tdCAtcyAzNjY1MDM4NzU5MgouL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC10IDEyMCAtZiAv
dG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1tbWFwLXByZWFkLXJhbmQtbXQgLS1yZWFkb25seSAt
LXJhbmRvbSAzNjY1MDM4NzU5Mgp1bW91bnQgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAKdW1vdW50
IC90bXAvdm0tc2NhbGFiaWxpdHkKcm0gL3RtcC92bS1zY2FsYWJpbGl0eS5pbWcK

--===============4973382791982122308==--

