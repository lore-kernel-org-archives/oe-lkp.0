Content-Type: multipart/mixed; boundary="===============5734578847010346855=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm] efe186b040: No primary change, phoronix-test-suite.time.involuntary_context_switches +442.2%
Date: Tue, 05 Apr 2016 16:50:37 +0800
Message-ID: <20160405085037.GD10110@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5734578847010346855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that phoronix-test-suite.time.involuntary_context_switches =
+442.2% change on

https://github.com/0day-ci/linux Kent-Overstreet/mm-Refactor-find_get_pages=
-friends/20160401-104010
commit efe186b040db472412151e66616efef8d2b5dfd7 ("mm: Real pagecache iterat=
ors")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/debian-full-x86_64/lkp-ne02/postmark-1.1.0/phoronix-t=
est-suite

commit: =

  8bc43c95e70464f4621317a59e405d901f00d13b
  efe186b040db472412151e66616efef8d2b5dfd7

8bc43c95e70464f4 efe186b040db472412151e6661 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

         %stddev     %change         %stddev
             \          |                \  =

    170373 =C2=B1  1%    +442.2%     923755 =C2=B1  0%  phoronix-test-suite=
.time.involuntary_context_switches
     24546 =C2=B1  0%      -0.9%      24320 =C2=B1  0%  phoronix-test-suite=
.time.maximum_resident_set_size
   6933914 =C2=B1  1%      -2.3%    6775202 =C2=B1  0%  phoronix-test-suite=
.time.voluntary_context_switches
    170373 =C2=B1  1%    +442.2%     923755 =C2=B1  0%  time.involuntary_co=
ntext_switches


lkp-ne02: Nehalem-EP
Memory: 4G



                 phoronix-test-suite.time.involuntary_context_switches

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.2e+06 ++                 O                                             =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |         OO OO O   O O O OO  O O                                =
 |
   800000 O+  O O  O                                                       =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 *+ **.**  **.*   *  *  **.**  *.* *  *.**.* *.**.**.**.* *.*  **.=
**
          |:+     + :   :  :+ :+ :    + :  ::+ :     ::           ::  :+   =
 |
        0 +O-O---O-*----*-*O-*--*O-----O---*--*------*------------*---*----=
-+


                           time.involuntary_context_switches

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.2e+06 ++                 O                                             =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |         OO OO O   O O O OO  O O                                =
 |
   800000 O+  O O  O                                                       =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 *+ **.**  **.*   *  *  **.**  *.* *  *.**.* *.**.**.**.* *.*  **.=
**
          |:+     + :   :  :+ :+ :    + :  ::+ :     ::           ::  :+   =
 |
        0 +O-O---O-*----*-*O-*--*O-----O---*--*------*------------*---*----=
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

--===============5734578847010346855==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQpk
ZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogZWZl
MTg2YjA0MGRiNDcyNDEyMTUxZTY2NjE2ZWZlZjhkMmI1ZGZkNwptb2RlbDogTmVoYWxlbS1FUApt
ZW1vcnk6IDRHCm5yX2hkZF9wYXJ0aXRpb25zOiAxMgpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlz
ay9ieS1pZC9zY3NpLTM1MDAwYzUwMDAqLXBhcnQxIgpzd2FwX3BhcnRpdGlvbnM6ICIvZGV2L2Rp
c2svYnktaWQvYXRhLUhEVDcyMjUxNkRMQTM4MF9WRFNEMURUQ0VNVVpMSi1wYXJ0MiIKdGVzdGNh
c2U6IHBob3Jvbml4LXRlc3Qtc3VpdGUKcm9vdGZzOiBpbm46L2V4cG9ydC9kZWJpYW4tZnVsbC14
ODZfNjQKcGhvcm9uaXgtdGVzdC1zdWl0ZToKICB0ZXN0OiBwb3N0bWFyay0xLjEuMApxdWV1ZTog
YmlzZWN0CnRlc3Rib3g6IGxrcC1uZTAyCnRib3hfZ3JvdXA6IGxrcC1uZTAyCmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wNC0wMyAwMTozMjozNC4yODI5NDg5MDIgKzA4
OjAwCmNvbXBpbGVyOiBnY2MtNC45CmlkOiA2NTk1OTUyOWIwMzJlNjY0MDU4YjgxNjg0Nzg5OGNh
MDY0ZDM5ZDkzCnVzZXI6IGxrcApoZWFkX2NvbW1pdDogYWM2ZmNiZjJhYmUzNDYwYzkxZjliNWE4
ZDBjZjRhZDRlZTFhY2FjYQpiYXNlX2NvbW1pdDogZjU1NTMyYTBjMGI4YmI2MTQ4ZjRlMDc4NTNi
ODc2ZWY3M2JjNjljYQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDQwMjAx
CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9waG9yb25peC10ZXN0LXN1aXRlL3Bvc3RtYXJrLTEuMS4w
L2xrcC1uZTAyL2RlYmlhbi1mdWxsLXg4Nl82NC94ODZfNjQtcmhlbC9nY2MtNC45L2VmZTE4NmIw
NDBkYjQ3MjQxMjE1MWU2NjYxNmVmZWY4ZDJiNWRmZDcvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVk
dWxlZC9sa3AtbmUwMi9iaXNlY3RfcGhvcm9uaXgtdGVzdC1zdWl0ZS1wb3N0bWFyay0xLjEuMC1k
ZWJpYW4tZnVsbC14ODZfNjQteDg2XzY0LXJoZWwtZWZlMTg2YjA0MGRiNDcyNDEyMTUxZTY2NjE2
ZWZlZjhkMmI1ZGZkNy0yMDE2MDQwMy02NTAzNi0xeGl6M3lsLTAueWFtbCIKbnJfY3B1OiAiJChu
cHJvYykiCm1heF91cHRpbWU6IDM2MDAKaW5pdHJkOiAiL29zaW1hZ2UvaW5pdHJhbWZzL2luaXRy
YW1mcy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gYm9vdD1uZnMK
LSBuZnNyb290PWlubjovZXhwb3J0L2RlYmlhbi1mdWxsLXg4Nl82NAotIHVzZXI9bGtwCi0gam9i
PS9sa3Avc2NoZWR1bGVkL2xrcC1uZTAyL2Jpc2VjdF9waG9yb25peC10ZXN0LXN1aXRlLXBvc3Rt
YXJrLTEuMS4wLWRlYmlhbi1mdWxsLXg4Nl82NC14ODZfNjQtcmhlbC1lZmUxODZiMDQwZGI0NzI0
MTIxNTFlNjY2MTZlZmVmOGQyYjVkZmQ3LTIwMTYwNDAzLTY1MDM2LTF4aXozeWwtMC55YW1sCi0g
QVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2Rl
dmVsLWhvdXJseS0yMDE2MDQwMjAxCi0gY29tbWl0PWVmZTE4NmIwNDBkYjQ3MjQxMjE1MWU2NjYx
NmVmZWY4ZDJiNWRmZDcKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQu
OS9lZmUxODZiMDQwZGI0NzI0MTIxNTFlNjY2MTZlZmVmOGQyYjVkZmQ3L3ZtbGludXotNC41LjAt
MTEyODQtZ2VmZTE4NmIKLSBtYXhfdXB0aW1lPTM2MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3Bo
b3Jvbml4LXRlc3Qtc3VpdGUvcG9zdG1hcmstMS4xLjAvbGtwLW5lMDIvZGViaWFuLWZ1bGwteDg2
XzY0L3g4Nl82NC1yaGVsL2djYy00LjkvZWZlMTg2YjA0MGRiNDcyNDEyMTUxZTY2NjE2ZWZlZjhk
MmI1ZGZkNy8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDEx
NTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5
c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBz
b2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1k
aXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5
MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIK
bW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZWZlMTg2YjA0
MGRiNDcyNDEyMTUxZTY2NjE2ZWZlZjhkMmI1ZGZkNy9tb2R1bGVzLmNneiIKbGludXhfaGVhZGVy
c19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZWZlMTg2YjA0MGRiNDcy
NDEyMTUxZTY2NjE2ZWZlZjhkMmI1ZGZkNy9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAy
Cmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9lZmUxODZiMDQwZGI0NzI0
MTIxNTFlNjY2MTZlZmVmOGQyYjVkZmQ3L3ZtbGludXotNC41LjAtMTEyODQtZ2VmZTE4NmIiCmRl
cXVldWVfdGltZTogMjAxNi0wNC0wMyAwMTozNjozMS45MTU0MDk0NTYgKzA4OjAwCmpvYl9zdGF0
ZTogZmluaXNoZWQKbG9hZGF2ZzogMC45OSAxLjA1IDEuMDEgMS8yNzUgMjk1NQpzdGFydF90aW1l
OiAnMTQ1OTYxODY5MicKZW5kX3RpbWU6ICcxNDU5NjIxMTU0Jwp2ZXJzaW9uOiAiL2xrcC9sa3Av
LnNyYy0yMDE2MDQwMS0yMzE1MDgiCg==

--===============5734578847010346855==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0wMyAwMTozODoxMiBwaG9yb25peC10ZXN0LXN1aXRlIGRlZmF1bHQtcnVuIHBvc3Rt
YXJrLTEuMS4wCg==

--===============5734578847010346855==--

