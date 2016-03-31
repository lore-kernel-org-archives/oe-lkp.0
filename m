Content-Type: multipart/mixed; boundary="===============8080811870673722640=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [selinux] 759b31c1d4: unixbench.score -9.7% regression
Date: Thu, 31 Mar 2016 10:38:12 +0800
Message-ID: <20160331023812.GA18248@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8080811870673722640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that unixbench.score -9.7% regression on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 759b31c1d4295a1dab34b4669ee838fb3131cd91 ("selinux: simply inode lab=
el states to INVALID and INITIALIZED")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/ivb42/pipe=
/unixbench

commit: =

  48c2353e841141683e13771ecd6684350004ccac
  759b31c1d4295a1dab34b4669ee838fb3131cd91

48c2353e84114168 759b31c1d4295a1dab34b4669e =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1972 =C2=B1  0%      -9.7%       1781 =C2=B1  0%  unixbench.score
     16298 =C2=B1  5%     -12.4%      14272 =C2=B1  5%  cpuidle.C1-IVT.usage
     10890 =C2=B1 19%     +84.8%      20129 =C2=B1 28%  cpuidle.POLL.usage
      2394 =C2=B1153%     +93.8%       4641 =C2=B1 90%  numa-meminfo.node1.=
Inactive(anon)
      2545 =C2=B1146%     +89.6%       4827 =C2=B1 86%  numa-meminfo.node1.=
Shmem
    598.25 =C2=B1153%     +93.9%       1160 =C2=B1 90%  numa-vmstat.node1.n=
r_inactive_anon
    636.00 =C2=B1146%     +89.7%       1206 =C2=B1 86%  numa-vmstat.node1.n=
r_shmem
     19716 =C2=B1  8%     -17.5%      16267 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
     19716 =C2=B1  8%     -17.5%      16267 =C2=B1 12%  sched_debug.cfs_rq:=
/.spread0.stddev

lkp-wsx02: Westmere-EX
Memory: 128G



                                  unixbench.score

  2000 *+**-*--*-*-----------------*-**-*-**-**-*-**-*-**------------------=
-+
       |      *    **.**.         +                      :   *.*.**.**.    =
 |
       |                 *.**.*.**                       :   :         *.**=
.*
  1950 ++                                                 *.*              =
 |
       |                                                                   =
 |
       |                                                                   =
 |
  1900 ++                                                                  =
 |
       |                                                                   =
 |
  1850 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
  1800 ++                  O                                               =
 |
       |           OO OO O  O O OO O OO O                                  =
 |
       O OO O OO O                                                         =
 |
  1750 ++------------------------------------------------------------------=
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

--===============8080811870673722640==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6
IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3Rh
dDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZv
cm1hbmNlCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29t
bWl0OiA3NTliMzFjMWQ0Mjk1YTFkYWIzNGI0NjY5ZWU4MzhmYjMxMzFjZDkxCm1vZGVsOiBJdnl0
b3duIEl2eSBCcmlkZ2UtRVAKbnJfY3B1OiA0OAptZW1vcnk6IDY0Rwpzd2FwX3BhcnRpdGlvbnM6
IExBQkVMPVNXQVAKcm9vdGZzX3BhcnRpdGlvbjogTEFCRUw9TEtQLVJPT1RGUwpjYXRlZ29yeTog
YmVuY2htYXJrCm5yX3Rhc2s6IDEKdW5peGJlbmNoOgogIHRlc3Q6IHBpcGUKcXVldWU6IGJpc2Vj
dAp0ZXN0Ym94OiBpdmI0Mgp0Ym94X2dyb3VwOiBpdmI0MgprY29uZmlnOiB4ODZfNjQtcmhlbApl
bnF1ZXVlX3RpbWU6IDIwMTYtMDMtMzAgMTA6NDQ6MTYuNTgyMTkwMzY3ICswODowMApjb21waWxl
cjogZ2NjLTQuOQpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKaWQ6IGZmZjEy
YjBhOGI4ZDZhNjMxNGViODc1N2ZkMzk1YTUyODRlNmNlZGQKdXNlcjogbGtwCmhlYWRfY29tbWl0
OiA0Mjk1Y2QyNzUzMGZjZWVhMjM2NTMxYjRiYTYwYzI0ZTE3YzQzODZhCmJhc2VfY29tbWl0OiBm
NTU1MzJhMGMwYjhiYjYxNDhmNGUwNzg1M2I4NzZlZjczYmM2OWNhCmJyYW5jaDogbGludXgtZGV2
ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMzMwMDMKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3VuaXhiZW5j
aC9wZXJmb3JtYW5jZS0xLXBpcGUvaXZiNDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94
ODZfNjQtcmhlbC9nY2MtNC45Lzc1OWIzMWMxZDQyOTVhMWRhYjM0YjQ2NjllZTgzOGZiMzEzMWNk
OTEvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9pdmI0Mi9iaXNlY3RfdW5peGJlbmNoLXBl
cmZvcm1hbmNlLTEtcGlwZS1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVs
LTc1OWIzMWMxZDQyOTVhMWRhYjM0YjQ2NjllZTgzOGZiMzEzMWNkOTEtMjAxNjAzMzAtMTAwNjY1
LTFvMnh2eC0wLnlhbWwiCm1heF91cHRpbWU6IDkzNC40NTk5OTk5OTk5OTk5CmluaXRyZDogIi9v
c2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2Fw
cGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2l2
YjQyL2Jpc2VjdF91bml4YmVuY2gtcGVyZm9ybWFuY2UtMS1waXBlLWRlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNzU5YjMxYzFkNDI5NWExZGFiMzRiNDY2OWVlODM4ZmIz
MTMxY2Q5MS0yMDE2MDMzMC0xMDA2NjUtMW8yeHZ4LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2Nv
bmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAz
MzAwMwotIGNvbW1pdD03NTliMzFjMWQ0Mjk1YTFkYWIzNGI0NjY5ZWU4MzhmYjMxMzFjZDkxCi0g
Qk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNzU5YjMxYzFkNDI5NWEx
ZGFiMzRiNDY2OWVlODM4ZmIzMTMxY2Q5MS92bWxpbnV6LTQuNS4wLXJjMy0wMDA3NC1nNzU5YjMx
YwotIG1heF91cHRpbWU9OTM0Ci0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC91bml4YmVuY2gvcGVyZm9y
bWFuY2UtMS1waXBlL2l2YjQyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJo
ZWwvZ2NjLTQuOS83NTliMzFjMWQ0Mjk1YTFkYWIzNGI0NjY5ZWU4MzhmYjMxMzFjZDkxLzAKLSBM
S1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQu
bG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1
cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFu
aWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRf
cmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwK
CiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRy
ZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS83NTliMzFjMWQ0Mjk1YTFkYWIzNGI0
NjY5ZWU4MzhmYjMxMzFjZDkxL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBz
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3Mv
dHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdW5peGJlbmNoLmNneiIKbGludXhfaGVhZGVy
c19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNzU5YjMxYzFkNDI5NWEx
ZGFiMzRiNDY2OWVlODM4ZmIzMTMxY2Q5MS9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAy
Cmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS83NTliMzFjMWQ0Mjk1YTFk
YWIzNGI0NjY5ZWU4MzhmYjMxMzFjZDkxL3ZtbGludXotNC41LjAtcmMzLTAwMDc0LWc3NTliMzFj
IgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDMtMzAgMTA6NDg6MjIuOTE0NTIwNjk4ICswODowMApqb2Jf
c3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDAuOTMgMC44MSAwLjM0IDEvNTI0IDQ3OTMKc3RhcnRf
dGltZTogJzE0NTkzMDYxNDUnCmVuZF90aW1lOiAnMTQ1OTMwNjI3NicKdmVyc2lvbjogIi9sa3Av
bGtwLy5zcmMtMjAxNjAzMzAtMDkxNzU0Igo=

--===============8080811870673722640==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMzAgMTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MzAgMTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMzAg
MTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6
NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6NDk6MDQgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTow
NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMzAg
MTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6
NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6NDk6
MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0zMCAxMDo0OTowNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMzAgMTA6NDk6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMw
IDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5
OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTMwIDEwOjQ5OjA0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTMwIDEwOjQ5OjA1IC4vUnVuIHBpcGUgLWMgMQo=

--===============8080811870673722640==--

