Content-Type: multipart/mixed; boundary="===============4570316629426345949=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [ksm] 40e318e509: ltp.ksm01.fail
Date: Mon, 25 Jan 2016 11:04:18 +0800
Message-ID: <87io2ibbrh.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4570316629426345949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 40e318e509d2c9f3cdb00ef32d2c14b9868af16b ("ksm: introduce ksm_max_pa=
ge_sharing per page deduplication limit")

We found LKP KSM test case failed for your patch.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase:
  gcc-5/x86_64-nfsroot/debian-x86_64-2015-02-07.cgz/vm-lkp-wsx03-4G/mm_func=
tional_positive/otc_kernel_qa-ts_ltp_ddt

commit: =

  77505a33e539477f1fbe5e6136df5b265f39cccf
  40e318e509d2c9f3cdb00ef32d2c14b9868af16b

77505a33e539477f 40e318e509d2c9f3cdb00ef32d =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4          100%           4:4     otc_kernel_qa-ts_ltp_ddt.ksm0=
1.fail
           :4          100%           4:4     otc_kernel_qa-ts_ltp_ddt.ksm0=
1_1.fail


vm-lkp-wsx03-4G: qemu-system-x86_64 -enable-kvm -cpu host
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
Ying Huang

--===============4570316629426345949==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogb3RjX2tlcm5lbF9xYS10c19sdHBfZGR0CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2Fp
dDogYWN0aXZhdGUtbW9uaXRvcgogIGttc2c6IAogIHZtc3RhdDoKICAgIGludGVydmFsOiAxMApk
ZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292
ZXJub3I6IAptb2RlbDogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3ZtIC1jcHUgaG9zdApu
cl92bTogNApucl9jcHU6IDIKbWVtb3J5OiA0Rwpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L3ZkYSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rl
di92ZGIiCnNzaF9iYXNlX3BvcnQ6IDIzNjQwCmNhdGVnb3J5OiBmdW5jdGlvbmFsCnBsYXRmb3Jt
OiAKY3ljbGljX2JyYW5jaDogaW50ZXJuYWwtZXl3YS9tYXN0ZXIKb3RjX2tlcm5lbF9xYS10c19s
dHBfZGR0OgogIHRlc3Q6IG1tX2Z1bmN0aW9uYWxfcG9zaXRpdmUKZW5xdWV1ZV90aW1lOiAyMDE2
LTAxLTIyIDIxOjQ1OjM3LjQyMzUyNjg1MSArMDg6MDAKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZl
bC1jYXRjaHVwLTIwMTYwMTIyMTQ1Mgpjb21taXQ6IDQwZTMxOGU1MDlkMmM5ZjNjZGIwMGVmMzJk
MmMxNGI5ODY4YWYxNmIKcXVldWU6IGJpc2VjdApjb21waWxlcjogZ2NjLTUKdGVzdGJveDogdm0t
bGtwLXdzeDAzLTRHLTIKdGJveF9ncm91cDogdm0tbGtwLXdzeDAzLTRHCmtjb25maWc6IHg4Nl82
NC1uZnNyb290CmlkOiBiNWY0NmJjNWY4NmY3ODNjY2MxMWZhYmM1ODQ3YmY2ZWJmNWEwM2ZmCnVz
ZXI6IGxrcApyZXN1bHRfcm9vdDogIi9yZXN1bHQvb3RjX2tlcm5lbF9xYS10c19sdHBfZGR0L21t
X2Z1bmN0aW9uYWxfcG9zaXRpdmUvdm0tbGtwLXdzeDAzLTRHL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oveDg2XzY0LW5mc3Jvb3QvZ2NjLTUvNDBlMzE4ZTUwOWQyYzlmM2NkYjAwZWYzMmQy
YzE0Yjk4NjhhZjE2Yi8xIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL3ZtLWxrcC13c3gwMy00
Ry0yL2Jpc2VjdF9vdGNfa2VybmVsX3FhLXRzX2x0cF9kZHQtbW1fZnVuY3Rpb25hbF9wb3NpdGl2
ZS1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1uZnNyb290LTQwZTMxOGU1MDlk
MmM5ZjNjZGIwMGVmMzJkMmMxNGI5ODY4YWYxNmItMjAxNjAxMjItNTgwMTYtdmJkYjN1LTEueWFt
bCIKbWF4X3VwdGltZTogMzYwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1
c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC92bS1sa3Atd3N4MDMtNEctMi9iaXNlY3Rfb3Rj
X2tlcm5lbF9xYS10c19sdHBfZGR0LW1tX2Z1bmN0aW9uYWxfcG9zaXRpdmUtZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtbmZzcm9vdC00MGUzMThlNTA5ZDJjOWYzY2RiMDBlZjMy
ZDJjMTRiOTg2OGFmMTZiLTIwMTYwMTIyLTU4MDE2LXZiZGIzdS0xLnlhbWwKLSBBUkNIPXg4Nl82
NAotIGtjb25maWc9eDg2XzY0LW5mc3Jvb3QKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtY2F0
Y2h1cC0yMDE2MDEyMjE0NTIKLSBjb21taXQ9NDBlMzE4ZTUwOWQyYzlmM2NkYjAwZWYzMmQyYzE0
Yjk4NjhhZjE2YgotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtbmZzcm9vdC9nY2MtNS80
MGUzMThlNTA5ZDJjOWYzY2RiMDBlZjMyZDJjMTRiOTg2OGFmMTZiL3ZtbGludXotNC40LjAtMDkx
MzItZzQwZTMxOGUKLSBtYXhfdXB0aW1lPTM2MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L290Y19r
ZXJuZWxfcWEtdHNfbHRwX2RkdC9tbV9mdW5jdGlvbmFsX3Bvc2l0aXZlL3ZtLWxrcC13c3gwMy00
Ry9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1uZnNyb290L2djYy01LzQwZTMx
OGU1MDlkMmM5ZjNjZGIwMGVmMzJkMmMxNGI5ODY4YWYxNmIvMQotIExLUF9TRVJWRVI9aW5uCi0g
fDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAg
ZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0
YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRv
Zz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25z
b2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJk
OiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94
ODZfNjQtbmZzcm9vdC9nY2MtNS80MGUzMThlNTA5ZDJjOWYzY2RiMDBlZjMyZDJjMTRiOTg2OGFm
MTZiL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvbGtwL2JlbmNobWFya3Mvb3RjX2tlcm5lbF9xYS10
c19sdHBfZGR0LmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1u
ZnNyb290L2djYy01LzQwZTMxOGU1MDlkMmM5ZjNjZGIwMGVmMzJkMmMxNGI5ODY4YWYxNmIvbGlu
dXgtaGVhZGVycy5jZ3oiCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LW5mc3Jvb3QvZ2NjLTUv
NDBlMzE4ZTUwOWQyYzlmM2NkYjAwZWYzMmQyYzE0Yjk4NjhhZjE2Yi92bWxpbnV6LTQuNC4wLTA5
MTMyLWc0MGUzMThlIgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDEtMjIgMjE6NTE6MzIuMzUwMjg1NTA0
ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDEuOTEgMS4xMiAwLjUxIDEvMTEz
IDEyNDg0CnN0YXJ0X3RpbWU6ICcxNDUzNDcwNzYwJwplbmRfdGltZTogJzE0NTM0NzExOTQnCnZl
cnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMTIyLTE4MDgwOSIK

--===============4570316629426345949==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0yMiAyMTo1MjozNyAuL3J1bnRlc3RzLnNoIC1mIG1tX2Z1bmN0aW9uYWxfcG9zaXRp
dmUgLWMK

--===============4570316629426345949==--

