Content-Type: multipart/mixed; boundary="===============4305508669373239236=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [drm/i915] 97f9010af0: No primary result change, -36.2% piglit.time.percent_of_cpu_this_job_got
Date: Tue, 22 Mar 2016 10:50:43 +0800
Message-ID: <20160322025043.GA19091@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4305508669373239236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that piglit.time.percent_of_cpu_this_job_got -36.2% change =
with your commit.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 97f9010af05c15e0b7e6b4ef6ff8cb0ebb7e7715 ("drm/i915: mdelay(10) cons=
idered harmful")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/group/kconfig/rootfs/tbox_group/testcase:
  gcc-4.9/igt-037/x86_64-rhel/debian-x86_64-2015-02-07.cgz/snb-drag/piglit

commit: =

  57a2af6bbc7a4f1b145cc216c34476402836f0b8
  97f9010af05c15e0b7e6b4ef6ff8cb0ebb7e7715

57a2af6bbc7a4f1b 97f9010af05c15e0b7e6b4ef6f =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
         %stddev     %change         %stddev
             \          |                \  =

     69.00 =C2=B1  0%     -36.2%      44.00 =C2=B1  0%  piglit.time.percent=
_of_cpu_this_job_got
     44.77 =C2=B1  0%     -36.0%      28.66 =C2=B1  0%  piglit.time.system_=
time
     38337 =C2=B1  0%      +4.1%      39904 =C2=B1  0%  piglit.time.volunta=
ry_context_switches
     69.00 =C2=B1  0%     -36.2%      44.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     44.77 =C2=B1  0%     -36.0%      28.66 =C2=B1  0%  time.system_time


snb-drag: Sandy Bridge
Memory: 6G



                             piglit.time.system_time

  46 ++--------------------------------------------------------------------=
-+
     *..*..*..*..*..*..*..*..*..*..*..*..*.*..*..*..*..*..*..*..*..*..*    =
 |
  44 ++                                                                    =
 |
  42 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
  38 ++                                                                    =
 |
     |                                                                     =
 |
  36 ++                                                                    =
 |
  34 ++                                                                    =
 |
     |                                                                     =
 |
  32 ++                                                                    =
 |
  30 ++                                                                    =
 |
     O  O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O  O =
 O
  28 ++--------------------------------------------------------------------=
-+


                     piglit.time.percent_of_cpu_this_job_got

  70 *+----*--*--*--*--*--*--*--*--*--*--*-*--*--*--*--*--*--*--*--*--*----=
-+
     |   ..                                                                =
 |
  65 ++ *                                                                  =
 |
  60 ++                                                                    =
 |
     |                                                                     =
 |
  55 ++                                                                    =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  45 ++                                                            O  O  O =
 O
  40 ++                                                                    =
 |
     |                                O  O O  O  O  O  O  O  O  O          =
 |
  35 ++                                                                    =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  25 O+-O--O--O--O--O--O--O--O--O--O---------------------------------------=
-+


                       piglit.time.voluntary_context_switches

  46000 ++-----------------------------------------------------------------=
-+
        O  O  O  O O  O  O  O  O  O O                                      =
 |
  45000 ++                                                                 =
 |
  44000 ++                                                                 =
 |
        |                                                                  =
 |
  43000 ++                                                                 =
 |
        |                                                                  =
 |
  42000 ++                                                                 =
 |
        |                                                                  =
 |
  41000 ++                             O  O  O  O  O O  O  O  O  O         =
 |
  40000 ++                                                                 =
 |
        |                                                           O O  O =
 O
  39000 ++                                                                 =
 |
        *..*..*..*.*..*..*..*..*..*.*..*..*..*..*..*.*..*..*..*..*..*.*    =
 |
  38000 ++-----------------------------------------------------------------=
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

--===============4305508669373239236==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogcGlnbGl0CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIGhlYXJ0YmVhdDoKICAgIGludGVydmFsOiAxMApkZWZhdWx0LXdhdGNoZG9n
czoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogOTdmOTAxMGFmMDVjMTVlMGI3
ZTZiNGVmNmZmOGNiMGViYjdlNzcxNQptb2RlbDogU2FuZHkgQnJpZGdlCm1lbW9yeTogNkcKaGRk
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
OiBpZ3QtMDM3CnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogc25iLWRyYWcKdGJveF9ncm91cDogc25i
LWRyYWcKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAzLTIwIDA0OjM5
OjA1LjkyOTgxNzUwMCArMDg6MDAKY29tcGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6CmlkOiAwNWE1NGQyZGEyOTQyNDRmMGQyZTAxZjQ3ZWE1ZjkxZDYz
MTAwMzNlCnVzZXI6IGxrcApoZWFkX2NvbW1pdDogZWIxMjhhNjdhMWEzZGQ5MTkyZjk1YzM4ODY5
MGVlYzcxNzNiMTM3ZApiYXNlX2NvbW1pdDogYjU2MmU0NGY1MDdlODYzYzY3OTI5NDZlNGUxYjE0
NDlmYmJhYzg1ZApicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDMxODIzCnJl
c3VsdF9yb290OiAiL3Jlc3VsdC9waWdsaXQvaWd0LTAzNy9zbmItZHJhZy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvOTdmOTAxMGFmMDVjMTVlMGI3ZTZi
NGVmNmZmOGNiMGViYjdlNzcxNS8xIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL3NuYi1kcmFn
L2Jpc2VjdF9waWdsaXQtaWd0LTAzNy1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82
NC1yaGVsLTk3ZjkwMTBhZjA1YzE1ZTBiN2U2YjRlZjZmZjhjYjBlYmI3ZTc3MTUtMjAxNjAzMjAt
NzEyNDUtMWlyZWx1NC0xLnlhbWwiCm5yX2NwdTogIiQobnByb2MpIgptYXhfdXB0aW1lOiAxODAw
CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpi
b290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Av
c2NoZWR1bGVkL3NuYi1kcmFnL2Jpc2VjdF9waWdsaXQtaWd0LTAzNy1kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTk3ZjkwMTBhZjA1YzE1ZTBiN2U2YjRlZjZmZjhjYjBl
YmI3ZTc3MTUtMjAxNjAzMjAtNzEyNDUtMWlyZWx1NC0xLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtj
b25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYw
MzE4MjMKLSBjb21taXQ9OTdmOTAxMGFmMDVjMTVlMGI3ZTZiNGVmNmZmOGNiMGViYjdlNzcxNQot
IEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45Lzk3ZjkwMTBhZjA1YzE1
ZTBiN2U2YjRlZjZmZjhjYjBlYmI3ZTc3MTUvdm1saW51ei00LjQuMC1yYzYtMDAwMDktZzk3Zjkw
MTAKLSBtYXhfdXB0aW1lPTE4MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3BpZ2xpdC9pZ3QtMDM3
L3NuYi1kcmFnL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQu
OS85N2Y5MDEwYWYwNWMxNWUwYjdlNmI0ZWY2ZmY4Y2IwZWJiN2U3NzE1LzEKLSBMS1BfU0VSVkVS
PWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVs
PWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1
X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlf
d2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0w
CiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtw
X2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS85N2Y5MDEwYWYwNWMxNWUwYjdlNmI0ZWY2ZmY4Y2Iw
ZWJiN2U3NzE1L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3ovcGlnbGl0LmNneiwvbGtwL2JlbmNobWFya3MvcGlnbGl0LmNneiIK
bGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOTdm
OTAxMGFmMDVjMTVlMGI3ZTZiNGVmNmZmOGNiMGViYjdlNzcxNS9saW51eC1oZWFkZXJzLmNneiIK
cmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS85N2Y5
MDEwYWYwNWMxNWUwYjdlNmI0ZWY2ZmY4Y2IwZWJiN2U3NzE1L3ZtbGludXotNC40LjAtcmM2LTAw
MDA5LWc5N2Y5MDEwIgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDMtMjAgMDQ6NTc6MzQuNTQxODM0MTM1
ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDAuNzUgMC4zNCAwLjEzIDEvMTI2
IDY2MwpzdGFydF90aW1lOiAnMTQ1ODQyMTEwMScKZW5kX3RpbWU6ICcxNDU4NDIxMTY5Jwp2ZXJz
aW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDMxOC0xNTUwMTIiCg==

--===============4305508669373239236==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yMCAwNDo1NjoyMiBwaWdsaXQgcnVuIGlndCAtdCBpZ3Qva21zX2N1cnNvcl9jcmMv
Y3Vyc29yLTEyOC1vZmZzY3JlZW4gL3RtcC9sa3AvcGlnbGl0LXJlc3VsdHMKMjAxNi0wMy0yMCAw
NDo1NzozMCBwaWdsaXQgc3VtbWFyeSBjb25zb2xlIC90bXAvbGtwL3BpZ2xpdC1yZXN1bHRzL3Jl
c3VsdHMuanNvbgo=

--===============4305508669373239236==--

