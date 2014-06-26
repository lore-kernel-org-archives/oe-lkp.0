Content-Type: multipart/mixed; boundary="===============0409326984384494079=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: [mempolicy] 5507231dd04: -18.2% vm-scalability.migrate_mbps
Date: Thu, 26 Jun 2014 13:13:02 +0800
Message-ID: <53ABABDE.1010704@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0409326984384494079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Naoya,

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git am437x-starterk=
it
commit 5507231dd04d3d68796bafe83e6a20c985a0ef68 ("mempolicy: apply page tab=
le walker on queue_pages_range()")

test case: ivb44/vm-scalability/300s-migrate

8c81f3eeb336567  5507231dd04d3d68796bafe83
---------------  -------------------------
      347258 ~ 0%     -18.2%     284195 ~ 0%  TOTAL vm-scalability.migrate_=
mbps
        0.00           +Inf%       0.94 ~ 7%  TOTAL perf-profile.cpu-cycles=
._raw_spin_lock.__walk_page_range.walk_page_range.queue_pages_range.migrate=
_to_node
       11.49 ~ 1%    -100.0%       0.00 ~ 0%  TOTAL perf-profile.cpu-cycles=
.vm_normal_page.queue_pages_range.migrate_to_node.do_migrate_pages.SYSC_mig=
rate_pages
       69.40 ~ 0%    -100.0%       0.00 ~ 0%  TOTAL perf-profile.cpu-cycles=
.queue_pages_range.migrate_to_node.do_migrate_pages.SYSC_migrate_pages.sys_=
migrate_pages
        3.68 ~ 3%    -100.0%       0.00 ~ 0%  TOTAL perf-profile.cpu-cycles=
.vm_normal_page.migrate_to_node.do_migrate_pages.SYSC_migrate_pages.sys_mig=
rate_pages
        0.00           +Inf%       4.51 ~ 2%  TOTAL perf-profile.cpu-cycles=
.vm_normal_page.__walk_page_range.walk_page_range.queue_pages_range.migrate=
_to_node
        0.00           +Inf%       8.36 ~ 1%  TOTAL perf-profile.cpu-cycles=
.__walk_page_range.walk_page_range.queue_pages_range.migrate_to_node.do_mig=
rate_pages
        1.17 ~ 4%    -100.0%       0.00 ~ 0%  TOTAL perf-profile.cpu-cycles=
._raw_spin_lock.queue_pages_range.migrate_to_node.do_migrate_pages.SYSC_mig=
rate_pages
        0.00           +Inf%       9.30 ~ 2%  TOTAL perf-profile.cpu-cycles=
.vm_normal_page.queue_pages_pte.__walk_page_range.walk_page_range.queue_pag=
es_range
        0.00           +Inf%      63.92 ~ 1%  TOTAL perf-profile.cpu-cycles=
.queue_pages_pte.__walk_page_range.walk_page_range.queue_pages_range.migrat=
e_to_node
          61 ~32%    +363.8%        286 ~10%  TOTAL numa-vmstat.node0.nr_un=
evictable
         257 ~30%    +345.5%       1147 ~10%  TOTAL numa-meminfo.node0.Unev=
ictable
        1133 ~ 8%    +129.0%       2596 ~ 0%  TOTAL meminfo.Unevictable
         282 ~ 8%    +129.1%        647 ~ 0%  TOTAL proc-vmstat.nr_unevicta=
ble
       93913 ~ 7%     -49.8%      47172 ~ 3%  TOTAL softirqs.RCU
      113808 ~ 1%     -45.4%      62087 ~ 0%  TOTAL softirqs.SCHED
      362197 ~ 0%     -32.9%     243163 ~ 0%  TOTAL cpuidle.C6-IVT.usage
        1.49 ~ 3%     -19.6%       1.20 ~ 4%  TOTAL perf-profile.cpu-cycles=
.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secon=
dary
      743815 ~ 2%     -20.3%     592628 ~ 6%  TOTAL proc-vmstat.pgmigrate_f=
ail
         310 ~ 6%     +16.6%        362 ~ 8%  TOTAL numa-vmstat.node1.nr_un=
evictable
        1243 ~ 6%     +16.5%       1448 ~ 8%  TOTAL numa-meminfo.node1.Unev=
ictable
        1230 ~ 6%     +16.6%       1434 ~ 8%  TOTAL numa-meminfo.node1.Mloc=
ked
         307 ~ 6%     +16.7%        358 ~ 8%  TOTAL numa-vmstat.node1.nr_ml=
ock
     3943910 ~ 0%     -12.3%    3459206 ~ 0%  TOTAL proc-vmstat.pgfault
        4402 ~ 3%     -13.4%       3812 ~ 5%  TOTAL numa-meminfo.node1.Kern=
elStack
       15303 ~ 7%     -17.5%      12621 ~ 9%  TOTAL slabinfo.kmalloc-192.nu=
m_objs
       15301 ~ 7%     -17.5%      12621 ~ 9%  TOTAL slabinfo.kmalloc-192.ac=
tive_objs
       30438 ~ 0%     +91.0%      58142 ~ 0%  TOTAL time.involuntary_contex=
t_switches
         162 ~ 3%     +81.9%        296 ~ 0%  TOTAL time.system_time
          53 ~ 3%     +81.1%         96 ~ 0%  TOTAL time.percent_of_cpu_thi=
s_job_got
     2586283 ~ 0%     -18.5%    2107842 ~ 0%  TOTAL time.minor_page_faults
       48619 ~ 0%     -18.1%      39800 ~ 0%  TOTAL time.voluntary_context_=
switches
        2037 ~ 0%     -17.7%       1677 ~ 0%  TOTAL vmstat.system.in
        2206 ~ 0%      -4.7%       2101 ~ 0%  TOTAL vmstat.system.cs
             ~ 1%      -3.6%            ~ 1%  TOTAL turbostat.Cor_W
             ~ 1%      -2.2%            ~ 1%  TOTAL turbostat.Pkg_W
        2.17 ~ 0%      -1.4%       2.14 ~ 0%  TOTAL turbostat.%c0

Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                                   time.system_time

    300 O+O--O-O-O--O-O-O--O-O-O--O-O-O--O-O-O--O-O-O----------------------=
---+
        |                                                                  =
   |
    280 ++                                                                 =
   |
    260 ++                                                                 =
   |
        |                                                                  =
   |
    240 ++                                                                 =
   |
        |                                                                  =
   |
    220 ++                                                                 =
   |
        |                                                                  =
   |
    200 ++                                                                 =
   |
    180 ++                                                                 =
   |
        |            .*.                       .*                   .*.    =
   |
    160 *+*.. .*.  .*   *..*.*.*.. .*.*..*.*.*.  + .*..*.*.  .*.*.*.   *.*.=
.*.|
        |    *   *.               *               *        *.              =
   *
    140 ++-----------------------------------------------------------------=
---+


                           time.percent_of_cpu_this_job_got

    100 ++-----------------------------------------------------------------=
---+
     95 O+O  O O O  O O O  O O O  O O    O O O  O O O                      =
   |
        |                             O                                    =
   |
     90 ++                                                                 =
   |
     85 ++                                                                 =
   |
        |                                                                  =
   |
     80 ++                                                                 =
   |
     75 ++                                                                 =
   |
     70 ++                                                                 =
   |
        |                                                                  =
   |
     65 ++                                                                 =
   |
     60 ++                                                                 =
   |
        |                                                           .*.    =
   |
     55 *+*.. .*.  .*.*.*..*.*.*.. .*.*..*.*.*..*. .*..*.*.  .*. .*.   *.*.=
.*.|
     50 ++---*---*----------------*---------------*--------*----*----------=
---*


                                  time.minor_page_faults

    2.7e+06 ++-------------------------------------------------------------=
---+
            |                    .*.    .*   *                             =
   |
    2.6e+06 *+*.*.. .*.         *   *.*.  + + + .*..*. .*.*.*..*.*. .*.*..*=
.*.|
            |      *   *.*.*.. +           *   *      *            *       =
   *
    2.5e+06 ++                *                                            =
   |
            |                                                              =
   |
    2.4e+06 ++                                                             =
   |
            |                                                              =
   |
    2.3e+06 ++                                                             =
   |
            |                                                              =
   |
    2.2e+06 ++                                                             =
   |
            |                                    O                         =
   |
    2.1e+06 ++                      O    O   O O    O O                    =
   |
            O O O    O O O O  O O O   O    O                               =
   |
      2e+06 ++-----O-------------------------------------------------------=
---+


                             time.voluntary_context_switches

    50000 ++---------------------------------------------------------------=
---+
          *.  .*. .*.        .*..*.*. .*.. .*.*..*.   .*..*.*.*.  .*. .*.  =
.*.|
    48000 ++*.   *   *..*.*.*        *    *        *.*          *.   *   *.=
   *
          |                                                                =
   |
          |                                                                =
   |
    46000 ++                                                               =
   |
          |                                                                =
   |
    44000 ++                                                               =
   |
          |                                                                =
   |
    42000 ++                                                               =
   |
          |                                                                =
   |
          |                                                                =
   |
    40000 ++                                O O  O O O                     =
   |
          |    O     O  O   O    O O O O  O                                =
   |
    38000 O+O----O-O------O---O--------------------------------------------=
---+


                            time.involuntary_context_switches

    60000 ++---------------------------------------------------------------=
---+
          O O  O   O O  O          O O O    O O  O O O                     =
   |
    55000 ++     O        O O O  O        O                                =
   |
          |                                                                =
   |
          |                                                                =
   |
    50000 ++                                                               =
   |
          |                                                                =
   |
    45000 ++                                                               =
   |
          |                                                                =
   |
    40000 ++                                                               =
   |
          |                                                                =
   |
          |                                                                =
   |
    35000 ++                                                               =
   |
          |                  .*..*.*.                                      =
   |
    30000 *+*--*-*-*-*--*-*-*--------*-*--*-*-*--*-*-*-*--*-*-*-*--*-*-*-*-=
-*-*


                               vm-scalability.migrate_mbps

    360000 ++--------------------------------------------------------------=
---+
           |  .*..            .*.*..*. .*    *. .*.          .*..          =
   |
    350000 *+*    *.*.*.*..*.*        *  + ..  *   *.*..*.*.*    *.*.*.*..*=
.*.|
    340000 ++                             *                                =
   *
           |                                                               =
   |
    330000 ++                                                              =
   |
    320000 ++                                                              =
   |
           |                                                               =
   |
    310000 ++                                                              =
   |
    300000 ++                                                              =
   |
           |                                                               =
   |
    290000 ++                                                              =
   |
    280000 ++                         O O    O O O O O                     =
   |
           O O O    O O O  O O O O  O     O                                =
   |
    270000 ++-----O--------------------------------------------------------=
---+


                                   vmstat.system.in

    2100 ++----------------------------------------------------------------=
---+
         |                                              .*..*.*.*..   .*.*.=
.*.*
    2000 ++                                            *           *.*     =
   |
         |                                            +                    =
   |
    1900 *+*..*. .*..   .*.  .*. .*..*.*.*..*.*.*.*..*                     =
   |
         |      *    *.*   *.   *                                          =
   |
    1800 ++                                                                =
   |
         |                                                                 =
   |
    1700 ++                          O   O  O   O    O                     =
   |
         |               O O  O O O    O      O   O                        =
   |
    1600 ++                                                                =
   |
         |                                                                 =
   |
    1500 O+       O  O                                                     =
   |
         | O  O O      O                                                   =
   |
    1400 ++----------------------------------------------------------------=
---+


	[*] bisect-good sample
	[O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Jet



--===============0409326984384494079==
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
b3Zlcm5vcgptb3VudCAtdCB0bXBmcyAtbyBzaXplPTEwMCUgdm0tc2NhbGFiaWxpdHktdG1wIC90
bXAvdm0tc2NhbGFiaWxpdHktdG1wCnRydW5jYXRlIC1zIDY3NDUwMDUyNjA4IC90bXAvdm0tc2Nh
bGFiaWxpdHkuaW1nCm1rZnMueGZzIC1xIC90bXAvdm0tc2NhbGFiaWxpdHkuaW1nCm1vdW50IC1v
IGxvb3AgL3RtcC92bS1zY2FsYWJpbGl0eS5pbWcgL3RtcC92bS1zY2FsYWJpbGl0eQouL2Nhc2Ut
bWlncmF0ZQp0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1taWdyYXRlIC1zIDY3
NDUwMDUyNjA4Ci4vdXNlbWVtIC0tcnVudGltZSAzMDAgLWYgL3RtcC92bS1zY2FsYWJpbGl0eS9z
cGFyc2UtbWlncmF0ZSAtLXJlYWRvbmx5IDE2ODYyNTEzMTUyIC0tZGV0YWNoIC0tc2xlZXAgNjAw
IC0tcGlkLWZpbGUgL3RtcC92bS1zY2FsYWJpbGl0eS9taWdyYXRlLnBpZAp1bW91bnQgL3RtcC92
bS1zY2FsYWJpbGl0eS10bXAKdW1vdW50IC90bXAvdm0tc2NhbGFiaWxpdHkKcm0gL3RtcC92bS1z
Y2FsYWJpbGl0eS5pbWcKCgo=

--===============0409326984384494079==--

