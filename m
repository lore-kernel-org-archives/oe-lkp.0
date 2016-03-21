Content-Type: multipart/mixed; boundary="===============1256753411941642581=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [drm/dp_helper] 31f8862c6e: No primary result change, 128.2% piglit.time.voluntary_context_switches
Date: Mon, 21 Mar 2016 14:53:24 +0800
Message-ID: <20160321065324.GE32569@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1256753411941642581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that piglit.time.voluntary_context_switches +917.2% change =
with your commit.

https://github.com/0day-ci/linux Lyude/drm-dp_helper-retry-on-ETIMEDOUT-in-=
drm_dp_dpcd_access/20160317-234351
commit 31f8862c6e6303223e946e6fcbdfa7f87274baef ("drm/dp_helper: retry on -=
ETIMEDOUT in drm_dp_dpcd_access()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/group/kconfig/rootfs/tbox_group/testcase:
  gcc-4.9/igt-071/x86_64-rhel/debian-x86_64-2015-02-07.cgz/snb-black/piglit

commit: =

  cf481068cdd430a22425d7712c8deeb25efdedc1
  31f8862c6e6303223e946e6fcbdfa7f87274baef

cf481068cdd430a2 31f8862c6e6303223e946e6fcb =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    111.96 =C2=B1  0%    +128.2%     255.52 =C2=B1  0%  piglit.time.elapsed=
_time
    111.96 =C2=B1  0%    +128.2%     255.52 =C2=B1  0%  piglit.time.elapsed=
_time.max
      8.25 =C2=B1  5%     -39.4%       5.00 =C2=B1  0%  piglit.time.percent=
_of_cpu_this_job_got
     31676 =C2=B1  0%    +917.2%     322222 =C2=B1  0%  piglit.time.volunta=
ry_context_switches
    111.96 =C2=B1  0%    +128.2%     255.52 =C2=B1  0%  time.elapsed_time
    111.96 =C2=B1  0%    +128.2%     255.52 =C2=B1  0%  time.elapsed_time.m=
ax
    115.50 =C2=B1  1%     +31.2%     151.50 =C2=B1 13%  time.involuntary_co=
ntext_switches
      8.25 =C2=B1  5%     -39.4%       5.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      8.31 =C2=B1  0%     +45.7%      12.12 =C2=B1  0%  time.system_time
     31676 =C2=B1  0%    +917.2%     322222 =C2=B1  0%  time.voluntary_cont=
ext_switches


snb-black: Sandy Bridge
Memory: 8G


                       piglit.time.voluntary_context_switches

  350000 ++----------------------------------------------------------------=
-+
         |                              OO OO                              =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 OO OO OO OO OO OOO OO OO OO OO                                    =
 |
         |                                                                 =
 |
   50000 ++                                                                =
 |
         **.**.**. *.**.***.**.**.**.**.**.***.**.**.**.**.***.**.**.**.**.=
**
       0 ++-------*--------------------------------------------------------=
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
Xiaolong Ye.

--===============1256753411941642581==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogcGlnbGl0CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIGhlYXJ0YmVhdDoKICAgIGludGVydmFsOiAxMApkZWZhdWx0LXdhdGNoZG9n
czoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogMzFmODg2MmM2ZTYzMDMyMjNl
OTQ2ZTZmY2JkZmE3Zjg3Mjc0YmFlZgptb2RlbDogU2FuZHkgQnJpZGdlCm1lbW9yeTogOEcKbnJf
Y3B1OiA4CmhkZF9wYXJ0aXRpb25zOiAKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlv
bjogCmNhdGVnb3J5OiBmdW5jdGlvbmFsCnRpbWVvdXQ6IDMwbQpwaWdsaXQ6CiAgZ3JvdXA6IGln
dC0wNzEKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBzbmItYmxhY2sKdGJveF9ncm91cDogc25iLWJs
YWNrCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wMy0yMSAwNjo0NDo1
MS43Mjg0MzM4NDAgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnegppZDogNDBhZjE1ZGQ4YzE3MzlkMzNmZmUwOTBmOGU2ZDA3NjUwYzVm
YmYwNwp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IGZmOTA0MDNmNDU3MDRmYTdhZDczMTIxNTI1NTU5
ZjM1Njc4ODZjNTMKYmFzZV9jb21taXQ6IGI1NjJlNDRmNTA3ZTg2M2M2NzkyOTQ2ZTRlMWIxNDQ5
ZmJiYWM4NWQKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAzMjAxNwpyZXN1
bHRfcm9vdDogIi9yZXN1bHQvcGlnbGl0L2lndC0wNzEvc25iLWJsYWNrL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8zMWY4ODYyYzZlNjMwMzIyM2U5NDZl
NmZjYmRmYTdmODcyNzRiYWVmLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvc25iLWJsYWNr
L2Jpc2VjdF9waWdsaXQtaWd0LTA3MS1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82
NC1yaGVsLTMxZjg4NjJjNmU2MzAzMjIzZTk0NmU2ZmNiZGZhN2Y4NzI3NGJhZWYtMjAxNjAzMjEt
MzkyNjUtcm55ZjUzLTAueWFtbCIKbWF4X3VwdGltZTogMTgwMAppbml0cmQ6ICIvb3NpbWFnZS9k
ZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0g
cm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9zbmItYmxhY2sv
YmlzZWN0X3BpZ2xpdC1pZ3QtMDcxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0
LXJoZWwtMzFmODg2MmM2ZTYzMDMyMjNlOTQ2ZTZmY2JkZmE3Zjg3Mjc0YmFlZi0yMDE2MDMyMS0z
OTI2NS1ybnlmNTMtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0g
YnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDMyMDE3Ci0gY29tbWl0PTMxZjg4
NjJjNmU2MzAzMjIzZTk0NmU2ZmNiZGZhN2Y4NzI3NGJhZWYKLSBCT09UX0lNQUdFPS9wa2cvbGlu
dXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8zMWY4ODYyYzZlNjMwMzIyM2U5NDZlNmZjYmRmYTdmODcy
NzRiYWVmL3ZtbGludXotNC41LjAtcmM3LTAxNTU5LWczMWY4ODYyCi0gbWF4X3VwdGltZT0xODAw
Ci0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9waWdsaXQvaWd0LTA3MS9zbmItYmxhY2svZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzMxZjg4NjJjNmU2MzAzMjIz
ZTk0NmU2ZmNiZGZhN2Y4NzI3NGJhZWYvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJs
eXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1k
ZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9
MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3Bz
PXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDEx
NTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3Av
bGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9n
Y2MtNC45LzMxZjg4NjJjNmU2MzAzMjIzZTk0NmU2ZmNiZGZhN2Y4NzI3NGJhZWYvbW9kdWxlcy5j
Z3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4t
aXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9w
aWdsaXQuY2d6LC9sa3AvYmVuY2htYXJrcy9waWdsaXQuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRy
ZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8zMWY4ODYyYzZlNjMwMzIyM2U5NDZl
NmZjYmRmYTdmODcyNzRiYWVmL2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVs
OiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzMxZjg4NjJjNmU2MzAzMjIzZTk0NmU2
ZmNiZGZhN2Y4NzI3NGJhZWYvdm1saW51ei00LjUuMC1yYzctMDE1NTktZzMxZjg4NjIiCmRlcXVl
dWVfdGltZTogMjAxNi0wMy0yMSAwNjo1NDozMy4wNjYwODc1NDcgKzA4OjAwCmpvYl9zdGF0ZTog
ZmluaXNoZWQKbG9hZGF2ZzogMC45MSAwLjYyIDAuMjcgMS8xNTkgNzYyCnN0YXJ0X3RpbWU6ICcx
NDU4NTE0NTAxJwplbmRfdGltZTogJzE0NTg1MTQ3NTcnCnZlcnNpb246ICIvbGtwL2xrcC8uc3Jj
LTIwMTYwMzE4LTE1NTAxMiIK

--===============1256753411941642581==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yMSAwNjo1NTowMSBwaWdsaXQgcnVuIGlndCAtdCBpZ3Qva21zX2N1cnNvcl9jcmMv
Y3Vyc29yLTEyOC1vbnNjcmVlbiAvdG1wL2xrcC9waWdsaXQtcmVzdWx0cwoyMDE2LTAzLTIxIDA2
OjU5OjE3IHBpZ2xpdCBzdW1tYXJ5IGNvbnNvbGUgL3RtcC9sa3AvcGlnbGl0LXJlc3VsdHMvcmVz
dWx0cy5qc29uCg==

--===============1256753411941642581==--

