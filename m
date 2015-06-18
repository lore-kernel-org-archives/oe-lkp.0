Content-Type: multipart/mixed; boundary="===============6379894945900057416=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [drm/i915] 2def4ad99be: +182.8% piglit.time.system_time
Date: Thu, 18 Jun 2015 11:23:21 +0800
Message-ID: <1434597801.21752.18.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6379894945900057416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 2def4ad99befa25775dd2f714fdd4d92faec6e34 ("drm/i915: Optimistically =
spin for the request completion")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/group:
  lkp-t410/piglit/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/igt-052

commit: =

  a1b2278e4dfcd2dbea85e319ebf73a6b7b2f180b
  2def4ad99befa25775dd2f714fdd4d92faec6e34

a1b2278e4dfcd2db 2def4ad99befa25775dd2f714f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      6.00 =C2=B1  0%    +116.7%      13.00 =C2=B1  0%  piglit.time.percent=
_of_cpu_this_job_got
      6.71 =C2=B1  0%    +182.8%      18.96 =C2=B1  0%  piglit.time.system_=
time
      5598 =C2=B1  0%      +2.1%       5718 =C2=B1  0%  vmstat.system.in
      6.00 =C2=B1  0%    +116.7%      13.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      6.71 =C2=B1  0%    +182.8%      18.96 =C2=B1  0%  time.system_time
      4.49 =C2=B1  0%     -26.1%       3.32 =C2=B1  0%  time.user_time


lkp-t410: Westmere
Memory: 2G


                             piglit.time.system_time

  20 ++--------------------------------------------------------------------=
-+
  18 O+O O O O O  O O O O O O O O O O O  O O O O O O O O                   =
 |
     |                                                                     =
 |
  16 ++                                                                    =
 |
  14 ++                                                                    =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
  10 ++                                                                    =
 |
   8 ++                                                                    =
 |
     *         *..*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*=
.*
   6 ++        :                                                           =
 |
   4 ++       :                                                            =
 |
     |:       :                                                            =
 |
   2 ++:     :                                                             =
 |
   0 ++*-*-*-*-------------------------------------------------------------=
-+


                     piglit.time.percent_of_cpu_this_job_got

  14 ++--------------------------------------------------------------------=
-+
     O O O O O O  O O O O O O   O O O O  O O O O O O O O                   =
 |
  12 ++                       O                                            =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   8 ++                                                                    =
 |
     |                                                                     =
 |
   6 *+        *..*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*=
.*
     |         :                                                           =
 |
   4 ++       :                                                            =
 |
     |:       :                                                            =
 |
   2 ++       :                                                            =
 |
     | :     :                                                             =
 |
   0 ++*-*-*-*-------------------------------------------------------------=
-+


                                  time.user_time

    5 ++-------------------------------------------------------------------=
-+
  4.5 ++             .*..*.                             .*..           .*.*=
.*
      *         *.*.*      *.*.*.*.*.*.*.*.*.*.*.*.*.*.*    *.*.*.*.*.*    =
 |
    4 ++        :                                                          =
 |
  3.5 ++      O :                              O                           =
 |
      O:O O O   O O O O  O O O O O O O O O O O   O O O O                   =
 |
    3 ++       :                                                           =
 |
  2.5 ++       :                                                           =
 |
    2 ++       :                                                           =
 |
      |:       :                                                           =
 |
  1.5 ++       :                                                           =
 |
    1 ++:      :                                                           =
 |
      | :     :                                                            =
 |
  0.5 ++:     :                                                            =
 |
    0 ++*-*-*-*------------------------------------------------------------=
-+


                                time.system_time

  20 ++--------------------------------------------------------------------=
-+
  18 O+O O O O O  O O O O O O O O O O O  O O O O O O O O                   =
 |
     |                                                                     =
 |
  16 ++                                                                    =
 |
  14 ++                                                                    =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
  10 ++                                                                    =
 |
   8 ++                                                                    =
 |
     *         *..*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*=
.*
   6 ++        :                                                           =
 |
   4 ++       :                                                            =
 |
     |:       :                                                            =
 |
   2 ++:     :                                                             =
 |
   0 ++*-*-*-*-------------------------------------------------------------=
-+


                        time.percent_of_cpu_this_job_got

  14 ++--------------------------------------------------------------------=
-+
     O O O O O O  O O O O O O   O O O O  O O O O O O O O                   =
 |
  12 ++                       O                                            =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   8 ++                                                                    =
 |
     |                                                                     =
 |
   6 *+        *..*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*=
.*
     |         :                                                           =
 |
   4 ++       :                                                            =
 |
     |:       :                                                            =
 |
   2 ++       :                                                            =
 |
     | :     :                                                             =
 |
   0 ++*-*-*-*-------------------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang
-------------------------------------
lkp(a)eclists.intel.com
https://eclists.intel.com/sympa/info/lkp
Unsubscribe by sending email to sympa(a)eclists.intel.com with subject "Uns=
ubscribe lkp"


--===============6379894945900057416==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgp0ZXN0Y2FzZTogcGlnbGl0CmRlZmF1bHQtbW9uaXRvcnM6CiAg
d2FpdDogcHJlLXRlc3QKICB2bXN0YXQ6IApkZWZhdWx0LXdhdGNoZG9nczoKICB3YXRjaC1vb206
IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKY29tbWl0OiBiYTA1
ZTMxMTU0YWRjZDAxMjM4YTNiZWI0NjFhNzViZDFlNWM1NGQzCm1vZGVsOiBXZXN0bWVyZQptZW1v
cnk6IDJHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1GVUpJVFNVX01KQTIy
NTBCSF9HMl9LOTVDVDlDMkcyOVctcGFydDYiCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0
aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRhLUZVSklUU1VfTUpBMjI1MEJIX0cyX0s5NUNUOUMy
RzI5Vy1wYXJ0NyIKdGltZW91dDogMzBtCnBpZ2xpdDoKICBncm91cDogaWd0LTA1Mgp0ZXN0Ym94
OiBsa3AtdDQxMAp0Ym94X2dyb3VwOiBsa3AtdDQxMAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1
ZXVlX3RpbWU6IDIwMTUtMDUtMzAgMTI6MzA6MDEuOTMzNzUyMzA5ICswODowMAp1c2VyOiBsa3AK
cXVldWU6IGN5Y2xpYwpjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogYmEwNWUzMTE1NGFk
Y2QwMTIzOGEzYmViNDYxYTc1YmQxZTVjNTRkMwpiYXNlX2NvbW1pdDogYzY1Yjk5ZjA0Njg0M2Qy
NDU1YWEyMzE3NDdiNWEwN2E5OTlhOWYzZApicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJs
eS0yMDE1MDYwNTAxCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iYTA1
ZTMxMTU0YWRjZDAxMjM4YTNiZWI0NjFhNzViZDFlNWM1NGQzL3ZtbGludXotNC4xLjAtcmM2LTAz
NzYxLWdiYTA1ZTMxMSIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3Vs
dF9yb290OiAiL3Jlc3VsdC9waWdsaXQvcGVyZm9ybWFuY2UtaWd0LTA1Mi9sa3AtdDQxMC9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvYmEwNWUzMTE1NGFk
Y2QwMTIzOGEzYmViNDYxYTc1YmQxZTVjNTRkMy8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVk
L2xrcC10NDEwL2N5Y2xpY19waWdsaXQtcGVyZm9ybWFuY2UtaWd0LTA1Mi14ODZfNjQtcmhlbC1D
WUNMSUNfSEVBRC1iYTA1ZTMxMTU0YWRjZDAxMjM4YTNiZWI0NjFhNzViZDFlNWM1NGQzLTAtMjAx
NTA1MzAtODI0NS1rdWJlM2oueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA2LTA1IDE3OjU1OjQw
LjA3MzAzODUyNSArMDg6MDAKbnJfY3B1OiAiJChucHJvYykiCm1heF91cHRpbWU6IDE4MDAKaW5p
dHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rs
b2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hl
ZHVsZWQvbGtwLXQ0MTAvY3ljbGljX3BpZ2xpdC1wZXJmb3JtYW5jZS1pZ3QtMDUyLXg4Nl82NC1y
aGVsLUNZQ0xJQ19IRUFELWJhMDVlMzExNTRhZGNkMDEyMzhhM2JlYjQ2MWE3NWJkMWU1YzU0ZDMt
MC0yMDE1MDUzMC04MjQ1LWt1YmUzai55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82
NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDYwNTAxCi0gY29t
bWl0PWJhMDVlMzExNTRhZGNkMDEyMzhhM2JlYjQ2MWE3NWJkMWU1YzU0ZDMKLSBCT09UX0lNQUdF
PS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iYTA1ZTMxMTU0YWRjZDAxMjM4YTNiZWI0
NjFhNzViZDFlNWM1NGQzL3ZtbGludXotNC4xLjAtcmM2LTAzNzYxLWdiYTA1ZTMxMQotIG1heF91
cHRpbWU9MTgwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvcGlnbGl0L3BlcmZvcm1hbmNlLWlndC0w
NTIvbGtwLXQ0MTAvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2Mt
NC45L2JhMDVlMzExNTRhZGNkMDEyMzhhM2JlYjQ2MWE3NWJkMWU1YzU0ZDMvMAotIExLUF9TRVJW
RVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2
ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5y
Y3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5t
aV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNr
PTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwps
a3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2JhMDVlMzExNTRhZGNkMDEyMzhhM2JlYjQ2MWE3
NWJkMWU1YzU0ZDMvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei9waWdsaXQuY2d6LC9sa3AvYmVuY2htYXJrcy9waWdsaXQuY2d6
Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDAuMzcgMC4zNiAwLjE2IDEvMTI2IDc1MQpz
dGFydF90aW1lOiAnMTQzMzQ5ODE3NycKZW5kX3RpbWU6ICcxNDMzNDk4MzQzJwp2ZXJzaW9uOiAi
L2xrcC9sa3AvLnNyYy0yMDE1MDYwNS0xMTU3MTQiCg==

--===============6379894945900057416==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCnBpZ2xpdCBydW4gaWd0IC10IGlndC9rbXNfZmxpcC9mbGlwLXZzLXBhbm5pbmcgL3Rt
cC9sa3AvcGlnbGl0LXJlc3VsdHMtMApwaWdsaXQgc3VtbWFyeSBjb25zb2xlIC90bXAvbGtwL3Bp
Z2xpdC1yZXN1bHRzLTAK

--===============6379894945900057416==--

