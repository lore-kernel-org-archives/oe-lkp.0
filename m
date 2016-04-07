Content-Type: multipart/mixed; boundary="===============1323848366892316994=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [xfs] ad68972acb: xfstests.time.file_system_outputs -6.0% improvement
Date: Thu, 07 Apr 2016 09:12:45 +0800
Message-ID: <20160407011245.GC12139@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1323848366892316994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that xfstests.time.file_system_outputs -6.0% improvement on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit ad68972acb82c3e8bba316d542ab204984cb1f1c ("xfs: xfs_cluster_write is=
 redundant")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/fs/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/4HDD/xfs/x86_64-rhel/debian-x86_64-2015-02-07.cgz/vm-kbuild-4G/ge=
neric-127/xfstests

commit: =

  fbcc025613590d7b1d15521555dcc6393a148a6b
  ad68972acb82c3e8bba316d542ab204984cb1f1c

fbcc025613590d7b ad68972acb82c3e8bba316d542 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   8055643 =C2=B1  0%      -6.0%    7568459 =C2=B1  0%  xfstests.time.file_=
system_outputs
     11.74 =C2=B1  2%     +28.9%      15.13 =C2=B1 21%  xfstests.time.user_=
time
     11.74 =C2=B1  2%     +28.9%      15.13 =C2=B1 21%  time.user_time


vm-kbuild-4G: qemu-system-x86_64 -enable-kvm -cpu qemu64,+ssse3
Memory: 4G



                          xfstests.time.file_system_outputs

  9e+06 ++-----------------------------------------------------------------=
-+
        *.*.*.*.*.*.*.*.*.*.*.*   *.*.*.*.*.*.*.*.*.*.*.*.*   *.*.*.*.*.*.*=
.*
  8e+06 O+O         O O O O O O O O O O O O O O O O O O O O O :            =
 |
  7e+06 ++                    :   :                       :   :            =
 |
        |                     :   :                       :   :            =
 |
  6e+06 ++                     : :                         : :             =
 |
  5e+06 ++                     : :                         : :             =
 |
        |                      : :                         : :             =
 |
  4e+06 ++                     : :                         : :             =
 |
  3e+06 ++                     : :                         : :             =
 |
        |                      : :                         : :             =
 |
  2e+06 ++                      :                           :              =
 |
  1e+06 ++                      :                           :              =
 |
        |                       :                           :              =
 |
      0 ++--O-O-O-O-------------*---------------------------*--------------=
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
Xiaolong Ye

--===============1323848366892316994==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogeGZzdGVzdHMKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0ZS1tb25p
dG9yCiAga21zZzogCiAgaGVhcnRiZWF0OgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHQtd2F0Y2hk
b2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogCm1vZGVs
OiBxZW11LXN5c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0gLWNwdSBxZW11NjQsK3Nzc2UzCm5yX3Zt
OiA2Cm5yX2NwdTogNAptZW1vcnk6IDRHCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnegpoZGRfcGFydGl0aW9uczogIi9kZXYvdmRhIC9kZXYvdmRiIC9kZXYvdmRjIC9kZXYvdmRk
IC9kZXYvdmRlIC9kZXYvdmRmIgpzd2FwX3BhcnRpdGlvbnM6ICIvZGV2L3ZkZyIKc3NoX2Jhc2Vf
cG9ydDogMjMwMzIKY2F0ZWdvcnk6IGZ1bmN0aW9uYWwKZGlzazogNEhERApmczogeGZzCnhmc3Rl
c3RzOgogIHRlc3Q6IGdlbmVyaWMtMTI3CmJyYW5jaDogc2NzaS9taXNjCmNvbW1pdDogYWQ2ODk3
MmFjYjgyYzNlOGJiYTMxNmQ1NDJhYjIwNDk4NGNiMWYxYwpxdWV1ZTogYmlzZWN0CnJlcGVhdF90
bzogMgp0ZXN0Ym94OiB2bS1rYnVpbGQtNEctMwp0Ym94X2dyb3VwOiB2bS1rYnVpbGQtNEcKa2Nv
bmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTA0LTAyIDE3OjE4OjEwLjMyODkz
NTU5OSArMDg6MDAKY29tcGlsZXI6IGdjYy00LjkKaWQ6IDEyZGU2ZWNmOTJkMDJjNjY4ZjQ1Zjhj
MGM1NWFlOGI1NTNjNzQxMDAKdXNlcjogbGtwCmhlYWRfY29tbWl0OiAwMGU4YTQ2YjUwZjgwMDk5
MWU4OTQ0NmZiOThkY2FkNWY3MmU3ODZmCmJhc2VfY29tbWl0OiBmNTU1MzJhMGMwYjhiYjYxNDhm
NGUwNzg1M2I4NzZlZjczYmM2OWNhCnJlc3VsdF9yb290OiAiL3Jlc3VsdC94ZnN0ZXN0cy80SERE
LXhmcy1nZW5lcmljLTEyNy92bS1rYnVpbGQtNEcvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei94ODZfNjQtcmhlbC9nY2MtNC45L2FkNjg5NzJhY2I4MmMzZThiYmEzMTZkNTQyYWIyMDQ5ODRj
YjFmMWMvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC92bS1rYnVpbGQtNEctMy9iaXNlY3Rf
eGZzdGVzdHMtNEhERC14ZnMtZ2VuZXJpYy0xMjctZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei14ODZfNjQtcmhlbC1hZDY4OTcyYWNiODJjM2U4YmJhMzE2ZDU0MmFiMjA0OTg0Y2IxZjFjLTIw
MTYwNDAyLTg3NzY1LTE2MXRuaHktMC55YW1sIgptYXhfdXB0aW1lOiAzNjAwCmluaXRyZDogIi9v
c2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2Fw
cGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL3Zt
LWtidWlsZC00Ry0zL2Jpc2VjdF94ZnN0ZXN0cy00SERELXhmcy1nZW5lcmljLTEyNy1kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLWFkNjg5NzJhY2I4MmMzZThiYmEzMTZk
NTQyYWIyMDQ5ODRjYjFmMWMtMjAxNjA0MDItODc3NjUtMTYxdG5oeS0wLnlhbWwKLSBBUkNIPXg4
Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9c2NzaS9taXNjCi0gY29tbWl0PWFk
Njg5NzJhY2I4MmMzZThiYmEzMTZkNTQyYWIyMDQ5ODRjYjFmMWMKLSBCT09UX0lNQUdFPS9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9hZDY4OTcyYWNiODJjM2U4YmJhMzE2ZDU0MmFiMjA0
OTg0Y2IxZjFjL3ZtbGludXotNC41LjAtcmMyLTAwMDA0LWdhZDY4OTcyCi0gbWF4X3VwdGltZT0z
NjAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC94ZnN0ZXN0cy80SERELXhmcy1nZW5lcmljLTEyNy92
bS1rYnVpbGQtNEcvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2Mt
NC45L2FkNjg5NzJhY2I4MmMzZThiYmEzMTZkNTQyYWIyMDQ5ODRjYjFmMWMvMAotIExLUF9TRVJW
RVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2
ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5y
Y3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5t
aV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNr
PTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwps
a3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2FkNjg5NzJhY2I4MmMzZThiYmEzMTZkNTQyYWIy
MDQ5ODRjYjFmMWMvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei9mcy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L3hmc3Rlc3RzLmNneiwvbGtwL2JlbmNobWFya3MveGZzdGVzdHMuY2d6Igps
aW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9hZDY4
OTcyYWNiODJjM2U4YmJhMzE2ZDU0MmFiMjA0OTg0Y2IxZjFjL2xpbnV4LWhlYWRlcnMuY2d6Igpr
ZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYWQ2ODk3MmFjYjgyYzNlOGJi
YTMxNmQ1NDJhYjIwNDk4NGNiMWYxYy92bWxpbnV6LTQuNS4wLXJjMi0wMDAwNC1nYWQ2ODk3MiIK
ZGVxdWV1ZV90aW1lOiAyMDE2LTA0LTAyIDE3OjIyOjI0Ljk5NzMzNDY2OCArMDg6MDAKam9iX3N0
YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAwLjkyIDAuOTkgMC45MyAxLzExNiAyMjczCnN0YXJ0X3Rp
bWU6ICcxNDU5NTg4OTkwJwplbmRfdGltZTogJzE0NTk1OTE1MTYnCnZlcnNpb246ICIvbGtwL2xr
cC8uc3JjLTIwMTYwNDAxLTIzMTUwOCIK

--===============1323848366892316994==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0wMiAxNzoyMzowMSBta2ZzIC10IHhmcyAvZGV2L3ZkYgoyMDE2LTA0LTAyIDE3OjIz
OjAxIG1rZnMgLXQgeGZzIC9kZXYvdmRhCjIwMTYtMDQtMDIgMTc6MjM6MDEgbWtmcyAtdCB4ZnMg
L2Rldi92ZGMKMjAxNi0wNC0wMiAxNzoyMzowMSBta2ZzIC10IHhmcyAvZGV2L3ZkZAoyMDE2LTA0
LTAyIDE3OjIzOjA5IG1vdW50IC10IHhmcyAtbyBub2JhcnJpZXIsaW5vZGU2NCAvZGV2L3ZkYSAv
ZnMvdmRhCjIwMTYtMDQtMDIgMTc6MjM6MDkgbW91bnQgLXQgeGZzIC1vIG5vYmFycmllcixpbm9k
ZTY0IC9kZXYvdmRiIC9mcy92ZGIKMjAxNi0wNC0wMiAxNzoyMzowOSBtb3VudCAtdCB4ZnMgLW8g
bm9iYXJyaWVyLGlub2RlNjQgL2Rldi92ZGMgL2ZzL3ZkYwoyMDE2LTA0LTAyIDE3OjIzOjA5IG1v
dW50IC10IHhmcyAtbyBub2JhcnJpZXIsaW5vZGU2NCAvZGV2L3ZkZCAvZnMvdmRkCjIwMTYtMDQt
MDIgMTc6MjM6MTAgZXhwb3J0IFRFU1RfRElSPS9mcy92ZGEKMjAxNi0wNC0wMiAxNzoyMzoxMCBl
eHBvcnQgVEVTVF9ERVY9L2Rldi92ZGEKMjAxNi0wNC0wMiAxNzoyMzoxMCBleHBvcnQgRlNUWVA9
eGZzCjIwMTYtMDQtMDIgMTc6MjM6MTAgZXhwb3J0IFNDUkFUQ0hfTU5UPS9mcy9zY3JhdGNoCjIw
MTYtMDQtMDIgMTc6MjM6MTAgbWtkaXIgL2ZzL3NjcmF0Y2ggLXAKMjAxNi0wNC0wMiAxNzoyMzox
MCBleHBvcnQgU0NSQVRDSF9ERVY9L2Rldi92ZGQKMjAxNi0wNC0wMiAxNzoyMzoxMCBleHBvcnQg
U0NSQVRDSF9MT0dERVY9L2Rldi92ZGIKMjAxNi0wNC0wMiAxNzoyMzoxMCAuL2NoZWNrIGdlbmVy
aWMvMTI3Cg==

--===============1323848366892316994==--

