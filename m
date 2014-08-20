Content-Type: multipart/mixed; boundary="===============6460880558615546105=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched/numa] 0132c3e1777: -6.4% vm-scalability.throughput
Date: Wed, 20 Aug 2014 23:58:45 +0800
Message-ID: <20140820155845.GA7241@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============6460880558615546105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rik,

FYI, we noticed the below changes on commit

0132c3e1777ceabc24c7d209b7cbe78c28c03c09 ("sched/numa: Examine a task move =
when examining a task swap")

test case: brickland3/vm-scalability/300s-1T-anon-cow-seq

1c5d3eb3759013b  0132c3e1777ceabc24c7d209b =

---------------  ------------------------- =

  36496955 =C2=B1 0%      -6.4%   34158456 =C2=B1 0%  TOTAL vm-scalability.=
throughput
      0.82 =C2=B124%    +239.4%       2.79 =C2=B110%  TOTAL turbostat.%pc2
  3.83e+08 =C2=B1 4%     -55.8%  1.693e+08 =C2=B110%  TOTAL cpuidle.C1-IVT-=
4S.time
    103637 =C2=B1 3%     +32.8%     137617 =C2=B1 1%  TOTAL cpuidle.C6-IVT-=
4S.usage
     14451 =C2=B112%     +28.1%      18508 =C2=B1 4%  TOTAL proc-vmstat.num=
a_pages_migrated
     14451 =C2=B112%     +28.1%      18508 =C2=B1 4%  TOTAL proc-vmstat.pgm=
igrate_success
  4.13e+09 =C2=B1 1%     +18.2%  4.882e+09 =C2=B1 0%  TOTAL cpuidle.C6-IVT-=
4S.time
      5858 =C2=B1 6%     -16.1%       4915 =C2=B1 1%  TOTAL proc-vmstat.nr_=
mapped
       786 =C2=B1 7%     +14.1%        897 =C2=B1 6%  TOTAL numa-vmstat.nod=
e0.nr_alloc_batch
      9.62 =C2=B1 2%     -13.2%       8.35 =C2=B1 2%  TOTAL turbostat.%c1
     14.64 =C2=B1 3%     +16.1%      17.00 =C2=B1 1%  TOTAL turbostat.%c6
    123533 =C2=B1 5%      -9.3%     112004 =C2=B1 0%  TOTAL proc-vmstat.pga=
ctivate
     21982 =C2=B1 4%     -11.0%      19567 =C2=B1 1%  TOTAL meminfo.Mapped
      5037 =C2=B1 4%      -8.1%       4630 =C2=B1 4%  TOTAL numa-meminfo.no=
de0.Mapped
     45737 =C2=B110%     -28.6%      32671 =C2=B1 9%  TOTAL time.voluntary_=
context_switches
      3124 =C2=B1 7%     -15.6%       2637 =C2=B1 2%  TOTAL vmstat.system.cs
     10226 =C2=B1 0%      +7.4%      10978 =C2=B1 0%  TOTAL time.system_time
       154 =C2=B1 0%      +7.1%        165 =C2=B1 0%  TOTAL time.elapsed_ti=
me
    153975 =C2=B1 3%      -6.2%     144429 =C2=B1 0%  TOTAL vmstat.system.in
       168 =C2=B1 0%      -3.2%        163 =C2=B1 0%  TOTAL turbostat.RAM_W
       374 =C2=B1 0%      -1.6%        368 =C2=B1 0%  TOTAL turbostat.Cor_W
       458 =C2=B1 0%      -1.5%        451 =C2=B1 0%  TOTAL turbostat.Pkg_W
      9092 =C2=B1 0%      -1.5%       8953 =C2=B1 0%  TOTAL time.percent_of=
_cpu_this_job_got
     75.72 =C2=B1 0%      -1.5%      74.61 =C2=B1 0%  TOTAL turbostat.%c0

The test box configuration is

brickland3: Brickland Ivy Bridge-EX
Memory: 512G
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                120
On-line CPU(s) list:   0-119
Thread(s) per core:    2
Core(s) per socket:    15
Socket(s):             4
NUMA node(s):          4
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 62
Stepping:              7
CPU MHz:               3192.875
BogoMIPS:              5593.49
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              38400K
NUMA node0 CPU(s):     0-14,60-74
NUMA node1 CPU(s):     15-29,75-89
NUMA node2 CPU(s):     30-44,90-104
NUMA node3 CPU(s):     45-59,105-119


                                  time.system_time

  11500 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
        |       O  O       O  O       O  O O  O  O    O  O  O O            =
 |
  11000 O+ O O        O O       O  O                O            O  O  O O =
 O
        |                                                                  =
 |
        |                                                                  =
 |
  10500 ++                                                                 =
 |
        |                      .*..*..*.. .*..  .*.. .*..*..*.             =
 |
  10000 ++                    *          *    *.    *         *            =
 |
        |                    +                                             =
 |
        |       *           +                                              =
 |
   9500 ++    .. :    *.  .*                                               =
 |
        | .*.*    :  +  *.                                                 =
 |
        *.        : +                                                      =
 |
   9000 ++---------*-------------------------------------------------------=
-+


                                 time.elapsed_time

  170 ++-------------------------------------------------------------------=
-+
      |       O             O        O  O       O       O     O            =
 |
      O  O  O    O  O  O  O    O  O       O  O     O  O    O     O  O      =
 O
  165 ++                                                              O  O =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  160 ++                                                                   =
 |
      |                                                                    =
 |
  155 ++                      .*..             .*..    .*..*..             =
 |
      |                     *.    *..*..*.*..*.      .*       *            =
 |
      |       *            +                       *.                      =
 |
  150 ++     + +    *..*..*                                                =
 |
      *..*..*   + ..                                                       =
 |
      |          *                                                         =
 |
  145 ++-------------------------------------------------------------------=
-+


                               vm-scalability.throughput

    4e+07 ++---------*-----------------------------------------------------=
-+
          *..       : :                                                    =
 |
  3.9e+07 ++ *.*..  : :  .*.                                               =
 |
          |        :   *.   *                                              =
 |
  3.8e+07 ++      *          :                                             =
 |
          |                   :                                            =
 |
  3.7e+07 ++                  :               .*.. .*..                    =
 |
          |                    *..*.*..*..*.*.    *      .*.*..*           =
 |
  3.6e+07 ++                                           *.                  =
 |
          |                                                                =
 |
  3.5e+07 ++                                                               =
 |
          |                                                              O =
 |
  3.4e+07 O+ O O     O O  O O     O O       O       O  O  O O  O O  O  O   =
 O
          |       O            O       O  O    O  O                        =
 |
  3.3e+07 ++---------------------------------------------------------------=
-+


                                  turbostat.RAM_W

  173 ++-------------------------------------------------------------------=
-+
  172 *+.        *..                                                       =
 |
      |    .*   +                                                          =
 |
  171 ++ *.  + +    *..*..*.                                               =
 |
  170 ++      *             *..*..                 *..                     =
 |
  169 ++                          *..       .*.. ..       .*..*            =
 |
  168 ++                             *..*.*.    *     *.*.                 =
 |
      |                                                                    =
 |
  167 ++                                                                   =
 |
  166 ++                                                                   =
 |
  165 ++                                                                   =
 |
  164 ++            O                                                    O =
 |
      O  O    O        O                                         O  O O    =
 O
  163 ++    O    O        O O  O  O  O    O  O  O  O  O O  O  O            =
 |
  162 ++--------------------------------O----------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample


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

--===============6460880558615546105==
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
cC92bS1zY2FsYWJpbGl0eS5pbWcgL3RtcC92bS1zY2FsYWJpbGl0eQouL2Nhc2UtYW5vbi1jb3ct
c2VxCi4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4gMTIwIC0tcHJlYWxsb2MgLS1wcmVmYXVsdCAy
MjUzOTY2OTY3Ci4vY2FzZS1hbm9uLWNvdy1zZXEKLi91c2VtZW0gLS1ydW50aW1lIDMwMCAtbiAx
MjAgLS1wcmVhbGxvYyAtLXByZWZhdWx0IDIyNTM5NjY5NjcKLi9jYXNlLWFub24tY293LXNlcQou
L3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1uIDEyMCAtLXByZWFsbG9jIC0tcHJlZmF1bHQgMjI1Mzk2
Njk2NwouL2Nhc2UtYW5vbi1jb3ctc2VxCi4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4gMTIwIC0t
cHJlYWxsb2MgLS1wcmVmYXVsdCAyMjUzOTY2OTY3Ci4vY2FzZS1hbm9uLWNvdy1zZXEKLi91c2Vt
ZW0gLS1ydW50aW1lIDMwMCAtbiAxMjAgLS1wcmVhbGxvYyAtLXByZWZhdWx0IDIyNTM5NjY5NjcK
Li9jYXNlLWFub24tY293LXNlcQouL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1uIDEyMCAtLXByZWFs
bG9jIC0tcHJlZmF1bHQgMjI1Mzk2Njk2NwouL2Nhc2UtYW5vbi1jb3ctc2VxCi4vdXNlbWVtIC0t
cnVudGltZSAzMDAgLW4gMTIwIC0tcHJlYWxsb2MgLS1wcmVmYXVsdCAyMjUzOTY2OTY3Ci4vY2Fz
ZS1hbm9uLWNvdy1zZXEKLi91c2VtZW0gLS1ydW50aW1lIDMwMCAtbiAxMjAgLS1wcmVhbGxvYyAt
LXByZWZhdWx0IDIyNTM5NjY5NjcKLi9jYXNlLWFub24tY293LXNlcQouL3VzZW1lbSAtLXJ1bnRp
bWUgMzAwIC1uIDEyMCAtLXByZWFsbG9jIC0tcHJlZmF1bHQgMjI1Mzk2Njk2NwouL2Nhc2UtYW5v
bi1jb3ctc2VxCi4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4gMTIwIC0tcHJlYWxsb2MgLS1wcmVm
YXVsdCAyMjUzOTY2OTY3Ci4vY2FzZS1hbm9uLWNvdy1zZXEKLi91c2VtZW0gLS1ydW50aW1lIDMw
MCAtbiAxMjAgLS1wcmVhbGxvYyAtLXByZWZhdWx0IDIyNTM5NjY5NjcKLi9jYXNlLWFub24tY293
LXNlcQouL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1uIDEyMCAtLXByZWFsbG9jIC0tcHJlZmF1bHQg
MjI1Mzk2Njk2NwouL2Nhc2UtYW5vbi1jb3ctc2VxCi4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4g
MTIwIC0tcHJlYWxsb2MgLS1wcmVmYXVsdCAyMjUzOTY2OTY3Ci4vY2FzZS1hbm9uLWNvdy1zZXEK
Li91c2VtZW0gLS1ydW50aW1lIDMwMCAtbiAxMjAgLS1wcmVhbGxvYyAtLXByZWZhdWx0IDIyNTM5
NjY5NjcKLi9jYXNlLWFub24tY293LXNlcQouL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1uIDEyMCAt
LXByZWFsbG9jIC0tcHJlZmF1bHQgMjI1Mzk2Njk2NwouL2Nhc2UtYW5vbi1jb3ctc2VxCi4vdXNl
bWVtIC0tcnVudGltZSAzMDAgLW4gMTIwIC0tcHJlYWxsb2MgLS1wcmVmYXVsdCAyMjUzOTY2OTY3
CnVtb3VudCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcAp1bW91bnQgL3RtcC92bS1zY2FsYWJpbGl0
eQpybSAvdG1wL3ZtLXNjYWxhYmlsaXR5LmltZwo=

--===============6460880558615546105==--

