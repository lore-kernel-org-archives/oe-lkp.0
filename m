Content-Type: multipart/mixed; boundary="===============6857937528852487295=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [drm/i915] 0bbca274a3: 3.6% piglit.time.elapsed_time
Date: Mon, 14 Mar 2016 10:14:37 +0800
Message-ID: <20160314021437.GA32210@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6857937528852487295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that piglit.time.elapsed_time 3.6% regression on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 0bbca274a31c2366414d8d3f95e03d1c4674d93f ("drm/i915: Actually retry =
with bit-banging after GMBUS timeout")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/group/kconfig/rootfs/tbox_group/testcase:
  gcc-4.9/igt-039/x86_64-rhel/debian-x86_64-2015-02-07.cgz/snb-black/piglit

commit: =

  2f791908a70e95768596f5bb9e6de4f441d7bf13
  0bbca274a31c2366414d8d3f95e03d1c4674d93f

2f791908a70e9576 0bbca274a31c2366414d8d3f95 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    188.79 =C2=B1  0%      +3.6%     195.58 =C2=B1  0%  piglit.time.elapsed=
_time
    188.79 =C2=B1  0%      +3.6%     195.58 =C2=B1  0%  piglit.time.elapsed=
_time.max
      5.00 =C2=B1  0%     +60.0%       8.00 =C2=B1  0%  piglit.time.percent=
_of_cpu_this_job_got
      7.86 =C2=B1  0%     +83.5%      14.42 =C2=B1  0%  piglit.time.system_=
time
      5.00 =C2=B1  0%     +60.0%       8.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      7.86 =C2=B1  0%     +83.5%      14.42 =C2=B1  0%  time.system_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/group/kconfig/rootfs/tbox_group/testcase:
  gcc-4.9/igt-036/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-u410/piglit

commit: =

  2f791908a70e95768596f5bb9e6de4f441d7bf13
  0bbca274a31c2366414d8d3f95e03d1c4674d93f

2f791908a70e9576 0bbca274a31c2366414d8d3f95 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    141.15 =C2=B1  0%      +6.9%     150.94 =C2=B1  0%  piglit.time.elapsed=
_time
    141.15 =C2=B1  0%      +6.9%     150.94 =C2=B1  0%  piglit.time.elapsed=
_time.max
     10.00 =C2=B1  0%     +60.0%      16.00 =C2=B1  0%  piglit.time.percent=
_of_cpu_this_job_got
     10.61 =C2=B1  0%     +88.8%      20.04 =C2=B1  0%  piglit.time.system_=
time
     10.00 =C2=B1  0%     +60.0%      16.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     10.61 =C2=B1  0%     +88.8%      20.04 =C2=B1  0%  time.system_time


snb-black: Sandy Bridge
Memory: 8G

lkp-u410: Ivy Bridge
Memory: 4G



                             piglit.time.system_time

  21 ++--------------------------------------------------------------------=
-+
  20 O+ O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O    =
 |
     |                                                                     =
 |
  19 ++                                                                    =
 |
  18 ++                                                                    =
 |
  17 ++                                                                    =
 |
  16 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  14 ++                                                                    =
 |
  13 ++                                                                    =
 |
  12 ++                                                                    =
 |
     |                                                                     =
 |
  11 *+.*..*..*..*..*..*..*..*..*..*..*..*.*..*..*..*..*..*..*..*..*..*..*.=
.*
  10 ++--------------------------------------------------------------------=
-+


                     piglit.time.percent_of_cpu_this_job_got

  16 O+-O--O--O--O--O--O--O--O--O--O--O--O-O--O--O--O--O--O--O--O--O--O----=
-+
     |                                                                     =
 |
  15 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  14 ++                                                                    =
 |
     |                                                                     =
 |
  13 ++                                                                    =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  11 *+.                  *..         *..           *..                    =
 |
     |                  ..          ..            ..                       =
 |
  10 ++-*--*--*--*--*--*-----*--*--*-----*-*--*--*-----*--*--*--*--*--*--*-=
-*


                             piglit.time.elapsed_time

  152 ++-------------------------------------------------------------------=
-+
      |  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O    =
 |
  150 O+                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  148 ++                                                                   =
 |
      |                                                                    =
 |
  146 ++                                                                   =
 |
      |                                                                    =
 |
  144 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  142 ++                 .*..                                              =
 |
      *..     .*..*..*..*    *..*..*..*..     .*..*..*..    .*..*..*..*..*.=
.*
  140 ++-*--*----------------------------*--*-----------*--*---------------=
-+


                           piglit.time.elapsed_time.max

  152 ++-------------------------------------------------------------------=
-+
      |  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O    =
 |
  150 O+                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  148 ++                                                                   =
 |
      |                                                                    =
 |
  146 ++                                                                   =
 |
      |                                                                    =
 |
  144 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  142 ++                 .*..                                              =
 |
      *..     .*..*..*..*    *..*..*..*..     .*..*..*..    .*..*..*..*..*.=
.*
  140 ++-*--*----------------------------*--*-----------*--*---------------=
-+


                                time.system_time

  21 ++--------------------------------------------------------------------=
-+
  20 O+ O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O    =
 |
     |                                                                     =
 |
  19 ++                                                                    =
 |
  18 ++                                                                    =
 |
  17 ++                                                                    =
 |
  16 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  14 ++                                                                    =
 |
  13 ++                                                                    =
 |
  12 ++                                                                    =
 |
     |                                                                     =
 |
  11 *+.*..*..*..*..*..*..*..*..*..*..*..*.*..*..*..*..*..*..*..*..*..*..*.=
.*
  10 ++--------------------------------------------------------------------=
-+


                        time.percent_of_cpu_this_job_got

  16 O+-O--O--O--O--O--O--O--O--O--O--O--O-O--O--O--O--O--O--O--O--O--O----=
-+
     |                                                                     =
 |
  15 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  14 ++                                                                    =
 |
     |                                                                     =
 |
  13 ++                                                                    =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  11 *+.                  *..         *..           *..                    =
 |
     |                  ..          ..            ..                       =
 |
  10 ++-*--*--*--*--*--*-----*--*--*-----*-*--*--*-----*--*--*--*--*--*--*-=
-*


 =


                             piglit.time.system_time

  15 ++--------------------------------------------------------------------=
-+
     O  O  O  O O  O  O  O  O  O O  O  O  O  O  O O  O  O  O  O  O O  O  O =
 |
  14 ++                                                                    =
 |
  13 ++                                                                    =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
     |                                                                     =
 |
  11 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
   9 ++                                                                    =
 |
     |                                                                     =
 |
   8 ++        .*..*..     .*..             .*..*.           .*..*.*..*..  =
.*
     *..*..*..*       *..*.    *.*..*..*..*.      *..*..*..*.            *.=
 |
   7 ++--------------------------------------------------------------------=
-+


                             piglit.time.elapsed_time

  450 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  400 ++                                     O                             =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  350 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  200 O+.O..O.O..O..O..O..O.O..O..O..O..O.O..*..O..O..O.O..O..O..O..O.O..O.=
.*
      |                                                                    =
 |
  150 ++-------------------------------------------------------------------=
-+


                           piglit.time.elapsed_time.max

  450 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  400 ++                                     O                             =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  350 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  200 O+.O..O.O..O..O..O..O.O..O..O..O..O.O..*..O..O..O.O..O..O..O..O.O..O.=
.*
      |                                                                    =
 |
  150 ++-------------------------------------------------------------------=
-+


                                time.system_time

  15 ++--------------------------------------------------------------------=
-+
     O  O  O  O O  O  O  O  O  O O  O  O  O  O  O O  O  O  O  O  O O  O  O =
 |
  14 ++                                                                    =
 |
  13 ++                                                                    =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
     |                                                                     =
 |
  11 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
   9 ++                                                                    =
 |
     |                                                                     =
 |
   8 ++        .*..*..     .*..             .*..*.           .*..*.*..*..  =
.*
     *..*..*..*       *..*.    *.*..*..*..*.      *..*..*..*.            *.=
 |
   7 ++--------------------------------------------------------------------=
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

--===============6857937528852487295==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogcGlnbGl0CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIGhlYXJ0YmVhdDoKICAgIGludGVydmFsOiAxMApkZWZhdWx0LXdhdGNoZG9n
czoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogMGJiY2EyNzRhMzFjMjM2NjQx
NGQ4ZDNmOTVlMDNkMWM0Njc0ZDkzZgptb2RlbDogSXZ5IEJyaWRnZQpucl9jcHU6IDQKbWVtb3J5
OiA0Rwpucl9oZGRfcGFydGl0aW9uczogMApoZGRfcGFydGl0aW9uczogCm5ldGNvbnNvbGVfcG9y
dDogNjY3NApjYXRlZ29yeTogZnVuY3Rpb25hbAp0aW1lb3V0OiAzMG0KcGlnbGl0OgogIGdyb3Vw
OiBpZ3QtMDM2CnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogbGtwLXU0MTAKdGJveF9ncm91cDogbGtw
LXU0MTAKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAzLTEyIDA4OjEw
OjM4LjE0MTQyNDE2OSArMDg6MDAKY29tcGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6CmlkOiA3ZWJjMTBmYjJhYzBlOTBmYjJlMzQ2ZWZiZGNkYTY5ZmFm
OWY0YzE4CnVzZXI6IGxrcApoZWFkX2NvbW1pdDogODg0ZGNkMzZmYzY4Zjc4YTEyZGIyYWUwNDFl
YWVhZGIyMzBiNDYwYgpiYXNlX2NvbW1pdDogZjZjZWRlNWI0OWU4MjJlYmM0MWEwOTlmZTQxYWI0
OTg5ZjY0ZTJjYgpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDMxMjAxCnJl
c3VsdF9yb290OiAiL3Jlc3VsdC9waWdsaXQvaWd0LTAzNi9sa3AtdTQxMC9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMGJiY2EyNzRhMzFjMjM2NjQxNGQ4
ZDNmOTVlMDNkMWM0Njc0ZDkzZi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC11NDEw
L2Jpc2VjdF9waWdsaXQtaWd0LTAzNi1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82
NC1yaGVsLTBiYmNhMjc0YTMxYzIzNjY0MTRkOGQzZjk1ZTAzZDFjNDY3NGQ5M2YtMjAxNjAzMTIt
MzE3MTAtMWNrZjc5cy0wLnlhbWwiCm1heF91cHRpbWU6IDE4MDAKaW5pdHJkOiAiL29zaW1hZ2Uv
ZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgot
IHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLXU0MTAv
YmlzZWN0X3BpZ2xpdC1pZ3QtMDM2LWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0
LXJoZWwtMGJiY2EyNzRhMzFjMjM2NjQxNGQ4ZDNmOTVlMDNkMWM0Njc0ZDkzZi0yMDE2MDMxMi0z
MTcxMC0xY2tmNzlzLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAot
IGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAzMTIwMQotIGNvbW1pdD0wYmJj
YTI3NGEzMWMyMzY2NDE0ZDhkM2Y5NWUwM2QxYzQ2NzRkOTNmCi0gQk9PVF9JTUFHRT0vcGtnL2xp
bnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMGJiY2EyNzRhMzFjMjM2NjQxNGQ4ZDNmOTVlMDNkMWM0
Njc0ZDkzZi92bWxpbnV6LTQuNS4wLXJjNy0wMDAwMi1nMGJiY2EyNwotIG1heF91cHRpbWU9MTgw
MAotIFJFU1VMVF9ST09UPS9yZXN1bHQvcGlnbGl0L2lndC0wMzYvbGtwLXU0MTAvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzBiYmNhMjc0YTMxYzIzNjY0
MTRkOGQzZjk1ZTAzZDFjNDY3NGQ5M2YvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJs
eXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1k
ZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9
MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3Bz
PXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDEx
NTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3Av
bGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9n
Y2MtNC45LzBiYmNhMjc0YTMxYzIzNjY0MTRkOGQzZjk1ZTAzZDFjNDY3NGQ5M2YvbW9kdWxlcy5j
Z3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4t
aXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9w
aWdsaXQuY2d6LC9sa3AvYmVuY2htYXJrcy9waWdsaXQuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRy
ZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wYmJjYTI3NGEzMWMyMzY2NDE0ZDhk
M2Y5NWUwM2QxYzQ2NzRkOTNmL2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVs
OiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzBiYmNhMjc0YTMxYzIzNjY0MTRkOGQz
Zjk1ZTAzZDFjNDY3NGQ5M2Yvdm1saW51ei00LjUuMC1yYzctMDAwMDItZzBiYmNhMjciCmRlcXVl
dWVfdGltZTogMjAxNi0wMy0xMiAwODoxNDowNC41NTY0MzgzNjIgKzA4OjAwCmpvYl9zdGF0ZTog
ZmluaXNoZWQKbG9hZGF2ZzogMC44MSAwLjM4IDAuMTUgMS8xMTYgNjkzCnN0YXJ0X3RpbWU6ICcx
NDU3NzQxNzEzJwplbmRfdGltZTogJzE0NTc3NDE4NjQnCnZlcnNpb246ICIvbGtwL2xrcC8uc3Jj
LTIwMTYwMzExLTE4MzYxMiIK

--===============6857937528852487295==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0xMiAwODoxNToxMyBwaWdsaXQgcnVuIGlndCAtdCBpZ3Qva21zX2N1cnNvcl9jcmMv
Y3Vyc29yLTY0LXNsaWRpbmcgL3RtcC9sa3AvcGlnbGl0LXJlc3VsdHMKMjAxNi0wMy0xMiAwODox
Nzo0MyBwaWdsaXQgc3VtbWFyeSBjb25zb2xlIC90bXAvbGtwL3BpZ2xpdC1yZXN1bHRzL3Jlc3Vs
dHMuanNvbgo=

--===============6857937528852487295==--

