Content-Type: multipart/mixed; boundary="===============7146439286367847835=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [drm/i915] 946ec703e5: No primary change, piglit.time.elapsed_time -59.2% improvement
Date: Wed, 30 Mar 2016 13:42:22 +0800
Message-ID: <20160330054222.GB2923@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7146439286367847835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that piglit.time.elapsed_time -59.2% improvement with your =
commit.

https://github.com/0day-ci/linux Shashank-Sharma/drm-i915-Restrict-usage-of=
-live-status-check/20160317-155226
commit 946ec703e5cf439a503a218345afa74e35aaf950 ("drm/i915: Restrict usage =
of live status check")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/group/kconfig/rootfs/tbox_group/testcase:
  gcc-4.9/igt-071/x86_64-rhel/debian-x86_64-2015-02-07.cgz/snb-drag/piglit

commit: =

  94669e6ba1ada133394ec8295d773df8b9238d08
  946ec703e5cf439a503a218345afa74e35aaf950

94669e6ba1ada133 946ec703e5cf439a503a218345 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
         %stddev     %change         %stddev
             \          |                \  =

    138.64 =C2=B1  0%     -59.2%      56.60 =C2=B1  0%  piglit.time.elapsed=
_time
    138.64 =C2=B1  0%     -59.2%      56.60 =C2=B1  0%  piglit.time.elapsed=
_time.max
     24.00 =C2=B1  0%    +151.0%      60.25 =C2=B1  0%  piglit.time.percent=
_of_cpu_this_job_got
     52321 =C2=B1  0%     -11.9%      46105 =C2=B1  0%  piglit.time.volunta=
ry_context_switches
    138.64 =C2=B1  0%     -59.2%      56.60 =C2=B1  0%  time.elapsed_time
    138.64 =C2=B1  0%     -59.2%      56.60 =C2=B1  0%  time.elapsed_time.m=
ax
     24.00 =C2=B1  0%    +151.0%      60.25 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     52321 =C2=B1  0%     -11.9%      46105 =C2=B1  0%  time.voluntary_cont=
ext_switches


snb-drag: Sandy Bridge
Memory: 6G

vm-kbuild-yocto-x86_64: qemu-system-x86_64 -enable-kvm -cpu SandyBridge
Memory: 320M



                     piglit.time.percent_of_cpu_this_job_got

  70 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  60 O+   O  O  O  O O  O  O  O O  O  O  O O  O  O O  O  O  O O  O  O  O   =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     *..*    *..*..*.*..*..*..*.*     *    *..*..*.*..*..*..*.*..*..*..*.*.=
.*
  20 ++ :   :                    :   : :   :                               =
 |
     |   :  :                    :   : :  :                                =
 |
  10 ++  : :                      : :   : :                                =
 |
     |    ::                      : :   ::                                 =
 |
   0 ++-O-*------------------------*-----*---------------------------------=
-+


                             piglit.time.elapsed_time

  140 *+-*----*--*-*--*--*--*-*--*----*-----*-*--*--*-*--*--*--*-*--*--*-*-=
-*
      |  :    :                  :    :     :                              =
 |
  120 ++ :    :                  :    :     :                              =
 |
      |  :   :                    :   ::   :                               =
 |
  100 ++  :  :                    :  : :   :                               =
 |
      |   :  :                    :  : :   :                               =
 |
   80 ++  :  :                    :  : :   :                               =
 |
      |   :  :                     : :  :  :                               =
 |
   60 O+  :O: O  O O  O  O  O O  O :O:O :O: O O  O  O O  O  O  O O  O  O   =
 |
      |   : :                      : :  : :                                =
 |
   40 ++  : :                      : :  : :                                =
 |
      |    ::                      ::   : :                                =
 |
   20 ++   :                        :    :                                 =
 |
      |    :                        :    :                                 =
 |
    0 ++-O-*------------------------*----*---------------------------------=
-+


                           piglit.time.elapsed_time.max

  140 *+-*----*--*-*--*--*--*-*--*----*-----*-*--*--*-*--*--*--*-*--*--*-*-=
-*
      |  :    :                  :    :     :                              =
 |
  120 ++ :    :                  :    :     :                              =
 |
      |  :   :                    :   ::   :                               =
 |
  100 ++  :  :                    :  : :   :                               =
 |
      |   :  :                    :  : :   :                               =
 |
   80 ++  :  :                    :  : :   :                               =
 |
      |   :  :                     : :  :  :                               =
 |
   60 O+  :O: O  O O  O  O  O O  O :O:O :O: O O  O  O O  O  O  O O  O  O   =
 |
      |   : :                      : :  : :                                =
 |
   40 ++  : :                      : :  : :                                =
 |
      |    ::                      ::   : :                                =
 |
   20 ++   :                        :    :                                 =
 |
      |    :                        :    :                                 =
 |
    0 ++-O-*------------------------*----*---------------------------------=
-+


                       piglit.time.voluntary_context_switches

  60000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  50000 *+.*    *.*..*..*.*..*..*.*    *     *.*..*.*..*..*.*..*..*.*..*.*.=
.*
        O  : O  O O  O  O O  O  O O  O O  O  O O  O O  O  O O  O  O O  O   =
 |
        |  :    :                  :   ::    :                             =
 |
  40000 ++  :  :                   :   ::   :                              =
 |
        |   :  :                   :  : :   :                              =
 |
  30000 ++  :  :                   :  : :   :                              =
 |
        |   :  :                    : :  :  :                              =
 |
  20000 ++  : :                     : :  : :                               =
 |
        |   : :                     : :  : :                               =
 |
        |    ::                     : :  : :                               =
 |
  10000 ++   ::                      :    ::                               =
 |
        |    :                       :    :                                =
 |
      0 ++-O-*-----------------------*----*--------------------------------=
-+


                        time.percent_of_cpu_this_job_got

  70 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  60 O+   O  O  O  O O  O  O  O O  O  O  O O  O  O O  O  O  O O  O  O  O   =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     *..*    *..*..*.*..*..*..*.*     *    *..*..*.*..*..*..*.*..*..*..*.*.=
.*
  20 ++ :   :                    :   : :   :                               =
 |
     |   :  :                    :   : :  :                                =
 |
  10 ++  : :                      : :   : :                                =
 |
     |    ::                      : :   ::                                 =
 |
   0 ++-O-*------------------------*-----*---------------------------------=
-+


                                 time.elapsed_time

  140 *+-*----*--*-*--*--*--*-*--*----*-----*-*--*--*-*--*--*--*-*--*--*-*-=
-*
      |  :    :                  :    :     :                              =
 |
  120 ++ :    :                  :    :     :                              =
 |
      |  :   :                    :   ::   :                               =
 |
  100 ++  :  :                    :  : :   :                               =
 |
      |   :  :                    :  : :   :                               =
 |
   80 ++  :  :                    :  : :   :                               =
 |
      |   :  :                     : :  :  :                               =
 |
   60 O+  :O: O  O O  O  O  O O  O :O:O :O: O O  O  O O  O  O  O O  O  O   =
 |
      |   : :                      : :  : :                                =
 |
   40 ++  : :                      : :  : :                                =
 |
      |    ::                      ::   : :                                =
 |
   20 ++   :                        :    :                                 =
 |
      |    :                        :    :                                 =
 |
    0 ++-O-*------------------------*----*---------------------------------=
-+


                               time.elapsed_time.max

  140 *+-*----*--*-*--*--*--*-*--*----*-----*-*--*--*-*--*--*--*-*--*--*-*-=
-*
      |  :    :                  :    :     :                              =
 |
  120 ++ :    :                  :    :     :                              =
 |
      |  :   :                    :   ::   :                               =
 |
  100 ++  :  :                    :  : :   :                               =
 |
      |   :  :                    :  : :   :                               =
 |
   80 ++  :  :                    :  : :   :                               =
 |
      |   :  :                     : :  :  :                               =
 |
   60 O+  :O: O  O O  O  O  O O  O :O:O :O: O O  O  O O  O  O  O O  O  O   =
 |
      |   : :                      : :  : :                                =
 |
   40 ++  : :                      : :  : :                                =
 |
      |    ::                      ::   : :                                =
 |
   20 ++   :                        :    :                                 =
 |
      |    :                        :    :                                 =
 |
    0 ++-O-*------------------------*----*---------------------------------=
-+


                           time.voluntary_context_switches

  60000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  50000 *+.*    *.*..*..*.*..*..*.*    *     *.*..*.*..*..*.*..*..*.*..*.*.=
.*
        O  : O  O O  O  O O  O  O O  O O  O  O O  O O  O  O O  O  O O  O   =
 |
        |  :    :                  :   ::    :                             =
 |
  40000 ++  :  :                   :   ::   :                              =
 |
        |   :  :                   :  : :   :                              =
 |
  30000 ++  :  :                   :  : :   :                              =
 |
        |   :  :                    : :  :  :                              =
 |
  20000 ++  : :                     : :  : :                               =
 |
        |   : :                     : :  : :                               =
 |
        |    ::                     : :  : :                               =
 |
  10000 ++   ::                      :    ::                               =
 |
        |    :                       :    :                                =
 |
      0 ++-O-*-----------------------*----*--------------------------------=
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

--===============7146439286367847835==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogcGlnbGl0CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIGhlYXJ0YmVhdDoKICAgIGludGVydmFsOiAxMApkZWZhdWx0LXdhdGNoZG9n
czoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogOTQ2ZWM3MDNlNWNmNDM5YTUw
M2EyMTgzNDVhZmE3NGUzNWFhZjk1MAptb2RlbDogU2FuZHkgQnJpZGdlCm1lbW9yeTogNkcKaGRk
X3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDIwRVpSWC0wMEQ4UEIwX1dE
LVdDQzRNNlhBU0FLVi1wYXJ0NSAvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDIwRVpSWC0wMEQ4
UEIwX1dELVdDQzRNNlhBU0FLVi1wYXJ0NgogIC9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMjBF
WlJYLTAwRDhQQjBfV0QtV0NDNE02WEFTQUtWLXBhcnQ3IC9kZXYvZGlzay9ieS1pZC9hdGEtV0RD
X1dEMjBFWlJYLTAwRDhQQjBfV0QtV0NDNE02WEFTQUtWLXBhcnQ4CiAgL2Rldi9kaXNrL2J5LWlk
L2F0YS1XRENfV0QyMEVaUlgtMDBEOFBCMF9XRC1XQ0M0TTZYQVNBS1YtcGFydDkgL2Rldi9kaXNr
L2J5LWlkL2F0YS1XRENfV0QyMEVaUlgtMDBEOFBCMF9XRC1XQ0M0TTZYQVNBS1YtcGFydDEwIgpz
d2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1X
RENfV0QyMEVaUlgtMDBEOFBCMF9XRC1XQ0M0TTZYQVNBS1YtcGFydDIiCm5ldGNvbnNvbGVfcG9y
dDogNjY0OApjYXRlZ29yeTogZnVuY3Rpb25hbAp0aW1lb3V0OiAzMG0KcGlnbGl0OgogIGdyb3Vw
OiBpZ3QtMDcxCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogc25iLWRyYWcKdGJveF9ncm91cDogc25i
LWRyYWcKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAzLTMwIDA3OjMz
OjEwLjgzNjU3MDg2MiArMDg6MDAKY29tcGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6CmlkOiBlOWFkODlmMTZmOTFlYmY2NDQ5ZjIxNTJlZTg5MDMzNjkw
Yjk2N2M5CnVzZXI6IGxrcApoZWFkX2NvbW1pdDogZGQwOGM1Y2M2MGU3ZGY3ZjZkNTZmNjYwOTIw
NmRhMjRlMjk5YTVhZgpiYXNlX2NvbW1pdDogYjU2MmU0NGY1MDdlODYzYzY3OTI5NDZlNGUxYjE0
NDlmYmJhYzg1ZApicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDMyNjEwCnJl
c3VsdF9yb290OiAiL3Jlc3VsdC9waWdsaXQvaWd0LTA3MS9zbmItZHJhZy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvOTQ2ZWM3MDNlNWNmNDM5YTUwM2Ey
MTgzNDVhZmE3NGUzNWFhZjk1MC8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL3NuYi1kcmFn
L2Jpc2VjdF9waWdsaXQtaWd0LTA3MS1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82
NC1yaGVsLTk0NmVjNzAzZTVjZjQzOWE1MDNhMjE4MzQ1YWZhNzRlMzVhYWY5NTAtMjAxNjAzMzAt
MTEzMDQwLTEyd2UxMm8tMC55YW1sIgpucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogMTgw
MAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIK
Ym9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtw
L3NjaGVkdWxlZC9zbmItZHJhZy9iaXNlY3RfcGlnbGl0LWlndC0wNzEtZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC05NDZlYzcwM2U1Y2Y0MzlhNTAzYTIxODM0NWFmYTc0
ZTM1YWFmOTUwLTIwMTYwMzMwLTExMzA0MC0xMndlMTJvLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0g
a2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAx
NjAzMjYxMAotIGNvbW1pdD05NDZlYzcwM2U1Y2Y0MzlhNTAzYTIxODM0NWFmYTc0ZTM1YWFmOTUw
Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOTQ2ZWM3MDNlNWNm
NDM5YTUwM2EyMTgzNDVhZmE3NGUzNWFhZjk1MC92bWxpbnV6LTQuNS4wLXJjNy0wMTQwMS1nOTQ2
ZWM3MAotIG1heF91cHRpbWU9MTgwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvcGlnbGl0L2lndC0w
NzEvc25iLWRyYWcvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2Mt
NC45Lzk0NmVjNzAzZTVjZjQzOWE1MDNhMjE4MzQ1YWZhNzRlMzVhYWY5NTAvMAotIExLUF9TRVJW
RVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2
ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5y
Y3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5t
aV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNr
PTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwps
a3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45Lzk0NmVjNzAzZTVjZjQzOWE1MDNhMjE4MzQ1YWZh
NzRlMzVhYWY5NTAvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei9waWdsaXQuY2d6LC9sa3AvYmVuY2htYXJrcy9waWdsaXQuY2d6
IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS85
NDZlYzcwM2U1Y2Y0MzlhNTAzYTIxODM0NWFmYTc0ZTM1YWFmOTUwL2xpbnV4LWhlYWRlcnMuY2d6
IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45Lzk0
NmVjNzAzZTVjZjQzOWE1MDNhMjE4MzQ1YWZhNzRlMzVhYWY5NTAvdm1saW51ei00LjUuMC1yYzct
MDE0MDEtZzk0NmVjNzAiCmRlcXVldWVfdGltZTogMjAxNi0wMy0zMCAwNzo1MDo0Mi4xNzQ4Nzg2
MzEgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMS4wMyAwLjQyIDAuMTUgMS8x
MjcgNjc4CnN0YXJ0X3RpbWU6ICcxNDU5Mjk1NDkyJwplbmRfdGltZTogJzE0NTkyOTU1NDgnCnZl
cnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMzI5LTIxMjEzMiIK

--===============7146439286367847835==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0zMCAwNzo1MTozMiBwaWdsaXQgcnVuIGlndCAtdCBpZ3Qva21zX2N1cnNvcl9jcmMv
Y3Vyc29yLTEyOC1vbnNjcmVlbiAvdG1wL2xrcC9waWdsaXQtcmVzdWx0cwoyMDE2LTAzLTMwIDA3
OjUyOjI4IHBpZ2xpdCBzdW1tYXJ5IGNvbnNvbGUgL3RtcC9sa3AvcGlnbGl0LXJlc3VsdHMvcmVz
dWx0cy5qc29uCg==

--===============7146439286367847835==--

