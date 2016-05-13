Content-Type: multipart/mixed; boundary="===============2941267475843180399=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [zsmalloc] 44f43e99fe: will-it-scale.scalability +15.0% improvement
Date: Fri, 13 May 2016 09:40:10 +0800
Message-ID: <20160513014010.GB24890@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2941267475843180399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed will-it-scale.scalability +15.0% improvement due to commit:

commit 44f43e99fe70833058482d183e99fdfd11220996 ("zsmalloc: fix zs_can_comp=
act() integer overflow")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

in testcase - will-it-scale
on test machine - xps: 8 threads Nehalem with 4G memory


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/xps/write1/w=
ill-it-scale

commit: =

  1e92a61c4c7ed85c1bec037c046e92d6dc762f32
  44f43e99fe70833058482d183e99fdfd11220996

1e92a61c4c7ed85c 44f43e99fe70833058482d183e =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

         %stddev     %change         %stddev
             \          |                \  =

   1269910 =C2=B1  0%      -7.7%    1172297 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   1219902 =C2=B1  0%      -7.7%    1125807 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.22 =C2=B1  2%     +15.0%       0.25 =C2=B1  0%  will-it-scale.scala=
bility
    962.50 =C2=B1  2%      -4.4%     920.00 =C2=B1  2%  vmstat.system.cs
     56.78 =C2=B1  7%     +99.5%     113.28 =C2=B1 53%  sched_debug.cpu.loa=
d.stddev
      0.41 =C2=B1  5%     +13.7%       0.47 =C2=B1  5%  sched_debug.cpu.nr_=
running.stddev
      5576 =C2=B1  3%     +19.1%       6642 =C2=B1  4%  slabinfo.anon_vma_c=
hain.active_objs
      5681 =C2=B1  3%     +17.9%       6696 =C2=B1  4%  slabinfo.anon_vma_c=
hain.num_objs
      1610 =C2=B1 15%     +22.5%       1973 =C2=B1  4%  slabinfo.cred_jar.a=
ctive_objs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/xps/writesee=
k2/will-it-scale

commit: =

  1e92a61c4c7ed85c1bec037c046e92d6dc762f32
  44f43e99fe70833058482d183e99fdfd11220996

1e92a61c4c7ed85c 44f43e99fe70833058482d183e =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4           25%           1:4     kmsg.do_IRQ:#No_irq_handler_f=
or_vector
         %stddev     %change         %stddev
             \          |                \  =

    768011 =C2=B1  0%      -8.7%     701413 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
    660490 =C2=B1  0%      -7.9%     608530 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.06 =C2=B1  2%     +13.8%       0.07 =C2=B1  0%  will-it-scale.scala=
bility
    702840 =C2=B1 11%     +56.7%    1101645 =C2=B1 11%  cpuidle.C1E-NHM.time
     23738 =C2=B1  4%      -7.5%      21947 =C2=B1  1%  softirqs.RCU
    173.21 =C2=B1  8%     +13.9%     197.33 =C2=B1  3%  sched_debug.cfs_rq:=
/.load.max
     56.64 =C2=B1  8%     +24.1%      70.31 =C2=B1  3%  sched_debug.cfs_rq:=
/.load.stddev
     36.58 =C2=B1  5%     -12.2%      32.12 =C2=B1  4%  sched_debug.cpu.cpu=
_load[3].min
    173.21 =C2=B1  8%     +13.9%     197.33 =C2=B1  3%  sched_debug.cpu.loa=
d.max
     56.65 =C2=B1  8%     +24.1%      70.32 =C2=B1  3%  sched_debug.cpu.loa=
d.stddev



                             will-it-scale.scalability

  0.27 ++------------------------------------------------------------------=
-+
       |                O                                                  =
 |
  0.26 ++     O  O                                                         =
 |
       O  O          O      O  O   O      O  O  O      O                   =
 |
  0.25 ++                             O             O                      =
 |
       |                                                                   =
 |
  0.24 ++                                                                  =
 |
       |                                                                   =
 |
  0.23 ++                                                                  =
 |
       |                                                             *...*.=
.|
  0.22 ++.*...  .*..    *...*..  ..*..  ..*..     ..*..  ..*..      +      =
 *
       *.     *.    . ..       *.     *.       .*.     *.          +       =
 |
  0.21 ++            *                       *.               *...*        =
 |
       |                                                                   =
 |
   0.2 ++------------------------------------------------------------------=
-+


                             will-it-scale.per_process_ops

   1.3e+06 ++--------------------------------------------------------------=
-+
           |                                                               =
 |
  1.28e+06 ++                ..*..                                         =
.*
  1.26e+06 *+.*...*..*..*..*.     *..*..*...*..*..*..*...*..*..*..*...*..*.=
 |
           |                                                               =
 |
  1.24e+06 ++                                                              =
 |
           |                                                               =
 |
  1.22e+06 ++                                                              =
 |
           |                                                               =
 |
   1.2e+06 ++                                                              =
 |
  1.18e+06 ++                                                              =
 |
           |                      O  O  O      O  O  O                     =
 |
  1.16e+06 ++           O      O            O            O                 =
 |
           O      O  O     O                                               =
 |
  1.14e+06 ++-O------------------------------------------------------------=
-+


                             will-it-scale.per_thread_ops

  1.24e+06 ++--------------------------------------------------------------=
-+
           |                                                               =
.*
  1.22e+06 ++       .*..*..  ..*..        ..*..*..         .*..*..*...*..*.=
 |
           *..*...*.       *.     *..*..*.        *..*...*.                =
 |
   1.2e+06 ++                                                              =
 |
           |                                                               =
 |
  1.18e+06 ++                                                              =
 |
           |                                                               =
 |
  1.16e+06 ++                                                              =
 |
           |                                                               =
 |
  1.14e+06 ++                                                              =
 |
           |                      O     O      O     O                     =
 |
  1.12e+06 ++ O      O     O         O      O     O      O                 =
 |
           O      O     O      O                                           =
 |
   1.1e+06 ++--------------------------------------------------------------=
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
Xiaolong

--===============2941267475843180399==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2
bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86
IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZv
OiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0
YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5m
c3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1l
dGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBw
ZXJmb3JtYW5jZQpORlNfSEFOR19ERl9USU1FT1VUOiAyMDAKTkZTX0hBTkdfQ0hFQ0tfSU5URVJW
QUw6IDkwMApkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCiAg
bmZzLWhhbmc6IApjb21taXQ6IDQ0ZjQzZTk5ZmU3MDgzMzA1ODQ4MmQxODNlOTlmZGZkMTEyMjA5
OTYKbW9kZWw6IE5laGFsZW0KbnJfY3B1OiA4Cm1lbW9yeTogNEcKaGRkX3BhcnRpdGlvbnM6IApz
d2FwX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUhEVDcyMjUxNkRMQTM4MF9WREs5
MUdURTBXTVpCUi1wYXJ0MiIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEt
SERUNzIyNTE2RExBMzgwX1ZESzkxR1RFMFdNWkJSLXBhcnQxIgpuZXRjb25zb2xlX3BvcnQ6IDY2
NjYKY2F0ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQt
c2NhbGU6CiAgdGVzdDogd3JpdGUxCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogeHBzCnRib3hfZ3Jv
dXA6IHhwcwprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDUtMTMgMDA6
MzY6MTguNjAwODk3Nzg2ICswODowMApjb21waWxlcjogZ2NjLTQuOQpyb290ZnM6IGRlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oKaWQ6IDFhYzllMjYwZjk4YjBmNWZhNWNjMmRkYmE5YWRiZWJj
OTQ2OTRiNjcKdXNlcjogbGtwCmhlYWRfY29tbWl0OiAyZDBiZDk1MzRjOGRkYWViZWU2NGUxYjRi
N2Q2MjE5MTVmNjVlOTk0CmJhc2VfY29tbWl0OiAxYjQ2YmFjNjI3NTUwNmRiNzM1OTJhYThiOWJk
MWQ2N2M3OWI5NWRjCmJyYW5jaDogbGludXMvbWFzdGVyCnJlc3VsdF9yb290OiAiL3Jlc3VsdC93
aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLXdyaXRlMS94cHMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzQ0ZjQzZTk5ZmU3MDgzMzA1ODQ4MmQxODNlOTlm
ZGZkMTEyMjA5OTYvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC94cHMvYmlzZWN0X3dpbGwt
aXQtc2NhbGUtcGVyZm9ybWFuY2Utd3JpdGUxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ot
eDg2XzY0LXJoZWwtNDRmNDNlOTlmZTcwODMzMDU4NDgyZDE4M2U5OWZkZmQxMTIyMDk5Ni0yMDE2
MDUxMy0xOTk5OC0xMHd4Y3YwLTAueWFtbCIKbWF4X3VwdGltZTogMTUwMAppbml0cmQ6ICIvb3Np
bWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBl
bmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC94cHMv
YmlzZWN0X3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2Utd3JpdGUxLWRlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNDRmNDNlOTlmZTcwODMzMDU4NDgyZDE4M2U5OWZkZmQx
MTIyMDk5Ni0yMDE2MDUxMy0xOTk5OC0xMHd4Y3YwLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2Nv
bmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51cy9tYXN0ZXIKLSBjb21taXQ9NDRmNDNlOTlm
ZTcwODMzMDU4NDgyZDE4M2U5OWZkZmQxMTIyMDk5NgotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45LzQ0ZjQzZTk5ZmU3MDgzMzA1ODQ4MmQxODNlOTlmZGZkMTEyMjA5
OTYvdm1saW51ei00LjYuMC1yYzctMDAwMDItZzQ0ZjQzZTkKLSBtYXhfdXB0aW1lPTE1MDAKLSBS
RVNVTFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2Utd3JpdGUxL3hwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNDRmNDNlOTlm
ZTcwODMzMDU4NDgyZDE4M2U5OWZkZmQxMTIyMDk5Ni8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0K
CgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1
ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxf
dGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBh
bmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9
dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIv
bGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82
NC1yaGVsL2djYy00LjkvNDRmNDNlOTlmZTcwODMzMDU4NDgyZDE4M2U5OWZkZmQxMTIyMDk5Ni9t
b2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9i
ZW5jaG1hcmtzL3BlcmYtcHJvZmlsZS14ODZfNjQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei93aWxsLWl0LXNjYWxlLmNneiwvbGtwL2JlbmNobWFya3Mvd2ls
bC1pdC1zY2FsZS5jZ3osL2xrcC9iZW5jaG1hcmtzL3dpbGwtaXQtc2NhbGUteDg2XzY0LmNneiIK
bGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNDRm
NDNlOTlmZTcwODMzMDU4NDgyZDE4M2U5OWZkZmQxMTIyMDk5Ni9saW51eC1oZWFkZXJzLmNneiIK
cmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS80NGY0
M2U5OWZlNzA4MzMwNTg0ODJkMTgzZTk5ZmRmZDExMjIwOTk2L3ZtbGludXotNC42LjAtcmM3LTAw
MDAyLWc0NGY0M2U5IgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDUtMTMgMDA6NDU6NDguNzY2ODA2MTg5
ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDcuMjQgMy40NiAxLjM4IDEvMTY2
IDQ3NzgKc3RhcnRfdGltZTogJzE0NjMwNzE1NzMnCmVuZF90aW1lOiAnMTQ2MzA3MTg3OCcKdmVy
c2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjA1MTMtMDAxMjM1Igo=

--===============2941267475843180399==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNS0xMyAwMDo0NjoxMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAwMDo0NjoxMiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAwMDo0NjoxMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NS0xMyAwMDo0NjoxMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAwMDo0NjoxMiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNS0xMyAwMDo0NjoxMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAw
MDo0NjoxMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAwMDo0NjoxMiBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNS0xMyAwMDo0NjoxMyAuL3J1bnRlc3QucHkgd3JpdGUxIDMyIGJvdGggMSA0IDYg
OAo=

--===============2941267475843180399==--

