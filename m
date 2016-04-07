Content-Type: multipart/mixed; boundary="===============5832025133447237959=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm] 6f25a14a70: will-it-scale.scalability -4.0% regression
Date: Thu, 07 Apr 2016 09:06:57 +0800
Message-ID: <20160407010657.GB12139@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5832025133447237959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that will-it-scale.scalability -4.0% regression on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 6f25a14a7053b69917e2ebea0d31dd444cd31fd5 ("mm: fix invalid node in a=
lloc_migrate_target()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-ivb-d03/=
pthread_mutex1/will-it-scale

commit: =

  969e8d7e47f93ef693028667480558de8f70523f
  6f25a14a7053b69917e2ebea0d31dd444cd31fd5

969e8d7e47f93ef6 6f25a14a7053b69917e2ebea0d =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
         %stddev     %change         %stddev
             \          |                \  =

 2.032e+08 =C2=B1  0%      -1.6%      2e+08 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.83 =C2=B1  0%      -4.0%       0.79 =C2=B1  0%  will-it-scale.scala=
bility
    214103 =C2=B1 14%     -20.2%     170884 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.stddev
      3789 =C2=B1  7%     -10.3%       3398 =C2=B1  6%  slabinfo.anon_vma_c=
hain.active_objs
      4660 =C2=B1  5%      +7.7%       5019 =C2=B1  2%  vmstat.system.in


lkp-ivb-d03: Ivy Bridge
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
Xiaolong Ye

--===============5832025133447237959==
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
ZXJmb3JtYW5jZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzog
CmNvbW1pdDogNmYyNWExNGE3MDUzYjY5OTE3ZTJlYmVhMGQzMWRkNDQ0Y2QzMWZkNQptb2RlbDog
SXZ5IEJyaWRnZQpucl9jcHU6IDQKbWVtb3J5OiA0Rwpucl9oZGRfcGFydGl0aW9uczogMApoZGRf
cGFydGl0aW9uczogCm5ldGNvbnNvbGVfcG9ydDogNjY3NApjYXRlZ29yeTogYmVuY2htYXJrCnBl
cmYtcHJvZmlsZToKICBmcmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OiBwdGhyZWFkX211
dGV4MQpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1pdmItZDAzCnRib3hfZ3JvdXA6IGxrcC1p
dmItZDAzCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wNC0wNSAwODox
Mzo0Ni4xMjIwNTQ5ODkgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnegppZDogNGQ2NWI5ZWMwNjEwZDhlMGU3ZmU2ODA5NGM0M2UzZmI4
ZDE1ZjgzMQp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IGM0MWRiYmY2ZjU5MWEwMjY5YjgxNWIyZWI1
ZjJhMTVhYWU5NDhlNTIKYmFzZV9jb21taXQ6IDk3MzVhMjI3OTliOTIxNGQxN2QzYzIzMWZlMzc3
ZmM4NTJmMDQyZTkKYnJhbmNoOiBpbnRlcm5hbC1leXdhL21hc3RlcgpyZXN1bHRfcm9vdDogIi9y
ZXN1bHQvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS1wdGhyZWFkX211dGV4MS9sa3AtaXZiLWQw
My9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNmYyNWEx
NGE3MDUzYjY5OTE3ZTJlYmVhMGQzMWRkNDQ0Y2QzMWZkNS8wIgpqb2JfZmlsZTogIi9sa3Avc2No
ZWR1bGVkL2xrcC1pdmItZDAzL2Jpc2VjdF93aWxsLWl0LXNjYWxlLXBlcmZvcm1hbmNlLXB0aHJl
YWRfbXV0ZXgxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNmYyNWEx
NGE3MDUzYjY5OTE3ZTJlYmVhMGQzMWRkNDQ0Y2QzMWZkNS0yMDE2MDQwNS03Njg4Ny0xdGU5MWVn
LTAueWFtbCIKbWF4X3VwdGltZTogMTUwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3Jh
bTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9sa3AtaXZiLWQwMy9iaXNlY3Rfd2ls
bC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1wdGhyZWFkX211dGV4MS1kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6LXg4Nl82NC1yaGVsLTZmMjVhMTRhNzA1M2I2OTkxN2UyZWJlYTBkMzFkZDQ0NGNk
MzFmZDUtMjAxNjA0MDUtNzY4ODctMXRlOTFlZy0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25m
aWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9aW50ZXJuYWwtZXl3YS9tYXN0ZXIKLSBjb21taXQ9NmYy
NWExNGE3MDUzYjY5OTE3ZTJlYmVhMGQzMWRkNDQ0Y2QzMWZkNQotIEJPT1RfSU1BR0U9L3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzZmMjVhMTRhNzA1M2I2OTkxN2UyZWJlYTBkMzFkZDQ0
NGNkMzFmZDUvdm1saW51ei00LjYuMC1yYzEtMDAwNjgtZzZmMjVhMTQKLSBtYXhfdXB0aW1lPTE1
MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtcHRocmVh
ZF9tdXRleDEvbGtwLWl2Yi1kMDMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQt
cmhlbC9nY2MtNC45LzZmMjVhMTRhNzA1M2I2OTkxN2UyZWJlYTBkMzFkZDQ0NGNkMzFmZDUvMAot
IExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVt
ZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCBy
Y3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9w
YW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21w
dF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1h
bAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5p
dHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzZmMjVhMTRhNzA1M2I2OTkxN2Uy
ZWJlYTBkMzFkZDQ0NGNkMzFmZDUvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2Rl
cHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMv
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJr
cy90dXJib3N0YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei93aWxsLWl0LXNjYWxlLmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2FsZS5jZ3osL2xr
cC9iZW5jaG1hcmtzL3dpbGwtaXQtc2NhbGUteDg2XzY0LmNneiIKbGludXhfaGVhZGVyc19pbml0
cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNmYyNWExNGE3MDUzYjY5OTE3ZTJl
YmVhMGQzMWRkNDQ0Y2QzMWZkNS9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5l
bDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82ZjI1YTE0YTcwNTNiNjk5MTdlMmVi
ZWEwZDMxZGQ0NDRjZDMxZmQ1L3ZtbGludXotNC42LjAtcmMxLTAwMDY4LWc2ZjI1YTE0IgpkZXF1
ZXVlX3RpbWU6IDIwMTYtMDQtMDUgMDg6MTU6NDEuMDExODgyODU1ICswODowMApqb2Jfc3RhdGU6
IGZpbmlzaGVkCmxvYWRhdmc6IDMuMDMgMS42NSAwLjY4IDEvMTE1IDQ3MDIKc3RhcnRfdGltZTog
JzE0NTk4MTUzNjknCmVuZF90aW1lOiAnMTQ1OTgxNTY3MycKdmVyc2lvbjogIi9sa3AvbGtwLy5z
cmMtMjAxNjA0MDEtMjMxNTA4Igo=

--===============5832025133447237959==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0wNSAwODoxNjowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0wNSAwODoxNjowOCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0wNSAwODoxNjowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NC0wNSAwODoxNjowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0wNSAwODoxNjowOSAuL3J1bnRl
c3QucHkgcHRocmVhZF9tdXRleDEgMzIgYm90aCAxIDIgMyA0Cg==

--===============5832025133447237959==--

